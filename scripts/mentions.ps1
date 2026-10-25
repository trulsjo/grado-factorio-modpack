<#
.SYNOPSIS
    Lists each tracked line that names what a commit range changed: a script, a pack member, a
    `base >=` floor or a `factorio_version`, as <file>:<line>: <name>: [dated: ]<the line>. It
    lists and does not fail.

.DESCRIPTION
    WHY (#365). A sentence outside a diff that rests on what the diff changed is not in the diff,
    and the pre-PR review missed such sentences on two pull requests running. On PR #363 three of
    the plugin pass's findings were sentences saying when a changed script fails. On PR #374 four
    were sentences naming an old floor or a dropped member, and the confirmation found four
    catalogue sections arguing from the old line. Finding those lines is mechanical; judging each
    is not. The list is handed to the pre-PR reviewer beside the diff
    (docs/agents/pre-pr-review-brief.md), who reads each hit against it.

    WHAT IT LOOKS FOR. The changed names of the range, from its merge base to its tip:
      - each `scripts/*.ps1` and each `.githooks/` file the range adds, changes, deletes or
        renames, by its file name;
      - each dependency name a top-level `<dir>/info.json` gains or loses, compared as a set of
        names per pack whatever the prefix, so a constraint-only change names nothing and a mod
        moved between packs is named once;
      - each `base >=` constraint an info.json replaces, as its old text;
      - each `factorio_version` an info.json replaces, as its old value.
    A name is matched whole: a letter, digit, `-` or `_` on either side is another name, and a
    version is not matched inside a longer one, so `2.0` is not found in `2.0.77`.

    WHAT IT READS. Every tracked text file at the tip.

    WHAT IT LEAVES. Files under docs/loads/ and docs/traces/, which record one run as it was. A
    line the range adds, which is in the diff already. Files git calls binary, and the
    submodule. A hit inside a dated note, `*YYYY-MM-DD (#n): ...*`, is listed and tagged
    `dated:`, so the reviewer can pass over a note that names a member as it was.

    WHY IT DOES NOT FAIL. A hit is a sentence to read, not a defect: most hold. Exit 0 says the
    range was read, and nothing about what was listed. A range git cannot read, or an info.json
    that is not JSON, exits 1 with its own message.

    WHAT IT CANNOT SEE. A sentence that rests on a change without naming it, such as "the floor
    is the resolver's" or a figure counted from a member list. A name written another way: a
    script without its `.ps1`, a mod by its title, a floor with its version alone. A dated note
    holding `*` of its own ends, for the tag, at its first one. A name broken over two lines.

.PARAMETER Range
    The commit range, with three dots: -Range origin/main...HEAD.

.PARAMETER SelfTest
    Prove each kind of changed name is found and matched whole, and over a range in a repository
    it builds: what is listed, what is left, what is tagged, and what it exits with. Needs git
    and the tools submodule.

.EXAMPLE
    pwsh -File scripts/mentions.ps1 -Range origin/main...HEAD
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [string] $Range,
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

# The changed names, each as @{ Name; Pattern }, from the packs at two revisions and the paths
# the range touches.
function Get-ChangedNames([Collections.IDictionary] $Before, [Collections.IDictionary] $After, [string[]] $Paths) {
    # A name or version matched whole: no letter, digit, - or _ beside it, and no .<digit> after.
    $whole = { param([string] $core) '(?<![\w.-])' + $core + '(?![\w-]|\.\d)' }
    $names = [ordered] @{}
    foreach ($p in $Paths -match '^(?:scripts/[^/]+\.ps1|\.githooks/[^/]+)$') {
        $leaf = Split-Path $p -Leaf
        $names[$leaf] = & $whole ([regex]::Escape($leaf))
    }
    $deps = { param($info) @($info.PSObject.Properties['dependencies']?.Value | Where-Object { $_ } | ForEach-Object { ConvertFrom-Dependency ($_ -replace '^\s*\+\s*') }) }
    $packs = @(@($Before.Keys) + @($After.Keys) | Sort-Object -Unique)
    foreach ($p in $packs) {
        $b = @(if ($Before.Contains($p)) { & $deps $Before[$p] })
        $a = @(if ($After.Contains($p)) { & $deps $After[$p] })
        foreach ($m in @(@($b.Name) + @($a.Name) | Where-Object { $_ -and (($_ -cin $b.Name) -xor ($_ -cin $a.Name)) })) {
            $names[$m] = & $whole ([regex]::Escape($m))
        }
    }
    foreach ($p in $packs) {
        $old = @(if ($Before.Contains($p)) { & $deps $Before[$p] }) | Where-Object { $_.Name -eq 'base' -and $_.Op -eq '>=' } | Select-Object -First 1
        $new = @(if ($After.Contains($p)) { & $deps $After[$p] }) | Where-Object { $_.Name -eq 'base' -and $_.Op -eq '>=' } | Select-Object -First 1
        if ($old -and "$($old.Version)" -ne "$(${new}?.Version)") {
            $names["base >= $($old.Version)"] = & $whole ('base\s*>=\s*' + [regex]::Escape($old.Version))
        }
    }
    foreach ($p in $packs) {
        $old = if ($Before.Contains($p)) { $Before[$p].PSObject.Properties['factorio_version']?.Value }
        $new = if ($After.Contains($p)) { $After[$p].PSObject.Properties['factorio_version']?.Value }
        if ($old -and "$old" -ne "$new") { $names["$old"] = & $whole ([regex]::Escape("$old")) }
    }
    foreach ($k in $names.Keys) { [pscustomobject] @{ Name = $k; Pattern = $names[$k] } }
}

# Whether the character at Index of a paragraph's text falls inside a dated note.
function Test-Dated([string] $Paragraph, [int] $Index) {
    foreach ($m in [regex]::Matches($Paragraph, '\*\d{4}-\d{2}-\d{2} \(#[^*]*\*?')) {
        if ($Index -ge $m.Index -and $Index -lt $m.Index + $m.Length) { return $true }
    }
    $false
}

if ($SelfTest) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) "mentions-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
    New-Item -ItemType Directory -Path $temp -Force | Out-Null
    try {
        $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
        $write = { param([string] $name, [string[]] $lines) $p = Join-Path $temp $name; New-Item -ItemType Directory -Path (Split-Path $p) -Force | Out-Null; Set-Content -LiteralPath $p -Value $lines }
        $pack = { param([string] $dir, [string] $line, [string[]] $deps) & $write "$dir/info.json" (@{ name = $dir; factorio_version = $line; dependencies = $deps } | ConvertTo-Json) }
        $run = { param([string] $range) Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath -Range $range 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text -replace "`r" } }
        & $git init --quiet
        & $pack 'Lower' '2.0' @('base >= 2.0.5', 'kept', '? soft', 'top-ish')
        & $pack 'Upper' '2.0' @('Lower', 'top', 'stays')
        & $write 'scripts/a-check.ps1' @('# a check')
        & $write 'scripts/b-check.ps1' @('# untouched')
        & $write 'docs/notes.md' @(
            'The pack holds `kept` and `stays`.',
            'Its floor is `base >= 2.0.5`, on Factorio 2.0.',
            'Built on 2.0.77, kept-alive by a-check.ps1, run beside b-check.ps1.',
            '',
            'A paragraph. *2026-10-01 (#1): `kept` was',
            'named here as it was.* Then `top` moved.')
        & $write 'docs/loads/Lower-2026-10-01.md' @('Loaded with `kept`.')
        & $write 'docs/traces/Lower-2026-10-01.md' @('Traced with `kept`.')
        & $git add -A
        & $git commit --quiet -m base
        & $git branch base
        # The branch: `kept` dropped and `new` added in Lower, `top` moved from Upper to Lower,
        # `? soft` given a constraint, the floor and the line raised, a-check.ps1 changed, and a
        # line added that names `kept`.
        & $pack 'Lower' '2.1' @('base >= 2.1.0', '? soft >= 1.0', 'top-ish', 'new', 'top')
        & $pack 'Upper' '2.1' @('Lower', 'stays')
        & $write 'scripts/a-check.ps1' @('# a check, changed')
        & $write 'docs/notes.md' @(
            'The pack holds `kept` and `stays`.',
            'Its floor is `base >= 2.0.5`, on Factorio 2.0.',
            'Built on 2.0.77, kept-alive by a-check.ps1, run beside b-check.ps1.',
            '',
            'A paragraph. *2026-10-01 (#1): `kept` was',
            'named here as it was.* Then `top` moved.',
            'An added line that names `kept`.')
        & $git add -A
        & $git commit --quiet -m branch
        $out = & $run 'base...HEAD'
        $none = & $run 'HEAD...HEAD'
        $bad = & $run 'no-such-branch...HEAD'
    }
    finally { Remove-Item -LiteralPath $temp -Recurse -Force }
    Write-Host ($out.Text.TrimEnd() -replace '(?m)^', '    ')

    $has = { param([string] $pattern) $out.Text -match $pattern }
    $cases = @(
        @{ Name = 'a member lost is found, by file, line and name'; Test = {
            & $has '(?m)^docs/notes\.md:1: kept: The pack holds `kept` and `stays`\.$' } }
        @{ Name = 'a member gained and a member moved between packs are names; a constraint-only change and an unchanged member are not'; Test = {
            (& $has '(?m)^docs/notes\.md:6: top: ') -and $out.Text -match 'changed names: .*`new`' -and
                $out.Text -notmatch 'changed names: .*`soft`' -and $out.Text -notmatch 'changed names: .*`stays`' } }
        @{ Name = 'a replaced floor is found as its old text'; Test = {
            & $has '(?m)^docs/notes\.md:2: base >= 2\.0\.5, 2\.0: ' } }
        @{ Name = 'a replaced factorio_version is found whole, and not inside 2.0.77'; Test = {
            (& $has '(?m)^docs/notes\.md:2: .*2\.0: ') -and -not (& $has '(?m)^docs/notes\.md:3: [^:]*2\.0') } }
        @{ Name = 'a changed script is found by file name, and an unchanged one is not a name'; Test = {
            (& $has '(?m)^docs/notes\.md:3: a-check\.ps1: ') -and $out.Text -notmatch 'changed names: .*b-check' } }
        @{ Name = 'a name inside a longer name is not found: kept-alive, top-ish'; Test = {
            -not (& $has '(?m)^docs/notes\.md:3: [^:]*kept') -and -not (& $has 'top-ish\.?$') } }
        @{ Name = 'a hit inside a dated note is tagged dated, and one after it on the next line is not'; Test = {
            (& $has '(?m)^docs/notes\.md:5: kept: dated: A paragraph\.') -and (& $has '(?m)^docs/notes\.md:6: top: named here') } }
        @{ Name = 'load records, traces and a line the range adds are left out'; Test = {
            $out.Text -notmatch 'docs/loads/|docs/traces/|docs/notes\.md:7:' } }
        @{ Name = 'the count ends the run, with exit 0'; Test = {
            $out.Code -eq 0 -and $out.Text -match '(?m)^mentions: \d+ hit\(s\) in \d+ file\(s\)' } }
        @{ Name = 'a range that changes no name says so and exits 0'; Test = {
            $none.Code -eq 0 -and $none.Text -match 'changes no script, member, floor or line' } }
        @{ Name = 'a range git cannot read exits non-zero'; Test = { $bad.Code -ne 0 } }
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

if ($Range -notmatch '^(.+?)\.\.\.([^.].*)$') { throw 'Say what to read: -Range origin/main...HEAD, with three dots, or -SelfTest.' }
$tip = $Matches[2]
$base = git merge-base $Matches[1] $tip
if ($LASTEXITCODE -ne 0 -or -not $base) { throw "git could not read the range $Range. Run it inside the repository." }

# Each pack at a revision, as its name mapped to its dependency strings.
function Read-Packs([string] $Rev) {
    $packs = [ordered] @{}
    foreach ($f in @(git -c core.quotepath=off ls-tree -r --name-only $Rev) -match '^[^/]+/info\.json$') {
        $text = git show "${Rev}:$f" | Out-String
        try { $info = $text | ConvertFrom-Json }
        catch { Write-Host "FAILED - mentions: ${Rev}:$f is not JSON: $($_.Exception.Message)"; exit 1 }
        $name = $info.PSObject.Properties['name']?.Value ?? ($f -replace '/info\.json$')
        $packs[$name] = $info
    }
    $packs
}

$paths = @(git -c core.quotepath=off diff --name-status --no-renames --ignore-submodules=all $Range | ForEach-Object { ($_ -split "`t")[-1] })
if ($LASTEXITCODE -ne 0) { throw "git could not read the range $Range. Run it inside the repository." }
$names = @(Get-ChangedNames (Read-Packs $base) (Read-Packs $tip) $paths)
if (-not $names) {
    Write-Host "mentions: the range $Range changes no script, member, floor or line, so nothing is listed."
    exit 0
}

# The numbers of the lines the range adds, by file.
$added = @{}
$file = $null
foreach ($d in git -c core.quotepath=off diff --unified=0 --diff-filter=ACMR --ignore-submodules=all $Range) {
    if ($d -match '^\+\+\+ b/(.+?)\t?$') { $file = $Matches[1]; $added[$file] = [Collections.Generic.HashSet[int]]::new() }
    elseif ($d -match '^@@ -\S+ \+(\d+)(?:,(\d+))? @@') {
        $count = if ($Matches[2]) { [int] $Matches[2] } else { 1 }
        for ($k = 0; $k -lt $count; $k++) { [void] $added[$file].Add([int] $Matches[1] + $k) }
    }
}

# The text files at the tip: git grep -I lists a file it does not call binary.
$files = @(git -c core.quotepath=off grep -I -l -e '' $tip -- . ':!docs/loads/' ':!docs/traces/' | ForEach-Object { $_.Substring($tip.Length + 1) })
$hits = 0
$where = [Collections.Generic.HashSet[string]]::new()
foreach ($f in $files) {
    $lines = @(git show "${tip}:$f")
    $start = 0
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if (-not $lines[$i].Trim()) { $start = $i + 1; continue }
        if ($added.ContainsKey($f) -and $added[$f].Contains($i + 1)) { continue }
        $found = @($names | Where-Object { $lines[$i] -match $_.Pattern })
        if (-not $found) { continue }
        # The paragraph up to and including this line, to tell whether the first hit is in a note.
        $paragraph = ($lines[$start..$i]) -join "`n"
        $at = $paragraph.Length - $lines[$i].Length + [regex]::Match($lines[$i], $found[0].Pattern).Index
        $tag = if (Test-Dated $paragraph $at) { 'dated: ' } else { '' }
        Write-Host "${f}:$($i + 1): $(($found | ForEach-Object Name) -join ', '): $tag$($lines[$i].Trim())"
        $hits++
        [void] $where.Add($f)
    }
}
Write-Host ''
Write-Host "mentions: $hits hit(s) in $($where.Count) file(s) for $($names.Count) changed name(s) in ${Range}. It lists and does not fail."
Write-Host "changed names: $(($names | ForEach-Object { '`' + $_.Name + '`' }) -join ', ')"
exit 0
