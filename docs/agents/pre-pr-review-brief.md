# The pre-PR reviewer's brief

The words the pre-PR reviewer is handed its material with, for both of its turns. The rules are in
`code-review.md`, *One review before the pull request*. This page adds the procedure: what a
session does before the first turn, the words each turn is sent with, and how the report comes
back. A session fills the blanks, written `<like this>`, and sends the rest as it stands.
`<scratch>` is filled wherever it stands. The blanks under the report's headings are the
reviewer's and are sent unfilled.

**The report goes to a file, and the turn ends on five lines.** A report sent as a reply was cut off
twice: in its sixth finding of ten on PR #163 (2026-10-06, by #167's account), and at the head of
its fourth of seven on the #172 branch (2026-10-07, by that session's account; the reply was not
kept). Asked for again as a file, the second arrived whole, by the same account. **The file is
written with the file tool, and the five lines follow it.** On PR #186 (2026-10-08) a reviewer
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
a commit whose patch is already in `main`, as when the branch was cut from one that has since
merged.
Stop, rebase with `git rebase --onto origin/main <the last commit that is not this branch's>`,
and start this section again.

**Read the `+` lines against the branch's tickets as well.** A merged commit whose patch was
changed before or by the merge shows `+`, so the mark does not tell it from one of the branch's
own. One was seen on `160-plugins` (2026-10-12, by #241's account), beside two that showed `-`.
If `gh pr list --state merged` shows the pull request of the branch a foreign `+` commit came
with, the same rebase drops the commit. If it is not merged, the reviewer is told under "not
under review" which commits are not the branch's.

Then, with `<scratch>` a directory outside the repository:

```
git diff origin/main...HEAD > <scratch>/branch.diff
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/commit-check.ps1 -Range origin/main..HEAD > <scratch>/commit-check.txt
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/markdown-check.ps1 -Range origin/main...HEAD -MaxLineLength 100 > <scratch>/markdown-check.txt
pwsh -NoProfile -File scripts/glossary-check.ps1 -Range origin/main...HEAD > <scratch>/glossary-check.txt
pwsh -NoProfile -File scripts/absolute-words.ps1 -Range origin/main...HEAD > <scratch>/absolute-words.txt
pwsh -NoProfile -File scripts/mentions.ps1 -Range origin/main...HEAD > <scratch>/mentions.txt
```

The commit check's range has two dots and the others have three. Why is in the header of
`.github/workflows/check.yml`.

If an `info.json` changed, resolve all five packs in one run (#259), in PowerShell, whichever
pack changed:

```
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/resolve-modpack.ps1 `
    -Line <line> -Build <build> Grado_NonChanging/info.json Grado_ChangingBase/info.json `
    Grado_ABC/info.json Grado_ABCX/info.json Grado_ABCS/info.json *> <scratch>/resolve.txt
Get-Date -Format o >> <scratch>/resolve.txt
```

`<line>` is the packs' `factorio_version`, and `<build>` the installed game's version, from its
`data/base/info.json`, which is what `scripts/stage-pack.ps1` passes when it is given no build.
`<build>` must be on `<line>`, and both scripts refuse a pair that is not. `stage-pack.ps1`
refuses it before it calls the resolver, read from its source at `32c732c`. The resolver refuses
it before it reads a pack or the portal and writes no pin file, read from its source at the tools
repository's `8a4f66f` and run through `vendor/` on 2026-10-14 (#277). The resolver reads the
portal, so its output is a measurement and the time of the run is kept with it. A pack named by
another is read from the files given, by the resolver's header, so the run covers every pack above
the one that changed. A run that fails is handed over as it stands, and the review goes on.

Walk `<scratch>/absolute-words.txt` before the reviewer is spawned (#219): it lists the added
lines of Markdown, of comment and of commit message that hold a word such as "only", "every" or
"cannot". Of each line, ask whether the sentence holds for what its word covers, and reword the
one that does not. The script lists and does not fail, and a word used in passing is left.

`<scratch>/mentions.txt` is not walked by the session: it goes to the reviewer (#365). It lists
each tracked line that names what the branch changed: a script, a member a pack gains or loses,
or a `base >=` floor or `factorio_version` an `info.json` replaces. On a branch that moves the
pin it names too each tools script this repository runs that the move changes, itself or through
a script it loads, and each tools file the move changes that a line cites by its path, and after
the list it prints the tools commits between the pins that call themselves breaking, with their
footers (#384).
Load records, traces and the lines the branch adds are left out.

A probe of a Claude Code setting is started as `docs/agents/issue-tracker.md`'s bullet on a
newly started process says.

### The raw output behind a figure

Keep the raw output behind each figure on the branch, in the draft of the pull request's body,
and in each later fix commit, a fix after the plugin pass included, in `<scratch>`, with the
command that produced it, as it was run and with any prompt it was given (#234). A figure whose
raw output is gone is named to the reviewer as missing.

**A run whose result may become a figure is saved when it runs** (#396), a failing run of
test-first work included: its output goes to `<scratch>/<name>.out.txt`, with its command on the
first line, as it is made, and is not copied afterwards. Twice on PR #394 (2026-10-26) a figure
was read on screen and rebuilt later: the draft's "6 of 7 held" for a self-test case failing
before the change, with every script's self-test counts, which the pre-PR review raised as its
finding 6; and the red run the plugin-pass fix commit's message cites.

**Where the run is gone, a rebuild stands in for it** if the text that gives the figure says it is
a rebuild, and how it was rebuilt and its output are kept beside it, as PR #394's body did and its
reviewer accepted. A rebuild so named is not a finding of its own.

The turns below hand a figure's raw output by this section and do not restate it, the
confirmation turn's for a figure that a fix or the draft adds included.

## The review turn

Sent to one fresh subagent.

```
You are the pre-PR reviewer of branch `<branch>` in the repository at <repository path>, which
carries <tickets, as #N>. <One or two sentences: what the change is meant to do.> <What is not
under review, such as a decision of Truls's that the branch records, or nothing.>

This review is read-only. Do not edit, stage, commit or push anything, and post nothing to
GitHub. Do not download or install any program or package: say in the report if you think you
need one. Run every command from the repository root and name files by path. A session's
tooling writes state files where its shell stands, and a command that changes directory into
`.mod-cache/` is refused by a hook.

You are handed:
- the diff against `main`: <scratch>/branch.diff. The commit messages are part of the review:
  `git log --format=%B origin/main..HEAD`.
- `docs/agents/code-review.md`. Read it whole. It is the rules you review by, and the prose is
  reviewed as carefully as the code. Where prose restates a list the code holds, read the two
  side by side.
- `GLOSSARY.md`, which holds the terms and the words most of them avoid.
- `vendor/grado-factorio-tools/docs/claim-grades.md`, which holds the three grades of evidence
  and the rules a reviewer checks them by.
- <the raw output, the saved commands and the scripts behind the figures, one path each with
  the figure it is behind; or nothing>
- <scratch>/commit-check.txt and <scratch>/markdown-check.txt. <If an `info.json` changed:
  <scratch>/resolve.txt, the resolve of all five packs, with the time it was run; a failure in it
  is a finding; or nothing.>
- <scratch>/glossary-check.txt: each added line that uses a word `GLOSSARY.md` avoids and is
  not marked deliberate. The script fails on one, so a use listed there is a finding. Say of
  each `<!-- deliberate: word -->` the diff adds whether the use is meant.
- <scratch>/mentions.txt: each line outside the diff that names what the branch changed. Read
  each against the diff; a sentence the change makes false is a finding. A line tagged `dated:`
  stands in a dated note, which names a thing as it was. On a pin move, read each listed line
  against the breaking tools commits printed after the list too: a sentence one of them makes
  false is a finding.
- <raw output that is missing, and the figure it was behind; or nothing>
- the tickets: `gh issue view <N> --json title,body,comments` for each.

Write the report to <scratch>/review.md with the file tool. Once it is written, end your turn
with at most five lines as its last text: how many findings, which one matters most, and the
path. Send no message: the five lines reach the session as they are. The report has two
sections and no scores. It goes into the pull request's body as it stands, so name a commit of
the branch by its role, such as "the ticket commit for #N" or "the fix commit", and never by its
hash. A commit on `main` may be named by its hash. Quote no closing keyword before an issue
reference: say "the `Closes` line for #N".

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

Sent to the same subagent, after the fixes are committed. A later fix commit, or a fix to the
draft, is sent the same way, and so is a fix made after the plugin pass. The turn names the
branch's commits by their roles, or by position from `HEAD`, as the report does (#321). A
rewording is the exception: the reviewer runs `git diff <old> <new>`, so the two hashes stand in
the turn's commands, and its confirmation line names the commit by its role. The first confirmation
also hands the draft of the pull request's body, `<scratch>/draft.md`, written before it (#273).

```
<The fixes are in the fix commit, at `HEAD`: `git show HEAD`; or nothing.> <A commit whose
message was reworded, named by its role, with its old and new hash for the commands alone:
`git log -1 --format=%B <new>`, and `git diff <old> <new>` is empty; or nothing.> <Edits
outside the diff, such as a ticket's body, and how to read each; or nothing.> <The checks'
results after this commit: <scratch>/commit-check.txt, <scratch>/markdown-check.txt and
<scratch>/glossary-check.txt; or nothing.> <The draft of the pull request's body above the
review: <scratch>/draft.md, read like the commit messages; or nothing.> <The raw output and
saved command behind each figure the fix or the draft adds, one path each with its figure; or
nothing.>

Not fixed, and why: <each finding by its number; or none>. <For a fix of a plugin-pass finding,
which is not one of yours: the finding as the pull request states it; or nothing.>

Read each fix commit as new diff: against your own finding, and by every rule you reviewed by
in the first turn. The fix commit's message is read like the rest. Still read-only, and still
from the repository root. Name the branch's commits by their roles, as in the first turn, in a
confirmation line too.

Write your confirmation into <scratch>/review.md with the file tool, under ## Confirmation as
below, above any other section this turn asks of you. Once it is written, end your turn with
at most five lines and the path as its last text, and send no message.

## Confirmation

<n>. fixed | not fixed: <what is left> | left unfixed, as said

One line for each finding, by its number. A new finding goes under Findings in the same form,
its number carrying on from the last, with "(at confirmation)" after its sentence. A later
confirmation goes under ## Confirmation as ### Second confirmation, ### Third confirmation and
so on, with a line for each finding it answers.
```

Each confirmation stays under `## Confirmation`, with no other `##` heading inside it, because
`pr-body.ps1` reads `## Confirmation` up to the next `##` heading (its `Get-Section`, read from
source at `e9d6d09`). On PR #377 (2026-10-25) a confirmation stood below the reviewer's
`## Classes` section, and `pr-body.ps1` failed with "No line of the confirmation answers finding
15"; that output was not kept.

## Into the pull request

The body takes *Findings* and *Confirmation* from `<scratch>/review.md` as they stand, under one
heading. A finding left unfixed has its reason beside its confirmation line.

```
pwsh -NoProfile -File scripts/pr-body.ps1 -Draft <scratch>/draft.md -Review <scratch>/review.md -Out <scratch>/body.md
```

`<scratch>/draft.md` is the body above the review, as the last confirmation read it. It is the
`Closes` lines and the `mattpocock-skills:pr` template, filled: load the skill before writing it.
The script fails, and writes nothing, when a finding's number opens no line of the confirmation,
and when the draft lacks one of the template's three headings or holds them out of order (#320).

The shared body check runs before the pull request is created (#321), in one command joined
with `&&`, so that a failure stops the create:

```
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/pr-body-check.ps1 <scratch>/body.md && gh pr create --title "<title>" --body-file <scratch>/body.md
```

It fails on a commit cited by hash that is not on `main`, and on a closing keyword outside a bare
`Closes #N` line, wherever either stands, and on the template's headings and markers, as
`README.md` lists. A failure in the draft is fixed in the draft. One in
the review's text goes back to the reviewer by a confirmation turn, to reword its report, since
the body takes the report as it stands. Then the body is built and run through the check again.
The rules are on `docs/agents/issue-tracker.md`.
