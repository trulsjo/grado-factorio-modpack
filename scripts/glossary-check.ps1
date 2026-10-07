<#
.SYNOPSIS
    Reports each use, in the lines a commit range adds to tracked Markdown, of a word that
    GLOSSARY.md lists on an `_Avoid_` line: <file>:<line>: the word, and the term that avoids it.
    It reports and never refuses: exit 0 whatever it finds.

.DESCRIPTION
    WHY (#164). GLOSSARY.md gives most terms an `_Avoid_` line, and nothing read new prose against
    them. The plugin pass on PR #163 (2026-10-06) found "confirms" in new text of
    docs/agents/code-review.md, a word *Measured* avoids, after the pre-PR review had passed it.
    The output is handed to the pre-PR reviewer (docs/agents/pre-pr-review-brief.md). Whether a
    reported word is wrong stays the reviewer's, which is why this does not refuse: most of these
    words are ordinary English, and a check that refused on them would be skipped.

    WHAT IT READS AS WHAT. GLOSSARY.md is read as it is at the end of the range. A term is a line
    opening `**Term**:`, and its avoid line runs from `_Avoid_:` to the next blank line. A remark
    in parentheses belongs to the entry before it and is dropped; what is left is split at every
    comma and semicolon, and `a/b` is two words. A word ending in -ed is matched in its other verb
    forms too (confirmed: confirm, confirms, confirming), and any other with a plural -s. Case is
    not read. Only added lines are read, as they are at the end of the range, and nothing inside a
    fenced code block.

    WHICH ENTRIES IT DOES NOT MATCH. -List prints them, each with why, from the glossary as it is:
    an entry that carries a condition ("above/below without saying of what", a quoted word "for"
    or "as" something) takes a reader, and so does a word in $LEFT below, which is in ordinary use
    here and avoided only as a word for one term.

    A DELIBERATE USE IS MARKED on its own line with an HTML comment naming the word as it stands
    there: <!-- deliberate: confirms -->. A marked use is not reported. A word inside double
    quotes or a code span is being mentioned and is not reported either.

    WHAT IT CANNOT SEE. Whether a use is wrong. A phrase or a quotation broken over two lines. A
    line that was moved and not changed is reported as added. GLOSSARY.md itself, where the words
    are listed. An irregular verb form (read, chose). Markdown outside `.md` files.

.PARAMETER Range
    Read the lines a commit range adds: -Range origin/main..HEAD. The same switch as
    markdown-check.ps1's.

.PARAMETER All
    Read every line of every tracked Markdown file, as at HEAD. For measuring how often a word is
    used before leaving it to the reviewer.

.PARAMETER List
    Print the avoid entries that are matched and those that are not, with why.

.PARAMETER SelfTest
    Prove an avoided word is reported and that a clean line, a marked use and a mention pass.

.EXAMPLE
    pwsh -File scripts/glossary-check.ps1 -Range origin/main..HEAD
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [string] $Range,
    [switch] $All,
    [switch] $List,
    [switch] $SelfTest
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

# Words left to the reviewer, each a pattern for the word as it stands in a line, and why.
$LEFT = [ordered] @{
    '^mods?$'            = 'what every member is; avoided only as a word for a pack'
    '^dependency$'       = "info.json's own word; avoided only as a word for a member mod"
    '^releases?$'        = 'what a portal entry holds; avoided only as a word for the entry'
    '^names?$'           = 'a term of its own, *Name*; avoided only as a word for a title'
    '^loads?$'           = 'a term of its own, *Load*; avoided only as a word for a start'
    '^rules?$'           = 'what CLAUDE.md and the review page state; avoided only as a word for a promise'
    '^check(s|ing)?$'    = 'what the scripts here are and do; "checked" is still reported'
}

function Get-Avoided {
    <#  The avoid entries of a glossary, each as @{ Term; Entry; Pattern; Why }. Why is set on an
        entry that is not matched, and Pattern on one that is.  #>
    param([Parameter(Mandatory)] [AllowEmptyString()] [string[]] $Glossary)

    $term = $null
    for ($i = 0; $i -lt $Glossary.Count; $i++) {
        if ($Glossary[$i] -match '^\*\*(.+?)\*\*:') { $term = $Matches[1]; continue }
        if ($Glossary[$i] -notmatch '^_Avoid_:\s*(.*)$') { continue }
        $text = $Matches[1]
        while ($i + 1 -lt $Glossary.Count -and $Glossary[$i + 1] -match '\S' -and $Glossary[$i + 1] -notmatch '^(\*\*|#)') { $text += ' ' + $Glossary[++$i] }
        do { $before = $text; $text = $text -replace '\s*\([^()]*\)' } while ($text -ne $before)
        foreach ($entry in $text -split '[,;]' | ForEach-Object { $_.Trim() -replace '^(and|or)\s+' } | Where-Object { $_ }) {
            $words = @(($entry -replace '"').ToLowerInvariant() -split '/')
            $key = $LEFT.Keys | Where-Object { $words -match $_ } | Select-Object -First 1
            $why = if ($entry -match '^"[^"]+"\s+\S|\s(without|for|as)\s|\son its own$') { 'carries a condition, which takes a reader' }
                elseif ($key) { $LEFT[$key] }
            $forms = foreach ($w in $words) {
                $escaped = [regex]::Escape($w) -replace '\\ ', '\s+'
                if ($w -match 'ied$') { ($escaped -replace 'ied$') + '(?:y|ies|ied|ying)' }
                elseif ($w -match 'ed$') { ($escaped -replace 'ed$') + '(?:e|es|ed|s|ing)?' }
                else { $escaped + 's?' }
            }
            @{ Term = $term; Entry = $entry; Why = $why; Pattern = "(?<![\w-])(?:$($forms -join '|'))(?![\w-])" }
        }
    }
}

function Find-Avoided {
    <#  The uses of a matched avoid entry on the numbered lines of one file, each as
        @{ Line; Word; Term; Entry }.  #>
    param(
        [Parameter(Mandatory)] [AllowEmptyCollection()] [AllowEmptyString()] [string[]] $Lines,
        [Parameter(Mandatory)] [AllowEmptyCollection()] [int[]] $Numbers,
        [Parameter(Mandatory)] [AllowEmptyCollection()] [hashtable[]] $Avoided
    )

    $fenced = [bool[]]::new($Lines.Count + 1)
    $fence = $null
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        $fenced[$i + 1] = $true
        if ($fence) { if ($Lines[$i] -match "^\s*$([regex]::Escape($fence))+\s*$") { $fence = $null } }
        elseif ($Lines[$i] -match '^\s*(`{3,}|~{3,})') { $fence = $Matches[1] }
        else { $fenced[$i + 1] = $false }
    }
    foreach ($n in $Numbers | Where-Object { $_ -le $Lines.Count -and -not $fenced[$_] }) {
        $line = $Lines[$n - 1]
        $marked = if ($line -match '<!--\s*deliberate:\s*(.*?)\s*-->') { $Matches[1].ToLowerInvariant() -split '\s*,\s*' } else { @() }
        $prose = $line -replace '<!--.*?-->|`[^`]*`|"[^"]*"|“[^”]*”'
        foreach ($a in $Avoided | Where-Object { -not $_.Why }) {
            foreach ($m in [regex]::Matches($prose, $a.Pattern, 'IgnoreCase')) {
                $word = $m.Value.ToLowerInvariant()
                if ($word -in $marked -or ($LEFT.Keys | Where-Object { $word -match $_ })) { continue }
                @{ Line = $n; Word = $m.Value; Term = $a.Term; Entry = $a.Entry }
            }
        }
    }
}

if ($SelfTest) {
    $glossary = "**Measured**:", "Run and written down.", "_Avoid_: confirmed, verified (neither says", "which grade), `"measured`" for anything undated", "", "**Portal entry**:", "A page.", "_Avoid_: portal page, above/below without saying of what"
    $avoided = @(Get-Avoided -Glossary $glossary)
    $find = { param([string] $text) $lines = $text -split "`n"; @(Find-Avoided -Lines $lines -Numbers (1..$lines.Count) -Avoided $avoided | ForEach-Object { "$($_.Line): $($_.Word) ($($_.Term))" }) }
    $cases = @(
        @{ Name = 'an avoided word is reported with its line and its term, in another verb form too'; Test = {
            $f = @(& $find "fine`nThe load confirms it, and was Verified on the portal pages.")
            $f.Count -eq 3 -and $f[0] -eq '2: confirms (Measured)' -and $f[1] -eq '2: Verified (Measured)' -and $f[2] -eq '2: portal pages (Portal entry)' } }
        @{ Name = 'a clean line passes, and so does a longer word that holds an avoided one'; Test = {
            @(& $find 'The load was measured on 2026-10-08; the confirmation is a step.').Count -eq 0 } }
        @{ Name = 'a marked use is not reported, and an unmarked word beside it still is'; Test = {
            $f = @(& $find 'The reviewer confirms its fix, verified. <!-- deliberate: confirms -->')
            $f.Count -eq 1 -and $f[0] -eq '1: verified (Measured)' } }
        @{ Name = 'a word in double quotes, in a code span or inside a fence is not reported'; Test = {
            @(& $find ('An old "confirmed" and `verified` are mentions.', '', '```', 'it confirms', '```' -join "`n")).Count -eq 0 } }
        @{ Name = 'an entry with a condition is listed as not matched, and a remark in parentheses is no entry'; Test = {
            $unmatched = @($avoided | Where-Object Why | ForEach-Object Entry)
            $avoided.Count -eq 5 -and $unmatched.Count -eq 2 -and $unmatched[0] -eq '"measured" for anything undated' -and $unmatched[1] -eq 'above/below without saying of what' } }
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

if ($Range -and $Range -notmatch '\.\.+[^.]') { throw '-Range needs both ends, as origin/main..HEAD: the files are read at its end.' }
$revision = if ($Range) { $Range -replace '^.*\.\.+' } else { 'HEAD' }
$avoided = @(Get-Avoided -Glossary @(git show "${revision}:GLOSSARY.md"))
if ($LASTEXITCODE -ne 0) { throw "git could not read GLOSSARY.md at $revision. Run it inside the repository." }

if ($List) {
    Write-Host 'Matched:'
    $avoided | Where-Object { -not $_.Why } | ForEach-Object { Write-Host "  $($_.Term): $($_.Entry)" }
    Write-Host 'Not matched, and left to the reviewer:'
    $avoided | Where-Object Why | ForEach-Object { Write-Host "  $($_.Term): $($_.Entry) -- $($_.Why)" }
    Write-Host 'Forms of a matched word that are left as well:'
    $LEFT.GetEnumerator() | Where-Object { $key = $_.Key; -not ($avoided | Where-Object { $_.Why -eq $LEFT[$key] }) } | ForEach-Object { Write-Host "  $($_.Key) -- $($_.Value)" }
    exit 0
}

# The added lines of each Markdown file: every line with -All, or what the range's diff adds.
$added = [ordered] @{}
if ($Range) {
    $file = $null
    foreach ($d in git -c core.quotepath=off diff --unified=0 --diff-filter=ACMR $Range -- '*.md') {
        if ($d -match '^\+\+\+ b/(.+)$') { $file = $Matches[1]; $added[$file] = [System.Collections.Generic.List[int]]::new() }
        elseif ($d -match '^@@ -\S+ \+(\d+)(?:,(\d+))? @@') {
            $count = if ($Matches[2]) { [int] $Matches[2] } else { 1 }
            for ($k = 0; $k -lt $count; $k++) { $added[$file].Add([int] $Matches[1] + $k) }
        }
    }
}
elseif ($All) { foreach ($f in git -c core.quotepath=off ls-files '*.md') { $added[$f] = $null } }
else { throw 'Say what to read: -Range origin/main..HEAD, -All, -List or -SelfTest.' }
if ($LASTEXITCODE -ne 0) { throw 'git could not list the lines to read. Run it inside the repository.' }

$found = 0
$added.Remove('GLOSSARY.md')
foreach ($f in $added.Keys) {
    $lines = @(git show "${revision}:$f")
    if ($LASTEXITCODE -ne 0) { throw "git could not read ${revision}:$f." }
    $numbers = if ($null -eq $added[$f]) { @(1..[Math]::Max(1, $lines.Count)) } else { $added[$f].ToArray() }
    foreach ($u in Find-Avoided -Lines $lines -Numbers $numbers -Avoided $avoided) {
        Write-Host "${f}:$($u.Line): `"$($u.Word)`" - *$($u.Term)* avoids $($u.Entry)"
        $found++
    }
}
Write-Host ''
Write-Host "glossary-check: $found use(s) of an avoided word in $($added.Count) Markdown file(s). It reports and does not refuse: whether a use is wrong is the reviewer's. A deliberate use is marked <!-- deliberate: word -->."
exit 0
