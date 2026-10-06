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
- **One mandatory review per branch, before the pull request** (2026-10-06, #151): the pre-PR
  review, one fresh subagent handed the diff, the review rules, the glossary and the raw output
  behind any measurement. Its findings go in the pull request's body and its fixes are one commit
  of their own. The plugin pass, `code-review:code-review`, runs only when Truls asks, and keeps
  its scorers. Chosen over running both because the batch of 2026-10-05 cost about 1.4 million
  subagent tokens for 27 findings and then five (figures from #151), and over the plugin pass
  alone because only a review handed the raw output can check a figure against it. The rule is
  in `docs/agents/code-review.md` and its evidence in `docs/agents/code-review-why.md`. When the
  review runs is #159's.
