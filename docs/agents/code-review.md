# Code review — two rules this repository adds

Both are conventions layered on the `/code-review` plugin rather than changes to it; see *Why it is
written here rather than fixed at source* at the foot.

Both were decided by Truls in the sibling
[realistic-fusion-refreshed](https://github.com/trulsjo/realistic-fusion-refreshed), and adopted here
on 2026-09-20 because this repository hit the first of them on its first pull request.

1. **[The threshold gates the comment, not the report](#the-threshold-gates-the-comment-not-the-report)**
   — decided 2026-08-26, settling
   [realistic-fusion-refreshed#128](https://github.com/trulsjo/realistic-fusion-refreshed/issues/128).
2. **[Review the prose, not only the code](#review-the-prose-not-only-the-code)** — decided
   2026-09-03, widened 2026-09-14 settling
   [realistic-fusion-refreshed#331](https://github.com/trulsjo/realistic-fusion-refreshed/issues/331).

## The threshold gates the comment, not the report

The `/code-review` workflow scores each candidate finding and drops anything below 80. **That filter
governs what gets posted to the pull request. It does not govern what gets told to the person who
ran the review.**

### The rule

**Report every finding that survived verification, whatever it scored.** Post to the PR only what
clears the threshold, exactly as the workflow says.

**A review that posts nothing must still say what it filtered.** Name each finding, its score, and
whether it was independently verified. A silent pass and a filtered pass must never look the same.

**Do not re-score to get a finding published.** The threshold is deliberately conservative and stays
where it is. If a filtered finding matters, say so in the report and let a human decide; inflating a
score to route around the filter destroys the only signal the score carries.

### Why the threshold cannot be read as "these findings do not matter"

The rubric offers exactly five values — **0, 25, 50, 75, 100** — and the filter admits 80 or more. So
it admits exactly one of them. The effective rule is *score exactly 100*, and the 75 band, which the
rubric itself defines as

> Highly confident. The agent double checked the issue, and verified that it is very likely it is a
> real issue that will be hit in practice … The issue is very important

is discarded by construction. A finding can be verified, important, and dropped.

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

## Review the prose, not only the code

**This repository is almost entirely prose, and nothing here checks it.** A pack is an `info.json`
whose dependency list *is* the pack, and `CLAUDE.md` says these packs are expected to carry no Lua at
all. The one gate that exists, `scripts/commit-check.ps1`, checks the *shape* of a commit message and
says so in its own header. Nothing reads whether a sentence agrees with the number beside it, and
**nothing has ever been loaded in Factorio**, so the game cannot contradict a claim either.

### The rule

**Check every number in prose against a number in the diff, and do the arithmetic.** Not "does this
look plausible" — add it up. A kept-plus-replaced-plus-dropped tally, a member count, a download
comparison: each is a claim with an arithmetic answer.

**Treat a quantifier as an instruction to enumerate.** "Every mod is accounted for", "the only mod
duplicated across the five packs", "no replacement was found" — a claim about *all* or *none* of a
set is checked by walking the set, never by agreeing with its tone.

**When a change supersedes a figure, grep the repository for the old one**, and read every hit in a
file that records a measurement. Here that is `docs/porting-notes.md`, `docs/catalogue/`, `CLAUDE.md`
and this file. A correction landing in three places and missing the fourth is worse than none,
because the survivor then reads as deliberate.

**An old figure inside a block that says what replaced it is not a defect; an unmarked one is.** The
house style keeps the old reading with a note — a date, an issue number, or both — rather than
erasing it, which is the same instinct as `CLAUDE.md`'s "record what was dropped and why".

**A portal reading is a measurement.** Every version, date, download count and `factorio_version` in
prose here came from an API call on a particular day and goes stale silently. Treat an undated one as
a finding.

**This binds the reviewer.** An author who greps before opening the pull request saves a round, but
the obligation lives in the review.

### Measured, not assumed

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

## Why it is written here rather than fixed at source

The workflow is a plugin, at `~/.claude/plugins/cache/claude-plugins-official/code-review/`. It is
not this repository's to edit, and editing a cache would be undone by the next plugin update. So this
is a convention, and `CLAUDE.md` points at it so a review session loads it before running.

Nothing about the scoring, the rubric or the 80 is changed. The first rule drops one assumption —
that a filtered finding is a discarded one. The second adds one obligation the rubric never mentions,
because a plugin that reviews code cannot know that here there is almost no code to review.
