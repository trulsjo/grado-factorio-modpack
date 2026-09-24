<#
.SYNOPSIS
    Stages one pack, with every mod it needs, into one mods directory that Factorio or the shared
    load harness can take as it stands. Exit 0 means every member is there at its resolved release
    and the pack and the packs under it are zipped beside them.

.DESCRIPTION
    THE INSTALL STEP OF EVERY LOAD (#24), so it is the same each time and a failed load is a
    dependency failure rather than an install mistake. It writes no code of its own for the
    members: resolving, fetching and loading are the shared tools', ruled on #16.

      resolve   vendor/grado-factorio-tools/scripts/resolve-modpack.ps1 picks the exact release of
                every member of the pack's closure, for the pack's own factorio_version and the
                game build, and writes the picks to a pin file.
      fetch     fetch-mods.ps1 there downloads those releases, and only those, into -ModsDirectory.
      stage     This script zips the pack, and every pack under it in the chain, as
                <name>_<version>.zip beside them. The version is read from the pack's info.json.

    The result goes to the harness unchanged: load-harness.ps1 <ModsDirectory>, printed at the end.

    STAGING TWICE IS SAFE. A pack's previous zip or directory in -ModsDirectory -- any version --
    is removed before the new zip takes its place, so Factorio never has two to choose between.
    A member is fetched as a directory named <name>, which fetch-mods.ps1 replaces; any
    <name>_<version>.zip or <name>_<version> directory of that member is removed before the fetch,
    as the mod manager installs them that way.

    A MEMBER THE PACK HAS DROPPED IS REMOVED, from the default directory only (#60). Before the
    fetch, any mod in .mod-cache/<Pack> -- directory or zip, and its zip in .zips -- that is not
    in the pack's resolved set or its chain goes, so a reused directory never loads a mod the pack
    no longer has. A -ModsDirectory you name is never pruned: it may be a player's mods directory.

    A FACTORIO MODS DIRECTORY AS THE TARGET WORKS. fetch-mods.ps1 keeps its downloaded zips in a
    .zips subdirectory of the target, and the game passes over it without a word: no log line, no
    mod-list.json entry (2.0.77 headless, Grado_NonChanging, 2026-09-24, #59).

    IT REFUSES A MALFORMED PACK. Every info.json in the chain is checked as strict JSON before
    anything is fetched: a comment or a trailing comma fails here, not inside the game.

    WHAT IT DOES NOT DO. It modifies no info.json. It never loads the game. It does not remove a
    member a pack has since dropped from a -ModsDirectory you named and reuse across membership
    changes; delete that directory to start clean. Fetching needs the mod-portal credentials
    Factorio stores in player-data.json -- fetch-mods.ps1 names the cause if they are missing.

.PARAMETER Pack
    The pack to stage, by name: one of the Grado_* directories at the repository root.

.PARAMETER ModsDirectory
    Where the set goes. Defaults to .mod-cache/<Pack> under the repository root, which is
    git-ignored, and the only directory pruned of mods the pack has dropped. A directory named
    here is never pruned. Point it at a Factorio mods directory to install there instead. One
    directory per pack: staging a second pack into the same directory leaves the first pack's
    members there too, which for Grado_ABCX and Grado_ABCS is a set that must never exist.

.PARAMETER Build
    The game build to resolve for, e.g. 2.0.77. Defaults to the version of the installed game's
    base mod, found through -FactorioExe.

.PARAMETER FactorioExe
    Path to Factorio.exe, read only to default -Build. Defaults as load-harness.ps1 does.

.PARAMETER SelfTest
    Prove the staging half can fail and passes what it should, against fixture packs in a temp
    directory. No network, no game.

.EXAMPLE
    pwsh -File scripts/stage-pack.ps1 Grado_ABC

.EXAMPLE
    pwsh -File scripts/stage-pack.ps1 Grado_NonChanging -ModsDirectory "$env:APPDATA\Factorio\mods"

.EXAMPLE
    pwsh -File scripts/stage-pack.ps1 -SelfTest
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [Parameter(Position = 0)] [string] $Pack,
    [string] $ModsDirectory,
    [string] $Build,
    [string] $FactorioExe,
    [switch] $SelfTest
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ROOT  = Split-Path $PSScriptRoot -Parent
$TOOLS = Join-Path $ROOT 'vendor/grado-factorio-tools/scripts'
# ponytail: copied from resolve-modpack.ps1, which is a script and cannot be dot-sourced; share
# it from the tools repo if a second copy ever has to change with it.
$GAME_MODS = @('base', 'space-age', 'quality', 'elevated-rails')

Add-Type -AssemblyName System.IO.Compression.FileSystem

function Get-RequiredName {
    <#  The mod names an info.json requires: bare and `~` lines, not `?`, `(?)` or `!`.  #>
    param([Parameter(Mandatory)] $Info)
    foreach ($d in @($Info.PSObject.Properties['dependencies']?.Value)) {
        if (-not $d -or $d -match '^\s*(\?|!|\(\?\))') { continue }
        ($d -replace '^\s*~\s*' -split '\s*(<=|>=|<|>|=)')[0].Trim()
    }
}

function Read-PackInfo {
    <#  A pack's info.json, refused with a reason if it is missing, not strict JSON, or names
        another pack than its directory.  #>
    param([Parameter(Mandatory)] [string] $Root, [Parameter(Mandatory)] [string] $Name)

    $path = Join-Path $Root "$Name/info.json"
    if (-not (Test-Path -LiteralPath $path)) {
        $known = @(Get-ChildItem -LiteralPath $Root -Directory | Where-Object { Test-Path (Join-Path $_.FullName 'info.json') } | ForEach-Object Name)
        throw "No pack '$Name'. Packs: $($known -join ', ')."
    }
    $text = Get-Content -LiteralPath $path -Raw
    if (-not (Test-Json -Json $text -ErrorAction SilentlyContinue)) {
        throw "$path is not valid JSON, so it is not staged: Factorio would refuse it. Strict JSON -- no comments, no trailing commas."
    }
    $info = $text | ConvertFrom-Json
    $field = { param($n) $info.PSObject.Properties[$n]?.Value }
    if ((& $field 'name') -ne $Name) { throw "$path names itself '$(& $field 'name')', not '$Name'." }
    if ((& $field 'version') -notmatch '^\d+\.\d+\.\d+$') { throw "$path has no version of the form x.y.z." }
    if (-not (& $field 'factorio_version')) { throw "$path has no factorio_version." }
    $info
}

function Get-PackChain {
    <#  The pack and every pack under it: its required dependencies that are packs here, walked
        down. Each as @{ Name; Info; Directory }, the pack first.  #>
    param([Parameter(Mandatory)] [string] $Root, [Parameter(Mandatory)] [string] $Name)

    $chain = [ordered]@{}
    $queue = [System.Collections.Generic.Queue[string]]::new()
    $queue.Enqueue($Name)
    while ($queue.Count) {
        $n = $queue.Dequeue()
        if ($chain.Contains($n)) { continue }
        $info = Read-PackInfo -Root $Root -Name $n
        $chain[$n] = @{ Name = $n; Info = $info; Directory = Join-Path $Root $n }
        foreach ($dep in Get-RequiredName $info) {
            if (Test-Path -LiteralPath (Join-Path $Root "$dep/info.json")) { $queue.Enqueue($dep) }
        }
    }
    @($chain.Values)
}

function Remove-VersionedCopy {
    <#  Remove every <name>_<x.y.z>.zip and <name>_<x.y.z> directory of one mod from $Directory,
        and with -Bare its <name> directory too. A neighbour whose name only starts the same stays.  #>
    param([Parameter(Mandatory)] [string] $Directory, [Parameter(Mandatory)] [string] $Name, [switch] $Bare)

    $pattern = '^' + [regex]::Escape($Name) + $(if ($Bare) { '(_\d+\.\d+\.\d+(\.zip)?)?$' } else { '_\d+\.\d+\.\d+(\.zip)?$' })
    Get-ChildItem -LiteralPath $Directory | Where-Object { $_.Name -match $pattern } |
        ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
}

function Remove-DroppedMod {
    <#  Remove from $Directory, and from fetch-mods.ps1's download cache in its .zips, every mod not
        named in $Keep: a directory, or a .zip, whose name less any _<x.y.z> is not kept. Other
        dot-entries and other files, such as mod-list.json, stay.  #>
    param([Parameter(Mandatory)] [string] $Directory, [Parameter(Mandatory)] [string[]] $Keep)

    Get-ChildItem -LiteralPath $Directory, (Join-Path $Directory '.zips') -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notlike '.*' -and ($_.PSIsContainer -or $_.Extension -eq '.zip') } |
        Where-Object { ($_.Name -replace '(_\d+\.\d+\.\d+)?(\.zip)?$') -notin $Keep } |
        ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
}

function Publish-PackZip {
    <#  Zip one pack into $ModsDirectory as <name>_<version>.zip, holding <name>_<version>/, which
        is the shape the portal and the game take. Any earlier zip or directory of the pack there
        is removed, whatever its version, once the new zip is built and before it takes its place.  #>
    param([Parameter(Mandatory)] [hashtable] $Pack, [Parameter(Mandatory)] [string] $ModsDirectory)

    $name = $Pack.Name
    $folder = "$($name)_$($Pack.Info.version)"
    New-Item -ItemType Directory -Path $ModsDirectory -Force | Out-Null
    $zip = Join-Path $ModsDirectory "$folder.zip"
    $partial = "$zip.partial"
    if (Test-Path -LiteralPath $partial) { Remove-Item -LiteralPath $partial -Force }

    $archive = [IO.Compression.ZipFile]::Open($partial, 'Create')
    try {
        foreach ($f in Get-ChildItem -LiteralPath $Pack.Directory -Recurse -File) {
            $rel = [IO.Path]::GetRelativePath($Pack.Directory, $f.FullName) -replace '\\', '/'
            [void] [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $f.FullName, "$folder/$rel")
        }
    }
    finally { $archive.Dispose() }

    Remove-VersionedCopy -Directory $ModsDirectory -Name $name -Bare
    Move-Item -LiteralPath $partial -Destination $zip
    $zip
}

function Invoke-SelfTest {
    $temp = Join-Path ([IO.Path]::GetTempPath()) "stage-pack-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
    $root = Join-Path $temp 'repo'
    $mods = Join-Path $temp 'mods'
    $write = {
        param($name, $body)
        New-Item -ItemType Directory -Path (Join-Path $root $name) -Force | Out-Null
        Set-Content -LiteralPath (Join-Path $root "$name/info.json") -Value $body -NoNewline
    }
    & $write 'Low'  '{"name":"Low","version":"0.2.0","factorio_version":"2.0","dependencies":["base >= 2.0.0","lib"]}'
    & $write 'Mid'  '{"name":"Mid","version":"0.1.0","factorio_version":"2.0","dependencies":["base","~ Low >= 0.1.0","? Side","! Enemy"]}'
    & $write 'High' '{"name":"High","version":"1.4.2","factorio_version":"2.0","dependencies":["Mid","space-age"]}'
    & $write 'Side' '{"name":"Side","version":"0.1.0","factorio_version":"2.0","dependencies":[]}'
    & $write 'Enemy' '{"name":"Enemy","version":"0.1.0","factorio_version":"2.0","dependencies":[]}'
    & $write 'Commented' "{`"name`":`"Commented`",`"version`":`"0.1.0`" /* no */}"
    & $write 'Trailing' '{"name":"Trailing","version":"0.1.0",}'
    & $write 'Liar' '{"name":"Other","version":"0.1.0"}'
    & $write 'Lineless' '{"name":"Lineless","version":"0.1.0"}'
    New-Item -ItemType Directory -Path $mods -Force | Out-Null
    # What a previous stage and a neighbour leave behind.
    Set-Content (Join-Path $mods 'Mid_0.0.9.zip') 'old'
    New-Item -ItemType Directory -Path (Join-Path $mods 'Mid') -Force | Out-Null
    Set-Content (Join-Path $mods 'Mid/info.json') '{"name":"Mid","version":"0.0.1"}'
    Set-Content (Join-Path $mods 'MidX_0.1.0.zip') 'a neighbour'
    $infoHash = { Get-ChildItem -LiteralPath $root -Recurse -File | Get-FileHash | ForEach-Object Hash }
    $before = @(& $infoHash)

    $refuses = { param($name, $pattern) try { Get-PackChain -Root $root -Name $name; $false } catch { $_.Exception.Message -match $pattern } }

    $cases = @(
        @{ Name = 'the chain walks required and ~ packs down, not ?, ! or game mods'; Test = {
            (@(Get-PackChain -Root $root -Name 'High') | ForEach-Object Name) -join ',' -eq 'High,Mid,Low' } }
        @{ Name = 'an info.json with no dependencies requires nothing, not one empty name'; Test = {
            @(Get-RequiredName ('{"name":"Bare","version":"0.1.0"}' | ConvertFrom-Json)).Count -eq 0 } }
        @{ Name = 'an unknown pack is refused, naming the packs there are'; Test = {
            & $refuses 'Nope' "No pack 'Nope'\. Packs: .*High" } }
        @{ Name = 'an info.json with a comment is refused as not valid JSON'; Test = {
            & $refuses 'Commented' 'is not valid JSON' } }
        @{ Name = 'an info.json with a trailing comma is refused as not valid JSON'; Test = {
            & $refuses 'Trailing' 'is not valid JSON' } }
        @{ Name = 'an info.json naming another pack is refused'; Test = {
            & $refuses 'Liar' "names itself 'Other'" } }
        @{ Name = 'an info.json with no factorio_version is refused by name, not by StrictMode'; Test = {
            & $refuses 'Lineless' 'has no factorio_version' } }
        @{ Name = 'a member''s versioned zips and directories go before a fetch; its fetched directory and neighbours stay'; Test = {
            $d = Join-Path $temp 'member'
            New-Item -ItemType Directory -Path (Join-Path $d 'flib'), (Join-Path $d 'flib_0.16.1') -Force | Out-Null
            'x' | Set-Content (Join-Path $d 'flib_0.16.2.zip'); 'x' | Set-Content (Join-Path $d 'flibX_1.0.0.zip')
            Remove-VersionedCopy -Directory $d -Name 'flib'
            (@(Get-ChildItem -LiteralPath $d | ForEach-Object Name | Sort-Object) -join ',') -eq 'flib,flibX_1.0.0.zip' } }
        @{ Name = 'a mod the pack has dropped goes, in every shape; members, packs and non-mods stay'; Test = {
            $d = Join-Path $temp 'dropped'
            New-Item -ItemType Directory -Path (Join-Path $d 'flib'), (Join-Path $d 'Gone'), (Join-Path $d 'Gone_0.9.0'), (Join-Path $d '.zips') -Force | Out-Null
            'x' | Set-Content (Join-Path $d 'Gone_1.0.0.zip'); 'x' | Set-Content (Join-Path $d 'Mid_0.1.0.zip')
            'x' | Set-Content (Join-Path $d 'Some_Mod_2.0.1.zip'); '{}' | Set-Content (Join-Path $d 'mod-list.json')
            'x' | Set-Content (Join-Path $d '.zips/Gone_1.0.0.zip'); 'x' | Set-Content (Join-Path $d '.zips/flib_0.16.5.zip')
            Remove-DroppedMod -Directory $d -Keep 'flib', 'Some_Mod', 'Mid'
            (@(Get-ChildItem -LiteralPath $d -Force | ForEach-Object Name | Sort-Object) -join ',') -eq '.zips,flib,Mid_0.1.0.zip,mod-list.json,Some_Mod_2.0.1.zip' -and
                (@(Get-ChildItem -LiteralPath (Join-Path $d '.zips') | ForEach-Object Name) -join ',') -eq 'flib_0.16.5.zip' } }
        @{ Name = 'the zip is named from info.json and holds <name>_<version>/info.json'; Test = {
            $zip = Publish-PackZip -Pack (Get-PackChain -Root $root -Name 'High')[0] -ModsDirectory $mods
            $a = [IO.Compression.ZipFile]::OpenRead($zip)
            try { $entries = @($a.Entries | ForEach-Object FullName) } finally { $a.Dispose() }
            (Split-Path $zip -Leaf) -eq 'High_1.4.2.zip' -and ($entries -join ',') -eq 'High_1.4.2/info.json' } }
        @{ Name = 'staging twice leaves one copy: old zips and directories go, neighbours stay'; Test = {
            $mid = (Get-PackChain -Root $root -Name 'Mid')[0]
            Publish-PackZip -Pack $mid -ModsDirectory $mods | Out-Null
            Publish-PackZip -Pack $mid -ModsDirectory $mods | Out-Null
            $left = @(Get-ChildItem -LiteralPath $mods | ForEach-Object Name | Sort-Object)
            ($left -join ',') -eq 'High_1.4.2.zip,Mid_0.1.0.zip,MidX_0.1.0.zip' } }
        @{ Name = 'the load harness reads the staged zips as they stand'; Test = {
            . (Join-Path $TOOLS 'load-harness-lib.ps1')
            Remove-Item -LiteralPath (Join-Path $mods 'MidX_0.1.0.zip')
            $rows = @(Get-HarnessMods -Path $mods)
            (($rows | ForEach-Object { "$($_.Name) $($_.Version)" }) -join ',') -eq 'High 1.4.2,Mid 0.1.0' } }
        @{ Name = 'no info.json was modified'; Test = {
            -not (Compare-Object $before @(& $infoHash)) } }
    )

    $failures = 0
    $n = 0
    try {
        foreach ($c in $cases) {
            $n++
            $ok = try { [bool] (& $c.Test) } catch { Write-Host "    threw: $($_.Exception.Message)"; $false }
            Write-Host ("self-test {0}/{1}: {2} -- {3}" -f $n, $cases.Count, $c.Name, $(if ($ok) { 'ok' } else { 'FAILED' }))
            if (-not $ok) { $failures++ }
        }
    }
    finally { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
    Write-Host ''
    if ($failures) { Write-Host "FAILED - self-test: $failures of $($cases.Count) case(s) did not hold."; exit 1 }
    Write-Host "OK - self-test passed: all $($cases.Count) cases."
    exit 0
}

if ($SelfTest) { Invoke-SelfTest }
if (-not $Pack) { throw 'Name the pack to stage, e.g. Grado_ABC. Or -SelfTest.' }
if (-not (Test-Path -LiteralPath (Join-Path $TOOLS 'resolve-modpack.ps1'))) {
    throw "The shared tools are not at $TOOLS. Run: git submodule update --init"
}

$chain = @(Get-PackChain -Root $ROOT -Name $Pack)
$line = $chain[0].Info.factorio_version
$offLine = @($chain | Where-Object { $_.Info.factorio_version -ne $line } | ForEach-Object { "$($_.Name) ($($_.Info.factorio_version))" })
if ($offLine) { throw "$Pack declares factorio_version $line, but packs under it do not: $($offLine -join ', ')." }
# Only the default directory is pruned: a directory the user names may hold mods of their own.
$prune = -not $ModsDirectory
if ($prune) { $ModsDirectory = Join-Path $ROOT ".mod-cache/$Pack" }
# Absolute once, so the zip written through .NET and the moves through PowerShell agree on where.
$ModsDirectory = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($ModsDirectory)
if (-not $Build) {
    . (Join-Path $TOOLS 'load-harness-lib.ps1')
    $data = Get-FactorioDataDirectory -FactorioExe (Resolve-FactorioExe -Path $FactorioExe)
    $Build = (Get-Content -LiteralPath (Join-Path $data 'base/info.json') -Raw | ConvertFrom-Json).version
}
# A 2.1 game does not load a mod declaring 2.0, so a set resolved across lines could never load.
if (-not $Build.StartsWith("$line.")) {
    throw "$Pack declares factorio_version $line, and build $Build is not on that line. Pass -Build $line.<n>, or run against a $line install."
}
$pinFile = Join-Path $ROOT ".mod-cache/$Pack.pins.psd1"
New-Item -ItemType Directory -Path (Split-Path $pinFile) -Force | Out-Null

Write-Host "stage-pack: $Pack $($chain[0].Info.version), chain $(($chain | ForEach-Object Name) -join ' > '), line $line on build $Build"
Write-Host "  into $ModsDirectory"

# Both tools fail by throwing, and resolve-modpack.ps1 also by exit 1, so both are checked.
$global:LASTEXITCODE = 0
try { & (Join-Path $TOOLS 'resolve-modpack.ps1') -Line $line -Build $Build -PinFile $pinFile @($chain | ForEach-Object { Join-Path $_.Directory 'info.json' }) }
catch { Write-Host "  $($_.Exception.Message)"; $global:LASTEXITCODE = 1 }
if ($LASTEXITCODE) { Write-Host ''; Write-Host "FAILED - $Pack did not resolve on $Build; nothing fetched or staged."; exit 1 }

New-Item -ItemType Directory -Path $ModsDirectory -Force | Out-Null
$members = @((Import-PowerShellDataFile -LiteralPath $pinFile).Sets[$Pack])
if ($prune) { Remove-DroppedMod -Directory $ModsDirectory -Keep @($members.Name; $chain.Name) }
foreach ($m in $members) { Remove-VersionedCopy -Directory $ModsDirectory -Name $m.Name }
try { & (Join-Path $TOOLS 'fetch-mods.ps1') -PinFile $pinFile -Set $Pack -CacheDirectory $ModsDirectory }
catch { Write-Host "  $($_.Exception.Message)"; Write-Host ''; Write-Host "FAILED - the members of $Pack could not all be fetched; the packs were not staged."; exit 1 }

foreach ($p in $chain) { Write-Host "  staged $(Publish-PackZip -Pack $p -ModsDirectory $ModsDirectory)" }

$bundled = @($chain | ForEach-Object { Get-RequiredName $_.Info } | Where-Object { $_ -in $GAME_MODS -and $_ -ne 'base' } | Sort-Object -Unique)
$with = if ($bundled) { " -With $($bundled -join ',')" } else { '' }
$exe = if ($FactorioExe) { " -FactorioExe `"$FactorioExe`"" } else { '' }
Write-Host ''
Write-Host "OK - $Pack staged with every member at its resolved release. To load it:"
Write-Host "  pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1$exe$with `"$ModsDirectory`""
exit 0
