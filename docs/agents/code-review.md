# Code review — this repository's values

**The procedure is
[`code-review-procedure.md`](../../vendor/grado-factorio-tools/docs/code-review-procedure.md),
and the shared rules
[`code-review-rules.md`](../../vendor/grado-factorio-tools/docs/code-review-rules.md)**, both
in the tools submodule at its pin. Where the submodule is not initialised they are on GitHub,
[the procedure](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/code-review-procedure.md)
and [the rules](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/code-review-rules.md),
whose `main` may be ahead of the pin. Read both with this page. This page gives this repository's
value for each of the procedure's parameters, its own steps, and the prose checks it keeps beside
the shared ones. Why, the evidence behind each rule, and what each said before it last changed,
is in `code-review-why.md`, which a review does not need to load.

**`/code-review` has meant three skills, and this file names two reviews.** **The pre-PR review**
is one fresh subagent on the branch, before a pull request exists. **The plugin pass** is
`code-review:code-review`, the official plugin: several reviewers, then scorers for the candidate
findings, and it needs a pull request. "The workflow" below is the plugin pass.
`mattpocock-skills:code-review` and the built-in `code-review` are neither. **When an implement
skill says to close out with `/code-review`, here that means the pre-PR review.** No pull request
is needed for it.

## This repository's values

- **When: before the pull request, and before the branch is first pushed** (Truls, 2026-10-06,
  #151). Every branch with a diff gets it, as the procedure's first step says.
- **Second pass: `on request`.** The plugin pass is run when Truls asks for it, and not otherwise.
- **Trigger page:** this page, which `CLAUDE.md` says to load before a review.
- **Brief template:** [`pre-pr-review-brief.md`](pre-pr-review-brief.md): what a session does
  before the first turn, the words each turn is sent with, and how the report comes back. That
  page is procedure and states no rule of review.
- **Reviewer's copy:** none. The reviewer changes no file, in the repository or out of it, but
  its report.
- **Further reading:** `GLOSSARY.md`, which holds the terms and the words most of them avoid, and
  [`claim-grades.md`](../../vendor/grado-factorio-tools/docs/claim-grades.md)
  ([on GitHub](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/claim-grades.md),
  whose `main` may be ahead of the pin), which holds the three grades the rules below use.
- **Check run:** the session's local runs that the brief lists. The session walks the output of
  `absolute-words.ps1 -Range origin/main...HEAD`, in `vendor/grado-factorio-tools/scripts/`, as
  the procedure's *Before the reviewer is started* says, and does not hand it over. The reviewer
  is handed the output of the rest:
  `commit-check.ps1 -ScopeFile commit-scopes.txt -Range origin/main..HEAD`,
  `markdown-check.ps1 -Range origin/main...HEAD -MaxLineLength 100` and
  `glossary-check.ps1 -Range origin/main...HEAD -LeftFile glossary-left.txt`, all three in
  `vendor/grado-factorio-tools/scripts/`, `scripts/mentions.ps1`, the resolve if an
  `info.json` changed, and, at each confirmation that hands the draft of the pull request's body,
  `vendor/grado-factorio-tools/scripts/pr-body-check.ps1` run on that draft. The commit check's
  range has two
  dots and the other two checks' have three: why is in the header of `.github/workflows/check.yml`.
  The glossary check fails on an
  added line that uses a word `GLOSSARY.md` avoids and is not marked deliberate, so a listed use
  is reworded or marked before the review. Whether a marker is honest is the reviewer's: a marker
  silences the script.
- **Raw output:** in the session's `<scratch>`, by command, as the brief's *The raw output behind
  a figure* says. **A figure whose raw output is gone is a finding.** The reviewer is told which
  output is missing and does not take the figure on trust.
- **Test claims:** the reviewer's reading, by the rule on a self-test's stated claims below.
- **Where recorded:** the pull request's body, built by `scripts/pr-body.ps1`.
- **Merge workflow:** `.github/workflows/check.yml`.
- **Threshold: every finding.** Each finding of the pre-PR review is fixed, or listed as left
  unfixed with why.
- **Lanes:** none. One reviewer reads the whole branch.
- **The grade:** none. The pre-PR review's findings carry no score: one reviewer has no scorers,
  and a score it gave itself would read as the plugin pass's. Claims are graded as
  `claim-grades.md` says.

## The plugin pass

**It keeps its scorers and its threshold of 80**, which gates the workflow's own comment and not
the report (decided 2026-08-26, settling
[realistic-fusion-refreshed#128](https://github.com/trulsjo/realistic-fusion-refreshed/issues/128),
adopted here 2026-09-20). The workflow's own comment carries only what clears 80, exactly as the
workflow says. **Every other finding, a verifier's verdict included, goes in a second comment on
the same pull request, with its score**, so that the pull request holds the plugin pass's whole
report. "Posts nothing" means the workflow's own comment carries nothing; what it set aside is said
in the second comment. "The report" is the second comment as well as what the person who ran the
review is told. **A check-run comment is not a prior review** for the plugin's first step. **A pass
run without `--comment` still gets the second comment**, which then also says what it raised. Why:
`code-review-why.md`, *Why the plugin pass reads past the comments this repository posts*.

**A plugin-pass finding the pre-PR review missed gets its class named in the pull request, by the
session that fixes it**, in one of the procedure's three forms.

## The pre-PR review

**The reviewer is handed** what the procedure's fourth step lists, the check runs and raw output
above, `GLOSSARY.md` and `claim-grades.md`, and, at the confirmation, which a review that found
nothing gets as well, the draft of the pull request's body above the review, which is read like
the commit messages: a finding in it is fixed in the draft before the pull request opens (#273).

**The reviewer that raised a finding confirms its fix** <!-- deliberate: confirms -->
by being continued: the same subagent reads each fix commit as new diff, against its own finding
and by every rule of this file. That is a confirmation and not a second round. **A fix that adds
a sentence adds a claim, and the confirmation checks it like any other.** "Confirms" here names
this step and is not a grade of evidence; `GLOSSARY.md` avoids the word for a claim.

**A fix narrows or deletes before it adds.** Where cutting a sentence or making it claim less
repairs a finding, that is the fix, and a fix that adds a sentence in its place is a finding at
confirmation.

**A fix the reviewer proposes is a claim.** Its quantifier is walked before it goes into the
report. Found in PR #205, where a proposed narrowing was false of one page and became the next
finding.

**The fixes are one commit, after the ticket commits**, not folded into the commits they repair,
so the list in the pull request's body can be read against a diff.

**A finding in a commit message is fixed by rewording that commit**, since the review runs before
the first push, while a commit can still be reworded: the commit of fixes cannot repair a
message. The reviewer is given the new hash, reads the message again, and checks that the tree
did not change. The shared `vendor/grado-factorio-tools/scripts/reword-commit.ps1` does the
rewording, for a commit under the tip too,
and prints the old and new hashes. Once the branch is pushed the message stays, and the pull
request's body says what holds. Found in PR #186, where five messages stayed wrong, and PR #187,
where one was reworded twice.

**A fix made after the plugin pass is confirmed by the branch's <!-- deliberate: confirmed -->
pre-PR reviewer**, continued as for any later fix commit: the plugin pass's reviewers do not
outlive the pass. If that reviewer cannot be continued, step 8 of the procedure says who stands
in. What the confirmation finds, and each repair, is recorded on the pull request. Found in
PR #186. What the confirmation finds is repaired and read again, until a read finds nothing new
(#166).

**The merge is Truls's, so a session's last message says when a plugin pass or a confirmation is
still running** (#159).

## Where a session is cleared

**A session that carries a branch is cleared at two points, and it says when it has reached
one** (#159). A clear is
`/clear`, a new session, or a later session taking the work up; the harness compacting by itself
is not one. The session's last message names the point when its conditions hold, and names the
condition that does not when one is missing.

- **After the pull request is open**, when its body holds the review's findings and
  confirmation, the check run's result is a comment on it, the brain page and journal are
  updated and staged, and what waits on Truls is named in the pull request and not in the
  session's last message alone.
- **After the merge**, when local `main` is fast-forwarded to it, the local branch is deleted
  after `git cherry` shows its commits in `main`, the tickets are seen closed, the brain page and
  journal carry the merge and are staged, and what is still open from the pull request is a
  ticket or a line in the brain's *Still open*.

**A session with no branch is cleared once what it decided is a comment on its ticket**, with
the command and the output behind each figure it made or repeated. A grill is one. Its last
message says so.

**From spawning the pre-PR reviewer until the pull request is open is not a clearing point.**
Nor is the time the tickets are being implemented: which output and which command stand behind
a figure is known to the session alone, a later session gets another scratch directory, and no
kept script makes a portal reading, a load's log or a timing again. **A clear before a
plugin pass costs a fresh reviewer**, handed what step 8 of the procedure says, and it may be
handed a figure whose raw output is gone.

## The prose checks this repository keeps

**This repository is almost entirely prose, and little here checks what it says.** The commit
hooks read the shape of a message and of the Markdown - emphasis, tables, links and line length
(`vendor/grado-factorio-tools/scripts/markdown-check.ps1`) - and one thing the catalogue says,
whether an **Overlaps** row is stale (`scripts/overlap-rows-check.ps1`). A load can
contradict only whether
a pack starts. A count, a date or a portal reading is checked by the reviewer or by nobody.

The rule to review the prose was decided by Truls in the sibling on 2026-09-03 and widened on
2026-09-14, settling
[realistic-fusion-refreshed#331](https://github.com/trulsjo/realistic-fusion-refreshed/issues/331),
and adopted here on 2026-09-20. The shared rules page holds the arithmetic and the quantifier
checks; here the quantifier check was missed twice in PR #163. These are this repository's own, and
bind the reviewer: an author who greps before opening the pull request saves a round, but the
obligation lives in the review.

**A case a ruling's own terms leave open is a finding for Truls**, one per case, even where the
evidence leans one way. It is listed as unfixed and waiting on him. Found in PR #311, where the
area counted was left open and two ores rested on it.

**Where prose restates a list the code holds, read the two side by side.** Found in PR #186,
where the README's list of what a hook stops had lost two entries of the script's.

**A self-test's stated claims are read against its cases.** For each clause of `.PARAMETER
SelfTest`, find the case that proves it, for every kind of input the clause names; a clause no
case proves is a finding. Found in PR #398, where the claims covered hooks and workflows and the
cases covered scripts alone.

**A glossary entry is read against the repository's uses of its word.** Grep the word whole. A
thing of this repository's own that the word also names, and that the entry neither names nor
avoids, is a finding; the word in its plain sense, or as the game uses it, is not. Found in PR
#390, where *Pin* missed the resolver's pin file.

**A check fails when the rules it reads, or the set it must cover, come back empty, and its
self-test covers that run.** A run that only has nothing to check this time, such as a commit
that stages no Markdown, may pass, and says it read nothing. A lister that does not fail is
outside this. Found in PR #360, where `overlap-rows-check.ps1` passed with no catalogue file, and
in the survey on #361, which found three more.

**A remedy a check prints is read for what following it does.** One that acts on a different copy
from the one the check read, such as the working tree where the check read the staged copy, with
a side effect it does not name, is a finding. Found in PR #394, where staging a rewrapped script
again, as the refusal said to, would stage its unstaged edits with it.

**A citation of a section names its heading, and the reviewer opens that heading and reads that
it holds the claim.** Found in PR #303, where "the section before it" pointed to the wrong section.

**A reason is written out in one file, and the rest point there.** The same reason written out
in a second file, outside a trail's quotation, is a finding. Found in PR #205, where one reason
stood in four files and the commit message's list of them was wrong twice.

**Attribute a figure where it stands.** A note that vouches for the source of every figure in a
section is a quantifier each later figure can make false, and is a finding. Found in PR #163,
where one such note was false twice.

**When a change supersedes a figure, grep the repository for the old one**, and read every hit in a
file that records a measurement. Here that is `docs/porting-notes.md`, `docs/catalogue/`,
`docs/loads/`, `docs/decisions.md`, `docs/agents/code-review-why.md`, `CLAUDE.md` and this file.
The superseded wording of `CLAUDE.md` is in `docs/porting-notes.md`, so an old figure may survive
there and not in `CLAUDE.md`. A correction landing in three places and missing the fourth is
worse than none, because the survivor then reads as deliberate.

**When a change alters a rule, read every sentence of that rule's section against the new
wording.** The grep above finds a superseded figure; a sentence that still reads the old way is
found only by reading. Found in PR #163 (2026-10-06).

**An old figure inside a block that says what replaced it is not a defect; an unmarked one is.** The
house style keeps the old reading with a note — a date, an issue number, or both — rather than
erasing it, which is the same instinct as `CLAUDE.md`'s "record what was dropped and why".

**`CLAUDE.md` and this file are the exception.** Both are loaded whole, so each states the live
rule only. When a line in one changes, its old wording goes, with its date, to the trail in
`docs/porting-notes.md` for `CLAUDE.md` and to `code-review-why.md` for this file. A sentence
added where none stood owes the trail nothing. A dated "since" or "until" note added to either is
a finding.

**A record cites a record, not `CLAUDE.md`.** A figure or a settled decision is cited from the
porting notes, a load record, a catalogue entry or `docs/decisions.md`; `CLAUDE.md` is steering and
gets slimmed, so it is cited for a rule only (2026-10-06, #158). It still repeats figures, which is
why the grep above reads it.

**A dated note goes after the older text it speaks to.** Last in its paragraph, and after the
older dated paragraphs of its entry. A note set before older text, or in the middle of a
paragraph, reads as if that text were written knowing it. Found in PR #121, PR #129 and PR #138.
Notes placed before 2026-10-14 were not moved: one out of place is fixed when a branch changes its
paragraph, and is a finding if it is not (#181).

**A conclusion read from source says so wherever it is repeated.** A section may open with "read
from the source and not run". Every later sentence that restates the conclusion, in that section
or in a note elsewhere, carries the same qualifier, and a cause is given as what the source shows.
Found in PR #129 and PR #138.

**A claim has a grade, and two of the three are always marked.** The grades, *Measured*, *Read
from source* and *Inferred*, and the rules a reviewer checks them by are on `claim-grades.md`.
Here they apply to all new prose (2026-10-06, #157); the reason is in that entry of
`docs/decisions.md`. Marking *Read from source*
and *Inferred* wherever a conclusion is repeated is the rule above made general. Prose written
before 2026-10-06 was not rewritten to these terms, so an old "confirmed" or "checked" is not a
defect on its own.

**A portal reading is a measurement.** Every version, date, download count and `factorio_version` in
prose here came from an API call on a particular day and goes stale silently. Treat an undated one
as a finding.
