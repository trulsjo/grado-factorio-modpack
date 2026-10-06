<#
.SYNOPSIS
    Gives the path of a --dump-data dump of a staged pack, making it only when the cache has none
    for that staged set. The path is the last line printed. Exit 0 means the path names a dump of
    the set its .key file lists.

.DESCRIPTION
    A DUMP IS KEPT, NOT THROWN AWAY (#148). A dump of an overhaul pack takes about a minute, and
    the measuring sessions of 2026-10-04 and 2026-10-05 each made their own of the same staged
    sets. This makes one through the shared harness's Invoke-HarnessDump and keeps it in
    .dump-cache/ under the repository root, which is git-ignored and outside the staged mod
    directories. Three files per dump:

      <pack>[+<bundled>...]-<checksum>-<id>.json   the dump
      ....log                                      the game's output from the run that made it
      ....key                                      the staged set it is a dump of, as text

    <checksum> is the prototype list checksum the game prints in that log. <id> is the first
    twelve hex digits of the SHA-256 of the .key file's text.

    WHAT MAKES A STAGED SET. The .key lists the game build, the bundled mods enabled, and every
    enabled mod in .mod-cache/<Pack> as name, version, directory or zip, file count and total
    bytes. A request is served from the cache only when a .key there holds exactly that text and
    its dump is still beside it. So a member at another release, a mod disabled, another bundled
    selection, another build, or a file added to or removed from a staged mod, is a different set
    and gets a dump of its own. A disabled mod is left out of the key, so a set with a mod
    disabled and a set without that mod staged are one set.

    WHAT IT CANNOT SEE. A file inside a staged mod rewritten to the same length under the same
    version: the key reads sizes, not contents, because hashing a staged overhaul pack is 2.5 GB
    (Grado_ABC, 2026-10-06). The mod settings: the harness loads every mod at its defaults. And a
    pack that was never staged, or staged long ago, is dumped as it stands; staging is
    scripts/stage-pack.ps1's.

    IT WRITES ONLY UNDER THE CACHE DIRECTORY. The staged directory is read, and junctioned into
    the harness's temp directory for the run. No info.json is modified.

    TO CLEAR IT, delete .dump-cache/, or the three files of one dump.

.PARAMETER Pack
    The staged pack, by name: .mod-cache/<Pack> must exist, as scripts/stage-pack.ps1 leaves it.

.PARAMETER With
    Bundled mods to enable, comma-separated, e.g. -With space-age. Dependencies are pulled in.
    Without it the dump is base only.

.PARAMETER Disabled
    Staged mods to load disabled, comma-separated, in exact case. A name that is not staged is
    refused.

.PARAMETER FactorioExe
    Path to Factorio.exe. Defaults as load-harness.ps1 does.

.PARAMETER CacheDirectory
    Where the dumps are kept. Defaults to .dump-cache under the repository root.

.PARAMETER SelfTest
    Prove a second request is served from the cache and a changed staged set is not, against
    fixture mods in a temp directory and a stand-in for the game. No network and no game, but it
    needs the tools submodule (git submodule update --init) for the harness library.

.EXAMPLE
    pwsh -File scripts/get-dump.ps1 Grado_ABC

.EXAMPLE
    pwsh -File scripts/get-dump.ps1 Grado_ABCS -With space-age -Disabled Grado_ABCS
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [Parameter(Position = 0)] [string] $Pack,
    [string] $With,
    [string] $Disabled,
    [string] $FactorioExe,
    [string] $CacheDirectory,
    [switch] $SelfTest
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ROOT = Split-Path $PSScriptRoot -Parent
$LIB  = Join-Path $ROOT 'vendor/grado-factorio-tools/scripts/load-harness-lib.ps1'
if (-not (Test-Path -LiteralPath $LIB)) { throw "The shared tools at $LIB are missing. Run: git submodule update --init" }
. $LIB

function Get-PackDump {
    <#  The path of a dump of the mods in $ModsDirectory less $Disabled, from $CacheDirectory if a
        dump of that set is there. Otherwise $Make is called with a directory, into which it writes
        dump.json and dump.log, and the dump is kept. The .key is written last, so a run that stops
        half-way leaves nothing a later request is served.  #>
    param(
        [Parameter(Mandatory)] [string] $ModsDirectory,
        [Parameter(Mandatory)] [string] $Pack,
        [Parameter(Mandatory)] [string] $Build,
        [Parameter(Mandatory)] [string] $CacheDirectory,
        [Parameter(Mandatory)] [scriptblock] $Make,
        [string[]] $Bundled = @(),
        [string[]] $Disabled = @()
    )

    $rows = @(Get-HarnessMods -Path $ModsDirectory)
    # Refused, because the set is keyed by what is enabled: a misspelt name would disable nothing
    # and be served the whole pack's dump.
    $unknown = @($Disabled | Where-Object { $_ -cnotin $rows.Name })
    if ($unknown) { throw "Not staged in ${ModsDirectory}: $($unknown -join ', '). Names match case exactly." }

    $key = @(
        "factorio $Build"
        "bundled $(($Bundled | Sort-Object) -join ',')"
        foreach ($r in $rows | Where-Object { $_.Name -cnotin $Disabled }) {
            # ponytail: sizes, not contents. A same-length edit under the same version is not seen;
            # hash the files if staged mods ever get edited in place.
            $size = Get-ChildItem -LiteralPath $r.Path -Recurse -File -Force | Measure-Object Length -Sum
            "$($r.Name) $($r.Version) $($r.Kind), $($size.Count) file(s), $([long] $size.Sum) bytes"
        }
    ) -join "`n"
    $id = [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes($key))).Substring(0, 12).ToLower()

    $kept = Get-ChildItem -LiteralPath $CacheDirectory -Filter "*-$id.key" -ErrorAction SilentlyContinue |
        Where-Object { (Get-Content -LiteralPath $_.FullName -Raw) -ceq $key } |
        ForEach-Object { [IO.Path]::ChangeExtension($_.FullName, '.json') } |
        Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
    if ($kept) { Write-Host "get-dump: served from the cache, nothing run"; return $kept }

    $work = Join-Path $CacheDirectory ".making-$id"
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Path $work -Force | Out-Null
    try {
        & $Make $work | Out-Null
        $checksum = Select-String -LiteralPath (Join-Path $work 'dump.log') -Pattern 'Prototype list checksum: (\d+)' |
            Select-Object -Last 1 | ForEach-Object { $_.Matches[0].Groups[1].Value }
        if (-not $checksum) { throw "The game printed no prototype list checksum, so the dump has no name and is not kept." }
        $base = Join-Path $CacheDirectory ((@($Pack) + @($Bundled | Sort-Object) -join '+') + "-$checksum-$id")
        Move-Item -LiteralPath (Join-Path $work 'dump.json') -Destination "$base.json" -Force
        Move-Item -LiteralPath (Join-Path $work 'dump.log') -Destination "$base.log" -Force
        Set-Content -LiteralPath "$base.key" -Value $key -NoNewline
    }
    finally { Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue }
    Write-Host "get-dump: made, no dump of this staged set was in the cache"
    "$base.json"
}

function Invoke-SelfTest {
    $temp = Join-Path ([IO.Path]::GetTempPath()) "get-dump-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
    $mods = Join-Path $temp 'mods'
    $cache = Join-Path $temp 'cache'
    $putMod = {
        param($name, $version)
        New-Item -ItemType Directory -Path (Join-Path $mods $name) -Force | Out-Null
        Set-Content -LiteralPath (Join-Path $mods "$name/info.json") -Value "{`"name`":`"$name`",`"version`":`"$version`"}" -NoNewline
    }
    & $putMod 'alpha' '1.0.0'
    & $putMod 'beta' '1.0.0'
    & $putMod 'zipped' '1.0.0'
    Compress-Archive -Path (Join-Path $mods 'zipped') -DestinationPath (Join-Path $mods 'zipped_1.0.0.zip')
    Remove-Item -LiteralPath (Join-Path $mods 'zipped') -Recurse -Force

    # The stand-in for the game: counts its runs, and prints a checksum as the game does.
    $script:runs = 0
    $script:log = '   1.234 Prototype list checksum: 4242'
    $make = {
        param($dir)
        $script:runs++
        Set-Content -LiteralPath (Join-Path $dir 'dump.json') -Value "{`"run`":$script:runs}"
        Set-Content -LiteralPath (Join-Path $dir 'dump.log') -Value $script:log
    }
    # Files only: NTFS settles a directory's own write time late, after the fixture edits below.
    $listing = { @(Get-ChildItem -LiteralPath $mods -Recurse -File -Force | ForEach-Object { "$($_.FullName)|$($_.Length)|$($_.LastWriteTimeUtc.Ticks)" }) }
    $script:touched = $false
    # One request, returning the path and whether the game ran for it.
    $ask = {
        param([hashtable] $More = @{})
        $before = & $listing
        $ran = $script:runs
        $path = Get-PackDump -ModsDirectory $mods -Pack 'Fixture' -Build '2.0.77' -CacheDirectory $cache -Make $make @More 6>$null
        foreach ($d in Compare-Object $before (& $listing)) { $script:touched = $true; Write-Host "    $($d.SideIndicator) $($d.InputObject)" }
        @{ Path = $path; Made = $script:runs -gt $ran }
    }

    $cases = @(
        @{ Name = 'a first request makes the dump, named by pack and checksum, with its log and key beside it'; Test = {
            $script:first = & $ask
            $first.Made -and (Split-Path $first.Path -Leaf) -match '^Fixture-4242-[0-9a-f]{12}\.json$' -and
                (Test-Path ([IO.Path]::ChangeExtension($first.Path, '.log'))) -and
                (Get-Content ([IO.Path]::ChangeExtension($first.Path, '.key')) -Raw) -match '(?m)^alpha 1\.0\.0 directory, 1 file\(s\), \d+ bytes$' } }
        @{ Name = 'a second request for the same staged set runs nothing and gives the same path'; Test = {
            $r = & $ask
            -not $r.Made -and $r.Path -eq $first.Path } }
        @{ Name = 'a member at another release is not served the old dump'; Test = {
            & $putMod 'beta' '1.0.1'
            $r = & $ask
            $r.Made -and $r.Path -ne $first.Path } }
        @{ Name = 'a mod disabled is not served the dump of the whole set, and is served its own the second time'; Test = {
            $r = & $ask @{ Disabled = 'alpha' }
            $again = & $ask @{ Disabled = 'alpha' }
            $r.Made -and -not $again.Made -and $again.Path -eq $r.Path -and
                (Get-Content ([IO.Path]::ChangeExtension($r.Path, '.key')) -Raw) -notmatch 'alpha' } }
        @{ Name = 'a disabled name that is not staged, or is staged in another case, is refused'; Test = {
            $refused = foreach ($n in 'gamma', 'Alpha') { try { $null = & $ask @{ Disabled = $n }; $false } catch { $_.Exception.Message -match "Not staged.*$n" } }
            -not ($refused -contains $false) } }
        @{ Name = 'another bundled selection is not served, and is in the name'; Test = {
            $r = & $ask @{ Bundled = 'space-age', 'quality' }
            $r.Made -and (Split-Path $r.Path -Leaf) -match '^Fixture\+quality\+space-age-4242-' } }
        @{ Name = 'a file added to a staged mod under the same version is not served the old dump'; Test = {
            $null = & $ask
            Set-Content -LiteralPath (Join-Path $mods 'alpha/data.lua') -Value '-- new'
            (& $ask).Made } }
        @{ Name = 'a zip replaced by one of another size is not served the old dump'; Test = {
            Add-Content -LiteralPath (Join-Path $mods 'zipped_1.0.0.zip') -Value 'x'
            (& $ask).Made -and -not (& $ask).Made } }
        @{ Name = 'a key whose dump has gone is not served; the dump is made again'; Test = {
            $r = & $ask
            Remove-Item -LiteralPath $r.Path
            $again = & $ask
            -not $r.Made -and $again.Made -and (Test-Path -LiteralPath $again.Path) } }
        @{ Name = 'a run that prints no checksum is refused and leaves nothing to be served'; Test = {
            & $putMod 'beta' '1.0.2'
            $script:log = 'no checksum here'
            $before = @(Get-ChildItem -LiteralPath $cache -Force | ForEach-Object Name)
            $threw = try { $null = & $ask; $false } catch { $_.Exception.Message -match 'no prototype list checksum' }
            $script:log = '   1.234 Prototype list checksum: 4242'
            $threw -and -not (Compare-Object $before @(Get-ChildItem -LiteralPath $cache -Force | ForEach-Object Name)) -and (& $ask).Made } }
        @{ Name = 'no request wrote under the staged directory'; Test = { -not $script:touched } }
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
if (-not $Pack) { throw 'Name the staged pack to dump, e.g. Grado_ABC. Or -SelfTest.' }

$mods = Join-Path $ROOT ".mod-cache/$Pack"
if (-not (Test-Path -LiteralPath $mods)) { throw "$Pack is not staged at $mods. Run: pwsh -File scripts/stage-pack.ps1 $Pack" }
if (-not $CacheDirectory) { $CacheDirectory = Join-Path $ROOT '.dump-cache' }
$CacheDirectory = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($CacheDirectory)

$exe = Resolve-FactorioExe -Path $FactorioExe
try { $bundled = @(Resolve-BundledSelection -Requested @($With -split ',' | Where-Object { $_ }) -Bundled (Get-BundledMods -FactorioExe $exe)) }
catch { throw "-With $($_.Exception.Message)" }
$build = (Get-Content -LiteralPath (Join-Path (Get-FactorioDataDirectory -FactorioExe $exe) 'base/info.json') -Raw | ConvertFrom-Json).version
$off = @($Disabled -split ',' | Where-Object { $_ })

$path = Get-PackDump -ModsDirectory $mods -Pack $Pack -Build $build -CacheDirectory $CacheDirectory -Bundled $bundled -Disabled $off -Make {
    param($dir)
    $h = New-LoadHarness -Mods $mods -FactorioExe $exe -With $bundled
    try {
        try { $dump = Invoke-HarnessDump -Harness $h -Tag 'dump' -Disabled $off }
        finally { Copy-Item -LiteralPath (Join-Path $h.Temp 'dump-stdout.txt') -Destination (Join-Path $dir 'dump.log') -ErrorAction SilentlyContinue }
        Move-Item -LiteralPath $dump -Destination (Join-Path $dir 'dump.json')
    }
    finally { Remove-LoadHarness -Harness $h }
}
Write-Host "  the set it is a dump of: $([IO.Path]::ChangeExtension($path, '.key'))"
$path
exit 0
