<#
.SYNOPSIS
    Reports each HTML comment opening, `<!--`, in the Markdown of a pack's directory, as
    <file>:<line>. Exit 1 if it reports one, and with -All if it finds no pack directory or no
    Markdown in those it finds, each a run that read nothing.

.DESCRIPTION
    WHY (#376). A pack's Markdown is its player page: it ships inside the pack zip, because the
    packer takes every tracked file in the pack directory, and its README.md is the text meant for
    the portal description. An HTML comment there is read raw in the archive and may show as text
    on the portal. On PR #374 a glossary marker, `<!-- deliberate: ... -->`, was put on
    Grado_NonChanging/README.md to quiet scripts/glossary-check.ps1, and only the plugin pass
    found it (finding 4, scored 55). A player page that uses a word the glossary avoids is
    reworded instead.

    WHAT IT READS. A pack directory is a top-level directory with an info.json in git's index. In
    each, every `.md` file, at any depth. With no switch, the staged content of the staged ones,
    which is what the commit will hold. -All reads each tracked one, as staged. A line fails if it
    holds `<!--` anywhere; nothing else on it is read.

    WHAT FAILS WITH NOTHING READ (#362). -All that finds no pack directory, as from a directory
    other than the root or in a clone whose checkout failed: exit 1. So does -All that finds pack
    directories and no `.md` file in any, which read nothing too (Truls, 2026-10-28, on PR #406).
    With no switch, nothing staged passes and says it read 0 files, since that commit had
    nothing to check.

    WHAT IT CANNOT SEE. An HTML comment written another way, such as with an entity, and any other
    HTML, which is not read. A pack directory not named by an info.json at the top level: an
    info.json deeper down, or a pack whose info.json is not in the index. A Markdown file whose
    name does not end in `.md`. Whether the portal shows an HTML comment, which was not measured.

.PARAMETER All
    Read each tracked Markdown file of every pack directory, as staged, and not only the staged
    ones.

.PARAMETER SelfTest
    Prove a `<!--` in a pack's README.md and in other Markdown deeper in a pack directory is
    reported by file and line, with the advice to reword, that one in Markdown outside a pack
    directory is not, nor one under an info.json below the top level, that a commit's staged
    content is what is read, and that -All with no pack directory fails, and with pack
    directories that hold no Markdown, while nothing staged passes. Needs git.

.EXAMPLE
    pwsh -File scripts/player-page-check.ps1

.EXAMPLE
    pwsh -File scripts/player-page-check.ps1 -All
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [switch] $All,
    [switch] $SelfTest
)

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# The line numbers of $Lines that hold an HTML comment's opening.
function Find-Comment([string[]] $Lines) {
    $n = 0
    foreach ($line in $Lines) {
        $n++
        if ($line.Contains('<!--')) { $n }
    }
}

if ($SelfTest) {
    $cases = @(
        @{ Name = 'a line holding <!-- is reported by its line, wherever on the line, and <!- or a closing --> alone is not'; Test = {
            (@(Find-Comment @('# Title', 'Text <!-- x -->', '<!-', 'a --> b', '<!--')) -join ' ') -eq '2 5' } }
        @{ Name = '-All reports a <!-- in a pack''s README.md and in Markdown deeper in a pack directory by file and line, says to reword, and leaves Markdown outside a pack directory and under a deeper info.json'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "player-page-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            try {
                $write = { param([string] $name, [string[]] $lines) $p = Join-Path $temp $name; New-Item -ItemType Directory -Path (Split-Path $p) -Force | Out-Null; Set-Content -LiteralPath $p -Value $lines }
                & $write 'Pack_A/info.json' '{}'
                & $write 'Pack_A/README.md' @('# A', '', 'Text. <!-- deliberate: mod -->')
                & $write 'Pack_A/docs/notes.md' @('<!-- note -->')
                & $write 'Pack_B/info.json' '{}'
                & $write 'Pack_B/README.md' @('# B, clean')
                & $write 'README.md' @('<!-- the repository''s own -->')
                & $write 'docs/a.md' @('<!-- outside -->')
                & $write 'NotAPack/README.md' @('<!-- no info.json -->')
                & $write 'docs/fixture/info.json' '{}'
                & $write 'docs/fixture/README.md' @('<!-- deeper info.json -->')
                git -C $temp init --quiet
                if ($LASTEXITCODE -ne 0) { throw 'git init failed; the self-test needs git.' }
                git -C $temp add -A
                Push-Location $temp
                try { $text = (& pwsh -NoProfile -File $PSCommandPath -All 2>&1 | Out-String) } finally { Pop-Location }
                $code = $LASTEXITCODE
                $ok = $code -eq 1 -and $text -match '(?m)^Pack_A/README\.md:3: ' -and $text -match '(?m)^Pack_A/docs/notes\.md:1: ' -and
                    @([regex]::Matches($text, '(?m)^\S+\.md:\d+: ')).Count -eq 2 -and $text -match '2 HTML comment\(s\), 3 file\(s\) read' -and
                    $text -match 'reword'
                if (-not $ok) { Write-Host ($text.TrimEnd() -replace '(?m)^', '    ') }
                $ok
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
        } }
        @{ Name = 'a commit''s staged content is what is read: a staged <!-- is refused though the file on disk is repaired, a staged repair passes though the disk has one, and an unstaged page is not read'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "player-page-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            try {
                $write = { param([string] $name, [string[]] $lines) $p = Join-Path $temp $name; New-Item -ItemType Directory -Path (Split-Path $p) -Force | Out-Null; Set-Content -LiteralPath $p -Value $lines }
                $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c core.autocrlf=false -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                & $write 'Pack/info.json' '{}'
                & $write 'Pack/old.md' @('<!-- committed, not staged -->')
                & $git init --quiet
                & $git add -A
                & $git commit --quiet -m x
                & $write 'Pack/README.md' @('# Pack', '<!-- staged -->')
                & $git add -A
                & $write 'Pack/README.md' @('# Pack', 'Repaired, and not staged.')
                $red = & $run
                & $git add -A
                & $write 'Pack/README.md' @('# Pack', '<!-- on disk, not staged -->')
                $green = & $run
                if ($red.Code -ne 1 -or $green.Code -ne 0) { Write-Host (($red.Text + $green.Text).TrimEnd() -replace '(?m)^', '    ') }
                $red.Code -eq 1 -and $red.Text -match '(?m)^Pack/README\.md:2: ' -and $red.Text -notmatch 'old\.md' -and
                    $green.Code -eq 0 -and $green.Text -match '1 file\(s\) read'
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
        } }
        @{ Name = '-All fails, saying so, where no pack directory is in the index, and with nothing staged and no switch the run passes and says it read 0'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "player-page-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path (Join-Path $temp 'docs') -Force | Out-Null
            try {
                Set-Content -LiteralPath (Join-Path $temp 'docs/a.md') -Value '<!-- outside -->'
                git -C $temp init --quiet
                if ($LASTEXITCODE -ne 0) { throw 'git init failed; the self-test needs git.' }
                git -C $temp add -A
                $run = { Push-Location $temp; try { $text = (& pwsh -NoProfile -File $PSCommandPath @args 2>&1 | Out-String) } finally { Pop-Location }; @{ Code = $LASTEXITCODE; Text = $text } }
                $all = & $run -All
                $staged = & $run
                if ($all.Code -ne 1 -or $staged.Code -ne 0) { Write-Host (($all.Text + $staged.Text).TrimEnd() -replace '(?m)^', '    ') }
                $all.Code -eq 1 -and $all.Text -match 'FAILED - player-page-check: -All found no pack directory' -and
                    $staged.Code -eq 0 -and $staged.Text -match '0 file\(s\) read'
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
        } }
        @{ Name = '-All fails, saying so, where it finds a pack directory and no .md file in it, though Markdown stands outside it and another file inside'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "player-page-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path (Join-Path $temp 'Pack'), (Join-Path $temp 'docs') -Force | Out-Null
            try {
                Set-Content -LiteralPath (Join-Path $temp 'Pack/info.json') -Value '{}'
                Set-Content -LiteralPath (Join-Path $temp 'Pack/notes.txt') -Value '<!-- not Markdown -->'
                Set-Content -LiteralPath (Join-Path $temp 'docs/a.md') -Value '# outside'
                git -C $temp init --quiet
                if ($LASTEXITCODE -ne 0) { throw 'git init failed; the self-test needs git.' }
                git -C $temp add -A
                Push-Location $temp
                try { $text = (& pwsh -NoProfile -File $PSCommandPath -All 2>&1 | Out-String) } finally { Pop-Location }
                $code = $LASTEXITCODE
                $ok = $code -eq 1 -and $text -match 'FAILED - player-page-check: -All found 1 pack directory and no tracked \.md file in any'
                if (-not $ok) { Write-Host ($text.TrimEnd() -replace '(?m)^', '    ') }
                $ok
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
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

# A pack directory is a top-level directory whose info.json is in the index.
$packs = @(git -c core.quotepath=off ls-files | Where-Object { $_ -match '^[^/]+/info\.json$' } | ForEach-Object { $_.Split('/')[0] })
if ($LASTEXITCODE -ne 0) { throw 'git could not list the pack directories. Run it from the repository root.' }
# -All reads every pack directory, so finding none is a run that read nothing (#362).
if ($All -and -not $packs) {
    Write-Host 'FAILED - player-page-check: -All found no pack directory (a top-level directory with an info.json in the index), so nothing was read. Run it from the repository root.'
    exit 1
}

# Each pack directory by its path, and the .md files kept here: given Pack/*.md, the check run
# on PR #406 listed no deeper file on ubuntu, where Windows did.
$paths = @($packs | ForEach-Object { "$_/" })
$files = if (-not $paths) { @() }
elseif ($All) { @(git -c core.quotepath=off ls-files -- @paths) }
else { @(git -c core.quotepath=off diff --cached --name-only --diff-filter=ACMR -- @paths) }
if ($LASTEXITCODE -ne 0) { throw 'git could not list the files to read. Run it from the repository root.' }
$files = @($files | Where-Object { $_ -clike '*.md' })
# Pack directories with no page among them read nothing too: WHAT FAILS WITH NOTHING READ.
if ($All -and -not $files) {
    Write-Host "FAILED - player-page-check: -All found $($packs.Count) pack director$(if ($packs.Count -eq 1) { 'y' } else { 'ies' }) and no tracked .md file in any, so nothing was read."
    exit 1
}

$found = 0
foreach ($f in $files) {
    $lines = @(git show ":$f")
    if ($LASTEXITCODE -ne 0) { throw "git could not read the staged $f. Run it from the repository root." }
    foreach ($line in @(Find-Comment $lines)) {
        Write-Host "${f}:${line}: an HTML comment, in a page that ships to players."
        $found++
    }
}
if ($found) {
    Write-Host ''
    Write-Host "FAILED - player-page-check: $found HTML comment(s), $($files.Count) file(s) read. A pack's Markdown ships in its zip, where a comment is read as text; take each out."
    Write-Host 'Where scripts/glossary-check.ps1 flags a word on a player page, reword the line: a <!-- deliberate: ... --> marker shows to players too.'
    exit 1
}
Write-Host "OK - player-page-check: $($files.Count) file(s) read in $($packs.Count) pack director$(if ($packs.Count -eq 1) { 'y' } else { 'ies' }), no HTML comment."
