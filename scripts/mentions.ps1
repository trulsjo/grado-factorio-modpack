<#
.SYNOPSIS
    Lists each tracked line that names what a commit range changed: a script, a pack member, a
    `base >=` floor, a `factorio_version`, or a tools script or page this repository uses that a
    pin move changes, as <file>:<line>: <name>: [dated: ]<the line>. On a pin move it then
    prints the tools commits between the pins that call themselves breaking. It lists and does
    not fail.

.DESCRIPTION
    WHY (#365). A sentence outside a diff that rests on what the diff changed is not in the diff,
    and the pre-PR review missed such sentences on two pull requests running. On PR #363 three of
    the plugin pass's findings were sentences saying when a changed script fails. On PR #374 its
    findings 1, 3 and 6 were sentences naming an old floor or a dropped member, and the
    confirmation of their fixes found four catalogue sections arguing from the old line. Finding
    those lines is mechanical; judging each is not. The list is handed to the pre-PR reviewer
    beside the diff (docs/agents/pre-pr-review-brief.md), who reads each hit against it.

    WHAT IT LOOKS FOR. The changed names of the range, from its merge base to its tip:
      - each `scripts/*.ps1` and each `.githooks/` file the range adds, changes, deletes or
        renames, by its file name;
      - each dependency name a top-level `<dir>/info.json` gains or loses, compared as a set of
        names per pack whatever the prefix, so a constraint-only change names nothing and a mod
        moved between packs is named once;
      - each `base >=` constraint an info.json replaces, as its old text;
      - each `factorio_version` an info.json replaces, as its old value;
      - on a range that moves the pin (GLOSSARY.md, *Pin*), each tools script this repository
        runs, by its file name, and each tools file a tracked line cites by its path, by that
        path inside the tools repository. Below, under WHAT A PIN MOVE NAMES.
    A name is matched whole: a letter, digit, `-` or `_` on either side is another name, and a
    version is not matched inside a longer one, so `2.0` is not found in `2.0.77`.

    WHAT A PIN MOVE NAMES (#384). A tools script runs here when a tracked file under .githooks/,
    .github/, .claude/ or scripts/ names its path in the submodule's scripts/ at the tip. It is a
    name when its file differs between the two pins, or a tools script it loads does, followed
    through every level at either pin. A script loads a file of the tools scripts/ when it names
    that file in a command that names $PSScriptRoot, outside comments: a dot-source, a
    Join-Path, a file read. A cited file is named by its path inside the tools repository, not
    its file name. The changed names line says what each such name rests on: (pin) when only
    its own file differs, and otherwise (pin: <file>, ...), each file that differs of it and
    what it loads. After the list come the tools commits between the pins whose subject has a
    `!` before its colon or whose body has a BREAKING CHANGE: footer, every one, with its footer
    where it has one; those a pin moved back drops are marked dropped. They are printed whenever
    the pin moved, with no hit too.

    WHAT IT READS. Every tracked text file at the tip, from the repository's root wherever the
    script is run, and on a pin move the submodule's clone at both pins.

    WHAT IT LEAVES. Files under docs/loads/ and docs/traces/, which record one run as it was. A
    line the range adds, which is in the diff already. Files git calls binary, and a submodule
    added or removed rather than moved. A hit inside a dated note, `*YYYY-MM-DD (#n): ...*`, is
    listed and tagged `dated:`, so the reviewer can pass over a note that names a member as it
    was.

    WHY IT DOES NOT FAIL. A hit is a sentence to read, not a defect: most hold. Exit 0 says the
    range was read, and nothing about what was listed. A range git cannot read, an info.json
    that is not JSON, or a pin the submodule's clone does not hold exits 1 with its own message,
    which for a pin names the fetch to run.

    WHAT IT CANNOT SEE. A sentence that rests on a change without naming it, such as "the floor
    is the resolver's" or a figure counted from a member list. A name written another way: a
    script without its `.ps1`, a mod by its title, a floor with its version alone. A dated note
    holding `*` of its own ends, for the tag, at its first one. A dated note in another shape,
    such as `*#43, 2026-09-24: ...*`, is not tagged. A name broken over two lines. A tools
    script reached by a path built at run time, or named in a command without $PSScriptRoot. A
    tools file named neither by its path nor by a script this repository runs. A tools change a
    commit does not call breaking.

.PARAMETER Range
    The commit range, with three dots: -Range origin/main...HEAD.

.PARAMETER SelfTest
    Prove each kind of changed name is found and matched whole, and over a range in a repository
    it builds: what is listed, what is left, what is tagged, and what it exits with. Needs git
    and the tools submodule. It builds a tools repository of its own too, as that repository's
    submodule, and moves the pin forward, back and to a commit the clone does not hold.

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
    foreach ($k in $names.Keys) { [pscustomobject] @{ Name = $k; Pattern = $names[$k]; Note = '' } }
}

# Where the tools repository's clone is, and its commit at a revision of this one, or $null.
$TOOLS_PATH = 'vendor/grado-factorio-tools'
function Get-Pin([string] $Rev) {
    if ("$(git ls-tree $Rev -- $TOOLS_PATH)" -match '^160000 commit ([0-9a-f]+)\t') { $Matches[1] }
}

# The names a pin move gives, each as @{ Name; Pattern; Note }: each tools script this repository
# runs, when it or a tools script it loads differs between the pins, and each tools file a tracked
# line cites by its path, when it differs.
function Get-PinNames([string] $Tools, [string] $Old, [string] $New, [string] $Tip) {
    $whole = { param([string] $core) '(?<![\w.-])' + $core + '(?![\w-]|\.\d)' }
    $differ = @(git -C $Tools -c core.quotepath=off diff --name-only --no-renames $Old $New)
    $differs = { param([string] $leaf) @($differ | Where-Object { $_ -eq "scripts/$leaf" -or $_.StartsWith("scripts/$leaf/") }).Count -gt 0 }
    # What each tools script loads, at either pin: a file of scripts/ named in a command that
    # names $PSScriptRoot, outside comments.
    $loads = @{}
    foreach ($pin in $Old, $New) {
        $here = @(git -C $Tools -c core.quotepath=off ls-tree --name-only $pin -- scripts/ | ForEach-Object { $_ -replace '^scripts/' })
        foreach ($s in $here -like '*.ps1') {
            if (-not $loads.ContainsKey($s)) { $loads[$s] = [Collections.Generic.HashSet[string]]::new() }
            $ast = [Management.Automation.Language.Parser]::ParseInput((git -C $Tools show "${pin}:scripts/$s" | Out-String), [ref] $null, [ref] $null)
            $roots = $ast.FindAll({ param($n) $n -is [Management.Automation.Language.VariableExpressionAst] -and $n.VariablePath.UserPath -eq 'PSScriptRoot' }, $true)
            foreach ($v in $roots) {
                $c = $v
                while ($c -and $c -isnot [Management.Automation.Language.CommandAst]) { $c = $c.Parent }
                if (-not $c) { continue }
                foreach ($f in $here) {
                    if ($f -ne $s -and $c.Extent.Text -match ('(?<![\w.-])' + [regex]::Escape($f) + '(?![\w.-])')) { [void] $loads[$s].Add($f) }
                }
            }
        }
    }
    $names = [ordered] @{}
    $runs = @(git -c core.quotepath=off grep -h -o -I -E "$TOOLS_PATH/scripts/[A-Za-z0-9_.-]+" $Tip -- .githooks .github .claude scripts |
        ForEach-Object { ($_ -replace "^.*$TOOLS_PATH/scripts/") -replace '\.+$' } | Sort-Object -Unique)
    foreach ($r in $runs) {
        # Every script under it, through every level of loads.
        $under = [Collections.Generic.List[string]]::new()
        $queue = [Collections.Generic.Queue[string]]::new()
        $queue.Enqueue($r)
        while ($queue.Count) {
            $s = $queue.Dequeue()
            if ($under.Contains($s)) { continue }
            $under.Add($s)
            if ($loads.ContainsKey($s)) { foreach ($l in $loads[$s]) { $queue.Enqueue($l) } }
        }
        $changed = @($under | Where-Object { & $differs $_ })
        if (-not $changed) { continue }
        $note = if ($changed.Count -eq 1 -and $changed[0] -eq $r) { '(pin)' } else { "(pin: $($changed -join ', '))" }
        $names[$r] = @{ Pattern = & $whole ([regex]::Escape($r)); Note = $note }
    }
    $cited = @(git -c core.quotepath=off grep -h -o -I -E "$TOOLS_PATH/[A-Za-z0-9_./-]+" $Tip -- . |
        ForEach-Object { ($_ -replace "^.*$TOOLS_PATH/") -replace '[./]+$' } | Sort-Object -Unique)
    foreach ($p in $cited) {
        if ($p -notin $differ -or $names.Contains($p)) { continue }
        if ($p -like 'scripts/*' -and $names.Contains(($p -replace '^scripts/'))) { continue }
        $names[$p] = @{ Pattern = & $whole ([regex]::Escape($p)); Note = '(pin)' }
    }
    foreach ($k in $names.Keys) { [pscustomobject] @{ Name = $k; Pattern = $names[$k].Pattern; Note = $names[$k].Note } }
}

# The tools commits in From..To whose subject has a `!` before its colon or whose body has a
# BREAKING CHANGE: footer, each as @{ Hash; Subject; Footer }.
function Get-BreakingCommits([string] $Tools, [string] $From, [string] $To) {
    $raw = @(git -C $Tools log --format='%h%x1f%s%x1f%b%x1e' "$From..$To") -join "`n"
    foreach ($c in $raw -split "\x1e") {
        $f = $c.Trim("`n") -split "\x1f"
        if ($f.Count -lt 3) { continue }
        $footer = [regex]::Match(($f[2] -replace "`r"), '(?ms)^BREAKING[ -]CHANGE:.*?(?=\n[ \t]*\n|\z)').Value.TrimEnd()
        if ($f[1] -match '^[^:]*!:' -or $footer) { [pscustomobject] @{ Hash = $f[0]; Subject = $f[1]; Footer = $footer } }
    }
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
    # The tools repository the fixture takes as its submodule, beside the fixture.
    $toolsRepo = "$temp-tools"
    New-Item -ItemType Directory -Path $temp, $toolsRepo -Force | Out-Null
    # Fixed dates, so the commits and the hashes the self-test prints are the same on every run
    # (#407).
    $env:GIT_AUTHOR_DATE = $env:GIT_COMMITTER_DATE = '2026-01-01T12:00:00+00:00'
    try {
        $gitIn = { param([string] $dir) git -C $dir -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false -c protocol.file.allow=always @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
        $git = { & $gitIn $temp @args }
        $tgit = { & $gitIn $toolsRepo @args }
        $writeIn = { param([string] $dir, [string] $name, [string[]] $lines) $p = Join-Path $dir $name; New-Item -ItemType Directory -Path (Split-Path $p) -Force | Out-Null; Set-Content -LiteralPath $p -Value $lines }
        $write = { & $writeIn $temp @args }
        $twrite = { & $writeIn $toolsRepo @args }
        $pack = { param([string] $dir, [string] $line, [string[]] $deps) & $write "$dir/info.json" (@{ name = $dir; factorio_version = $line; dependencies = $deps } | ConvertTo-Json) }
        $run = { param([string] $range) Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath -Range $range 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text -replace "`r" } }
        # The tools at three pins. At the first: run-a.ps1, run-b.ps1 which loads lib-b.ps1 which
        # loads lib-c.ps1, run-c.ps1 which names idle.ps1 in a comment only, and two pages.
        & $tgit init --quiet
        & $twrite 'scripts/run-a.ps1' @('# run a')
        & $twrite 'scripts/run-b.ps1' @('. "$PSScriptRoot/lib-b.ps1"')
        & $twrite 'scripts/lib-b.ps1' @(". (Join-Path `$PSScriptRoot 'lib-c.ps1')")
        & $twrite 'scripts/lib-c.ps1' @('# lib c')
        & $twrite 'scripts/run-c.ps1' @('# . "$PSScriptRoot/idle.ps1"')
        & $twrite 'scripts/idle.ps1' @('# idle')
        & $twrite 'docs/rules.md' @('rules')
        & $twrite 'docs/other.md' @('other')
        & $tgit add -A
        & $tgit commit --quiet -m 'feat: first'
        $pin1 = git -C $toolsRepo rev-parse HEAD
        # The second: a plain commit changing idle.ps1, then a breaking one changing run-a.ps1,
        # lib-c.ps1 and the cited page.
        & $twrite 'scripts/idle.ps1' @('# idle, changed')
        & $tgit commit --quiet -a -m 'fix: plain change'
        & $twrite 'scripts/run-a.ps1' @('# run a, changed')
        & $twrite 'scripts/lib-c.ps1' @('# lib c, changed')
        & $twrite 'docs/rules.md' @('rules, changed')
        & $tgit commit --quiet -a -m 'feat(run-a)!: change run-a' -m 'Body.' -m 'BREAKING CHANGE: run-a now reads x.'
        $pin2 = git -C $toolsRepo rev-parse HEAD
        # The third: a breaking commit changing only a page nothing cites.
        & $twrite 'docs/other.md' @('other, changed')
        & $tgit commit --quiet -a -m 'docs: move other' -m 'BREAKING CHANGE: other moved.'
        $pin3 = git -C $toolsRepo rev-parse HEAD
        & $git init --quiet
        & $git submodule --quiet add $toolsRepo vendor/grado-factorio-tools
        git -C (Join-Path $temp 'vendor/grado-factorio-tools') checkout --quiet $pin1 2>&1 | Out-Null
        & $write '.githooks/pre-commit' @(
            'pwsh -File vendor/grado-factorio-tools/scripts/run-a.ps1',
            'pwsh -File vendor/grado-factorio-tools/scripts/run-b.ps1',
            'pwsh -File vendor/grado-factorio-tools/scripts/run-c.ps1')
        & $write 'docs/tools.md' @(
            'The hook runs run-a.ps1 first.',
            'Its second step runs run-b.ps1, and its third run-c.ps1.',
            'Nothing runs idle.ps1.',
            'The rules are vendor/grado-factorio-tools/docs/rules.md, online at blob/main/docs/rules.md.',
            'The other page is other.md.')
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
        # `? soft` given a constraint, the floor and the line raised, a-check.ps1 changed, a line
        # added that names `kept`, and the pin moved from the first to the second.
        git -C (Join-Path $temp 'vendor/grado-factorio-tools') checkout --quiet $pin2 2>&1 | Out-Null
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
        # From a subdirectory, which git lists only the files beneath.
        Push-Location (Join-Path $temp 'scripts')
        try { $text = (& pwsh -NoProfile -File $PSCommandPath -Range 'base...HEAD' 2>&1 | Out-String) } finally { Pop-Location }
        $sub = @{ Code = $LASTEXITCODE; Text = $text -replace "`r" }
        $none = & $run 'HEAD...HEAD'
        $bad = & $run 'no-such-branch...HEAD'
        # A pin move alone, to the third pin, then a move to a pin the clone does not hold.
        git -C (Join-Path $temp 'vendor/grado-factorio-tools') checkout --quiet $pin3 2>&1 | Out-Null
        & $git add -A
        & $git commit --quiet -m 'pin only'
        $pinOnly = & $run 'HEAD~1...HEAD'
        # The pin moved back to the second, which drops the third's breaking commit.
        git -C (Join-Path $temp 'vendor/grado-factorio-tools') checkout --quiet $pin2 2>&1 | Out-Null
        & $git add -A
        & $git commit --quiet -m 'pin back'
        $back = & $run 'HEAD~1...HEAD'
        & $git update-index --cacheinfo "160000,$('1' * 40),vendor/grado-factorio-tools"
        & $git commit --quiet -m 'unreadable pin'
        $unread = & $run 'HEAD~1...HEAD'
    }
    finally {
        Remove-Item -LiteralPath $temp, $toolsRepo -Recurse -Force
        Remove-Item Env:GIT_AUTHOR_DATE, Env:GIT_COMMITTER_DATE -ErrorAction SilentlyContinue
    }
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
            $none.Code -eq 0 -and $none.Text -match 'changes no script, member, floor, line or pinned tools file' } }
        @{ Name = 'a run script that changed between the pins is listed, tagged pin'; Test = {
            (& $has '(?m)^docs/tools\.md:1: run-a\.ps1: ') -and $out.Text -match 'changed names: .*`run-a\.ps1` \(pin\)' } }
        @{ Name = 'a run script that did not change is no name, though a comment in it names a changed file'; Test = {
            (& $has '(?m)^docs/tools\.md:2: run-b\.ps1: ') -and $out.Text -notmatch 'changed names: .*run-c' } }
        @{ Name = 'a changed tools file neither run nor cited is no name'; Test = {
            $out.Text -notmatch 'changed names: .*idle' -and -not (& $has '(?m)^docs/tools\.md:3:') } }
        @{ Name = 'a run script is named for a script it loads two levels down, tagged with it'; Test = {
            $out.Text -match 'changed names: .*`run-b\.ps1` \(pin: lib-c\.ps1\)' -and $out.Text -notmatch 'changed names: .*`lib-' } }
        @{ Name = 'a tools file cited by its path is listed by that path'; Test = {
            (& $has '(?m)^docs/tools\.md:4: docs/rules\.md: ') -and $out.Text -match 'changed names: .*`docs/rules\.md` \(pin\)' -and
                -not (& $has '(?m)^docs/tools\.md:5:') } }
        @{ Name = 'a breaking commit between the pins is printed with its footer, and a plain one is not'; Test = {
            (& $has '(?m)^breaking: [0-9a-f]+ feat\(run-a\)!: change run-a$') -and (& $has '(?m)^    BREAKING CHANGE: run-a now reads x\.$') -and
                $out.Text -notmatch 'plain change' } }
        @{ Name = 'a pin move alone with no hit says nothing is listed, prints the footer and exits 0'; Test = {
            $pinOnly.Code -eq 0 -and $pinOnly.Text -match 'nothing is listed' -and $pinOnly.Text -match '(?m)^    BREAKING CHANGE: other moved\.$' -and
                $pinOnly.Text -notmatch '(?m)^\S+:\d+: ' } }
        @{ Name = 'a pin moved back marks the breaking commit it drops as dropped'; Test = {
            $back.Code -eq 0 -and $back.Text -match '(?m)^breaking, dropped: [0-9a-f]+ docs: move other$' } }
        @{ Name = 'a pin the clone does not hold exits non-zero, naming the fetch'; Test = {
            $unread.Code -ne 0 -and $unread.Text -match 'git -C vendor/grado-factorio-tools fetch' } }
        @{ Name = 'a range git cannot read exits non-zero'; Test = { $bad.Code -ne 0 } }
        @{ Name = 'run from a subdirectory, the same hits are listed'; Test = { $sub.Code -eq 0 -and $sub.Text -eq $out.Text } }
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
# The files are listed from the root, since git lists only those beneath where it stands.
$root = git rev-parse --show-toplevel
if ($LASTEXITCODE -ne 0) { throw 'Run it inside the repository.' }
Set-Location -LiteralPath $root
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

# A pin move: the names it gives, and the breaking tools commits between the pins.
$oldPin = Get-Pin $base
$newPin = Get-Pin $tip
$moved = $oldPin -and $newPin -and $oldPin -ne $newPin
if ($moved) {
    $tools = Join-Path $root $TOOLS_PATH
    foreach ($p in $oldPin, $newPin) {
        git -C $tools cat-file -e "$p^{commit}" 2>$null
        if ($LASTEXITCODE -ne 0) {
            Write-Host "FAILED - mentions: the pin $p is not in the clone at $TOOLS_PATH. Run 'git submodule update --init', then 'git -C $TOOLS_PATH fetch'."
            exit 1
        }
    }
    foreach ($n in Get-PinNames $tools $oldPin $newPin $tip) {
        $same = $names | Where-Object Name -EQ $n.Name | Select-Object -First 1
        if ($same) { $same.Note = $n.Note } else { $names += $n }
    }
    $differCount = @(git -C $tools diff --name-only --no-renames $oldPin $newPin).Count
    $breaking = @(@(Get-BreakingCommits $tools $oldPin $newPin | Select-Object *, @{ n = 'Dropped'; e = { $false } }) +
        @(Get-BreakingCommits $tools $newPin $oldPin | Select-Object *, @{ n = 'Dropped'; e = { $true } }))
}
# What a pin move printed after the list: the move, then each breaking commit with its footer.
function Write-Pin {
    if (-not $moved) { return }
    Write-Host ''
    Write-Host "pin: $TOOLS_PATH moves from $($oldPin.Substring(0, 7)) to $($newPin.Substring(0, 7)); $differCount tools file(s) differ, $($breaking.Count) breaking commit(s) between the pins."
    foreach ($b in $breaking) {
        Write-Host "breaking$(if ($b.Dropped) { ', dropped' }): $($b.Hash) $($b.Subject)"
        if ($b.Footer) { Write-Host ($b.Footer -replace '(?m)^', '    ') }
    }
}

if (-not $names) {
    Write-Host "mentions: the range $Range changes no script, member, floor, line or pinned tools file this repository uses, so nothing is listed."
    Write-Pin
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
Write-Host "changed names: $(($names | ForEach-Object { '`' + $_.Name + '`' + $(if ($_.Note) { " $($_.Note)" }) }) -join ', ')"
Write-Pin
exit 0
