<#
.SYNOPSIS
    Reports each line over 100 characters in the comment header of a script here, as
    <file>:<line> with its length. Exit 1 if it reports one, and with -All if it lists no
    script, which is a run that read nothing.

.DESCRIPTION
    WHY (#211). The headers are wrapped at 100 characters and nothing read that. On PR #210
    (2026-10-09) a fix left a header line at 153 characters, and the pre-PR review took a second
    confirmation turn over it. The Markdown check reads `.md` files only.

    WHAT IT READS. The header of each `scripts/*.ps1`: the lines after the first line that opens
    a block comment, up to the first that opens with the two characters that close one. With no
    switch, the staged content of the staged scripts, which is what the commit will hold. -All
    reads each tracked script, as staged.

    WHAT FAILS WITH NOTHING READ (#362). -All that lists no tracked script, as from a directory
    other than the root or in a clone whose checkout failed: exit 1. With no switch, nothing
    staged passes and says it read 0 scripts, since that commit had nothing to check.

    WHAT IT LEAVES. A line under `.EXAMPLE`, up to the next line that opens with a dot and a word
    in capitals: a command there is not wrapped. The code below the header.

    WHAT IT CANNOT SEE. A comment other than the first block comment that starts a line. A header
    whose opening does not start its line. A script outside `scripts/`, and the hooks and the
    workflow, whose comments are wrapped the same way. Whether a line could have been wrapped: an
    address longer than the limit is reported like any other. A character outside the basic
    plane, such as most emoji, counts two.

    WHAT A REFUSAL NAMES (#393). For each refused script, the command that rewraps its header:
    `markdown-rewrap.ps1 -Comment` from the tools submodule, at this check's limit. It writes the
    working tree only, so the script is staged again. Until the pin moves past
    trulsjo/grado-factorio-tools#254, the rewrap can leave a line that opens with a dot and a
    letter, such as `.github/`, which it takes for a help keyword; this check still refuses that
    line, and it is rewrapped by hand.

.PARAMETER All
    Read each tracked script, as staged, and not only the staged ones.

.PARAMETER SelfTest
    Prove a long header line is reported by its line and length, that a long line under
    `.EXAMPLE`, below the header or in a script with no block comment is not, that a commit's
    staged content is what is read, that a refusal names the rewrap command for each refused
    script and no other, and that -All with no tracked script fails while nothing staged passes.
    The last three cases need git.

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

# The header's lines that are over the limit, each with its line number in the file.
function Find-Long([string[]] $Lines) {
    $inside = $false
    $example = $false
    $n = 0
    foreach ($line in $Lines) {
        $n++
        if (-not $inside) { $inside = $line -match '^<#'; continue }
        if ($line -match '^#>') { break }
        if ($line -cmatch '^\.([A-Z]+)\b') { $example = $Matches[1] -eq 'EXAMPLE' }
        if (-not $example -and $line.Length -gt $LIMIT) { [pscustomobject] @{ Line = $n; Length = $line.Length } }
    }
}

if ($SelfTest) {
    $long = 'x' * 101
    $hits = { param([string[]] $lines) @(Find-Long $lines | ForEach-Object { "$($_.Line):$($_.Length)" }) -join ' ' }
    $cases = @(
        @{ Name = 'a header line over the limit is reported by its line and length, and one at the limit is not'; Test = {
            (& $hits @('<#', '.SYNOPSIS', "    $long", ('y' * 100), '#>')) -eq '3:105' } }
        @{ Name = 'a long line under .EXAMPLE is not reported, and one under the keyword after it is'; Test = {
            (& $hits @('<#', '.EXAMPLE', "    pwsh $long", '', "    $long", '.NOTES', "    $long", '#>')) -eq '7:105' } }
        @{ Name = 'a long line of code below the header is not reported'; Test = {
            (& $hits @('<#', '.SYNOPSIS', '    Short.', '#>', "`$x = '$long'", '<#', $long, '#>')) -eq '' } }
        @{ Name = 'a script with no block comment passes'; Test = {
            (& $hits @('#Requires -Version 7', "# $long", "`$x = '$long'")) -eq '' } }
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
        @{ Name = 'a refusal names, for each refused script and for no other, the markdown-rewrap.ps1 -Comment command that rewraps it at the limit'; Test = {
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
                    $printed -contains (& $command 'scripts/b.ps1')
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force }
        } }
        @{ Name = '-All fails, saying so, where git tracks no script, and with nothing staged and no switch the run passes and says it read 0'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "header-length-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path $temp -Force | Out-Null
            try {
                git -C $temp init --quiet
                if ($LASTEXITCODE -ne 0) { throw 'git init failed; the self-test needs git.' }
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                $all = & $run -All
                $staged = & $run
                if ($all.Code -ne 1 -or $staged.Code -ne 0) { Write-Host (($all.Text + $staged.Text).TrimEnd() -replace '(?m)^', '    ') }
                $all.Code -eq 1 -and $all.Text -match 'FAILED - header-length-check: -All found no tracked scripts/\*\.ps1' -and
                    $staged.Code -eq 0 -and $staged.Text -match '0 script\(s\) read'
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

$files = if ($All) { @(git -c core.quotepath=off ls-files -- 'scripts/*.ps1') }
else { @(git -c core.quotepath=off diff --cached --name-only --diff-filter=ACMR -- 'scripts/*.ps1') }
if ($LASTEXITCODE -ne 0) { throw 'git could not list the scripts to read. Run it from the repository root.' }
# -All is the set every header must be read from, so an empty one is a run that read nothing (#362).
if ($All -and -not $files) {
    Write-Host 'FAILED - header-length-check: -All found no tracked scripts/*.ps1, so nothing was read. Run it from the repository root.'
    exit 1
}

$found = 0
$refused = @()
foreach ($f in $files) {
    $lines = @(git show ":$f")
    if ($LASTEXITCODE -ne 0) { throw "git could not read the staged $f. Run it from the repository root." }
    $hits = @(Find-Long $lines)
    foreach ($hit in $hits) {
        Write-Host "${f}:$($hit.Line): $($hit.Length) characters in the header, over $LIMIT."
        $found++
    }
    if ($hits) { $refused += $f }
}
if ($found) {
    Write-Host ''
    Write-Host "FAILED - header-length-check: $found header line(s) over $LIMIT, $($files.Count) script(s) read. Rewrap each; a line under .EXAMPLE is left."
    # The repair, named where it is needed (#393). It writes the working tree only, so the file is staged again after it.
    Write-Host 'Rewrap with this, then stage the file again:'
    foreach ($f in $refused) {
        Write-Host "    pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/markdown-rewrap.ps1 -Comment -MaxLineLength $LIMIT -Path $f"
    }
    exit 1
}
Write-Host "OK - header-length-check: $($files.Count) script(s) read, no header line over $LIMIT."
