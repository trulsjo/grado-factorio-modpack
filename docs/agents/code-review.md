# Code review — three rules this repository adds

All three are conventions kept around the `code-review:code-review` plugin rather than changes to
it; why, and the evidence behind each, is in `code-review-why.md`, which a review does not need to
load. *Two rules until 2026-10-06, when #151 added the third.*

**`/code-review` has meant three skills, and this file names two reviews.** **The pre-PR review**
is one fresh subagent on the branch, before a pull request exists; the third rule defines it.
**The plugin pass** is `code-review:code-review`, the official plugin: several reviewers, then a
scorer for each candidate finding, and it needs a pull request. "The workflow" below is the plugin
pass. `mattpocock-skills:code-review` and the built-in `code-review` are neither. Where this file
said "the `/code-review` plugin" or "the `/code-review` workflow" before 2026-10-06 it meant the
plugin pass, and now says so.

The first two were decided by Truls in the sibling
[realistic-fusion-refreshed](https://github.com/trulsjo/realistic-fusion-refreshed), and adopted here
on 2026-09-20 because this repository hit the first of them on its first pull request. The third
was decided by Truls here on 2026-10-06 (#151), a day after the sibling decided its own
([realistic-fusion-refreshed#592](https://github.com/trulsjo/realistic-fusion-refreshed/issues/592)).

1. **[The threshold gates the comment, not the report](#the-threshold-gates-the-comment-not-the-report)**
   — decided 2026-08-26, settling
   [realistic-fusion-refreshed#128](https://github.com/trulsjo/realistic-fusion-refreshed/issues/128).
2. **[Review the prose, not only the code](#review-the-prose-not-only-the-code)** — decided
   2026-09-03, widened 2026-09-14 settling
   [realistic-fusion-refreshed#331](https://github.com/trulsjo/realistic-fusion-refreshed/issues/331).
3. **[One review before the pull request](#one-review-before-the-pull-request)** — decided
   2026-10-06, settling #151. It also changed where the first rule's filtered findings are posted,
   dated where it sits.

## The threshold gates the comment, not the report

The plugin pass scores each candidate finding and leaves anything below 80 out of its comment.
**That filter governs what the workflow's own comment carries. It does not govern what gets told to
the person who ran the review** — or, since 2026-10-06 (#151), what reaches the pull request.

### The rule

**Report every finding that survived verification, whatever it scored.** The workflow's own comment
carries only what clears the threshold, exactly as the workflow says. **Every other surviving
finding goes in a second comment on the same pull request, with its score.** *Until 2026-10-06 this
said to post only what cleared the threshold, and the rest was told to the person who ran the
review. #151 changed it, so that the pull request holds the plugin pass's whole report.*

**A review that posts nothing must still say what it filtered.** Name each finding, its score, and
whether it was independently verified. A silent pass and a filtered pass must never look the same.

**Do not re-score to move a finding into the first comment.** The threshold is deliberately
conservative and stays where it is. If a filtered finding matters, say so in the report and let a
human decide; inflating a score to route around the filter destroys the only signal the score
carries. *Until 2026-10-06 this was written against re-scoring to get a finding published at all.*

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

**A record cites a record, not `CLAUDE.md`.** A figure or a settled decision is cited from the
porting notes, a load record, a catalogue entry or `docs/decisions.md`; `CLAUDE.md` is steering and
gets slimmed, so it is cited for a rule only (2026-10-06, #158). It still repeats figures, which is
why the grep above reads it.

**A dated note goes after the older text it speaks to.** Last in its paragraph, and after the
older dated paragraphs of its entry. A note set before older text, or in the middle of a
paragraph, reads as if that text were written knowing it. Found in PR #121, PR #129 and PR #138.

**A conclusion read from source says so wherever it is repeated.** A section may open with "read
from the source and not run". Every later sentence that restates the conclusion, in that section
or in a note elsewhere, carries the same qualifier, and a cause is given as what the source shows.
Found in PR #129 and PR #138.

**A claim has a grade, and two of the three are always marked.** The grades are in `GLOSSARY.md`:
*Measured*, *Read from source* and *Inferred* (2026-10-06, #157). *Measured* may go unmarked inside
a section that says how and when it was measured - a catalogue header's portal-reading date, a load
record's build line. *Read from source* and *Inferred* are marked every time, and again wherever
the conclusion is repeated, which is the rule above made general. Each grade has something it
carries - its day and build, the release read, the claims it rests on - and a claim without it is
not that grade. A conclusion takes the weakest grade among its parts. A claim that names nothing it
rests on has no grade: it is marked "not measured" or it is a finding. Prose written before
2026-10-06 was not rewritten to these terms, so an old "confirmed" or "checked" is not a defect on
its own.

**A portal reading is a measurement.** Every version, date, download count and `factorio_version` in
prose here came from an API call on a particular day and goes stale silently. Treat an undated one as
a finding.

**This binds the reviewer.** An author who greps before opening the pull request saves a round, but
the obligation lives in the review.

## One review before the pull request

Decided by Truls, 2026-10-06, settling #151. The evidence is in `code-review-why.md`.

### The rule

**Every branch with a diff gets the pre-PR review, before its pull request exists.** No branch is
exempt for being small. One fresh subagent runs it, and it is defined by what the subagent is
handed and not by a skill's name:

- the diff against `main`;
- this file;
- `GLOSSARY.md`, which holds the three grades the rules above use;
- on a branch that records measurements, the raw output behind them - a `--dump-data` dump, the
  portal API's responses, a load's log - and the scripts that produced the figures. On any other
  branch, the result of `commit-check.ps1 -Range origin/main..HEAD`, and of the resolve if an
  `info.json` changed.

**A figure whose raw output is gone is a finding.** The reviewer is told which output is missing
and does not take the figure on trust.

**When an implement skill says to close out with `/code-review`, here that means the pre-PR
review.** No pull request is needed for it.

**The reviewer that raised a finding confirms its fix.** Continue the same subagent and have it
read each fix against its own finding. That is a confirmation and not a second round. **A fix that
adds a sentence adds a claim, and the confirmation checks it like any other.**

**The fixes are one commit of their own, after the ticket commits.** They are not folded into the
commits they repair, so the list in the pull request's body can be read against a diff.

**Its findings go in the pull request's body, every one**, each with whether it was fixed. They
carry no score: one reviewer has no scorers, and a score it gave itself would read as the plugin
pass's. A finding may be left unfixed if the body says which and why. **A finding that needs a
decision of Truls's is not fixed by the session**: it is listed as unfixed and waiting on him.

**The plugin pass is run when it is asked for, and not otherwise.** It keeps its scorers and its
threshold, and the first rule above says where its findings go.

**A plugin-pass finding the pre-PR review missed gets its class named**, in the pull request, by
the session that fixes it. A class a script could detect becomes a ticket proposing the check. A
class that takes judgement becomes a line in this file. "One-off, no rule" is an answer, and it is
written down like the others.

When the pre-PR review runs, and what may happen while a review is running, is #159's to decide
and is not settled here.
