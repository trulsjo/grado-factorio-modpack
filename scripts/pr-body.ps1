<#
.SYNOPSIS
    Puts the pre-PR reviewer's findings and confirmation under a pull request body's draft, word
    for word from the report, and fails when a finding has no confirmation line, the draft
    lacks one of the pr template's three headings, or the report names a commit not on
    origin/main.

.DESCRIPTION
    WHY (#208). The body takes *Findings* and *Confirmation* from the reviewer's report as they
    stand, under one heading (docs/agents/pre-pr-review-brief.md, *Into the pull request*). On
    PR #205 (2026-10-09) that was done by a throwaway script, and nothing read whether each
    finding had been answered.

    WHAT IT WRITES. The draft, then `## Pre-PR review`, then everything the report holds under
    `## Findings`, then `### Confirmation` and everything the report holds under
    `## Confirmation`. The findings keep their `### <n>.` headings. *Read and found correct* and
    anything else in the report stays out.

    WHAT IT REFUSES, writing nothing: a report with no `## Findings`; one whose `## Findings`
    holds blank lines only (#362), since docs/agents/pre-pr-review-brief.md has a reviewer who
    found nothing say so there; one with a numbered finding and no `## Confirmation`; one where a
    finding's number opens no line of the confirmation; one whose `## Findings` or
    `## Confirmation` holds a word naming a commit that is not on origin/main (#388), each named
    with its line in the report. That test is `Test-Body`, taken from the shared
    pr-body-check.ps1 in the tools submodule by its parse, so it is the test that check runs on
    the finished body. On PR #387 (2026-10-26) a confirmation cited two branch commits, the body
    was built, and only that check refused it, a turn later; a rebase-merge rewrites a branch
    commit, so a reviewer names one by its role. Test-Body's own refusals stop it too: a shallow
    clone, and an origin/main git cannot resolve. A clone without the submodule says the report
    was not checked for a hash and builds the body, as .githooks/commit-msg lets a commit through
    (ADR 0001 of the tools repository).

    THE DRAFT'S HEADINGS (#320). Truls ruled on 2026-10-19 that the body above the review carries
    the `mattpocock-skills:pr` template's three headings: `## Summary`, `## Evidence` and
    `## Merge Danger`, each once, at the second level, outside fenced blocks, in that order.
    Other sections may stand between them and after them; why is in docs/decisions.md. A draft
    that breaks the rule is refused, writing nothing, with each heading missing, each one given
    twice, or the order the three stand in.

    WHAT IT CANNOT SEE. What a confirmation line says: "3. not fixed" answers finding 3 as well
    as "3. fixed" does, and whether a finding left unfixed has its reason beside it is read by a
    person. A finding not headed `### <n>.`, which is taken as text. Of the draft, the three
    headings alone are read: not what stands under them, not `**Door:**` or `**Blast Radius:**`,
    and not the `Closes` lines, and not a commit hash it holds: pr-body-check.ps1 reads the whole
    body for that before `gh pr create`. A word of the report's other sections, such as *Read and
    found correct*, is not read for a hash, since the body does not copy it. A heading of the
    draft, and a `##` heading of the report, is read from the line's first column, so none in an
    indented block is taken, whose every line opens
    with four spaces or more. A draft heading line is the heading's text exactly, with trailing
    spaces allowed: one indented, closed with `##`, or underlined is taken as missing, and one in
    an HTML comment is taken as a heading. A fence is any line of optional spaces then three
    backticks or three tildes, and the next such line closes it, whichever of the two it uses and
    however long. Inside one a `##` line is not a heading, and a `### <n>.` line is still a
    finding. CommonMark reads fences otherwise, so the rule can be wrong both ways. A fence line
    in an indented code block, or a line opening with a code span of three backticks, hides every
    heading after it until the next fence line. A fence of one character inside one of the
    other, or a shorter fence inside a longer one, ends the outer fence early, and a heading
    inside it is counted.

.PARAMETER Draft
    The body above the review: the `Closes` lines and the pr skill's template, filled.

.PARAMETER Review
    The reviewer's report, as docs/agents/pre-pr-review-brief.md shapes it.

.PARAMETER Out
    The file to write the body to, for `gh pr create --body-file`.

.PARAMETER SelfTest
    Prove the body holds every finding and the whole confirmation, wherever the confirmation
    stands, and that each refusal refuses and writes nothing. In a repository of two commits, one
    on origin/main and one not, with copies of this script and of the shared check: prove a
    report naming the second by hash is refused by word and line, one naming the first or none
    builds as before, a hash in the draft alone does not stop it, a clone without the submodule
    says so and builds, and an origin/main git cannot resolve stops it. Those cases need git and
    the submodule.

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

$TemplateHeadings = 'Summary', 'Evidence', 'Merge Danger'

# What is wrong with the draft's three template headings, one line each. Empty if nothing is.
function Get-DraftProblem([string] $DraftText) {
    $found = [System.Collections.Generic.List[string]]::new()
    $fenced = $false
    foreach ($line in $DraftText -split "`r?`n") {
        if ($line -match '^\s*(```|~~~)') { $fenced = -not $fenced; continue }
        if ($fenced) { continue }
        foreach ($h in $TemplateHeadings) { if ($line.TrimEnd() -ceq "## $h") { $found.Add($h) } }
    }
    $problems = @(foreach ($h in $TemplateHeadings) {
        $count = @($found | Where-Object { $_ -ceq $h }).Count
        if ($count -eq 0) { "``## $h`` is missing" }
        elseif ($count -gt 1) { "``## $h`` stands $count times" }
    })
    if (-not $problems -and ($found -join '|') -cne ($TemplateHeadings -join '|')) {
        $problems += "the headings stand in the order $($found -join ', ')"
    }
    $problems
}

# The lines under one second-level heading of the report, up to the next one. $null if it is absent.
# With -Numbers, the 1-based numbers of those lines in $Lines instead, blank ones among them.
function Get-Section([string[]] $Lines, [string] $Heading, [switch] $Numbers) {
    $taken = $null
    $fenced = $false
    $i = 0
    foreach ($line in $Lines) {
        $i++
        if ($line -match '^\s*(```|~~~)') { $fenced = -not $fenced }
        elseif (-not $fenced -and $line -match '^## ') {
            if ($null -ne $taken) { break }
            if ($line.TrimEnd() -eq "## $Heading") { $taken = [System.Collections.Generic.List[object]]::new() }
            continue
        }
        if ($null -ne $taken) { $taken.Add($(if ($Numbers) { $i } else { $line })) }
    }
    if ($null -eq $taken) { return $null }
    if ($Numbers) { return , @($taken) }
    , @(($taken -join "`n").Trim("`n") -split "`n")
}

# The shared check's test of a commit cited by hash, taken from its file without running the file
# (#388), as member-change-check.ps1 takes the resolver's parse. Not there, it is $null.
$sharedCheck = Join-Path $PSScriptRoot '../vendor/grado-factorio-tools/scripts/pr-body-check.ps1'
if (Test-Path -LiteralPath $sharedCheck) {
    $ast = [Management.Automation.Language.Parser]::ParseFile((Resolve-Path -LiteralPath $sharedCheck), [ref] $null, [ref] $null)
    $testBody = $ast.Find({ param($n) $n -is [Management.Automation.Language.FunctionDefinitionAst] -and $n.Name -eq 'Test-Body' }, $true)
    if (-not $testBody) { throw "$sharedCheck no longer defines Test-Body." }
    . ([scriptblock]::Create($testBody.Extent.Text))
}

# Each word of the report's Findings and Confirmation, the parts the body copies, that names a
# commit not on $Main, as @{ Line; Word }: its line in the report, by Test-Body's test (#388).
function Get-BranchHash([string[]] $ReviewLines, [string] $Top, [string] $Main) {
    # Get-Section returns its array whole; written out again, its numbers go one by one.
    $numbers = @(foreach ($h in 'Findings', 'Confirmation') { $section = Get-Section $ReviewLines $h -Numbers; if ($section) { $section } })
    $text = @($numbers | ForEach-Object { $ReviewLines[$_ - 1] }) -join "`n"
    foreach ($word in @((Test-Body -Text $text -Top $Top -Main $Main).Off)) {
        foreach ($n in $numbers) {
            if ($ReviewLines[$n - 1] -match "(?<![0-9A-Za-z_])$word(?![0-9A-Za-z_])") { @{ Line = $n; Word = $word } }
        }
    }
}

function Get-Body([string] $DraftText, [string[]] $ReviewLines) {
    $problems = @(Get-DraftProblem $DraftText)
    if ($problems) { throw "The draft breaks the pr template: $($problems -join '; '). It needs ``## Summary``, ``## Evidence`` and ``## Merge Danger``, once each and in that order." }
    $findings = Get-Section $ReviewLines 'Findings'
    if ($null -eq $findings) { throw 'The report has no "## Findings" section.' }
    if (-not ($findings -join '').Trim()) { throw 'The report''s "## Findings" section is empty: a reviewer who found nothing says so there.' }
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
    $draft = "Closes #1`n`n## Summary`n`nA change.`n`n## Evidence`n`nRead.`n`n## Merge Danger`n`nNone.`n"
    $refusesDraft = { param([string] $text, [string] $why) try { Get-Body $text (& $report @('Nothing found.', '') $null) | Out-Null; $false } catch { $_.Exception.Message -match $why } }
    $throws = { param([string[]] $lines, [string] $why) try { Get-Body $draft $lines | Out-Null; $false } catch { $_.Exception.Message -match $why } }
    # A repository of two commits, the first on origin/main and the second not, holding a copy of
    # this script and of the shared check where the submodule puts it (#388). Build runs the copy
    # on a report, and on the draft or another, and says what it printed, exited and wrote.
    $hashRepo = {
        if (-not (Test-Path -LiteralPath $sharedCheck)) { throw "$sharedCheck not found; this case needs the submodule." }
        $draft = $draft
        $temp = Join-Path ([IO.Path]::GetTempPath()) "pr-body-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
        $vendored = Join-Path $temp 'vendor/grado-factorio-tools/scripts'
        New-Item -ItemType Directory -Path (Join-Path $temp 'scripts'), $vendored -Force | Out-Null
        $git = { git -C $temp -c user.name=selftest -c user.email=selftest@example.invalid -c commit.gpgsign=false @args; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
        Copy-Item -LiteralPath $PSCommandPath -Destination (Join-Path $temp 'scripts/pr-body.ps1')
        Copy-Item -LiteralPath $sharedCheck -Destination $vendored
        & $git init --quiet -b main | Out-Null
        Set-Content -LiteralPath "$temp/a.txt" -Value 'a'
        & $git add a.txt | Out-Null
        & $git commit --quiet -m on-main | Out-Null
        $onMain = & $git rev-parse --short=7 HEAD
        & $git update-ref refs/remotes/origin/main HEAD | Out-Null
        Set-Content -LiteralPath "$temp/a.txt" -Value 'b'
        & $git commit --quiet -am on-branch | Out-Null
        $onBranch = & $git rev-parse --short=7 HEAD
        $build = { param([string] $name, [string[]] $reviewLines, [string] $draftText = $draft)
            Set-Content -LiteralPath "$temp/$name-draft.md" -Value $draftText -NoNewline
            Set-Content -LiteralPath "$temp/$name.md" -Value $reviewLines
            $said = & pwsh -NoProfile -File (Join-Path $temp 'scripts/pr-body.ps1') -Draft "$temp/$name-draft.md" -Review "$temp/$name.md" -Out "$temp/$name-body.md" 2>&1 | Out-String
            $code = $LASTEXITCODE
            $wrote = Test-Path -LiteralPath "$temp/$name-body.md"
            @{ Code = $code; Said = $said; Wrote = $wrote; Body = $(if ($wrote) { Get-Content -LiteralPath "$temp/$name-body.md" -Raw }) } }.GetNewClosure()
        @{ Temp = $temp; OnMain = $onMain; OnBranch = $onBranch; Build = $build }
    }
    $cases = @(
        @{ Name = 'the body is the draft, one heading, every finding and the whole confirmation, with no report heading above the third level'; Test = {
            $body = Get-Body $draft (& $report $two @('Read at `abc1234`.', '', '1. fixed', '2. not fixed: the count is still off'))
            $after = $body.Substring($body.IndexOf('## Pre-PR review') + 16)
            $body.StartsWith("$($draft.TrimEnd())`n`n## Pre-PR review`n`n### 1. Something is wrong.") -and
                $after -match '(?m)^### 2\. Something' -and $after -match '(?m)^- \*\*Where:\*\* `a\.md:2`$' -and
                $after -match "(?m)^### Confirmation`n`nRead at ``abc1234``\.`n`n1\. fixed`n2\. not fixed: the count is still off`n$" -and
                $after -notmatch '(?m)^#{1,2} ' -and $body -notmatch 'Read and found correct|adding it up|Two findings' } }
        @{ Name = 'a draft with a template heading missing is refused, naming it'; Test = {
            & $refusesDraft ($draft -replace '## Evidence', 'Evidence') '`## Evidence` is missing\.' } }
        @{ Name = 'a draft with a template heading twice is refused, naming it and the count'; Test = {
            & $refusesDraft ($draft + "`n## Summary`n`nAgain.`n") '`## Summary` stands 2 times' } }
        @{ Name = 'a draft with the three headings out of order is refused, naming the order'; Test = {
            $swapped = "Closes #1`n`n## Evidence`n`nRead.`n`n## Summary`n`nA change.`n`n## Merge Danger`n`nNone.`n"
            & $refusesDraft $swapped 'in the order Evidence, Summary, Merge Danger' } }
        @{ Name = 'a template heading only inside a fenced block is missing, as is one at the third level'; Test = {
            (& $refusesDraft ($draft -replace '## Merge Danger', "~~~`n## Merge Danger`n~~~") '`## Merge Danger` is missing\.') -and
                (& $refusesDraft ($draft -replace '## Summary', '### Summary') '`## Summary` is missing\.') } }
        @{ Name = 'a draft with other sections between and after the three headings passes'; Test = {
            $extra = "Closes #1`n`n## Summary`n`nA change.`n`n## Said on the tickets`n`nA ruling.`n`n## Evidence`n`nRead.`n`n## Merge Danger`n`nNone.`n`n## Notes`n`nMore.`n"
            (Get-Body $extra (& $report @('Nothing found.', '') $null)).StartsWith($extra.TrimEnd()) } }
        @{ Name = 'a report with no Findings section is refused'; Test = {
            & $throws @('# Report', '', '## Confirmation', '', '1. fixed') 'no "## Findings"' } }
        @{ Name = 'a report whose Findings section is empty, or blank lines only, is refused'; Test = {
            (& $throws (& $report @() $null) '"## Findings" section is empty') -and (& $throws (& $report @('', '   ', '') $null) '"## Findings" section is empty') } }
        @{ Name = 'findings with no Confirmation section are refused'; Test = {
            & $throws (& $report $two $null) '2 finding\(s\) and no "## Confirmation"' } }
        @{ Name = 'a finding with no confirmation line is refused by its number, and a longer number does not answer it'; Test = {
            (& $throws (& $report $two @('1. fixed', '12. fixed')) 'answers finding 2\.$') -and (& $throws (& $report $two @('2. fixed')) 'answers finding 1\.$') } }
        @{ Name = 'a report that found nothing and has no confirmation gives a body that says so'; Test = {
            $body = Get-Body $draft (& $report @('Nothing found.', '') $null)
            $body.EndsWith("## Pre-PR review`n`nNothing found.`n") -and $body -notmatch 'Confirmation' } }
        @{ Name = 'the confirmation is taken where it stands last, with two runs of numbered lines'; Test = {
            $body = Get-Body $draft (& $report $two @('1. fixed', '2. not fixed: see 3', '', 'Second confirmation.', '', '2. fixed') -ConfirmationLast)
            $body.EndsWith("### Confirmation`n`n1. fixed`n2. not fixed: see 3`n`nSecond confirmation.`n`n2. fixed`n") -and $body -notmatch 'adding it up' } }
        @{ Name = 'a later confirmation under its own third-level heading is kept, and its lines answer findings'; Test = {
            $body = Get-Body $draft (& $report $two @('1. fixed', '', '### Second confirmation', '', '2. fixed'))
            $body.EndsWith("### Confirmation`n`n1. fixed`n`n### Second confirmation`n`n2. fixed`n") } }
        @{ Name = 'a second-level heading inside a fenced block does not end a finding'; Test = {
            $fenced = (& $finding 1) + @('```', '## Findings', '## Not a heading', '```', 'After the block.', '')
            $body = Get-Body $draft (& $report $fenced @('1. fixed'))
            $body -match '(?m)^## Findings\n## Not a heading\n```\nAfter the block\.$' -and $body -match '(?m)^1\. fixed$' } }
        @{ Name = 'run as a command it writes the body and exits 0, and a refused report or draft exits 1 and writes nothing'; Test = {
            $temp = Join-Path ([IO.Path]::GetTempPath()) "pr-body-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
            New-Item -ItemType Directory -Path $temp -Force | Out-Null
            try {
                Set-Content -LiteralPath "$temp/draft.md" -Value $draft -NoNewline
                Set-Content -LiteralPath "$temp/good.md" -Value (& $report $two @('1. fixed', '2. fixed'))
                Set-Content -LiteralPath "$temp/bad.md" -Value (& $report $two @('1. fixed'))
                Set-Content -LiteralPath "$temp/bare.md" -Value "Closes #1`n`n## Summary`n`nA change.`n" -NoNewline
                $good = & pwsh -NoProfile -File $PSCommandPath -Draft "$temp/draft.md" -Review "$temp/good.md" -Out "$temp/good-body.md" 2>&1 | Out-String; $goodCode = $LASTEXITCODE
                $bad = & pwsh -NoProfile -File $PSCommandPath -Draft "$temp/draft.md" -Review "$temp/bad.md" -Out "$temp/bad-body.md" 2>&1 | Out-String; $badCode = $LASTEXITCODE
                $bare = & pwsh -NoProfile -File $PSCommandPath -Draft "$temp/bare.md" -Review "$temp/good.md" -Out "$temp/bare-body.md" 2>&1 | Out-String; $bareCode = $LASTEXITCODE
                if ($goodCode -ne 0) { Write-Host ($good.TrimEnd() -replace '(?m)^', '    ') }
                if ($badCode -ne 1) { Write-Host ($bad.TrimEnd() -replace '(?m)^', '    ') }
                $goodCode -eq 0 -and (Get-Content -LiteralPath "$temp/good-body.md" -Raw) -eq (Get-Body $draft (& $report $two @('1. fixed', '2. fixed'))) -and
                    $badCode -eq 1 -and $bad -match 'finding 2' -and -not (Test-Path -LiteralPath "$temp/bad-body.md") -and
                    $bareCode -eq 1 -and $bare -match '`## Evidence` is missing' -and -not (Test-Path -LiteralPath "$temp/bare-body.md")
            }
            finally { Remove-Item -LiteralPath $temp -Recurse -Force }
        } }
        @{ Name = 'the line numbers of a section are its lines in the report, blank ones among them, and a missing section has none'; Test = {
            $lines = & $report $two @('1. fixed', '2. fixed')
            $numbers = Get-Section $lines 'Confirmation' -Numbers
            ($numbers -join ' ') -eq '18 19 20 21' -and $lines[18] -eq '1. fixed' -and $null -eq (Get-Section $lines 'Nowhere' -Numbers) } }
        @{ Name = 'a report whose confirmation or finding names a commit not on origin/main is refused by the word and its line in the report, exits 1 and writes nothing, and a commit on origin/main beside it is not named'; Test = {
            $r = & $hashRepo
            try {
                $red = & $r.Build 'cited' (& $report $two @("1. fixed: ``git diff $($r.OnMain) $($r.OnBranch)`` prints nothing", '2. fixed'))
                $inFinding = & $r.Build 'finding' (& $report ((& $finding 1) + @("Seen at $($r.OnBranch).", '')) @('1. fixed'))
                foreach ($x in $red, $inFinding) { if ($x.Code -ne 1) { Write-Host ($x.Said.TrimEnd() -replace '(?m)^', '    ') } }
                $red.Code -eq 1 -and -not $red.Wrote -and $red.Said -match "(?m)cited\.md:19: $($r.OnBranch) is a commit that is not on origin/main" -and
                    $red.Said -notmatch "$($r.OnMain) is a commit" -and $red.Said -match 'Nothing was written' -and
                    $inFinding.Code -eq 1 -and -not $inFinding.Wrote -and $inFinding.Said -match "finding\.md:12: $($r.OnBranch) is a commit"
            }
            finally { Remove-Item -LiteralPath $r.Temp -Recurse -Force -ErrorAction SilentlyContinue }
        } }
        @{ Name = 'a report naming only a commit on origin/main, or none, or one not on it only under Read and found correct, which the body does not copy, writes the same body as before'; Test = {
            $r = & $hashRepo
            try {
                $onMain = & $report $two @("1. fixed at $($r.OnMain)", '2. fixed')
                $plain = & $report $two @('1. fixed', '2. fixed')
                $read = $plain -replace 'by adding it up', "at $($r.OnBranch)"
                $built = foreach ($x in @{ N = 'main'; L = $onMain }, @{ N = 'none'; L = $plain }, @{ N = 'read'; L = $read }) { , @((& $r.Build $x.N $x.L), $x.L) }
                foreach ($b in $built) { if ($b[0].Code -ne 0) { Write-Host ($b[0].Said.TrimEnd() -replace '(?m)^', '    ') } }
                -not @($built | Where-Object { $_[0].Code -ne 0 -or $_[0].Body -ne (Get-Body $draft $_[1]) })
            }
            finally { Remove-Item -LiteralPath $r.Temp -Recurse -Force -ErrorAction SilentlyContinue }
        } }
        @{ Name = 'a commit not on origin/main named only in the draft does not stop the body, which keeps it'; Test = {
            $r = & $hashRepo
            try {
                $x = & $r.Build 'indraft' (& $report $two @('1. fixed', '2. fixed')) ($draft -replace 'Read\.', "Read at $($r.OnBranch).")
                if ($x.Code -ne 0) { Write-Host ($x.Said.TrimEnd() -replace '(?m)^', '    ') }
                $x.Code -eq 0 -and $x.Body -match "Read at $($r.OnBranch)\."
            }
            finally { Remove-Item -LiteralPath $r.Temp -Recurse -Force -ErrorAction SilentlyContinue }
        } }
        @{ Name = 'without the submodule it says the report was not checked for a commit cited by hash, and builds the body'; Test = {
            $r = & $hashRepo
            try {
                Remove-Item -LiteralPath (Join-Path $r.Temp 'vendor') -Recurse -Force
                $x = & $r.Build 'bare' (& $report $two @("1. fixed at $($r.OnBranch)", '2. fixed'))
                if ($x.Code -ne 0) { Write-Host ($x.Said.TrimEnd() -replace '(?m)^', '    ') }
                $x.Code -eq 0 -and $x.Wrote -and $x.Said -match 'NOT checked for a commit cited by hash' -and $x.Body -match $r.OnBranch
            }
            finally { Remove-Item -LiteralPath $r.Temp -Recurse -Force -ErrorAction SilentlyContinue }
        } }
        @{ Name = 'where git cannot resolve origin/main the shared test throws, and that stops the body, writing nothing'; Test = {
            $r = & $hashRepo
            try {
                git -C $r.Temp update-ref -d refs/remotes/origin/main
                $x = & $r.Build 'nomain' (& $report $two @('1. fixed', '2. fixed'))
                if ($x.Code -ne 1) { Write-Host ($x.Said.TrimEnd() -replace '(?m)^', '    ') }
                $x.Code -eq 1 -and -not $x.Wrote -and $x.Said -match 'cannot resolve origin/main'
            }
            finally { Remove-Item -LiteralPath $r.Temp -Recurse -Force -ErrorAction SilentlyContinue }
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
try {
    $reviewLines = @(Get-Content -LiteralPath $Review)
    $body = Get-Body (Get-Content -LiteralPath $Draft -Raw) $reviewLines
    # A clone without the submodule says the hash check did not run and builds, as
    # .githooks/commit-msg does (ADR 0001); a shallow clone or no origin/main stops it.
    $hits = @()
    if (Get-Command Test-Body -ErrorAction SilentlyContinue) {
        $top = git -C $PSScriptRoot rev-parse --show-toplevel
        $hits = @(Get-BranchHash $reviewLines $top 'origin/main')
    }
    else { Write-Host "pr-body: $sharedCheck not found, so the report was NOT checked for a commit cited by hash. Run 'git submodule update --init'." }
}
catch { Write-Host "FAILED - pr-body: $($_.Exception.Message) Nothing was written."; exit 1 }
if ($hits) {
    foreach ($h in $hits) { Write-Host "${Review}:$($h.Line): $($h.Word) is a commit that is not on origin/main." }
    Write-Host "FAILED - pr-body: the report names $(@($hits.Word | Sort-Object -Unique).Count) commit(s) not on origin/main, which a rebase-merge rewrites. Hand the report back to name each by its role. Nothing was written."
    exit 1
}
Set-Content -LiteralPath $Out -Value $body -NoNewline
Write-Host "OK - pr-body: $Out, with $(@($body -split "`n" | Where-Object { $_ -match '^### \d+\.' }).Count) finding(s) under the review heading."
