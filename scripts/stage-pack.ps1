<#
.SYNOPSIS
    Stages one pack, with every mod it needs, into one mods directory that Factorio or the shared
    load harness can take as it stands. Exit 0 means every member is there at its resolved release
    and the pack and the packs under it are zipped beside them.

.DESCRIPTION
    THE INSTALL STEP OF EVERY LOAD (#24), so it is the same each time and a failed load is a
    dependency failure rather than an install mistake. It writes no code of its own for the
    members or the packs: resolving, fetching, packing and loading are the shared tools', ruled
    on #16 and, for packing, #64.

      resolve   vendor/grado-factorio-tools/scripts/resolve-modpack.ps1 picks the exact release of
                every member of the pack's closure, for the pack's own factorio_version and the
                game build, and writes the picks to a pin file.
      fetch     fetch-mods.ps1 there downloads those releases, and only those, into -ModsDirectory.
      stage     pack-mods.ps1 there zips the pack, and every pack under it in the chain, as
                <name>_<version>.zip beside them, holding <name>/. The version is read from the
                pack's info.json; the files are git's tracked set under the pack directory, so an
                untracked file is left out and reported, and a pack directory outside a git work
                tree is refused.

    The result goes to the harness unchanged: load-harness.ps1 <ModsDirectory>, printed at the end.

    STAGING TWICE IS SAFE. A pack's previous zip or directory in -ModsDirectory -- any version --
    is removed once the new zip is written, so Factorio never has two to choose between: the packer
    removes the zips, and this script the <name> and <name>_<version> directories, which the
    packer leaves alone.
    A member is fetched as a directory named <name>, which fetch-mods.ps1 replaces; any
    <name>_<version>.zip or <name>_<version> directory of that member is removed before the fetch,
    as the mod manager installs them that way.

    A MEMBER THE PACK HAS DROPPED IS REMOVED, from the default directory only (#60). Before the
    fetch, any mod in .mod-cache/<Pack> -- directory or zip, and its zip in .zips -- that is not
    in the pack's resolved set or its chain goes, so a reused directory never loads a mod the pack
    no longer has. A -ModsDirectory you name is never pruned: it may be a player's mods directory.

    NAMES ARE COMPARED CASE-SENSITIVELY, as Factorio compares them -- on 2.0.77 a zip or directory
    named Alpha holding a mod named alpha is refused "(case sensitive!)" -- and as the portal does,
    which on 2026-10-01 answered /api/mods/Krastorio2 with 200 and /api/mods/krastorio2 with 404.
    So Alpha and alpha are two mods. Every step that removes something compares this way (#68): the
    packer's one-copy rule, the pack-directory cleanup, a member's versioned copies and the dropped
    mods, so staging one must neither remove the other's copies nor keep the other as a member. So
    does the pack-name check (#78): the name asked for, the name in info.json and the directory must
    agree in case, so grado_abc inside Grado_ABC/ is refused. On Windows that also refuses -Pack or
    a dependency line naming grado_abc. A case-sensitive filesystem does not find that directory at
    all, so there -Pack is refused as an unknown pack and the dependency line is not taken for a
    pack. Every mod name is compared this way, the game mods (base, space-age, ...) included:
    a dependency line naming Space-Age is not taken as bundled and is not passed to the harness,
    as resolve-modpack.ps1 has not taken it since trulsjo/grado-factorio-tools#28 (#88).

    FACTORIO TAKES THE TARGET AS ITS MODS DIRECTORY, on the one run checked (2.0.77 headless,
    Grado_NonChanging, 2026-09-24, #59). fetch-mods.ps1 keeps its downloaded zips in a .zips
    subdirectory, and the game passed over it without a word: no log line, no mod-list.json entry.
    It then enabled every mod it found, and space-age, quality and elevated-rails with them.

    IT REFUSES A MALFORMED PACK. Every info.json in the chain is checked as strict JSON, and for a
    name that matches its directory in case, before anything is fetched: a comment or a trailing
    comma fails here, not inside the game.

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

# For the self-test's reading of the zips; the packing is pack-mods.ps1's.
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
    # Case-sensitive, as Factorio compares mod names: the name asked for, the info.json and the
    # directory on disk must all agree. Windows finds Grado_ABC when asked for grado_abc, so the
    # directory is matched by its name as it is on disk.
    if ((& $field 'name') -cne $Name) { throw "$path names itself '$(& $field 'name')', not '$Name'." }
    if (-not @(Get-ChildItem -LiteralPath $Root -Directory | Where-Object Name -ceq $Name)) {
        throw "$path is found, but its directory is not named '$Name' in that case: Factorio compares mod names case-sensitively."
    }
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
    <#  Remove every <name>_<x.y.z>.zip and <name>_<x.y.z> directory of one mod from $Directory.
        A neighbour whose name only starts the same, or differs only in case, stays.  #>
    param([Parameter(Mandatory)] [string] $Directory, [Parameter(Mandatory)] [string] $Name)

    $pattern = '^' + [regex]::Escape($Name) + '_\d+\.\d+\.\d+(\.zip)?$'
    Get-ChildItem -LiteralPath $Directory | Where-Object { $_.Name -cmatch $pattern } |
        ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
}

function Remove-DroppedMod {
    <#  Remove from $Directory, and from fetch-mods.ps1's download cache in its .zips, every mod not
        named in $Keep: a directory, or a .zip, whose name less any _<x.y.z> is not kept. Other
        dot-entries and other files, such as mod-list.json, stay. A mod whose name differs from a
        kept one only in case is not kept.  #>
    param([Parameter(Mandatory)] [string] $Directory, [Parameter(Mandatory)] [string[]] $Keep)

    $zips = Join-Path $Directory '.zips'
    Get-ChildItem -LiteralPath @($Directory; if (Test-Path -LiteralPath $zips) { $zips }) -Force |
        Where-Object { $_.Name -notlike '.*' -and ($_.PSIsContainer -or $_.Extension -eq '.zip') } |
        Where-Object { ($_.Name -replace '(_\d+\.\d+\.\d+)?(\.zip)?$') -cnotin $Keep } |
        ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
}

function Install-PackZip {
    <#  Zip each pack into $ModsDirectory with the shared packer, pack-mods.ps1, which also deletes
        each pack's other <name>_<x.y.z>.zip there. It leaves directories alone, so an unpacked
        <name> or <name>_<x.y.z> directory of a pack -- which the game would see beside the zip --
        is removed here, once the zips are written.  #>
    [CmdletBinding()]
    param([Parameter(Mandatory)] [hashtable[]] $Chain, [Parameter(Mandatory)] [string] $ModsDirectory)

    & (Join-Path $TOOLS 'pack-mods.ps1') -OutputDirectory $ModsDirectory @($Chain | ForEach-Object Directory)
    foreach ($name in $Chain.Name) {
        # -cmatch, as the packer's one-copy rule: Factorio compares mod names case-sensitively.
        $pattern = '^' + [regex]::Escape($name) + '(_\d+\.\d+\.\d+)?$'
        Get-ChildItem -LiteralPath $ModsDirectory -Directory | Where-Object { $_.Name -cmatch $pattern } |
            ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
    }
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
    & $write 'Cased' '{"name":"cased","version":"0.1.0","factorio_version":"2.0"}'
    & $write 'Lineless' '{"name":"Lineless","version":"0.1.0"}'
    # The shared packer zips git's tracked set, so the fixture packs are tracked, and one file
    # beside them is not.
    git -C $root init --quiet
    if ($LASTEXITCODE -ne 0) { throw 'git init failed; the self-test needs git.' }
    git -C $root add -A
    Set-Content -LiteralPath (Join-Path $root 'High/notes.txt') -Value 'untracked'
    New-Item -ItemType Directory -Path $mods -Force | Out-Null
    # What a previous stage and a neighbour leave behind.
    Set-Content (Join-Path $mods 'Mid_0.0.9.zip') 'old'
    New-Item -ItemType Directory -Path (Join-Path $mods 'Mid'), (Join-Path $mods 'Mid_0.0.8') -Force | Out-Null
    Set-Content (Join-Path $mods 'Mid/info.json') '{"name":"Mid","version":"0.0.1"}'
    Set-Content (Join-Path $mods 'MidX_0.1.0.zip') 'a neighbour'
    # info.json only, since git keeps its own files under $root/.git now.
    $infoHash = { Get-ChildItem -LiteralPath $root -Recurse -File -Filter info.json | Get-FileHash | ForEach-Object Hash }
    $before = @(& $infoHash)

    $refuses = { param($name, $pattern) try { $null = Get-PackChain -Root $root -Name $name; $false } catch { $_.Exception.Message -match $pattern } }

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
        @{ Name = 'an info.json naming its pack in another case only is refused, naming both'; Test = {
            & $refuses 'Cased' "names itself 'cased'.*'Cased'" } }
        # What a dependency line or -Pack in the wrong case asks for. Windows finds the directory
        # anyway, so the name checks must refuse it; a case-sensitive filesystem does not, and
        # refuses it as an unknown pack. Each platform expects its own refusal.
        @{ Name = 'a pack asked for in another case than its directory is refused, though its info.json agrees'; Test = {
            & $refuses 'cased' $(if ($IsWindows) { "directory is not named 'cased'" } else { "No pack 'cased'" }) } }
        @{ Name = 'a pack asked for in another case than its info.json is refused'; Test = {
            & $refuses 'high' $(if ($IsWindows) { "names itself 'High', not 'high'" } else { "No pack 'high'" }) } }
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
        # Names differing only in case are two mods to Factorio, so each step is case-sensitive.
        # Distinct versions, since NTFS would take Flib_1.0.0.zip and flib_1.0.0.zip as one file.
        @{ Name = 'a member''s versioned copies go; a case-only neighbour''s stay'; Test = {
            $d = Join-Path $temp 'member-case'
            New-Item -ItemType Directory -Path (Join-Path $d 'Flib_0.9.0') -Force | Out-Null
            'x' | Set-Content (Join-Path $d 'flib_0.16.2.zip'); 'x' | Set-Content (Join-Path $d 'Flib_1.0.0.zip')
            Remove-VersionedCopy -Directory $d -Name 'flib'
            (@(Get-ChildItem -LiteralPath $d | ForEach-Object Name | Sort-Object) -join ',') -eq 'Flib_0.9.0,Flib_1.0.0.zip' } }
        @{ Name = 'a dropped mod whose name differs from a kept one only in case goes'; Test = {
            $d = Join-Path $temp 'dropped-case'
            New-Item -ItemType Directory -Path (Join-Path $d 'flib'), (Join-Path $d '.zips') -Force | Out-Null
            'x' | Set-Content (Join-Path $d 'Flib_1.0.0.zip'); 'x' | Set-Content (Join-Path $d '.zips/Flib_1.0.0.zip')
            'x' | Set-Content (Join-Path $d '.zips/flib_0.16.5.zip')
            Remove-DroppedMod -Directory $d -Keep 'flib'
            (@(Get-ChildItem -LiteralPath $d -Force | ForEach-Object Name | Sort-Object) -join ',') -eq '.zips,flib' -and
                (@(Get-ChildItem -LiteralPath (Join-Path $d '.zips') | ForEach-Object Name) -join ',') -eq 'flib_0.16.5.zip' } }
        @{ Name = 'the zip is named from info.json and holds <name>/info.json; an untracked file is reported and left out'; Test = {
            Install-PackZip -Chain (Get-PackChain -Root $root -Name 'High')[0] -ModsDirectory $mods -WarningVariable w -WarningAction SilentlyContinue 6>$null
            $a = [IO.Compression.ZipFile]::OpenRead((Join-Path $mods 'High_1.4.2.zip'))
            try { $entries = @($a.Entries | ForEach-Object FullName) } finally { $a.Dispose() }
            ($entries -join ',') -eq 'High/info.json' -and ($w -join ' ') -match 'notes\.txt' } }
        @{ Name = 'staging a chain twice leaves one copy of each pack: old zips and directories go, neighbours stay'; Test = {
            # The whole chain in one call, as a real stage makes it, with a stale directory of the
            # second pack too, so the cleanup is proven past the first.
            New-Item -ItemType Directory -Path (Join-Path $mods 'Low') -Force | Out-Null
            $chain = @(Get-PackChain -Root $root -Name 'Mid')
            Install-PackZip -Chain $chain -ModsDirectory $mods 6>$null
            Install-PackZip -Chain $chain -ModsDirectory $mods 6>$null
            $left = @(Get-ChildItem -LiteralPath $mods | ForEach-Object Name | Sort-Object)
            ($left -join ',') -eq 'High_1.4.2.zip,Low_0.2.0.zip,Mid_0.1.0.zip,MidX_0.1.0.zip' } }
        @{ Name = 'the load harness reads the staged zips as they stand'; Test = {
            . (Join-Path $TOOLS 'load-harness-lib.ps1')
            Remove-Item -LiteralPath (Join-Path $mods 'MidX_0.1.0.zip')
            $rows = @(Get-HarnessMods -Path $mods)
            (($rows | ForEach-Object { "$($_.Name) $($_.Version)" }) -join ',') -eq 'High 1.4.2,Low 0.2.0,Mid 0.1.0' } }
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

try { Install-PackZip -Chain $chain -ModsDirectory $ModsDirectory }
catch { Write-Host "  $($_.Exception.Message)"; Write-Host ''; Write-Host "FAILED - the packs may be partly staged; the members of $Pack are fetched."; exit 1 }

$bundled = @($chain | ForEach-Object { Get-RequiredName $_.Info } | Where-Object { $_ -cin $GAME_MODS -and $_ -cne 'base' } | Sort-Object -Unique -CaseSensitive)
$with = if ($bundled) { " -With $($bundled -join ',')" } else { '' }
$exe = if ($FactorioExe) { " -FactorioExe `"$FactorioExe`"" } else { '' }
Write-Host ''
Write-Host "OK - $Pack staged with every member at its resolved release. To load it:"
Write-Host "  pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1$exe$with `"$ModsDirectory`""
exit 0
