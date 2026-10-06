# Code review — two rules this repository adds

Both are conventions layered on the `/code-review` plugin rather than changes to it; why, and the
evidence behind each, is in `code-review-why.md`, which a review does not need to load.

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

## Review the prose, not only the code

**This repository is almost entirely prose, and nothing here checks it.** The commit hook reads
the shape of a message, and a load can contradict only whether a pack starts. A count, a date or a
portal reading is checked by the reviewer or by nobody.

### The rule

**Check every number in prose against a number in the diff, and do the arithmetic.** Not "does this
look plausible" — add it up. A kept-plus-replaced-plus-dropped tally, a member count, a download
comparison: each is a claim with an arithmetic answer.

**Treat a quantifier as an instruction to enumerate.** "Every mod is accounted for", "the only mod
duplicated across the five packs", "no replacement was found" — a claim about *all* or *none* of a
set is checked by walking the set, never by agreeing with its tone.

**When a change supersedes a figure, grep the repository for the old one**, and read every hit in a
file that records a measurement. Here that is `docs/porting-notes.md`, `docs/catalogue/`, `CLAUDE.md`
and this file. *Since 2026-10-05 `docs/loads/` too, and the superseded wording of `CLAUDE.md`'s
State is in `docs/porting-notes.md`, so an old figure may survive there and not in `CLAUDE.md`.* *Since 2026-10-06 `docs/decisions.md` and `docs/agents/code-review-why.md` too, which took the settled decisions from `CLAUDE.md` and the measurements from this file.* A correction landing in three places and missing the fourth is worse than none,
because the survivor then reads as deliberate.

**An old figure inside a block that says what replaced it is not a defect; an unmarked one is.** The
house style keeps the old reading with a note — a date, an issue number, or both — rather than
erasing it, which is the same instinct as `CLAUDE.md`'s "record what was dropped and why".

**A dated note goes after the older text it speaks to.** Last in its paragraph, and after the
older dated paragraphs of its entry. A note set before older text, or in the middle of a
paragraph, reads as if that text were written knowing it. Found in PR #121, PR #129 and PR #138.

**A conclusion read from source says so wherever it is repeated.** A section may open with "read
from the source and not run". Every later sentence that restates the conclusion, in that section
or in a note elsewhere, carries the same qualifier, and a cause is given as what the source shows.
Found in PR #129 and PR #138.

**A portal reading is a measurement.** Every version, date, download count and `factorio_version` in
prose here came from an API call on a particular day and goes stale silently. Treat an undated one as
a finding.

**This binds the reviewer.** An author who greps before opening the pull request saves a round, but
the obligation lives in the review.
