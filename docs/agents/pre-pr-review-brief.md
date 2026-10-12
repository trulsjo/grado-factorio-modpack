# The pre-PR reviewer's brief

The words the pre-PR reviewer is handed its material with, for both of its turns. The rules are in
`code-review.md`, *One review before the pull request*. A session fills the
blanks, written `<like this>`, and sends the rest as it stands. `<scratch>` is filled wherever it
stands. The blanks under the report's headings are the reviewer's and are sent unfilled.

**The report goes to a file, and the reply is five lines.** A report sent as a reply was cut off
twice: in its sixth finding of ten on PR #163 (2026-10-06, by #167's account), and at the head of
its fourth of seven on the #172 branch (2026-10-07, by that session's account; the reply was not
kept). Asked for again as a file, the second arrived whole, by the same account. **The file is
written with the file tool, and the reply follows it.** On PR #186 (2026-10-08) a reviewer
replied with its count before its section existed, by #192's account: it had appended the
section through the shell, the download hook refused the command, and the count was one short,
all three by that pull request's fifth comment.

## Before the first turn

From the repository root, read the branch's commits against `main` first (#241):

```
git fetch origin
git cherry -v origin/main HEAD
```

The fetch comes first, because `git cherry` reads the local `origin/main`. A line opening `-` is
a commit whose patch is already in `main`: the branch was cut from one that has since merged.
Stop, rebase with `git rebase --onto origin/main <the last commit that is not this branch's>`,
and start this section again.

**Read the `+` lines against the branch's tickets as well.** A merged commit whose patch was
changed before or by the merge shows `+`, so the mark does not tell it from one of the branch's
own. One was seen on `160-plugins` (2026-10-12, by #241's account), beside two that showed `-`.
A `+` commit that is not this branch's own came with the branch this one was cut from. If
`gh pr list --state merged` shows that branch's pull request, the same rebase drops the commit.
If it is not merged, the reviewer is told under "not under review" which commits are not the
branch's.

Then, with `<scratch>` a directory outside the repository:

```
git diff origin/main...HEAD > <scratch>/branch.diff
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/commit-check.ps1 -Range origin/main..HEAD > <scratch>/commit-check.txt
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/markdown-check.ps1 -Range origin/main...HEAD -MaxLineLength 100 > <scratch>/markdown-check.txt
pwsh -NoProfile -File scripts/glossary-check.ps1 -Range origin/main...HEAD > <scratch>/glossary-check.txt
pwsh -NoProfile -File scripts/absolute-words.ps1 -Range origin/main...HEAD > <scratch>/absolute-words.txt
```

The commit check's range has two dots and the others have three. Why is in the header of
`.github/workflows/check.yml`.

Walk `<scratch>/absolute-words.txt` before the reviewer is spawned (#219): it lists the added
lines of Markdown, of comment and of commit message that hold a word such as "only", "every" or
"cannot". Of each line, ask whether the sentence holds for what its word covers, and reword the
one that does not. The script lists and does not fail, and a word used in passing is left.

Copy the raw output behind each figure on the branch into `<scratch>` as well, and save beside it
the command that produced it, as it was run and with any prompt it was given (#234). A figure
whose raw output is gone is named to the reviewer as missing.

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
- <the raw output, the saved commands and the scripts behind the figures, one path each with
  the figure it is behind; or, on a branch that records no measurements:
  <scratch>/commit-check.txt and <scratch>/markdown-check.txt, and the resolve's output if an
  `info.json` changed>
- <scratch>/glossary-check.txt: each added line that uses a word `GLOSSARY.md` avoids and is
  not marked deliberate. The script fails on one, so a use listed there is a finding. Say of
  each `<!-- deliberate: word -->` the diff adds whether the use is meant.
- <raw output that is missing, and the figure it was behind; or nothing>
- the tickets: `gh issue view <N> --json title,body,comments` for each.

Write the report to <scratch>/review.md with the file tool, and reply only after it is written,
in at most five lines: how many findings, which one matters most, and the path. The report has
two sections and no scores.

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
nothing.> <Edits outside the diff, such as a ticket's body, and how to read each; or nothing.>
<If the two checks' results were handed at the review, their results after this commit:
<scratch>/commit-check.txt and <scratch>/markdown-check.txt; or nothing.> The glossary check's
after this commit: <scratch>/glossary-check.txt.

Not fixed, and why: <each finding by its number; or none>. <For a fix of a plugin-pass finding,
which is not one of yours: the finding as the pull request states it; or nothing.>

Read each fix against your own finding. The fix commit's message is read like the rest. Still
read-only, and still from the repository root.

Add a section to <scratch>/review.md with the file tool, and reply only after it is written, in
at most five lines with the path.

## Confirmation

<n>. fixed | not fixed: <what is left> | left unfixed, as said

One line for each finding, by its number. A new finding goes under Findings in the same form,
its number carrying on from the last, with "(at confirmation)" after its sentence.
```

## Into the pull request

The body takes *Findings* and *Confirmation* from `<scratch>/review.md` as they stand, under one
heading. A finding left unfixed has its reason beside its confirmation line.

```
pwsh -NoProfile -File scripts/pr-body.ps1 -Draft <scratch>/draft.md -Review <scratch>/review.md -Out <scratch>/body.md
```

`<scratch>/draft.md` is the body above the review. The script fails, and writes nothing, when a
finding's number opens no line of the confirmation.
