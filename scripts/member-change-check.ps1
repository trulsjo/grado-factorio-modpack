<#
.SYNOPSIS
    Refuses a commit that adds or removes a member of a pack when its subject has no `!` before
    the colon, naming each pack and each member gained or lost. Exit 1 if it refuses one, or if
    the commits it reads hold no pack; exit 0 means every commit read changes no member, carries
    the `!`, or has a subject the shared check skips. A range of no commits has nothing to read:
    it passes, and says "0 commit(s)".

.DESCRIPTION
    WHY (#375). CLAUDE.md, *Commit messages*: adding or removing a member mod of any pack is a
    breaking change, and takes `!` and a `BREAKING CHANGE:` footer. The shared commit check reads
    the message alone, so it holds the footer to a `!` and cannot see that a change needs one. On
    PR #374 (2026-10-24) the three member commits were written without it, passed, and were
    reworded by hand. This demands the `!` only; the shared check then demands the footer.

    WHAT A MEMBER IS (Truls, 2026-10-25). A dependency with no prefix or with `~`: what the game
    installs with the pack. `?`, `(?)`, `!` and `+` lines are not members, so a change of prefix
    counts when it crosses that line (`? foo` to `foo`). A `Grado_*` line is a member like any
    other. A mod the game supplies is not a member: $BUNDLED, whose list and the reading behind
    it are in docs/decisions.md (2026-10-25, #375). A line that bundles another mod adds it there
    and to $BUNDLED by hand. A dependency is parsed by `ConvertFrom-Dependency` in
    vendor/grado-factorio-tools/scripts/resolve-modpack.ps1, loaded from that file, so the parse
    is the resolver's; a `+` line is set aside before it.

    WHAT IS COMPARED. For each pack, a top-level `<dir>/info.json` by its `name` key, the set of
    member names before and after. A version constraint is not compared, so `base >= 2.0.74` to
    `base >= 2.1.22` passes. Each pack is compared on its own: a member moved from one pack to
    another is lost by one and gained by the other, and both are named. A pack whose info.json is
    added or deleted gains or loses all its members. The packs are read from the repository's
    root wherever the script is run, and a run whose commits hold no pack fails.

    WHICH COMMITS. -MessageFile is the commit being made, as .githooks/commit-msg runs it: the
    staged tree against HEAD, or against nothing in a repository with no commit. -Range is each
    commit of a range against its first parent, as the pull request check runs it. A subject the
    shared commit check skips, `fixup!`, `squash!`, `amend!`, `Merge ...` or `Revert "..."`, is
    skipped here too. An info.json that is not JSON fails with its own message.

    WHAT IT CANNOT SEE. A member change made any other way than in a top-level info.json. On
    `git commit --amend` the hook compares with the commit being amended, so a member change it
    already held is not read again; scripts/reword-commit.ps1 runs no commit-msg hook. The pull
    request check reads every commit of the range, which covers both. Whether the
    `BREAKING CHANGE:` footer says what a save loses.

.PARAMETER MessageFile
    The commit message being written, as git hands it to a commit-msg hook.

.PARAMETER Range
    The commits to read, with two dots: -Range origin/main..HEAD.

.PARAMETER SelfTest
    Prove which dependency lines are members, and over commits in a repository it builds: that a
    member gained or lost without `!` fails and names the pack, that a `!` passes, that a
    constraint-only change, a non-member line and a mod the game supplies pass, that a move
    fails in both packs, that a skipped subject passes, that an info.json that is not JSON fails
    with its own message, that a run from a subdirectory reads the packs, that commits holding
    no pack fail and a range of no commits passes, that a range with three dots is refused, and
    that -MessageFile reads the staged tree. Needs git and the tools submodule.

.EXAMPLE
    pwsh -File scripts/member-change-check.ps1 -Range origin/main..HEAD
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [string] $MessageFile,
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

# The mods the game supplies, by docs/decisions.md (2026-10-25, #375).
$BUNDLED = 'base', 'elevated-rails', 'quality', 'recycler', 'space-age'

# The member names among a pack's dependency strings, sorted.
function Get-Members([string[]] $Dependencies) {
    @($Dependencies | Where-Object { $_ -and $_.TrimStart() -notmatch '^\+' } | ForEach-Object { ConvertFrom-Dependency $_ } |
        Where-Object { $_.Kind -in 'required', 'unordered' -and $_.Name -cnotin $BUNDLED } | ForEach-Object Name | Sort-Object -Unique -CaseSensitive)
}

# Each pack at a revision (`<rev>:`) or as staged (`:`), as its name mapped to its members.
# A file that is not JSON ends the run with exit 1.
function Read-Packs([string] $At) {
    $packs = [ordered] @{}
    $listed = @(if ($At -eq ':') { git -c core.quotepath=off ls-files } else { git -c core.quotepath=off ls-tree -r --name-only $At.TrimEnd(':') })
    if ($LASTEXITCODE -ne 0) { throw "git could not list the files at $At." }
    foreach ($f in $listed -match '^[^/]+/info\.json$') {
        $text = git show "$At$f" | Out-String
        if ($LASTEXITCODE -ne 0) { throw "git could not read $At$f." }
        try { $info = $text | ConvertFrom-Json }
        catch {
            Write-Host "FAILED - member-change-check: $At$f is not JSON, so its members cannot be read: $($_.Exception.Message)"
            exit 1
        }
        $name = $info.PSObject.Properties['name']?.Value ?? ($f -replace '/info\.json$')
        $packs[$name] = Get-Members @($info.PSObject.Properties['dependencies']?.Value | Where-Object { $_ })
    }
    $packs
}

# Each pack whose members differ, as @{ Pack; Gained; Lost }.
function Compare-Packs([Collections.IDictionary] $Before, [Collections.IDictionary] $After) {
    $names = @(@($Before.Keys) + @($After.Keys) | Sort-Object -Unique)
    foreach ($p in $names) {
        $b = @(if ($Before.Contains($p)) { $Before[$p] })
        $a = @(if ($After.Contains($p)) { $After[$p] })
        $gained = @($a | Where-Object { $_ -cnotin $b })
        $lost = @($b | Where-Object { $_ -cnotin $a })
        if ($gained -or $lost) { [pscustomobject] @{ Pack = $p; Gained = $gained; Lost = $lost } }
    }
}

# What a commit's member changes are, one line per pack.
function Format-Change($Change) {
    $parts = @()
    if ($Change.Lost) { $parts += 'lost ' + (($Change.Lost | ForEach-Object { '`' + $_ + '`' }) -join ', ') }
    if ($Change.Gained) { $parts += 'gained ' + (($Change.Gained | ForEach-Object { '`' + $_ + '`' }) -join ', ') }
    "$($Change.Pack) $($parts -join '; ')"
}

$SKIPPED = '^(?:(?:fixup|squash|amend)! |Merge |Revert ")'
$BANG = '^[^:]*!:'

if ($SelfTest) {
    $members = { param([string[]] $deps) (Get-Members $deps) -join '|' }
    $temp = Join-Path ([IO.Path]::GetTempPath()) "member-change-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
    New-Item -ItemType Directory -Path (Join-Path $temp 'Lower'), (Join-Path $temp 'Upper') -Force | Out-Null
    $runs = @{}
    try {
        $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
        $pack = { param([string] $dir, [string[]] $deps) Set-Content -LiteralPath (Join-Path $temp "$dir/info.json") -Value (@{ name = $dir; dependencies = $deps } | ConvertTo-Json) }
        $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text -replace "`r" } }
        $lower = @('base >= 2.0', 'kept', '? soft', '! enemy')
        $upper = @('Lower', 'top')
        # Each case is one commit on the base, read as a range of one.
        $case = {
            param([string] $key, [string] $subject, [scriptblock] $change)
            & $git checkout --quiet -B $key base
            & $change
            & $git add -A
            & $git commit --quiet --allow-empty -m $subject
            $runs[$key] = & $run -Range 'base..HEAD'
        }
        & $git init --quiet
        & $pack 'Lower' $lower
        & $pack 'Upper' $upper
        & $git add -A
        & $git commit --quiet -m 'start'
        & $git branch base
        & $case 'lost' 'x(lower): drop kept' { & $pack 'Lower' @('base >= 2.0', '? soft', '! enemy') }
        & $case 'lostbang' 'x(lower)!: drop kept' { & $pack 'Lower' @('base >= 2.0', '? soft', '! enemy') }
        & $case 'gained' 'x(upper): add new' { & $pack 'Upper' @('Lower', 'top', 'new') }
        & $case 'unordered' 'x(upper): add one unordered' { & $pack 'Upper' @('Lower', 'top', '~ loose') }
        & $case 'constraint' 'x(lower): raise the floors' { & $pack 'Lower' @('base >= 2.1', 'kept >= 1.0', '? soft >= 2', '! enemy') }
        & $case 'promoted' 'x(lower): require soft' { & $pack 'Lower' @('base >= 2.0', 'kept', 'soft', '! enemy') }
        & $case 'nonmember' 'x(upper): recommend, hide and refuse' { & $pack 'Upper' @('Lower', 'top', '+ rec', '(?) hid', '? opt', '! foe') }
        & $case 'moved' 'x(repo): move kept up' { & $pack 'Lower' @('base >= 2.0', '? soft', '! enemy'); & $pack 'Upper' @('Lower', 'top', 'kept') }
        & $case 'bundled' 'x(upper): name quality' { & $pack 'Upper' @('Lower', 'top', 'quality', '~ space-age') }
        & $case 'fixup' 'fixup! x(lower): drop kept' { & $pack 'Lower' @('base >= 2.0', '? soft', '! enemy') }
        & $case 'notjson' 'x(lower): break it' { Set-Content -LiteralPath (Join-Path $temp 'Lower/info.json') -Value '{ "name": "Lower", ' }
        # Two commits, the second changing members, so a range of more than one is read whole.
        & $git checkout --quiet -B two base
        & $git commit --quiet --allow-empty -m 'x(repo): nothing'
        & $pack 'Upper' @('Lower')
        & $git add -A
        & $git commit --quiet -m 'x(upper): drop top'
        $runs['two'] = & $run -Range 'base..HEAD'
        $runs['bad'] = & $run -Range 'no-such-branch..HEAD'
        # The staged tree, as the commit-msg hook reads it.
        & $git checkout --quiet -B staged base
        & $pack 'Lower' @('base >= 2.0', '? soft', '! enemy')
        & $git add -A
        Set-Content -LiteralPath (Join-Path $temp 'msg-plain.txt') -Value @('# a comment git strips', 'x(lower): drop kept', '', 'Body.')
        Set-Content -LiteralPath (Join-Path $temp 'msg-bang.txt') -Value @('x(lower)!: drop kept', '', 'BREAKING CHANGE: a save loses kept.')
        $runs['msgplain'] = & $run -MessageFile (Join-Path $temp 'msg-plain.txt')
        $runs['msgbang'] = & $run -MessageFile (Join-Path $temp 'msg-bang.txt')
        & $git reset --quiet --hard
        $runs['msgnone'] = & $run -MessageFile (Join-Path $temp 'msg-plain.txt')
        # From a subdirectory, which git lists only the files beneath.
        Push-Location (Join-Path $temp 'Lower')
        try { $text = (& pwsh -NoProfile -File $PSCommandPath -Range 'base..lost' 2>&1 | Out-String) } finally { Pop-Location }
        $runs['subdir'] = @{ Code = $LASTEXITCODE; Text = $text -replace "`r" }
        $runs['threedots'] = & $run -Range 'base...lost'
        # Two commits that hold no pack.
        & $git checkout --quiet -B nopack base
        & $git rm --quiet -r Lower Upper
        & $git commit --quiet -m 'x(repo)!: drop both packs'
        & $git commit --quiet --allow-empty -m 'x(repo): nothing'
        $runs['nopack'] = & $run -Range 'nopack~1..nopack'
        $runs['empty'] = & $run -Range 'base..base'
    }
    finally { Remove-Item -LiteralPath $temp -Recurse -Force }

    $fails = { param([string] $key, [string] $pattern) $runs[$key].Code -eq 1 -and $runs[$key].Text -match $pattern }
    $passes = { param([string] $key) $runs[$key].Code -eq 0 -and $runs[$key].Text -match '(?m)^OK - member-change-check' }
    $cases = @(
        @{ Name = 'no prefix and ~ are members; ?, (?), !, +, the constraint and base are not'; Test = {
            (& $members @('base >= 2.0', 'kept >= 1.0', '~ loose', '? soft', '(?) hid', '! enemy', '+ rec')) -eq 'kept|loose' } }
        @{ Name = 'a mod the game supplies is no member: quality named without ! passes'; Test = { & $passes 'bundled' } }
        @{ Name = 'a member lost without ! fails, naming the pack and the member'; Test = {
            & $fails 'lost' '(?m)^[0-9a-f]{7} x\(lower\): drop kept: Lower lost `kept`$' } }
        @{ Name = 'the same with ! passes'; Test = { & $passes 'lostbang' } }
        @{ Name = 'a member gained without ! fails'; Test = { & $fails 'gained' 'Upper gained `new`' } }
        @{ Name = 'a ~ member gained without ! fails'; Test = { & $fails 'unordered' 'Upper gained `loose`' } }
        @{ Name = 'a constraint-only change without ! passes'; Test = { & $passes 'constraint' } }
        @{ Name = '? soft to soft without ! fails'; Test = { & $fails 'promoted' 'Lower gained `soft`' } }
        @{ Name = '+, (?), ? and ! lines added without ! pass'; Test = { & $passes 'nonmember' } }
        @{ Name = 'a member moved between packs without ! fails, naming both packs'; Test = {
            (& $fails 'moved' 'Lower lost `kept`') -and $runs['moved'].Text -match 'Upper gained `kept`' } }
        @{ Name = 'a fixup! subject is skipped'; Test = { & $passes 'fixup' } }
        @{ Name = 'an info.json that is not JSON fails with its own message'; Test = {
            & $fails 'notjson' 'Lower/info\.json is not JSON' } }
        @{ Name = 'every commit of a range is read, and the count is given'; Test = {
            (& $fails 'two' 'drop top: Upper lost `top`') -and $runs['two'].Text -match '2 commit\(s\)' } }
        @{ Name = 'a range git cannot read exits non-zero'; Test = { $runs['bad'].Code -ne 0 } }
        @{ Name = '-MessageFile reads the staged tree: a staged member change fails without ! past a comment line, and passes with it'; Test = {
            (& $fails 'msgplain' 'this commit x\(lower\): drop kept: Lower lost `kept`') -and (& $passes 'msgbang') } }
        @{ Name = '-MessageFile with nothing staged passes'; Test = { & $passes 'msgnone' } }
        @{ Name = 'run from a subdirectory, a member lost without ! still fails'; Test = { & $fails 'subdir' 'Lower lost `kept`' } }
        @{ Name = 'commits that hold no pack fail'; Test = { & $fails 'nopack' 'no pack' } }
        @{ Name = 'a range of no commits passes and says 0 commit(s)'; Test = { (& $passes 'empty') -and $runs['empty'].Text -match '0 commit\(s\) in base\.\.base' } }
        @{ Name = 'a range with three dots is refused'; Test = {
            # A narrow console wraps the error and margins it with |, as on the Actions runner.
            $runs['threedots'].Code -ne 0 -and ($runs['threedots'].Text -replace '[\s|]+', ' ') -match 'with two dots' } }
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
    if ($failures) {
        foreach ($k in $runs.Keys | Sort-Object) { Write-Host "  $k (exit $($runs[$k].Code)):"; Write-Host ($runs[$k].Text.TrimEnd() -replace '(?m)^', '    ') }
        Write-Host "FAILED - self-test: $failures of $($cases.Count) case(s) did not hold."
        exit 1
    }
    Write-Host "OK - self-test passed: all $($cases.Count) cases."
    exit 0
}

# The packs are top-level, and git lists only the files beneath where it stands.
if ($MessageFile) { $MessageFile = (Resolve-Path -LiteralPath $MessageFile).Path }
$root = git rev-parse --show-toplevel
if ($LASTEXITCODE -ne 0) { throw 'Run it inside the repository.' }
Set-Location -LiteralPath $root

# Each commit to read, as @{ Where; Subject; Before; After }.
if ($MessageFile) {
    $subject = @(Get-Content -LiteralPath $MessageFile | Where-Object { $_ -notmatch '^#' -and $_.Trim() })[0] ?? ''
    git rev-parse --quiet --verify HEAD | Out-Null
    $before = if ($LASTEXITCODE -eq 0) { Read-Packs 'HEAD:' } else { [ordered] @{} }
    $commits = @([pscustomobject] @{ Where = 'this commit'; Subject = $subject; Before = $before; After = (Read-Packs ':') })
    $what = 'the commit being made'
}
elseif ($Range -notmatch '\.\.\.' -and $Range -match '^(.+?)\.\.([^.].*)$') {
    $shas = @(git rev-list --reverse $Range)
    if ($LASTEXITCODE -ne 0) { throw "git could not read the range $Range. Run it inside the repository." }
    $commits = @(
        foreach ($sha in $shas) {
            $parent = git rev-parse --quiet --verify "$sha^"
            [pscustomobject] @{
                Where = $sha.Substring(0, 7)
                Subject = (git log -1 --format=%s $sha)
                Before = $(if ($parent) { Read-Packs "${parent}:" } else { [ordered] @{} })
                After = (Read-Packs "${sha}:")
            }
        }
    )
    $what = "$($commits.Count) commit(s) in $Range"
}
else { throw 'Say what to read: -MessageFile <file>, -Range origin/main..HEAD with two dots, or -SelfTest.' }

if ($commits -and -not @($commits | Where-Object { $_.Before.Count -or $_.After.Count })) {
    Write-Host "FAILED - member-change-check: no pack was read in $what, which holds no top-level info.json."
    exit 1
}

$refused = 0
$changing = 0
foreach ($c in $commits) {
    if ($c.Subject -match $SKIPPED) { continue }
    $changes = @(Compare-Packs $c.Before $c.After)
    if (-not $changes) { continue }
    $changing++
    if ($c.Subject -match $BANG) { continue }
    $refused++
    foreach ($ch in $changes) { Write-Host "$($c.Where) $($c.Subject): $(Format-Change $ch)" }
}
if ($refused) {
    Write-Host ''
    $who = if ($MessageFile) { "$what changes" } else { "$refused commit(s) of $what change" }
    Write-Host "FAILED - member-change-check: $who a pack's members with no ! before the colon. A member gained or lost is breaking (CLAUDE.md, *Commit messages*): add the !, and a BREAKING CHANGE: footer saying what an existing save loses."
    exit 1
}
$said = if ($changing) { "$changing changing a pack's members, each with !" } else { "none changing a pack's members" }
Write-Host "OK - member-change-check: $what, $said."
exit 0
