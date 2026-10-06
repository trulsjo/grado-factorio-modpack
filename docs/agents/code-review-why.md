# Code review — why the two rules exist

The rules are in `code-review.md`. This page holds what stood beside them there until 2026-10-06:
the measurements that produced each rule, and why they are conventions and not plugin edits. It
moved word for word, so that a reviewer loads the rules without the history.

## Why the threshold cannot be read as "these findings do not matter"

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

## Why it is written here rather than fixed at source

The workflow is a plugin, at `~/.claude/plugins/cache/claude-plugins-official/code-review/`. It is
not this repository's to edit, and editing a cache would be undone by the next plugin update. So this
is a convention, and `CLAUDE.md` points at it so a review session loads it before running.

Nothing about the scoring, the rubric or the 80 is changed. The first rule drops one assumption —
that a filtered finding is a discarded one. The second adds one obligation the rubric never mentions,
because a plugin that reviews code cannot know that here there is almost no code to review.
