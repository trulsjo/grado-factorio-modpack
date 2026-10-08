# The pre-PR reviewer's brief

The words the pre-PR reviewer is handed its material with, for both of its turns. The rules are in
`code-review.md`, *One review before the pull request*; this page adds none. A session fills the
blanks, written `<like this>`, and sends the rest as it stands. `<scratch>` is filled wherever it
stands. The blanks under the report's headings are the reviewer's and are sent unfilled.

**The report goes to a file, and the reply is five lines.** A report sent as a reply was cut off
twice: in its sixth finding of ten on PR #163 (2026-10-06, by #167's account), and at the head of
its fourth of seven on the #172 branch (2026-10-07, by that session's account; the reply was not
kept). Asked for again as a file, the second arrived whole, by the same account.

## Before the first turn

From the repository root, with `<scratch>` a directory outside the repository:

```
git diff origin/main...HEAD > <scratch>/branch.diff
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/commit-check.ps1 -Range origin/main..HEAD > <scratch>/commit-check.txt
pwsh -NoProfile -File scripts/markdown-check.ps1 -Range origin/main..HEAD > <scratch>/markdown-check.txt
pwsh -NoProfile -File scripts/glossary-check.ps1 -Range origin/main..HEAD > <scratch>/glossary-check.txt
```

Copy the raw output behind each figure on the branch into `<scratch>` as well. A figure whose raw
output is gone is named to the reviewer as missing.

## The review turn

Sent to one fresh subagent.

```
You are the pre-PR reviewer of branch `<branch>` in the repository at <repository path>, which
carries <tickets, as #N>. <One or two sentences: what the change is meant to do.> <What is not
under review, such as a decision of Truls's that the branch records, or nothing.>

This review is read-only. Do not edit, stage, commit or push anything, and post nothing to
GitHub. Do not download or install any program or package: say in the report if you think you
need one. Do not change directory: run every command from the repository root and name files by
path. A session's tooling writes state files where its shell stands, and a command that changes
directory into `.mod-cache/` is refused by a hook.

You are handed:
- the diff against `main`: <scratch>/branch.diff. The commit messages are part of the review:
  `git log --format=%B origin/main..HEAD`.
- `docs/agents/code-review.md`. Read it whole. It is the rules you review by, and the prose is
  reviewed as carefully as the code. Where prose restates a list the code holds, read the two
  side by side.
- `GLOSSARY.md`, which holds the three grades of evidence and the other terms.
- <the raw output and the scripts behind the figures, one path each with the figure it is
  behind; or, on a branch that records no measurements: <scratch>/commit-check.txt and
  <scratch>/markdown-check.txt, and the resolve's output if an `info.json` changed>
- <scratch>/glossary-check.txt: each added line that uses a word `GLOSSARY.md` avoids. The
  script reports and does not judge; say of each use whether it is wrong.
- <raw output that is missing, and the figure it was behind; or nothing>
- the tickets: `gh issue view <N> --json title,body,comments` for each.

Write the report to <scratch>/review.md and reply in at most five lines: how many findings,
which one matters most, and the path. The report has two sections and no scores.

## Findings

### <n>. <One sentence saying what is wrong.>

- **Where:** `<file>:<line>`, with the sentence quoted.
- **Evidence:** what you ran or read, and what it showed.
- **Fix:** the smallest one. The rules say which kind comes first.

## Read and found correct

One line for each thing you checked and found right, with how you checked it.

If you find nothing, say so under Findings and still fill the second section.
```

## The confirmation turn

Sent to the same subagent, after the fixes are committed. A later fix commit is sent the same way,
and so is a fix made after the plugin pass.

```
The fixes are in commit <sha>: `git show <sha>`. <A commit whose message was reworded, by its
old and new hash: `git log -1 --format=%B <new>`, and `git diff <old> <new>` is empty; or
nothing.> <Edits outside the diff, such as a ticket's
body, and how to read each; or nothing.> <If the two checks' results were handed at the review,
their results after this commit: <scratch>/commit-check.txt and <scratch>/markdown-check.txt; or
nothing.> The glossary check's after this commit: <scratch>/glossary-check.txt.

Not fixed, and why: <each finding by its number; or none>. <For a fix of a plugin-pass finding,
which is not one of yours: the finding as the pull request states it; or nothing.>

Read each fix against your own finding. The fix commit's message is read like the rest. Still
read-only, and still from the repository root.

Add a section to <scratch>/review.md and reply in at most five lines with the path.

## Confirmation

<n>. fixed | not fixed: <what is left> | left unfixed, as said

One line for each finding, by its number. A new finding goes under Findings in the same form,
its number carrying on from the last, with "(at confirmation)" after its sentence.
```

## Into the pull request

The body takes *Findings* and *Confirmation* from `<scratch>/review.md` as they stand, under one
heading. A finding left unfixed has its reason beside its confirmation line.
