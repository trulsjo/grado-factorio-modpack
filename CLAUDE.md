# Grado Factorio Modpack — agent notes

Factorio modpack project. Five packs, ported from the three 1.1 packs Truls publishes on the mod
portal as `ostogvin`. See `README.md` for what the packs are; this file is how to work in the repo.

**Long-term context lives in the brain**, not here — the decision trail, the upstream survey, what was
measured and what is still assumed. `CLAUDE.local.md` has the path and is git-ignored. Read it at
session start.

## State

**Skeleton.** Five `info.json` files with resolved dependency lists, a README and the docs. No
pack carries Lua.

**All five packs have a recorded load on Factorio 2.0.77; one has been played.**

- `Grado_NonChanging`: loaded, base only and with Space Age, and played (2026-09-29 to
  2026-09-30, #17). 24 of its 26 named members were seen working; `ixuAutoSave` and
  `kry-picker-extended` were not confirmed. One clash found: `YARM` and `PipeVisualizer-Updated`
  share `Alt+Y`, as does a base control that is not the cause (#71). Whether the pack carries Lua
  to change a default is Truls's (#73).
- `Grado_ChangingBase`, `Grado_ABC`, `Grado_ABCX`, `Grado_ABCS`: loaded 2026-10-04 (#115 to
  #118). No play session yet (#26 to #29). `Grado_ABCX` is refused beside Space Age, as intended.
  The three overhaul packs log non-fatal complaints (#125).

The records are in `docs/loads/`. **"It resolves on the portal", "it loads in the game" and "it
plays" are three claims** (`GLOSSARY.md`: *Resolve*, *Load*, *Play session*). For the four upper
packs only the first two are true. A *Start* is a fourth thing, less than a load.

How this section came to read as it does, every superseded sentence kept:
`docs/porting-notes.md`, *The trail of CLAUDE.md's State and open decisions*.

## What a modpack is here

A pack is an `info.json` whose `dependencies` list *is* the pack. There is no Lua unless two member
mods need glue between them — and that is the only code these packs are expected to ever carry. If a
change can be made by editing a dependency list, it should be.

Glue is for two members that each load on their own. Patching a member that is broken against
another is decided case by case and leans towards not doing it: report upstream and drop instead.
It is Truls's call each time. #81 (2026-10-04) declined it for the nukes mods, where the patch list
had at least four entries and no known end.

## The chain

```
Grado_NonChanging        quality of life; adds no content (see GLOSSARY.md, *Promise*)
  └─ Grado_ChangingBase    may add content and change saves; compatible with most overhauls
       └─ Grado_ABC          Angel's + Bob's + MadClown. The shared overhaul core.
            ├─ Grado_ABCX     + Space Extension (SpaceX), via `SpaceModFeorasFork`
            └─ Grado_ABCS     + Space Age
```

**ABCX and ABCS are mutually exclusive and must stay that way.** `SpaceModFeorasFork` declares
`! space-age`. That incompatibility is the entire reason `Grado_ABC` exists as its own pack rather
than the two end-games duplicating the overhaul list. **Anything both branches need goes in ABC**, and
each branch adds exactly one thing. If you find yourself adding the same mod to both, it belongs in
ABC.

`Grado_ABC` and `Grado_ABCS` are new portal entries. The other three already exist under `ostogvin`
as Factorio 1.1 entries.

## The rule that matters most here

**The big decisions are Truls's.** Which mods are in a pack, whether a dropped mod gets a replacement
or stays dropped, whether Space Age is first-class, what the packs are called, and what happens to the
existing 1.1 portal entries.

Do not settle any of them as a side effect of doing something else — no "I picked X to get started".
Recording options with trade-offs is welcome; choosing between them is not. If a task cannot proceed
without a decision, say so and ask.

Settled so far, recorded here so nobody reopens them by accident:

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

## Decisions still open

Listed with their evidence in `docs/porting-notes.md`. Do not close one silently.

- **The 2.1 line.** The declared line is `2.0` (#16, under *Settled so far*). A 2.1 release on the
  same entries follows once factorio.com's stable release is 2.1.x. Stable Factorio is 2.0.77 and
  2.1.20 is experimental (read 2026-09-24). What is known for that day:
  - On a latest-release reading the project's highest floor is `base >= 2.1.20`, from the hidden
    member `kry_stdlib` `2.2.21` (2026-09-23), or `base >= 2.1.12` from `cybersyn2` if the game
    installs an older `kry_stdlib`. The table is *Effective Factorio floor* in
    `docs/porting-notes.md` (#15).
  - Fourteen members, one of them hidden, have no 2.1 release (since 2026-10-04, #81). The list
    is under *Resolves on stable 2.0.77* there.
  - The 2.1 build of `space-age` is unread.
- **`PickerPipeTools`' pipe clamps are the one feature lost in the port with no successor
  found**: a search, not a proof. All twenty port drops are closed (#7, #8, #9): nineteen stay
  dropped and `RealisticFusionPower` was replaced by `RealisticFusionPowerPort`.

How the first item was measured and ruled, step by step: `docs/porting-notes.md`, *The trail of
CLAUDE.md's State and open decisions*.

## Factorio specifics

- Mods are **Lua**. The API has **three stages**: `settings` and `prototype` run at start-up,
  `runtime` runs during gameplay. Know which stage code belongs to before writing it. A modpack
  normally touches none of them.
- API docs are published **per game version** at <https://lua-api.factorio.com/>. Check claims against
  the version being targeted rather than from memory.
- `/stable/` and `/latest/` both move, and `latest` is the **experimental** build. Pin an explicit
  version when recording a fact.
- **The 1.1→2.0 break is the whole reason this project exists.** A 1.1 mod is not a 2.0 mod, and a mod
  with a 2.0 release is not necessarily Space Age compatible. Both are checkable; check rather than
  assume.

## Checking the mod portal

The portal API is the primary source for what exists and at what version. No key needed:

- `https://mods.factorio.com/api/mods/<name>` — one mod, with its release list.
- `https://mods.factorio.com/api/mods/<name>/full` — adds each release's `info_json`, which is where
  `factorio_version` and the dependency list live.
- `https://mods.factorio.com/api/mods?page_size=max&version=2.0` — 9,791 entries — and
  `&version=2.1` — 4,334. **The full sweep is the union of both, 10,845 distinct mods**; neither
  listing alone is complete. 1,054 mods are in the 2.1 listing only, so a sweep of the 2.0 listing
  misses them. Counts read 2026-10-01; they move. (#44, which measured 977 missed on 2026-09-22.)

**A mod is served only to the major version it declares.** `factorio_version: "2.0"` means every
2.0 release and no other major version, with no 2.0-to-2.1 exception
([mod structure](https://lua-api.factorio.com/2.0.77/auxiliary/mod-structure.html), 2.0.77), so a
2.0-only mod is not served to a 2.1 game at all. A pack can therefore list a mod that resolves on
the portal and still be uninstallable on the other line (#43).

**A mod missing under one name is not a mod that does not exist.** Learned the expensive way on
2026-09-20: `SpaceMod` has no 2.0 release, and reporting "SpaceX is dead" from that was wrong —
`SpaceModFeorasFork` is a live fork on 2.1. Search titles and summaries, not just names, before
concluding anything is gone. The same trap may be hiding successors for the seven dropped Picker mods.

**Check `factorio_version` for any `2.x`, not `== "2.0"` exactly.** A mod that has moved to 2.1 is not
missing.

## Conventions

- Default branch `main`. Commit email is set per-repo — do not change it.
- **A batch of tickets lands as one pull request** (written down 2026-10-05; the practice since
  PR #94): a branch named for its tickets, one commit per ticket, a review, then a rebase merge.
  Open the pull request when the work is committed.
- `CLAUDE.local.md` is personal and git-ignored. Never commit it, and never move its contents into a
  tracked file.
- **`info.json` is strict JSON — no comments.** Anything that needs explaining goes in
  `docs/porting-notes.md`, next to the mod it explains.
- **Two documents, two jobs.** `docs/porting-notes.md` records what happened to the 1.1 packs,
  and since 2026-10-05 the superseded wording of this file's *State* and *Decisions still open*;
  `docs/catalogue/<pack>.md` records what is in each pack now and why, one entry per mod.
  `docs/mod-catalogue.md` is the entry format. A fact about the port goes in the notes, a fact about
  a mod goes in its catalogue entry. *A third since 2026-09-29 (#17):* `docs/loads/<pack>-<date>.md`
  records one load and its play session - the build, the bundled mods and every resolved member
  version, so the next load can be compared with it. The first one is the template.
- **`<pack>/README.md` is the player's page** (2026-09-29, #17), and the text meant for the pack's
  portal description. It ships inside the pack zip, because the packer takes every tracked file in
  the pack directory. It is written for players, so no ticket numbers and no project vocabulary.
  `Grado_NonChanging` has the first one.
- **Record what was dropped and why**, never just remove a line. A dependency that silently vanishes
  cannot be revisited.
- Cite a mod by its **portal name** (`even-pickier-dollies`), not its title, because the name is what
  `info.json` resolves.
- **A pack's major version tracks save compatibility**, not maturity - with one exception, named
  below. Major = a dependency change an existing save cannot survive (a member mod of
  `Grado_ChangingBase` or below added or removed); minor = a save-safe dependency change; patch =
  metadata only. Same rule as the `!` in a commit subject. **`Grado_NonChanging` is not exempt** -
  several of its members write to the save. **The exception:**
  `0.x` to `1.0.0` is the one major that signals maturity rather than a broken save, and a pack's
  version does not move at all before its first release. Reasoning in
  `docs/adr/0002-any-pack-can-go-major-and-1-0-0-signals-maturity.md`, which supersedes
  `docs/adr/0001-version-major-tracks-save-compatibility.md`.
- **Re-run the resolve before every pack release** (#16, 2026-09-24), with the resolver in
  `vendor/grado-factorio-tools` - `scripts/resolve-modpack.ps1` there, which
  `scripts/stage-pack.ps1` runs (#24). If a pack's
  `base >=` minimum moved, raise it: metadata only, so a patch. The packs name members without
  versions, so a member's new release can make a declared minimum false without any change here.
- **Packs version independently.** A bump means that pack's dependency list changed, so do not
  bump the other four to match.
- **A title is short identity, colon, descriptor** — `Grado ABC: Angel's, Bob's, MadClown`. Keep
  `Grado` leading all five so the family sorts together on the portal. The descriptor names the
  mods a player would search for; the initialism alone means nothing to someone browsing.
- **`name` and `title` are not the same field.** The name is permanent and resolves dependencies;
  the title is display only. `GLOSSARY.md` is the glossary: six terms, these two among them, each
  of which has been used here to mean two things. *Nine since 2026-09-24: `Promise` had already
  made it seven, and #43 added `Resolve` and #16 `Declared line`. Twelve since 2026-09-29: #17
  added `Load`, `Start` and `Play session`.* *Fourteen since 2026-10-04: #81 added `Hidden member`
  and `Load drop`.*

## Commit messages

[Conventional Commits](https://www.conventionalcommits.org/) with a [gitmoji](https://gitmoji.dev/)
prefix. One format, no exceptions:

```
<emoji> <type>(<scope>): <subject>

<body>

<footer>
```

**The rules live in
[`vendor/grado-factorio-tools/docs/commit-convention.md`](vendor/grado-factorio-tools/docs/commit-convention.md)**
— the type table, the situational emoji, the subject and body limits, and what the check is blind
to. That page is shared with `realistic-fusion-refreshed` and the tooling repo, so a rule change is
one edit instead of three. If the submodule is not initialised, read it at
<https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/commit-convention.md> — but that
shows `main`, which may be ahead of the commit this repo has pinned.

Three things are this repository's own, because all three are its domain rather than shared
mechanics:

- **Scope vocabulary.** Use the pack (`nonchanging`, `changingbase`, `abc`, `abcx`, `abcs`) or the
  area (`docs`, `repo`).
- **What counts as a breaking change.** Here it is a dependency change an existing save cannot
  survive: adding or removing a member mod of `Grado_ChangingBase` or anything below it in the
  chain - **`Grado_NonChanging` included**, which was written here as exempt until 2026-09-22 and is
  not: `Tapeline`, `Todo-List`, `YARM` and `SpeedControl` all write to the save, and the removed
  `blueprint-sandboxes` created whole surfaces. It breaks
  silently and players find out, not the build. The `!` and the `BREAKING CHANGE:` footer are the
  shared mechanism; what triggers them is this repo's own.
- **What a body has to cite.** Name a mod by its portal name and pin the version or date behind a
  claim, because a portal reading goes stale.

Example:

```
📦 build(changingbase): replace miniloader with miniloader-redux

The 1.1 miniloader has no 2.0 release. miniloader-redux (hgschmie,
22,472 downloads) is the maintained successor. Not yet loaded in game.
```

**A hook checks all of this, and it is not installed by default.** `.githooks/commit-msg` runs the
shared check on the message before the commit is written. Git tracks neither `.git/hooks` nor a
submodule's contents, so every clone opts in twice:

```
git submodule update --init
git config core.hooksPath .githooks
```

**Skipping either step is loud rather than silent.** The hook says the message was not checked and
lets the commit through, instead of passing everything quietly — which is the posture
[ADR 0001](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/adr/0001-siblings-consume-this-repo-as-a-submodule.md)
requires, and what makes the second step safe to ask for.

Old commits that fail the check are left alone — the three from 2026-09-20, `3ab917c` among them,
predate it. The hook stops the failures growing; `-Range origin/main..HEAD` checks a branch before a
push, and `-SelfTest` proves the check can still fail.

## Agent skills

### Issue tracker

GitHub Issues on `trulsjo/grado-factorio-modpack`, via the `gh` CLI. See
`docs/agents/issue-tracker.md`.

### Triage labels

The five canonical roles, unchanged. See `docs/agents/triage-labels.md`.

### Code review

Two conventions on top of the `/code-review` plugin: a filtered finding is still reported, and the
prose is reviewed as carefully as the code, because here there is almost none. **Load
`docs/agents/code-review.md` before running a review.**

### Domain docs

Single-context: `GLOSSARY.md` and `docs/adr/` at the repo root. See
`docs/agents/domain.md`.
