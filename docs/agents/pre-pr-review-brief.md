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

Copy the raw output behind each figure on the branch into `<scratch>` as well, and save beside it
the command that produced it, as it was run and with any prompt it was given (#234). A figure
whose raw output is gone is named to the reviewer as missing.

**A probe in a clone outside the repository's directory can start under another profile**
(#280). Where the `claude` command chooses its Claude Code profile by the directory it is started
in, an interactive `claude` started in such a clone can run with another profile's settings,
sign-in and folder trust, and write its transcript under that profile. On 2026-10-14 it happened
to #231's measurement, whose write-up did not say so
([#231's addendum](https://github.com/trulsjo/grado-factorio-modpack/issues/231#issuecomment-6185969252)),
and twice to #160's second process before it was started under the intended profile
([#160](https://github.com/trulsjo/grado-factorio-modpack/issues/160#issuecomment-6178947824)).
Start the probe under the intended profile explicitly: set `CLAUDE_CONFIG_DIR` and start Claude
Code's executable, not the `claude` command. Save the path of the `projects/` directory its
transcript was written to beside its command and output, since that path shows which profile ran
it.

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
- `GLOSSARY.md`, which holds the three grades of evidence and the other terms.
- <the raw output, the saved commands and the scripts behind the figures, one path each with
  the figure it is behind; or nothing>
- <scratch>/commit-check.txt and <scratch>/markdown-check.txt. <If an `info.json` changed:
  <scratch>/resolve.txt, the resolve of all five packs, with the time it was run; a failure in it
  is a finding; or nothing.>
- <scratch>/glossary-check.txt: each added line that uses a word `GLOSSARY.md` avoids and is
  not marked deliberate. The script fails on one, so a use listed there is a finding. Say of
  each `<!-- deliberate: word -->` the diff adds whether the use is meant.
- <raw output that is missing, and the figure it was behind; or nothing>
- the tickets: `gh issue view <N> --json title,body,comments` for each.

Write the report to <scratch>/review.md with the file tool. Once it is written, end your turn
with at most five lines as its last text: how many findings, which one matters most, and the
path. Send no message: the five lines reach the session as they are. The report has two
sections and no scores.

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
draft, is sent the same way, and so is a fix made after the plugin pass. The first confirmation
also hands the draft of the pull request's body, `<scratch>/draft.md`, written before it (#273).

```
<The fixes are in commit <sha>: `git show <sha>`; or nothing.> <A commit whose message was
reworded, by its old and new hash: `git log -1 --format=%B <new>`, and `git diff <old> <new>` is
empty; or nothing.> <Edits outside the diff, such as a ticket's body, and how to read each; or
nothing.> <The checks' results after this commit: <scratch>/commit-check.txt,
<scratch>/markdown-check.txt and <scratch>/glossary-check.txt; or nothing.> <The draft of the
pull request's body above the review: <scratch>/draft.md, read like the commit messages; or
nothing.>

Not fixed, and why: <each finding by its number; or none>. <For a fix of a plugin-pass finding,
which is not one of yours: the finding as the pull request states it; or nothing.>

Read each fix against your own finding. The fix commit's message is read like the rest. Still
read-only, and still from the repository root.

Add a section to <scratch>/review.md with the file tool. Once it is written, end your turn with
at most five lines and the path as its last text, and send no message.

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

`<scratch>/draft.md` is the body above the review, as the last confirmation read it. The script
fails, and writes nothing, when a finding's number opens no line of the confirmation.
