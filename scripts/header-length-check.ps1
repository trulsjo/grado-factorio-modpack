<#
.SYNOPSIS
    Reports each line over 100 characters in the comment header of a script here, as
    <file>:<line> with its length. Exit 1 if it reports one.

.DESCRIPTION
    WHY (#211). The headers are wrapped at 100 characters and nothing read that. On PR #210
    (2026-10-09) a fix left a header line at 153 characters, and the pre-PR review took a second
    confirmation turn over it. The Markdown check reads `.md` files only.

    WHAT IT READS. The header of each `scripts/*.ps1`: from the first line that opens a block
    comment to the first after it that opens with the two characters that close one. With no
    switch, the staged content of the staged scripts, which is what the commit will hold. -All
    reads each tracked script, as staged.

    WHAT IT LEAVES. A line under `.EXAMPLE`, up to the next keyword line: a command cannot be
    wrapped. The code below the header.

    WHAT IT CANNOT SEE. A comment that is not the header. A header whose opening does not start its
    line. A script outside `scripts/`, and the hooks and the workflow, whose comments are wrapped
    the same way. Whether a line could have been wrapped: an address longer than the limit is
    reported like any other. A character outside the basic plane, such as most emoji, counts two.

.PARAMETER All
    Read each tracked script, as staged, and not only the staged ones.

.PARAMETER SelfTest
    Prove a long header line is reported by its line and length, that a long line under
    `.EXAMPLE`, below the header or in a script with no header is not, and that a commit's
    staged content is what is read. That case needs git.

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
        @{ Name = 'a script with no header passes'; Test = {
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

$found = 0
foreach ($f in $files) {
    $lines = @(git show ":$f")
    if ($LASTEXITCODE -ne 0) { throw "git could not read the staged $f. Run it from the repository root." }
    foreach ($hit in Find-Long $lines) {
        Write-Host "${f}:$($hit.Line): $($hit.Length) characters in the header, over $LIMIT."
        $found++
    }
}
if ($found) {
    Write-Host ''
    Write-Host "FAILED - header-length-check: $found header line(s) over $LIMIT, $($files.Count) script(s) read. Rewrap each; a line under .EXAMPLE is left."
    exit 1
}
Write-Host "OK - header-length-check: $($files.Count) script(s) read, no header line over $LIMIT."
