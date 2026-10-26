<#
.SYNOPSIS
    Reports each comment line over 100 characters in a script, a hook or a workflow here, as
    <file>:<line> with its length. Exit 1 if it reports one, and with -All if it lists no file,
    which is a run that read nothing.

.DESCRIPTION
    WHY (#211, #378). The comments are wrapped at 100 characters and nothing read that. On PR #210
    (2026-10-09) a fix left a header line at 153 characters, and the pre-PR review took a second
    confirmation turn over it. On PR #377 (2026-10-25) one left a line of the workflow's header at
    130, which the reviewer found and no check did. The Markdown check reads `.md` files only.

    WHAT IT READS. In each `scripts/*.ps1`, its header: the lines after the first line that opens
    a block comment, up to the first that opens with the two characters that close one. In each
    `scripts/*.ps1` outside its header, each file under `.githooks/` and each
    `.github/workflows/*.yml`, every `#` comment line: one that opens with optional whitespace,
    `#` and one space, as `markdown-rewrap.ps1 -Comment` reads one (#397), so the command a
    refusal names rewraps what it refused. With no switch, the staged content of the staged files,
    which is what the commit will hold. -All reads each tracked file, as staged.

    WHAT FAILS WITH NOTHING READ (#362). -All that lists no tracked file, as from a directory
    other than the root or in a clone whose checkout failed: exit 1. With no switch, nothing
    staged passes and says it read 0 files, since that commit had nothing to check.

    WHAT IT LEAVES. A line under `.EXAMPLE`, up to the next line that opens with a dot and a word
    in capitals: a command there is not wrapped. Code, a workflow's `run:` line among it. A
    shebang, and `#Requires`, neither of which is a comment by that rule.

    WHAT IT CANNOT SEE. A line of a block comment other than a script's first, which the rewrap
    reads, unless it opens with optional whitespace, `#` and a space: such a line is read as a `#`
    comment line, in a hook or a workflow too. A header whose opening does not start its line. A
    `#` line with no space after the `#`. Whether a `#` line is a comment: a line of a here-string
    or of a `run: |` block that opens with `#` and a space is read as one, as the rewrap reads it.
    A script outside `scripts/`, and a workflow named `.yaml`. Whether a line could have been
    wrapped: an address longer than the limit is reported like any other. A character outside the
    basic plane, such as most emoji, counts two.

    WHAT A REFUSAL NAMES (#393). For each refused file, the command that rewraps its comment
    lines over the limit: `markdown-rewrap.ps1 -Comment` from the tools submodule, at this check's
    limit. It reads and writes the working tree only, so the file is staged again, and the
    refusal warns that staging it again stages any edit to it that was not staged, beside the
    rewrap. Until the pin moves past trulsjo/grado-factorio-tools#254, the rewrap can leave a line
    that opens with a dot and a letter, such as `.github/`, which, by its source at the tools
    repository's `2c13393`, it takes for a help keyword; this check still refuses that line, and
    it is rewrapped by hand.

.PARAMETER All
    Read each tracked script, hook and workflow, as staged, and not only the staged ones.

.PARAMETER SelfTest
    Prove a long header line is reported by its line and length, that a long line under
    `.EXAMPLE` or of code is not, that a long `#` comment line is, below a header, in a script
    with no block comment, in a hook and in a workflow, while a shebang, `#Requires` and a
    workflow's `run:` line are not, that a commit's staged content is what is read, a hook's and
    a workflow's too, that a refusal names the rewrap command for each refused file and no other,
    with a warning that staging it again takes unstaged edits, and that -All with no tracked file
    fails while nothing staged passes. The last four cases need git.

.EXAMPLE
    pwsh -File scripts/header-length-check.ps1

.EXAMPLE
    pwsh -File scripts/header-length-check.ps1 -All
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [switch] $All,
    [switch] $SelfTest
)

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$LIMIT = 100

# The comment lines over the limit, each with its line number in the file and where it stands.
# With -Header, a script's: its header, and each # comment line outside it. Without, a hook's or
# a workflow's: each # comment line. A # comment line is the rewrap's, # and one space (#397).
function Find-Long([string[]] $Lines, [switch] $Header) {
    $state = if ($Header) { 'before' } else { 'after' }
    $example = $false
    $n = 0
    foreach ($line in $Lines) {
        $n++
        $long = $line.Length -gt $LIMIT
        if ($state -eq 'inside') {
            if ($line -match '^#>') { $state = 'after'; continue }
            if ($line -cmatch '^\.([A-Z]+)\b') { $example = $Matches[1] -eq 'EXAMPLE' }
            if (-not $example -and $long) { [pscustomobject] @{ Line = $n; Length = $line.Length; Where = 'in the header' } }
            continue
        }
        if ($state -eq 'before' -and $line -match '^<#') { $state = 'inside'; continue }
        if ($long -and $line -match '^\s*# ') { [pscustomobject] @{ Line = $n; Length = $line.Length; Where = 'in a comment' } }
    }
}

if ($SelfTest) {
    $long = 'x' * 101
    $hits = { param([string[]] $lines, [switch] $NoHeader) @(Find-Long $lines -Header:(-not $NoHeader) | ForEach-Object { "$($_.Line):$($_.Length)" }) -join ' ' }
    $cases = @(
        @{ Name = 'a header line over the limit is reported by its line and length, and one at the limit is not'; Test = {
            (& $hits @('<#', '.SYNOPSIS', "    $long", ('y' * 100), '#>')) -eq '3:105' } }
        @{ Name = 'a long line under .EXAMPLE is not reported, and one under the keyword after it is'; Test = {
            (& $hits @('<#', '.EXAMPLE', "    pwsh $long", '', "    $long", '.NOTES', "    $long", '#>')) -eq '7:105' } }
        @{ Name = 'a long line of code below the header is not reported'; Test = {
            (& $hits @('<#', '.SYNOPSIS', '    Short.', '#>', "`$x = '$long'", '<#', $long, '#>')) -eq '' } }
        @{ Name = 'a # comment line below the header over the limit is reported by its line and length, and one at the limit is not'; Test = {
            (& $hits @('<#', '.SYNOPSIS', '    Short.', '#>', '$x = 1', "    # $long", ('# ' + 'y' * 98))) -eq '6:107' } }
        @{ Name = 'in a script with no block comment a long # comment line is reported, and a long shebang, #Requires or line of code is not'; Test = {
            (& $hits @("#!$long", "#Requires $long", "# $long", "`$x = '$long'")) -eq '3:103' } }
        @{ Name = 'a hook''s long comment line is reported by its line and length, and its shebang, its code and a block comment are not'; Test = {
            (& $hits -NoHeader @('#!/bin/sh', "# $long", "echo $long", '<#', "  $long", '#>')) -eq '2:103' } }
        @{ Name = 'a workflow''s long comment line is reported, an indented one too, and a long run: line is not'; Test = {
            (& $hits -NoHeader @("# $long", 'jobs:', "      # $long", "        run: pwsh -NoProfile -File $long")) -eq '1:103 3:109' } }
        @{ Name = 'a commit''s staged content is what is read: a staged long line is refused by file and line, the staged repair passes, and -All reads a script that is not staged'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "header-length-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path (Join-Path $temp 'scripts') -Force | Out-Null
            try {
                $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
                $write = { param([string] $name, [string[]] $lines) Set-Content -LiteralPath (Join-Path $temp "scripts/$name") -Value $lines }
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                & $git init --quiet
                & $write 'old.ps1' @('<#', $long, '#>')
                & $git add -A
                & $git commit --quiet -m x
                & $write 'a.ps1' @('<#', '.SYNOPSIS', "    $long", '#>')
                & $git add -A
                & $write 'a.ps1' @('<#', '.SYNOPSIS', '    Repaired, and not staged.', '#>')
                $red = & $run
                & $git add -A
                $green = & $run
                $all = & $run -All
                if ($red.Code -ne 1 -or $green.Code -ne 0) { Write-Host (($red.Text + $green.Text).TrimEnd() -replace '(?m)^', '    ') }
                $red.Code -eq 1 -and $red.Text -match '(?m)^scripts/a\.ps1:3: 105 ' -and $red.Text -notmatch 'old\.ps1' -and $green.Code -eq 0 -and
                    $all.Code -eq 1 -and $all.Text -match '(?m)^scripts/old\.ps1:2: 101 '
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force }
        } }
        @{ Name = 'a staged hook and workflow are read as staged, not from disk, a refusal names the rewrap command for each refused one and for no other, and -All reads each tracked one, by file, line and length'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "header-length-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path (Join-Path $temp '.githooks'), (Join-Path $temp '.github/workflows') -Force | Out-Null
            try {
                $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
                $write = { param([string] $name, [string[]] $lines) Set-Content -LiteralPath (Join-Path $temp $name) -Value $lines }
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                & $git init --quiet
                & $write '.githooks/old-hook' @('#!/bin/sh', "# $long")
                & $write '.github/workflows/old.yml' @('jobs:', "  # $long")
                & $git add -A
                & $git commit --quiet -m x
                & $write '.githooks/pre-commit' @('#!/bin/sh', "# $long", "echo $long")
                & $write '.github/workflows/check.yml' @('jobs:', "        run: pwsh -File $long", "      # $long")
                & $write '.githooks/commit-msg' @('#!/bin/sh', '# Short.')
                & $git add -A
                & $write '.githooks/pre-commit' @('#!/bin/sh', '# Repaired, and not staged.', "echo $long")
                & $write '.github/workflows/check.yml' @('jobs:', "        run: pwsh -File $long", '      # Repaired, and not staged.')
                $staged = & $run
                $all = & $run -All
                $command = { param([string] $f) "pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/markdown-rewrap.ps1 -Comment -MaxLineLength $LIMIT -Path $f" }
                $printed = @([regex]::Matches($staged.Text, '(?m)^\s*(pwsh .*markdown-rewrap\.ps1.*?)\s*$') | ForEach-Object { $_.Groups[1].Value })
                if ($staged.Code -ne 1 -or $all.Code -ne 1) { Write-Host (($staged.Text + $all.Text).TrimEnd() -replace '(?m)^', '    ') }
                $staged.Code -eq 1 -and $staged.Text -match '(?m)^\.githooks/pre-commit:2: 103 ' -and $staged.Text -match '(?m)^\.github/workflows/check\.yml:3: 109 ' -and
                    $staged.Text -notmatch 'old' -and $staged.Text -notmatch 'check\.yml:2:' -and $staged.Text -notmatch 'pre-commit:3:' -and
                    $printed.Count -eq 2 -and $printed -contains (& $command '.githooks/pre-commit') -and $printed -contains (& $command '.github/workflows/check.yml') -and
                    $all.Code -eq 1 -and $all.Text -match '(?m)^\.githooks/old-hook:2: 103 ' -and $all.Text -match '(?m)^\.github/workflows/old\.yml:2: 105 '
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force }
        } }
        @{ Name = 'a refusal names, for each refused script and for no other, the markdown-rewrap.ps1 -Comment command that rewraps it at the limit, and warns that restaging takes unstaged edits'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "header-length-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path (Join-Path $temp 'scripts') -Force | Out-Null
            try {
                git -C $temp init --quiet
                if ($LASTEXITCODE -ne 0) { throw 'git init failed; the self-test needs git.' }
                Set-Content -LiteralPath (Join-Path $temp 'scripts/a.ps1') -Value @('<#', $long, $long, '#>')
                Set-Content -LiteralPath (Join-Path $temp 'scripts/b.ps1') -Value @('<#', $long, '#>')
                Set-Content -LiteralPath (Join-Path $temp 'scripts/c.ps1') -Value @('<#', 'Short.', '#>')
                git -C $temp add -A
                Push-Location $temp
                try { $text = (& pwsh -NoProfile -File $PSCommandPath 2>&1 | Out-String) } finally { Pop-Location }
                $code = $LASTEXITCODE
                $command = { param([string] $f) "pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/markdown-rewrap.ps1 -Comment -MaxLineLength $LIMIT -Path $f" }
                $printed = @([regex]::Matches($text, '(?m)^\s*(pwsh .*markdown-rewrap\.ps1.*?)\s*$') | ForEach-Object { $_.Groups[1].Value })
                if ($code -ne 1) { Write-Host ($text.TrimEnd() -replace '(?m)^', '    ') }
                $code -eq 1 -and $printed.Count -eq 2 -and $printed -contains (& $command 'scripts/a.ps1') -and
                    $printed -contains (& $command 'scripts/b.ps1') -and $text -match 'stages with it any edit that was not staged'
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force }
        } }
        @{ Name = '-All fails, saying so, where git tracks no script, hook or workflow, and with nothing staged and no switch the run passes and says it read 0'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "header-length-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path $temp -Force | Out-Null
            try {
                git -C $temp init --quiet
                if ($LASTEXITCODE -ne 0) { throw 'git init failed; the self-test needs git.' }
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                $all = & $run -All
                $staged = & $run
                if ($all.Code -ne 1 -or $staged.Code -ne 0) { Write-Host (($all.Text + $staged.Text).TrimEnd() -replace '(?m)^', '    ') }
                $all.Code -eq 1 -and $all.Text -match 'FAILED - header-length-check: -All found no tracked file to read' -and
                    $staged.Code -eq 0 -and $staged.Text -match '0 file\(s\) read'
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

# The scripts, the hooks and the workflows (#378).
$paths = @('scripts/*.ps1', '.githooks/*', '.github/workflows/*.yml')
$files = if ($All) { @(git -c core.quotepath=off ls-files -- @paths) }
else { @(git -c core.quotepath=off diff --cached --name-only --diff-filter=ACMR -- @paths) }
if ($LASTEXITCODE -ne 0) { throw 'git could not list the files to read. Run it from the repository root.' }
# -All is the whole set of files this check reads, so an empty one is a run that read nothing
# (#362).
if ($All -and -not $files) {
    Write-Host "FAILED - header-length-check: -All found no tracked file to read ($($paths -join ', ')), so nothing was read. Run it from the repository root."
    exit 1
}

$found = 0
$refused = @()
foreach ($f in $files) {
    $lines = @(git show ":$f")
    if ($LASTEXITCODE -ne 0) { throw "git could not read the staged $f. Run it from the repository root." }
    $hits = @(Find-Long $lines -Header:($f -like 'scripts/*.ps1'))
    foreach ($hit in $hits) {
        Write-Host "${f}:$($hit.Line): $($hit.Length) characters $($hit.Where), over $LIMIT."
        $found++
    }
    if ($hits) { $refused += $f }
}
if ($found) {
    Write-Host ''
    Write-Host "FAILED - header-length-check: $found comment line(s) over $LIMIT, $($files.Count) file(s) read. Rewrap each; a line under .EXAMPLE is left."
    # The repair, named where it is needed (#393). It reads and writes the working tree, not
    # the staged copy this check read, so the file is staged again after it, and the warning
    # says what that stage takes with it (the plugin pass on PR #394).
    Write-Host 'Rewrap each file with its command, then stage it again:'
    Write-Host '(The rewrap reads the file on disk, so staging it again stages with it any edit that was not staged.)'
    foreach ($f in $refused) {
        Write-Host "    pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/markdown-rewrap.ps1 -Comment -MaxLineLength $LIMIT -Path $f"
    }
    exit 1
}
Write-Host "OK - header-length-check: $($files.Count) file(s) read, no comment line over $LIMIT."
