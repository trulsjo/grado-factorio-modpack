<#
.SYNOPSIS
    Reads every `| **Overlaps** |` row in docs/catalogue/*.md against the dependency lists of the
    five packs, and reports each stale one as <file>:<line>: the entry, the rule and the name.
    Exit 1 if it reports one; exit 0 means every row was read and none is stale.

.DESCRIPTION
    WHY (#357). On 2026-09-23 #9 dropped `deadlock-beltboxes-loaders` and struck the overlap's
    row on the Grado_ChangingBase side only. The Grado_ABC side stayed unstruck, and the tally of
    live overlaps in docs/mod-catalogue.md was repeated as three to Truls in the grill on #33,
    a month after it had become two. Nothing read a catalogue entry against a dependency list.

    WHAT IS STALE. A name inside `~~ ~~` is struck and is not read. A row is stale when either
    holds:
      1. it names a mod tagged (`Pack`) that is not in that pack's dependencies;
      2. it stands in the entry of a mod that is not in the dependencies of the pack its file
         catalogues, nor of a pack below it, and still names a mod. An entry resolved through a
         lower pack, which docs/mod-catalogue.md keeps under *In the pack*, is a member.
    It also fails a row it cannot read: a name with no pack tag after it, a tag naming no pack,
    a row under no `## ` or `### ` heading that is a mod's name alone, and a catalogue file with
    no pack of its name. A run that finds no pack or no catalogue file fails too, since it read
    nothing, and so does one that finds no Overlaps row in any catalogue file (#362). Rows are
    counted across the catalogue and not per file: a pack with no cross-pack overlap is a real
    state.

    WHAT IT READS AS WHAT. A pack is a top-level `<dir>/info.json`, by its `name` key. A
    dependency is parsed by `ConvertFrom-Dependency` in
    vendor/grado-factorio-tools/scripts/resolve-modpack.ps1, loaded from that file, so the parse
    is the resolver's. A pack's members are its entries of every kind but incompatible (`!`): an
    optional or hidden entry counts. The packs below one are the packs among its members, and
    theirs in turn. A row's entry is the last `## ` or `### ` heading above it;
    `#### ` and deeper are inside an entry. In a row, the code spans before a tag (`Pack`) and
    after the tag before it are that pack's.

    WHICH STATE. With no switch, the staged content, which is what the commit will hold.
    -Revision reads a commit instead.

    WHAT IT CANNOT SEE. A figure in prose, such as a tally of live overlaps: only the rows are
    read. A mod named in an entry's prose and not in its row. Whether an overlap is real, or
    whether the row on the other pack's side exists. A pack's members below it, for a tag: a tag
    means the pack's own list. A mod a member brings in that is not a pack here. A row whose
    label is misspelt, as `| **Overlap** |`, in a catalogue that has other rows: it is not read,
    and only a catalogue with no row left fails.

.PARAMETER Revision
    Read the catalogue and the packs as at this commit, not as staged.

.PARAMETER SelfTest
    Prove each rule fails a row and names it, that a struck name passes, that a row it cannot
    read fails, that the staged content and -Revision are what is read, that a commit with no
    pack or no catalogue file fails, and that zero rows across the catalogue fails where a file
    with none beside one with a row passes. Those three cases need git.

.EXAMPLE
    pwsh -File scripts/overlap-rows-check.ps1

.EXAMPLE
    pwsh -File scripts/overlap-rows-check.ps1 -Revision 974d342
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [string] $Revision,
    [switch] $SelfTest
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

# The resolver's own parse of a dependency, taken from its file without running the file.
$resolver = Join-Path $PSScriptRoot '../vendor/grado-factorio-tools/scripts/resolve-modpack.ps1'
if (-not (Test-Path -LiteralPath $resolver)) { throw "$resolver not found: run 'git submodule update --init'." }
$ast = [Management.Automation.Language.Parser]::ParseFile((Resolve-Path -LiteralPath $resolver), [ref] $null, [ref] $null)
$parse = $ast.Find({ param($n) $n -is [Management.Automation.Language.FunctionDefinitionAst] -and $n.Name -eq 'ConvertFrom-Dependency' }, $true)
if (-not $parse) { throw "$resolver no longer defines ConvertFrom-Dependency." }
. ([scriptblock]::Create($parse.Extent.Text))

# An Overlaps row, with its cells after the label as group 1.
$ROW = '^\|\s*\*\*Overlaps\*\*\s*\|(.*)\|\s*$'

function Find-Stale {
    <#  The stale rows of the catalogue files, each as @{ File; Line; Text }. Catalogues maps a
        file's path to its lines; Packs maps a pack's name to its dependency strings.  #>
    param(
        [Parameter(Mandatory)] [Collections.IDictionary] $Catalogues,
        [Parameter(Mandatory)] [Collections.IDictionary] $Packs
    )

    $members = @{}
    foreach ($p in $Packs.Keys) {
        $members[$p] = [Collections.Generic.HashSet[string]]::new([string[]] @($Packs[$p] | ForEach-Object { ConvertFrom-Dependency $_ } |
            Where-Object Kind -ne 'incompatible' | ForEach-Object Name), [StringComparer]::Ordinal)
    }
    # A pack's members with those of every pack below it, for rule 2.
    $reach = @{}
    foreach ($p in $Packs.Keys) {
        $reach[$p] = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        $queue = [Collections.Generic.Queue[string]]::new([string[]] @($p))
        while ($queue.Count) {
            foreach ($m in $members[$queue.Dequeue()]) { if ($reach[$p].Add($m) -and $members.ContainsKey($m)) { $queue.Enqueue($m) } }
        }
    }
    foreach ($file in $Catalogues.Keys) {
        $pack = [IO.Path]::GetFileNameWithoutExtension($file)
        $lines = @($Catalogues[$file])
        $entry = $null
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match '^#{2,3}\s+(.*?)\s*$') { $entry = if ($Matches[1] -match '^`([^`]+)`$') { $Matches[1] } else { $null }; continue }
            if ($lines[$i] -notmatch $ROW) { continue }
            $say = { param([string] $text) @{ File = $file; Line = $i + 1; Text = $text } }
            if (-not $members.ContainsKey($pack)) { & $say "no pack is named $pack, so the row cannot be read"; continue }
            if (-not $entry) { & $say 'the row is under no heading that is a mod''s name'; continue }
            $named = [Collections.Generic.List[string]]::new()
            $live = $Matches[1] -replace '~~.*?~~'
            foreach ($group in [regex]::Matches($live, '(?<mods>(?:[^`(]|`[^`]*`|\((?!`))*?)\(`(?<tag>[^`]+)`\)')) {
                $tag = $group.Groups['tag'].Value
                $mods = @([regex]::Matches($group.Groups['mods'].Value, '`([^`]+)`') | ForEach-Object { $_.Groups[1].Value })
                $named.AddRange([string[]] $mods)
                if (-not $members.ContainsKey($tag)) { & $say "it tags (``$tag``), which is no pack"; continue }
                foreach ($m in $mods | Where-Object { -not $members[$tag].Contains($_) }) {
                    & $say "entry ``$entry``, rule 1: it names ``$m`` (``$tag``), which is not in ${tag}'s dependencies"
                }
            }
            $rest = [regex]::Replace($live, '(?:[^`(]|`[^`]*`|\((?!`))*?\(`[^`]+`\)', '')
            foreach ($m in [regex]::Matches($rest, '`([^`]+)`')) {
                $named.Add($m.Groups[1].Value)
                & $say "entry ``$entry``: it names ``$($m.Groups[1].Value)`` with no pack tag after it"
            }
            if ($named.Count -and -not $reach[$pack].Contains($entry)) {
                $list = ($named | ForEach-Object { '`' + $_ + '`' }) -join ', '
                & $say "entry ``$entry``, rule 2: ``$entry`` is not in ${pack}'s dependencies or those of a pack below it, and the row still names $list"
            }
        }
    }
}

if ($SelfTest) {
    $packs = [ordered] @{ Lower = @('base >= 2.0', 'kept', '? soft', '! enemy'); Upper = @('Lower', 'top') }
    $find = { param([string] $text) @(Find-Stale -Catalogues ([ordered] @{ 'docs/catalogue/Upper.md' = ($text -split "`n") }) -Packs $packs | ForEach-Object { "$($_.Line): $($_.Text)" }) }
    $cases = @(
        @{ Name = 'a live row whose mods are members passes, an optional member included'; Test = {
            @(& $find "### ``top```n| **Overlaps** | ``kept``, ``soft`` (``Lower``) |").Count -eq 0 } }
        @{ Name = 'rule 1: a tagged mod that is not in the tagged pack fails, named with its line, and an incompatible entry is no member'; Test = {
            $f = @(& $find "intro`n### ``top```n| **Overlaps** | ``kept`` (``Lower``); ``gone``, ``enemy`` (``Lower``) |")
            $f.Count -eq 2 -and $f[0] -match '^3: entry `top`, rule 1: it names `gone` \(`Lower`\)' -and $f[1] -match 'rule 1: it names `enemy`' } }
        @{ Name = 'rule 2: a live row in the entry of a mod not in the pack fails and names what it still names'; Test = {
            $f = @(& $find "### ``dropped```n| **Overlaps** | ``kept`` (``Lower``) |")
            $f.Count -eq 1 -and $f[0] -match '^2: entry `dropped`, rule 2: .*still names `kept`' } }
        @{ Name = 'rule 2: an entry resolved through a lower pack is a member, and its live row passes'; Test = {
            @(& $find "### ``kept```n| **Status** | line removed from this pack; still a member of ``Lower`` |`n| **Overlaps** | ``soft`` (``Lower``) |").Count -eq 0 } }
        @{ Name = 'a struck name passes both rules, and a struck row in a dropped entry passes'; Test = {
            (@(& $find "### ``top```n| **Overlaps** | ~~``gone`` (``Lower``)~~ - resolved |").Count -eq 0) -and
                (@(& $find "### ``dropped```n| **Overlaps** | ~~``kept`` (``Lower``)~~ - resolved (#1), this mod is in no pack |").Count -eq 0) } }
        @{ Name = 'a #### heading stays inside its entry, and a ## heading that is no mod''s name leaves the row unread'; Test = {
            (@(& $find "### ``dropped```n#### Against ``kept```n| **Overlaps** | ``kept`` (``Lower``) |").Count -eq 1) -and
                (@(& $find "## Notes on ``kept```n| **Overlaps** | ``kept`` (``Lower``) |")[0] -match 'under no heading') } }
        @{ Name = 'a name with no tag, a tag that is no pack and a file that is no pack each fail'; Test = {
            $untagged = @(& $find "### ``top```n| **Overlaps** | ``kept`` |")
            $nopack = @(& $find "### ``top```n| **Overlaps** | ``kept`` (``Nowhere``) |")
            $nofile = @(Find-Stale -Catalogues @{ 'docs/catalogue/Stray.md' = @('### `top`', '| **Overlaps** | `kept` (`Lower`) |') } -Packs $packs)
            $untagged.Count -eq 1 -and $untagged[0] -match 'no pack tag' -and $nopack[0] -match 'which is no pack' -and $nofile[0].Text -match 'no pack is named Stray' } }
        @{ Name = 'the staged content is what is read, and -Revision reads a commit: a stale staged row fails by file and line, its staged repair passes, the commit before still fails, and so do a commit with no pack and one with no catalogue file'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "overlap-rows-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path (Join-Path $temp 'docs/catalogue'), (Join-Path $temp 'Lower'), (Join-Path $temp 'Upper') -Force | Out-Null
            try {
                $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
                $write = { param([string] $path, [string[]] $lines) Set-Content -LiteralPath (Join-Path $temp $path) -Value $lines }
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                & $git init --quiet
                & $write 'docs/catalogue/Upper.md' @('# Upper', '', '### `top`', '', '| **Overlaps** | `gone` (`Lower`) |')
                & $git add -A
                & $git commit --quiet -m x
                & $git rm --quiet docs/catalogue/Upper.md
                New-Item -ItemType Directory -Path (Join-Path $temp 'docs/catalogue') -Force | Out-Null
                & $write 'Lower/info.json' '{ "name": "Lower", "dependencies": ["kept"] }'
                & $write 'Upper/info.json' '{ "name": "Upper", "dependencies": ["Lower", "top"] }'
                & $git add -A
                & $git commit --quiet -m x
                & $write 'docs/catalogue/Upper.md' @('# Upper', '', '### `top`', '', '| **Overlaps** | `gone` (`Lower`) |')
                & $git add -A
                & $git commit --quiet -m x
                & $write 'docs/catalogue/Upper.md' @('# Upper', '', '### `top`', '', '| **Overlaps** | ~~`gone` (`Lower`)~~ - resolved |')
                $red = & $run
                & $git add -A
                $green = & $run
                $before = & $run -Revision HEAD
                $nopack = & $run -Revision HEAD~2
                $nocatalogue = & $run -Revision HEAD~1
                if ($red.Code -ne 1 -or $green.Code -ne 0) { Write-Host (($red.Text + $green.Text).TrimEnd() -replace '(?m)^', '    ') }
                $red.Code -eq 1 -and $red.Text -match '(?m)^docs/catalogue/Upper\.md:5: entry `top`, rule 1' -and $green.Code -eq 0 -and $before.Code -eq 1 -and
                    $nopack.Code -eq 1 -and $nopack.Text -match 'found 0 pack\(s\) and 1 catalogue file\(s\)' -and
                    $nocatalogue.Code -eq 1 -and $nocatalogue.Text -match 'found 2 pack\(s\) and 0 catalogue file\(s\)'
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force }
        } }
        @{ Name = 'zero Overlaps rows across the catalogue fails, a misspelt label among them, and a file with none beside one that has a row passes'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "overlap-rows-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path (Join-Path $temp 'docs/catalogue'), (Join-Path $temp 'Lower'), (Join-Path $temp 'Upper') -Force | Out-Null
            try {
                $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
                $write = { param([string] $path, [string[]] $lines) Set-Content -LiteralPath (Join-Path $temp $path) -Value $lines }
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                & $git init --quiet
                & $write 'Lower/info.json' '{ "name": "Lower", "dependencies": ["kept"] }'
                & $write 'Upper/info.json' '{ "name": "Upper", "dependencies": ["Lower", "top"] }'
                & $write 'docs/catalogue/Lower.md' @('# Lower', '', '### `kept`', '', '| **Status** | in |')
                & $write 'docs/catalogue/Upper.md' @('# Upper', '', '### `top`', '', '| **Overlap** | `gone` (`Lower`) |')
                & $git add -A
                & $git commit --quiet -m x
                & $write 'docs/catalogue/Upper.md' @('# Upper', '', '### `top`', '', '| **Overlaps** | `kept` (`Lower`) |')
                & $git add -A
                & $git commit --quiet -m x
                $none = & $run -Revision HEAD~1
                $one = & $run -Revision HEAD
                if ($none.Code -ne 1 -or $one.Code -ne 0) { Write-Host (($none.Text + $one.Text).TrimEnd() -replace '(?m)^', '    ') }
                $none.Code -eq 1 -and $none.Text -match 'FAILED - overlap-rows-check: 0 Overlaps row\(s\) in 2 catalogue file\(s\)' -and
                    $one.Code -eq 0 -and $one.Text -match '1 Overlaps row\(s\) in 2 catalogue file\(s\)'
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force }
        } }
    )
    $failures = 0
    $n = 0
    foreach ($c in $cases) {
        $n++
        $ok = try { [bool] (& $c.Test) } catch { Write-Host "    threw: $($_.Exception.Message)"; $false }
        Write-Host ("self-test {0}/{1}: {2} -- {3}" -f $n, $cases.Count, $c.Name, $(if ($ok) { 'ok' } else { 'FAILED' }))
        if (-not $ok) { $failures++ }
    }
    Write-Host ''
    if ($failures) { Write-Host "FAILED - self-test: $failures of $($cases.Count) case(s) did not hold."; exit 1 }
    Write-Host "OK - self-test passed: all $($cases.Count) cases."
    exit 0
}

# The staged content, or the commit's: `:path` or `<rev>:path` to git show.
$at = if ($Revision) { "${Revision}:" } else { ':' }
$listed = @(if ($Revision) { git -c core.quotepath=off ls-tree -r --name-only $Revision } else { git -c core.quotepath=off ls-files })
if ($LASTEXITCODE -ne 0) { throw 'git could not list the files to read. Run it inside the repository.' }
$packs = [ordered] @{}
foreach ($f in $listed -match '^[^/]+/info\.json$') {
    $info = (git show "$at$f" | Out-String) | ConvertFrom-Json
    if ($LASTEXITCODE -ne 0) { throw "git could not read $at$f." }
    $packs[$info.name] = @($info.PSObject.Properties['dependencies']?.Value | Where-Object { $_ })
}
$catalogues = [ordered] @{}
foreach ($f in $listed -match '^docs/catalogue/[^/]+\.md$') {
    $catalogues[$f] = @(git show "$at$f")
    if ($LASTEXITCODE -ne 0) { throw "git could not read $at$f." }
}

$where = if ($Revision) { " at $Revision" } else { ', as staged' }
if (-not $packs.Count -or -not $catalogues.Count) {
    Write-Host "FAILED - overlap-rows-check: found $($packs.Count) pack(s) and $($catalogues.Count) catalogue file(s)$where, so nothing was read."
    exit 1
}
# Counted across the catalogue and not per file: a pack with no cross-pack overlap is a real
# state (#362).
$rows = @($catalogues.Values | ForEach-Object { $_ } | Where-Object { $_ -match $ROW }).Count
$what = "$rows Overlaps row(s) in $($catalogues.Count) catalogue file(s) against $($packs.Count) pack(s)$where"
if (-not $rows) {
    Write-Host "FAILED - overlap-rows-check: $what, so nothing was read. A row is labelled exactly | **Overlaps** |."
    exit 1
}
$stale = @(Find-Stale -Catalogues $catalogues -Packs $packs)
foreach ($s in $stale) { Write-Host "$($s.File):$($s.Line): $($s.Text)" }
if ($stale) {
    Write-Host ''
    Write-Host "FAILED - overlap-rows-check: $($stale.Count) stale Overlaps row(s), $what. Strike each name the row no longer holds, as ~~``mod`` (``Pack``)~~ - resolved <date> (#N)."
    exit 1
}
Write-Host "OK - overlap-rows-check: $what, no stale Overlaps row."
exit 0
