# Settled decisions

The big decisions are Truls's (`CLAUDE.md`, *The rule that matters most here*). These are the ones
made so far, recorded so nobody reopens one by accident. They are in the order they stood in
`CLAUDE.md` until 2026-10-06, when the list moved here word for word because that file is loaded
into every session. Where an entry says "under *Conventions*", it means `CLAUDE.md`'s. The
entries after the one on the declared line (#16) were never in `CLAUDE.md`: they were added here,
each when it was decided.

- **Five packs, with ABC as the shared core** (2026-09-20). Replaced an earlier three-pack plan.
- **Space Age is a target**, which is what produced the ABCX/ABCS split.
- **SpaceX stays in, via the fork.** `SpaceMod` itself is 1.1-only; `SpaceModFeorasFork` is current
  (1.3.4, Factorio 2.1, 2026-07-10).
- **One repo, one directory per pack.**
- **The 2.0 packs reuse the three existing portal entries** (2026-09-21). The 1.1 releases stay
  in place on them; one entry serves each player the newest release matching their game version.
- **Version `0.1.0` on all five** (2026-09-21), each pack versioning independently from there. It
  sits above every published number and marks the 1.1 -> 2.0 break without claiming the packs work
  in game. How a version is then chosen is under *Conventions*.
- **The name is `Grado_ABCS`, with the underscore** (2026-09-21). Permanent — a name is the portal
  URL and what `info.json` resolves.
- **Titles are short identity, colon, descriptor** (2026-09-21). The published entries used the
  raw name as the title; this replaces it. The form itself is under *Conventions*, which is where
  it is stated once.
- **Each pack has a promise, and it is the membership test** (2026-09-22). `Grado_NonChanging`
  adds no content; `Grado_ChangingBase` may, but not content that competes with an overhaul for
  the same ground. Stated once in `GLOSSARY.md` under *Promise*; the old wording, "does not change
  save state or the factory", was false and is retired.
- **`Grado_NonChanging`'s membership is settled** (2026-09-22, #7). 29 members to 26:
  `AfraidOfTheDark`, `blueprint-sandboxes` and `blueprint_flip_and_turn` out, `Bottleneck` to
  `BottleneckLite` and `MaxRateCalculator` to `RateCalculator`. `kry-picker-complete` declined.
  Reasons per mod in `docs/catalogue/Grado_NonChanging.md`.
- **`Grado_ChangingBase`'s membership is settled** (2026-09-22, #8). 25 members to 20, and it
  settled #11 and #23 in the same pass. The four LTN mods out and `cybersyn2` in — **Cybersyn 2,
  which its author declares alpha**; `UltimateBeltsSpaceAge` and `StoneWaterWell-ActuallyUpdated`
  out as the first two failures of this pack's promise; `safefill` to `Waterfill_v17` and
  `ModuleInserterSimplified` to `ModuleInserterEx`; `reverse-factory` and `squeak-through-2`
  mandatory by decision; `bobinserters` kept here and its duplicate line removed from
  `Grado_ABC/info.json`. `kry-picker-complete` declined here too. Three rules decided most of it:
  **swaps in, additions out** (as #7); **the promise is the membership test**; and
  **unreachability breaks a tie but does not decide alone**. Reasons per mod in
  `docs/catalogue/Grado_ChangingBase.md`.
- **`Grado_ABC`'s membership is settled** (2026-09-23, #9). 44 mods to 41. The pack gained a promise
  (`GLOSSARY.md`): **Truls's own Angel's, Bob's and MadClown setup**, where a member may extend the
  overhaul or add content of its own but must not conflict with it. The whole Deadlock stacking
  family is out, as is `signalstrings`. `RealisticFusionPower` is replaced by
  `RealisticFusionPowerPort`, **a comparison slot for `realistic-fusion-refreshed`**, which may take
  the slot later. `angels-smelting-extended` is kept for now; #50 (2026-09-30) found
  `angelsextended-remelting` a complement, not an alternative, and recommends not adding it. #8's
  three rules carried up unchanged, with **a partial replacement counted as an addition**, which is
  why `ScienceCostTweakerM` and the others went to #49. A 2.x `angelsindustries` port reopens the
  question rather than adding it back. All ten of this pack's drops are closed. The hidden mandatory
  members stay unnamed. Reasons per mod in `docs/catalogue/Grado_ABC.md`.
- **The nukes mods are out of `Grado_ABC`** (2026-10-04, #81). 41 mods to 39:
  `True-Nukes_Continued` and `True-Nukes-Graphics_Continued`, and the hidden member
  `Warheads_Continued` leaves with them. They fail in the data stage beside the pack's Bob's and
  Clowns members on 2.0.77. The first *load drop* (`GLOSSARY.md`), so the twenty port drops stay
  twenty. No replacement and no pack Lua. A release that passes
  a data stage beside Bob's and Clowns reopens the question and does not add them back; #113
  revisits it when 2.1 is stable.
- **`Grado_ABCX`'s and `Grado_ABCS`'s membership is settled** (2026-09-23, #10). Neither list
  changed: one member each. Both gained a promise (`GLOSSARY.md`). **`Grado_ABCS` is ABC *beside*
  Space Age, not merged with it**, so no bridge mod; #31 stays open to revisit that. ABCX keeps its
  own `! space-age` beside the fork's. `quality` and `elevated-rails` go unnamed, because
  `space-age` requires both (read from the installed game, 2.0.77). Reasons per mod in
  `docs/catalogue/Grado_ABCX.md` and `docs/catalogue/Grado_ABCS.md`.
- **A pack version does not move before its first release** (2026-09-22). All five stay at
  `0.1.0` through any number of dependency edits; the major/minor rule under *Conventions* starts
  applying at the first published release. `0.x` to `1.0.0` is the one major that signals
  maturity rather than a broken save - see ADR 0002.
- **The declared line is `2.0` for the first release** (2026-09-24, #16), with a 2.1 release on
  the same entries once factorio.com's stable release is 2.1.x. Minimums: `base >= 2.0.67` for
  `Grado_NonChanging`, `>= 2.0.74` for the other four. **Applied 2026-09-24 (#58)**: the pinned
  resolver re-measured all five on line `2.0`, build `2.0.77`, and read the same floors - `2.0.67`
  from `helmod` `2.2.14`, `2.0.74` from `miniloader-redux` `1.2.0` - and each `info.json` now
  declares its floor. Versions stay `0.1.0`.
- **A claim has one of three grades of evidence** (2026-10-06, #157): *Measured*, *Read from
  source* and *Inferred*, defined in `GLOSSARY.md`. Three and not two, because six of the eight
  review-fix commits of 2026-10-04 and 2026-10-05 repaired a sentence that gave an inference or a
  reading of source as an observation (`f2e51f4`, `b9d2798`, `5ea5b14`, `db432d0`, `bb54d42` and
  `5f00aee`, by their messages; `4bc148a` and `1c90e4e` did not), and folding the two together
  loses which it was. The middle grade is not called *Read*, because a portal reading is a
  measurement. *Assumed* is not a grade, and neither is what a mod's author says. *Measured* is
  the strongest grade and *Inferred* the weakest. *Measured* may go unmarked inside a section that
  says how and when; the other two are always marked. The marking rule is in
  `docs/agents/code-review.md`. Existing prose was not rewritten.
- **One mandatory review on every branch with a diff, before the pull request** (2026-10-06,
  #151): the pre-PR review, one fresh subagent handed the diff, the review rules, the glossary
  and the raw output behind any measurement. Its findings go in the pull request's body and its
  fixes are one commit of their own. The plugin pass, `code-review:code-review`, runs only when
  Truls asks, and keeps its scorers; its findings under the threshold now go in a second comment
  on the pull request, where before they were only told to whoever ran the review. Chosen over
  running both: the two together cost about 1.4 million subagent tokens on the batch of
  2026-10-05, for 27 findings and then five (figures from #151, which gives no split, so what
  leaving one out saves is not measured). Chosen over the plugin pass alone because only a
  review handed the raw output can check a figure against it, which is inferred from what the
  plugin's command file hands its reviewers. The rule is in `docs/agents/code-review.md` and its
  evidence in `docs/agents/code-review-why.md`. Whether a pull request may be merged while a
  review runs is #159's. *Decided 2026-10-11 (#159): not while a plugin pass or a confirmation
  of it runs. The rule is in `docs/agents/code-review.md`.* *Decided 2026-10-13 (#243): the
  time the tickets are being implemented stays outside the points where a session is cleared,
  and a session with no branch has a point of its own. The rule is in the same file and why in
  `docs/agents/code-review-why.md`.*
- **A catalogue's header gives the day of its portal reading and does not list later notes**
  (2026-10-07, #172). Every portal reading in the file is of that day "except where a later date
  is given inline", which is the wording `Grado_NonChanging.md` already had. A later reading
  carries its own day, ticket and source where it stands, and that is the only place they are
  stated. A note from a load, a data dump or a mod's source is not a portal reading, so it names
  its own day and source whatever the header says. The sentences in `Grado_ABC.md` and
  `Grado_ChangingBase.md` on the searches re-run over the union of both listings stay: they are
  a claim about the file, not a list of notes. Chosen over writing the list rule down for the
  reviewer, and over a fixed form of note a script could match. The list was a second copy of
  what each note says, and the copy was what went stale: the reviews of PR #121 and PR #129 both
  found a header missing what its batch had added. #149's matcher found 21 tickets cited in a
  dated form and not named in their file's header, 15 of them in `Grado_NonChanging.md`, whose
  header never had a list (2026-10-06, `main` at `28ed67f`). The first option keeps the
  reviewer's cost for every batch, and the second changes how the catalogues are written to
  keep a duplicate in step. The list may not be a pure duplicate: a
  count of phrases on 2026-10-07 (`main` at `d6157a9`) found "staged source" in the headers of
  `Grado_ABCX.md` and `Grado_ChangingBase.md` and nowhere below them, so each clause is read
  against its note before the list is cut. The work is #175.
- **oh-my-claudecode and ponytail are disabled in `.claude/settings.json`** (2026-10-12, #160).
  By #160's count from the session logs, read 2026-10-06, oh-my-claudecode's hooks added 59
  reminders in the session of 2026-10-05, four
  texts about testing, verifying and parallel execution in a <!-- deliberate: verifying -->
  repository with no tests. #160 gives three more reasons for it, not measured here: its read
  budget refuses a second full read of a large file; its state files are what landed in the
  mod cache (#150), where #150 names no plugin; and it adds about forty skills to every session.
  ponytail's session-start text steers towards the
  shortest explanation, against a repository that is almost all prose and whose reviews ask for
  every number pinned and every claim qualified. Whether either changed what an agent did was
  not measured. On 2026-10-12 `git grep -n -i -E 'ponytail|oh-my-claudecode|omc'` over `main`
  at `c74f969`, the tools submodule not read, matched four lines, all in `.gitignore`: the
  `.omc/*` and `!.omc/skills/` lines and two lines of the comment above them. They stay as a
  guard, as does #150's hook.
  Other plugins were out of scope. The oh-my-claudecode
  section of a global `CLAUDE.md` still loads, so `CLAUDE.md` says which of it does not apply.
  *2026-10-12 (#249):* "still loads" held in three cases of four. Measured that day from the
  list of instruction files in 22 transcripts. Under `~/.claude`,
  `C:\Users\TrulsJ\.claude\CLAUDE.md` was given as a user file, in checkouts under `C:\src`
  (7 transcripts, 2026-09-21 to 2026-09-26) and in herdr worktrees under `C:\Users\TrulsJ`
  (3, 2026-10-12). Under `~/.claude-personal`, which has no `CLAUDE.md`, it was given as a
  project file in a worktree (3) and not under `C:\src` (9). Claude Code's memory page, as it
  stood on 2026-10-12, says that a `.claude/CLAUDE.md` in a directory above the working
  directory is loaded at launch. Truls ruled that the instruction stays, and `CLAUDE.md` now
  gives it as a condition.
- **The table of own materials of 2026-10-13 is the record, and its difference from #132's is
  not closed as looked for and not found** (2026-10-13, #248). `docs/catalogue/Grado_ABCS.md`,
  *From its own materials*, has three tables of what each surface makes: #132's of
  2026-10-05, `dump-walk.ps1`'s of 2026-10-12, and that script's of 2026-10-13 at the tools
  commit `ad3bcce`, with the count
  Truls ruled on grado-factorio-tools#126 (#251). The third is the record. The first two stay as
  history, each with its date, and the first is "not reproduced", not "not reproducible". #248
  offered three options: close it as looked for and not found after #242's 256 rule sets, search
  more rules, or make the script's table the record. Truls took the third for the record and
  none of the three for the difference, because the session that put them to him found the
  text of #132's scripts in the transcript of 2026-10-05, where the catalogue had "the first
  script is gone". They are comments on #248, extracted and not run. #253 runs them on the
  dump `3295867752`. If they do not run, or do not print 211, 202, 206, 188, 20 and 169, it
  says which and no wider search follows. If they print them, the difference is explained when
  each rule on which they differ from `dump-walk.ps1` is named, read from source, and the first
  table's row is measured to move to the record's 202, 198, 199, 200, 21 and 172 under that
  script's rules, or what is left over is stated for each surface. #253 changes no figure of
  the record and not `dump-walk.ps1`. The recovered scripts stay as ticket comments, in neither
  repository, with no ADR and no `GLOSSARY.md` entry.
  *2026-10-13 (#253):* the scripts ran and printed the six figures, so #132's table is
  reproduced, and the difference is explained by three rules. The record is as it was. What
  was measured is in the catalogue, under the note of #253 in that section.
- **The pre-PR reviewer's brief is procedure, and a rule of review has a test** (2026-10-13,
  #178). A rule of review is what a reviewer judges a branch by, or what defines the review:
  what the reviewer is handed, who reads a fix against its finding, where the findings go.
  Procedure is what a session does to prepare and send the review, and how the report comes
  back. The test follows who loads which page: the reviewer reads `docs/agents/code-review.md`
  whole and is sent the code blocks of `docs/agents/pre-pr-review-brief.md`, and the session
  reads the brief's page. #178 listed five requirements of the brief that the rules did not
  state, and the brief held four more by the day it was ruled (#192, #219, #234, #241, by a
  reading of the page), so a list would have gone out of date again. The brief is mandatory: one
  rule says the review is run by it, and a session that writes its own words has done the pre-PR
  review wrong. By the test three things went into the rules, each with what stands behind it in
  `docs/agents/code-review-why.md`, *What the rules took from the brief*: the commit messages
  and the tickets are in the list of what the reviewer is handed, the two checks' results are
  handed over on every branch, and the review is read-only. Staying in the brief, among others:
  the report to a file and the reply of five lines, the file tool, the report's two sections,
  the `git cherry` read, the command saved beside a figure's raw output, no change of directory,
  and the walk of `absolute-words.txt`, whose list the reviewer is not handed. No step of the
  review reads whether a session walked it. The incidents behind the file requirement stay in
  the brief's head, beside it. #178 offered five options for the whole and three for the checks.
  Taken: "Split them", with the test drawing its line, and "Run both on every branch, and say so
  in the rules". `GLOSSARY.md` has *Rule of review*. No ADR: it is cheap to reverse.
- **No check finds a dated note out of place; the reviewer does** (2026-10-14, #181). A dated
  note goes last in its paragraph, and `markdown-check.ps1` gets no check for it. #181 offered
  three options: a broad check, a narrow one for notes opening "*Until*" or "*Added*", and the
  reviewer. Taken: the reviewer. On `7a0bec5` the ticket's script flags 82 of 199 notes, and
  about one flag in ten was the thing by #181's hand sort of an earlier count. A dated note has
  two forms, one italic run or an italic label with roman text after it, and runs to the end of
  its paragraph; a check would have needed the second form retired. Notes already out of place
  stay until a branch changes their paragraph. The rule is in `docs/agents/code-review.md`, why
  and the count in `docs/agents/code-review-why.md`, and `GLOSSARY.md` has *Dated note*. No ADR:
  a check can still be built.
- **A fix made after the plugin pass is read by the branch's pre-PR reviewer** (2026-10-08,
  #191). The plugin pass's reviewers do not outlive the pass, so on PR #186 four of its findings
  were fixed in a commit no reviewer had read. The pre-PR reviewer is continued to read such a fix
  against its finding, and if it cannot be, a fresh one is handed its report and the commits.
  The fallback was proposed by the commit that added the rule and left to Truls; he merged
  PR #193 with it. #166
  asked the same question and was settled by this rule on 2026-10-14, when Truls also ruled that
  the confirmation has no bound: what it finds is repaired and read again until a read finds
  nothing new. Not taken: one read, with what it finds repaired and listed on the pull request
  as unread, as on PR #163. There the one read of the fix commit found three errors in sentences
  that commit added, one of them a repair that was false in the way its finding had been, and the
  repairs of the three were pushed unread. The rule is in `docs/agents/code-review.md`. No ADR:
  it is a rule of review and cheap to change.
