# Code review — why the three rules exist

The rules are in `code-review.md`. This page holds what stood beside them there until 2026-10-06:
the measurements that produced each rule, and why they are conventions and not plugin edits. It
moved word for word, so that a reviewer loads the rules without the history. Wording the rules
have lost, that day or later, is under *What the rules said before*.

## Why the threshold cannot be read as "these findings do not matter"

The rubric offers exactly five values — **0, 25, 50, 75, 100** — and the filter admits 80 or more. So
it admits exactly one of them. The effective rule is *score exactly 100*, and the 75 band, which the
rubric itself defines as

> Highly confident. The agent double checked the issue, and verified that it is very likely it is a
> real issue that will be hit in practice … The issue is very important

is discarded by construction. A finding can be verified, important, and dropped. *Since 2026-10-06
(#151) read "discarded" and "dropped" as left out of the workflow's own comment: such a finding is
now posted in a second one.*

**Measured here, on the first pull request this repository ever had.** [PR
#12](https://github.com/trulsjo/grado-factorio-modpack/pull/12): five review agents, nine findings,
**zero posted**. The two highest both scored 75, both were real, and both were fixed in `011f5d4`:

| finding | score | what it was |
|---|---|---|
| the catalogue's variant rule | 75 | said the variants "add one row each, and change nothing else", then described a dropped entry also changing section and Recommendation — and its own worked example broke both halves |
| the Picker open question | 75 | `docs/porting-notes.md` still said only two of nine Picker mods had replacements, in the same branch that documented `kry-picker-complete` disproving it |

A third, the irreconcilable `Kept 29 / 25 / 45` against `26 / 16 / 41` in one file, was excluded as
pre-existing and was also real; it is fixed in the same commit. The sibling measured the same shape
across its PRs #124, #126 and #127: ten findings, zero posted, nine real and subsequently fixed.

## Why the prose is reviewed

**This repository is almost entirely prose, and nothing here checks it.** A pack is an `info.json`
whose dependency list *is* the pack, and `CLAUDE.md` says these packs are expected to carry no Lua at
all. The one gate that exists — the shared check, at
`vendor/grado-factorio-tools/scripts/commit-check.ps1` since 2026-09-21 — reads the *shape* of a
commit message and says so in its own header. Nothing reads whether a sentence agrees with the number beside it, and
**nothing has ever been loaded in Factorio**, so the game cannot contradict a claim either.

*True when this page was adopted on 2026-09-20. Since 2026-10-04 (#115 to #118) all five packs have
a recorded load on Factorio 2.0.77, and `Grado_NonChanging` has been played (#17, 2026-09-30); the
records are in `docs/loads/`. So the game can now contradict a claim about whether a pack starts.
It still cannot contradict a count, a date or a portal reading, which is what the rule below is
for.*

*Since 2026-10-06 (#149) there is a second gate, `scripts/markdown-check.ps1`, which reads the
shape of the Markdown and still not what a sentence says.*

## Measured, not assumed

Every defect this project has produced so far has been prose or data, and none was catchable by
machinery:

| what escaped | where it was |
|---|---|
| "Sixteen mods are dropped with no replacement found" | `CLAUDE.md`. The true count is twenty; sixteen is the number of *replacements*, taken from the wrong table. Two documents written in one session agreed with each other and neither could check the other — it took the portal to settle it (`3867050`) |
| "SpaceX is dead" | reported from `SpaceMod` having no 2.0 release, on a page that had already written the caveat that "missing" meant only *under that exact name*. `SpaceModFeorasFork` is live on 2.1, and the five-pack structure exists because of it |
| seven Picker mods "dropped, no replacement found" | a name-only search. Searching titles returns `kry-picker-complete`, a 2.1 modpack reassembling the family. The same mistake as the row above, made a second time, by the rule written after the first |
| two optional dependencies silently made mandatory | `? reverse-factory` and `? Squeak Through` are optional in the published 1.1 pack and required in the 2.0 one. Nobody decided that; it is now [#11](https://github.com/trulsjo/grado-factorio-modpack/issues/11) |

Three of those four are a claim stated more confidently than its evidence allowed. That is the defect
this repository actually produces, and no gate will ever catch it.

## Why a record does not cite `CLAUDE.md`

`CLAUDE.md` is loaded into every session and is slimmed for that reason. PR #152 (2026-10-05) took
out the project's highest 2.1 floor while four catalogue and load-record sentences cited
`CLAUDE.md` for a 2.1 floor, and only the review found it (`1c90e4e`, which put the floor back and
whose message counts the four). #158 (2026-10-06) pointed those four and three more at the records
that hold the facts.

## Why it is written here rather than fixed at source

The workflow is a plugin, at `~/.claude/plugins/cache/claude-plugins-official/code-review/`. It is
not this repository's to edit, and editing a cache would be undone by the next plugin update. So this
is a convention, and `CLAUDE.md` points at it so a review session loads it before running.

Nothing about the scoring, the rubric or the 80 is changed. The first rule drops one assumption —
that a filtered finding is a discarded one. The second adds one obligation the rubric never mentions,
because a plugin that reviews code cannot know that here there is almost no code to review.
*Since 2026-10-06 (#151) a third says when the workflow is run at all, and changes nothing inside
it either.*

## Why one review before the pull request

*Added 2026-10-06 (#151). The head of this page says it holds what moved here from
`code-review.md` word for word. That is so of four of the five sections above. *Why a record does
not cite `CLAUDE.md`* (#158) and this one were written here. The rule's reason also stands in
`code-review.md`, in one sentence, because #151 asked for it there.*

*The figures in this section are quoted from #151 or its two comments, which took them from the
sessions' logs, and were not counted again for this page. Two are not from #151: "about 30" and
the three notes not actioned, both read from PR #138's body on 2026-10-06.*

**The batch of 2026-10-05 (#130 to #137, PR #138) was reviewed twice.** A two-axis review on the
branch, standards and spec, found 27 things. Then the plugin pass ran five reviewers and four
scorers on the same diff and found five more, mostly wording. Together they cost about 1.4 million
subagent tokens. By #151's account the spec axis was the one that recomputed numbers from the
dumps, and it found the one real error of the batch; PR #138's body records the error and not
which reviewer found it.

**Only a review handed the raw output can check a figure against it.** That is inferred, from
what the plugin hands its reviewers. Read from source: its command file gives the five reviewers
`CLAUDE.md`, the changes, their blame and history, earlier pull requests with their comments, and
the comments in the modified files (`commands/code-review.md`, cache copy `2a8ad9f74633`, read
2026-10-06; the plugin carries no version number). A dump is in none of those. That is why the
mandatory review is the one before the pull request, and why it is defined by what it is handed.

**Narrowing the plugin pass was considered and not taken.** In the sibling, on
[realistic-fusion-refreshed#579](https://github.com/trulsjo/realistic-fusion-refreshed/pull/579),
the plugin pass's one finding at 100 was a figure missing its exponent. #151's first comment
infers that an instruction not to redo the arithmetic would have told it to skip that finding;
no narrowed pass was run.

**What the rule gives up.** On
[realistic-fusion-refreshed#594](https://github.com/trulsjo/realistic-fusion-refreshed/pull/594)
the plugin pass posted three findings at 100 after a clean confirmation; all three were wording
and all three were true. One was in a sentence a fix had added after the first review, which is
where "a fix that adds a sentence adds a claim" comes from. The sibling holds that confirmation
by the same reviewer is a weaker check than a fresh second round, and chose it on cost, from one
branch's evidence.

**Why the scorers stay.** Dropping them was the fifth option on #151. The score decides only which
comment a finding sits in: in PR #121 thirteen findings, twelve below the threshold, all fixed; in
PR #129 ten, nine below, all fixed. But the scorers did separate the one false positive in PR #138,
scored 0, and they are inside a plugin this repository does not edit.

**Why the findings go in the body.** PR #138's body gave a count of the first review's findings
("about 30", where #151 counts 27), the one real error and three notes not actioned (read
2026-10-06). The other findings are in no record on the pull request.

**Why the plugin pass's filtered findings go in a second comment.** No measurement is behind this
half of #151. It was ruled so that the pull request holds the plugin pass's whole report, as the
sibling ruled in realistic-fusion-refreshed#592.

## Why a fix narrows before it adds, and a figure is attributed where it stands

*Added 2026-10-06, from the retrospective of the session that ruled #151.* The plugin pass on PR
#163 posted eight findings, in its first two comments. The third comment there says three of them
were in sentences the pre-PR review's fixes had added, and that a read of the repair before it
was pushed found three more errors, each in a sentence the repair had added. One sentence was
false twice: "every figure in this section is quoted from #151" became "one is not from #151",
and two were not.

## What the rules said before

`code-review.md` is loaded whole by every review, so since 2026-10-06 it states the live rule only
and its old wording is kept here. The passages below are word for word as they stood on `0444fa2`.

**The head of the file**, two sentences now out:

> *Two rules until 2026-10-06, when #151 added the third.*

> Where this file said "the `/code-review` plugin" or "the `/code-review` workflow" before
> 2026-10-06 it meant the plugin pass, and now says so.

**The list at the head**, the end of its third item, now out:

> It also changed where the first rule's filtered findings are posted, dated where it sits.

**The first rule**, a clause that lost its date and three notes now out, in the order they stood:

> — or, since 2026-10-06 (#151), what reaches the pull request.

> *Until 2026-10-06 this said to post only what cleared the threshold, and the rest was told to the
> person who ran the review. #151 changed it, so that the pull request holds the plugin pass's
> whole report.*

> *Since 2026-10-06 (#151) "posts nothing" means the workflow's own comment carries nothing, and
> what it filtered is said in the second comment.*

> *Until 2026-10-06 this was written against re-scoring to get a finding published at all. Since
> then "the report" is the second comment as well as what the person who ran the review is told.*

Before #151 the first rule's own wording was: "Post to the PR only what clears the threshold,
exactly as the workflow says" and "Do not re-score to get a finding published."

**The quantifier line**, a note that is now plain text of the rule:

> *Since 2026-10-06: a fix that adds a figure re-walks every quantifier that covers the place it
> lands. Found in PR #163, twice.*

**The grep line**, whose list of files grew twice:

> Here that is `docs/porting-notes.md`, `docs/catalogue/`, `CLAUDE.md` and this file. *Since
> 2026-10-05 `docs/loads/` too, and the superseded wording of `CLAUDE.md`'s State is in
> `docs/porting-notes.md`, so an old figure may survive there and not in `CLAUDE.md`.* *Since
> 2026-10-06 `docs/decisions.md` and `docs/agents/code-review-why.md` too, which took the settled
> decisions from `CLAUDE.md` and the measurements from this file.*

**The head of the second rule**, before #149 added a check of the Markdown's shape (2026-10-06):

> **This repository is almost entirely prose, and nothing here checks it.** The commit hook reads
> the shape of a message, and a load can contradict only whether a pack starts.

**What the pre-PR reviewer is handed**, the end of its last item, before #173 added the result of
the Markdown check (2026-10-07):

> On any other
> branch, the result of `commit-check.ps1 -Range origin/main..HEAD`, and of the resolve if an
> `info.json` changed.

**The exception for `CLAUDE.md` and `code-review.md`**, as it stood until 2026-10-08. The rule
gained one sentence, decided by Truls on 2026-10-08 (#186): an added sentence owes the trail
nothing. The rest stands as quoted.

> **`CLAUDE.md` and this file are the exception.** Both are loaded whole, so each states the live
> rule only. When a line in one changes, its old wording goes, with its date, to the trail in
> `docs/porting-notes.md` for `CLAUDE.md` and to `code-review-why.md` for this file. A dated
> "since" or "until" note added to either is a finding.

**What the pre-PR reviewer is handed**, its last item, as it stood until 2026-10-09, when #198
made the glossary check fail on an unmarked use:

> - the output of `scripts/glossary-check.ps1 -Range origin/main..HEAD`, which lists each added line
>   that uses a word `GLOSSARY.md` avoids. It reports and does not judge: each use is the reviewer's.

**What the pre-PR reviewer is handed**, the two ranges that had two dots until 2026-10-09, when
#204 gave the Markdown check's and the glossary check's three. The sentence that says why the
commit check keeps two was added then and stood nowhere before.

> `scripts/markdown-check.ps1 -Range origin/main..HEAD`, and of the resolve if an `info.json`
> changed.

> - the output of `scripts/glossary-check.ps1 -Range origin/main..HEAD`, which lists each added line
