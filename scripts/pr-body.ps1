<#
.SYNOPSIS
    Puts the pre-PR reviewer's findings and confirmation under a pull request body's draft, word
    for word from the report, and fails when a finding has no confirmation line.

.DESCRIPTION
    WHY (#208). The body takes *Findings* and *Confirmation* from the reviewer's report as they
    stand, under one heading (docs/agents/pre-pr-review-brief.md, *Into the pull request*). On
    PR #205 (2026-10-09) that was done by a throwaway script, and nothing read whether each
    finding had been answered.

    WHAT IT WRITES. The draft, then `## Pre-PR review`, then everything the report holds under
    `## Findings`, then `### Confirmation` and everything the report holds under
    `## Confirmation`. The findings keep their `### <n>.` headings. *Read and found correct* and
    anything else in the report stays out.

    WHAT IT REFUSES, writing nothing: a report with no `## Findings`; one with a numbered finding
    and no `## Confirmation`; one where a finding's number opens no line of the confirmation.

    WHAT IT CANNOT SEE. What a confirmation line says: "3. not fixed" answers finding 3 as well
    as "3. fixed" does, and whether a finding left unfixed has its reason beside it is read by a
    person. A finding not headed `### <n>.`, which is taken as text. A `##` heading inside a
    fenced block is not a heading; one inside an indented block is. The draft is not read at all.

.PARAMETER Draft
    The body above the review: the `Closes` lines and the pr skill's template, filled.

.PARAMETER Review
    The reviewer's report, as docs/agents/pre-pr-review-brief.md shapes it.

.PARAMETER Out
    The file to write the body to, for `gh pr create --body-file`.

.PARAMETER SelfTest
    Prove the body holds every finding and the whole confirmation, wherever the confirmation
    stands, and that each refusal refuses and writes nothing.

.EXAMPLE
    pwsh -File scripts/pr-body.ps1 -Draft ../scratch/draft.md -Review ../scratch/review.md -Out ../scratch/body.md
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [string] $Draft,
    [string] $Review,
    [string] $Out,
    [switch] $SelfTest
)

$ErrorActionPreference = 'Stop'

# The lines under one second-level heading of the report, up to the next one. $null if it is absent.
function Get-Section([string[]] $Lines, [string] $Heading) {
    $taken = $null
    $fenced = $false
    foreach ($line in $Lines) {
        if ($line -match '^\s*(```|~~~)') { $fenced = -not $fenced }
        elseif (-not $fenced -and $line -match '^## ') {
            if ($null -ne $taken) { break }
            if ($line.TrimEnd() -eq "## $Heading") { $taken = [System.Collections.Generic.List[string]]::new() }
            continue
        }
        if ($null -ne $taken) { $taken.Add($line) }
    }
    if ($null -eq $taken) { return $null }
    , @(($taken -join "`n").Trim("`n") -split "`n")
}

function Get-Body([string] $DraftText, [string[]] $ReviewLines) {
    $findings = Get-Section $ReviewLines 'Findings'
    if ($null -eq $findings) { throw 'The report has no "## Findings" section.' }
    $confirmation = Get-Section $ReviewLines 'Confirmation'
    $numbers = @($findings | ForEach-Object { if ($_ -match '^### (\d+)\.') { $Matches[1] } })
    if ($numbers -and $null -eq $confirmation) { throw "The report has $($numbers.Count) finding(s) and no ""## Confirmation"" section." }
    $unanswered = @($numbers | Where-Object { $n = $_; -not ($confirmation -match "^\s*$n\. ") })
    if ($unanswered) { throw "No line of the confirmation answers finding $($unanswered -join ', ')." }
    $parts = @($DraftText.TrimEnd(), '## Pre-PR review', ($findings -join "`n"))
    if ($null -ne $confirmation) { $parts += '### Confirmation', ($confirmation -join "`n") }
    ($parts -join "`n`n") + "`n"
}

if ($SelfTest) {
    $finding = { param($n) "### $n. Something is wrong.", '', "- **Where:** ``a.md:$n``", '- **Fix:** narrow.', '' }
    $report = { param([string[]] $Findings, [string[]] $Confirmation, [switch] $ConfirmationLast)
        $read = '## Read and found correct', '', '- The count, by adding it up.', ''
        $conf = if ($null -ne $Confirmation) { @('## Confirmation', '') + $Confirmation + '' } else { @() }
        @('# Pre-PR review of `branch`', '', 'Two findings.', '', '## Findings', '') + $Findings + $(if ($ConfirmationLast) { $read + $conf } else { $conf + $read }) }
    $two = (& $finding 1) + (& $finding 2)
    $draft = "Closes #1`n`n## Summary`n`nA change.`n"
    $throws = { param([string[]] $lines, [string] $why) try { Get-Body $draft $lines | Out-Null; $false } catch { $_.Exception.Message -match $why } }
    $cases = @(
        @{ Name = 'the body is the draft, one heading, every finding and the whole confirmation, with no report heading above the third level'; Test = {
            $body = Get-Body $draft (& $report $two @('Read at `abc1234`.', '', '1. fixed', '2. not fixed: the count is still off'))
            $after = $body.Substring($body.IndexOf('## Pre-PR review') + 16)
            $body.StartsWith("Closes #1`n`n## Summary`n`nA change.`n`n## Pre-PR review`n`n### 1. Something is wrong.") -and
                $after -match '(?m)^### 2\. Something' -and $after -match '(?m)^- \*\*Where:\*\* `a\.md:2`$' -and
                $after -match "(?m)^### Confirmation`n`nRead at ``abc1234``\.`n`n1\. fixed`n2\. not fixed: the count is still off`n$" -and
                $after -notmatch '(?m)^#{1,2} ' -and $body -notmatch 'Read and found correct|adding it up|Two findings' } }
        @{ Name = 'a report with no Findings section is refused'; Test = {
            & $throws @('# Report', '', '## Confirmation', '', '1. fixed') 'no "## Findings"' } }
        @{ Name = 'findings with no Confirmation section are refused'; Test = {
            & $throws (& $report $two $null) '2 finding\(s\) and no "## Confirmation"' } }
        @{ Name = 'a finding with no confirmation line is refused by its number, and a longer number does not answer it'; Test = {
            (& $throws (& $report $two @('1. fixed', '12. fixed')) 'answers finding 2\.$') -and (& $throws (& $report $two @('2. fixed')) 'answers finding 1\.$') } }
        @{ Name = 'a report that found nothing gives a body that says so, with or without a confirmation'; Test = {
            $body = Get-Body $draft (& $report @('Nothing found.', '') $null)
            $body.EndsWith("## Pre-PR review`n`nNothing found.`n") -and $body -notmatch 'Confirmation' } }
        @{ Name = 'the confirmation is taken where it stands last, with two runs of numbered lines'; Test = {
            $body = Get-Body $draft (& $report $two @('1. fixed', '2. not fixed: see 3', '', 'Second confirmation.', '', '2. fixed') -ConfirmationLast)
            $body.EndsWith("### Confirmation`n`n1. fixed`n2. not fixed: see 3`n`nSecond confirmation.`n`n2. fixed`n") -and $body -notmatch 'adding it up' } }
        @{ Name = 'a second-level heading inside a fenced block does not end a finding'; Test = {
            $fenced = (& $finding 1) + @('```', '## Findings', '## Not a heading', '```', 'After the block.', '')
            $body = Get-Body $draft (& $report $fenced @('1. fixed'))
            $body -match '(?m)^## Findings\n## Not a heading\n```\nAfter the block\.$' -and $body -match '(?m)^1\. fixed$' } }
        @{ Name = 'run as a command it writes the body and exits 0, and a refused report exits 1 and writes nothing'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "pr-body-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path $temp -Force | Out-Null
            try {
                Set-Content -LiteralPath "$temp/draft.md" -Value $draft -NoNewline
                Set-Content -LiteralPath "$temp/good.md" -Value (& $report $two @('1. fixed', '2. fixed'))
                Set-Content -LiteralPath "$temp/bad.md" -Value (& $report $two @('1. fixed'))
                $good = & pwsh -NoProfile -File $PSCommandPath -Draft "$temp/draft.md" -Review "$temp/good.md" -Out "$temp/good-body.md" 2>&1 | Out-String; $goodCode = $LASTEXITCODE
                $bad = & pwsh -NoProfile -File $PSCommandPath -Draft "$temp/draft.md" -Review "$temp/bad.md" -Out "$temp/bad-body.md" 2>&1 | Out-String; $badCode = $LASTEXITCODE
                if ($goodCode -ne 0) { Write-Host ($good.TrimEnd() -replace '(?m)^', '    ') }
                if ($badCode -ne 1) { Write-Host ($bad.TrimEnd() -replace '(?m)^', '    ') }
                $goodCode -eq 0 -and (Get-Content -LiteralPath "$temp/good-body.md" -Raw) -eq (Get-Body $draft (& $report $two @('1. fixed', '2. fixed'))) -and
                    $badCode -eq 1 -and $bad -match 'finding 2' -and -not (Test-Path -LiteralPath "$temp/bad-body.md")
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

if (-not $Draft -or -not $Review -or -not $Out) { throw 'Say what to build: -Draft <file> -Review <review.md> -Out <file>, or -SelfTest.' }
try { $body = Get-Body (Get-Content -LiteralPath $Draft -Raw) @(Get-Content -LiteralPath $Review) }
catch { Write-Host "FAILED - pr-body: $($_.Exception.Message) Nothing was written."; exit 1 }
Set-Content -LiteralPath $Out -Value $body -NoNewline
Write-Host "OK - pr-body: $Out, with $(@($body -split "`n" | Where-Object { $_ -match '^### \d+\.' }).Count) finding(s) under the review heading."
