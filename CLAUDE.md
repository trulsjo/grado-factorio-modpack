# Grado Factorio Modpack — agent notes

Factorio modpack project. Five packs, ported from the three 1.1 packs Truls publishes on the mod
portal as `ostogvin`. See `README.md` for what the packs are; this file is how to work in the repo.

**Long-term context lives in the brain**, not here — the decision trail, the upstream survey, what was
measured and what is still assumed. `CLAUDE.local.md` has the path and is git-ignored. Read it at
session start.

## State

**Skeleton.** Five `info.json` files with resolved dependency lists, a README and
`docs/porting-notes.md`. First commit `3ab917c`, 2026-09-20.

**Nothing has been launched in Factorio.** No pack has been loaded, no
compatibility Lua written or shown to be needed. *Members can now be downloaded:
`scripts/stage-pack.ps1` (#24) fetches them. Recording a load is #17's.* Every dependency list is a portal-API reading, not a
tested configuration. Treat "it resolves on the portal" and "it loads in the game" as different
claims, because right now only the first is true.

## What a modpack is here

A pack is an `info.json` whose `dependencies` list *is* the pack. There is no Lua unless two member
mods need glue between them — and that is the only code these packs are expected to ever carry. If a
change can be made by editing a dependency list, it should be.

## The chain

```
Grado_NonChanging        quality of life; adds no content (see CONTEXT.md, *Promise*)
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
  the same ground. Stated once in `CONTEXT.md` under *Promise*; the old wording, "does not change
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
- **`Grado_ABC`'s membership is settled** (2026-09-23, #9). 44 mods to 41. The pack gained a
  promise (`CONTEXT.md`): **Truls's own Angel's, Bob's and MadClown setup**, where a member may extend
  the overhaul or add content of its own but must not conflict with it. The whole Deadlock stacking
  family is out, as is `signalstrings`. `RealisticFusionPower` is replaced by `RealisticFusionPowerPort`,
  **a comparison slot for `realistic-fusion-refreshed`**, which may take the slot later.
  `angels-smelting-extended` is kept for now, pending #50. #8's three rules carried up unchanged,
  with **a partial replacement counted as an addition**, which is why `ScienceCostTweakerM` and the
  others went to #49. A 2.x `angelsindustries` port reopens the question rather than adding it
  back. All ten of this pack's drops are closed. The hidden mandatory members stay unnamed. Reasons
  per mod in `docs/catalogue/Grado_ABC.md`.
- **`Grado_ABCX`'s and `Grado_ABCS`'s membership is settled** (2026-09-23, #10). Neither list
  changed: one member each. Both gained a promise (`CONTEXT.md`). **`Grado_ABCS` is ABC *beside*
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

Listed in full with their evidence in `docs/porting-notes.md`. Do not close one silently.

- `factorio_version` is declared `2.0` on all five packs while several members have moved to `2.1`.
  The members' own floors answer it for four packs: the project high is `base >= 2.1.20`
  (`kry_stdlib` `2.2.21`, a hidden member of `Grado_NonChanging`, released 2026-09-23), which every
  pack inherits - or `base >= 2.1.12` (`cybersyn2`, #8) if the game installs an older
  `kry_stdlib`, which the constraint allows. `Grado_ABCS` cannot be answered until
  the pack is loaded, because `space-age` is not a portal mod (#29); its 2.0.77 build, read from
  disk on 2026-09-23, requires only `base >= 2.0.0`, and a 2.1 build is unread. The measurement is
  #15; the number to declare is #16. **#16 cannot be answered by choosing a number yet** - *true
  of a 2.1 target only; see the 2.0.77 result below (2026-09-24). Ruled 2026-09-24 (#16): see
  Settled so far.* A member
  declaring `factorio_version: 2.0` is not served to a 2.1 game at all, and several are members of
  every lower pack (#43). **Those floors are latest-release readings, and they overstate the case**
  (2026-09-23, #9): every one of the 87 members of the three lower packs has at least one release
  declaring 2.0 whose `base` floor is below 2.1, and the whole closure read that way asks
  `base >= 2.0.74` (`miniloader-redux`, #15). So a 2.0 target may resolve, while a 2.1 target
  strands the 2.0-only members. That makes "installs on no version of Factorio" unproven rather than
  true, and the choice between the two targets is #16's (*Ruled 2026-09-24 (#16), applied 2026-09-24 (#58).*)
  The hidden members pass too. Not yet checked: whether the old releases' floors on each other are
  consistent. *Checked 2026-09-24 (#43): they are.* **Stable Factorio is 2.0.77; 2.1.20 is
  experimental** (read 2026-09-24). **On 2.0.77 all five packs resolve on portal metadata, with zero
  conflicts between the releases a 2.0.77 game would install** (#43, closed 2026-09-24) - so the 2.0
  target is no longer "may resolve". Seventeen members, two of them hidden, still have no 2.1
  release; that list is a watch list for when 2.1 goes stable, under *Resolves on stable 2.0.77* in
  `docs/porting-notes.md`. The five-pack table, dated 2026-09-23 and against the settled
  memberships, is *Effective Factorio floor* in `docs/porting-notes.md` (#15). **Ruled 2026-09-24
  (#16) - see *Settled so far*.** What stays open is applying it: the `info.json` edits wait on the
  resolver re-measuring the minimums. *Applied 2026-09-24 (#58): re-measured on 2.0.77, same
  floors, and the five `info.json` files declare them.*
- **`PickerPipeTools`' pipe clamps are the one feature lost in the port with no successor found** —
  a search, not a proof. All twenty port drops are now closed (#7, #8, #9): nineteen stay dropped
  and `RealisticFusionPower` was replaced by `RealisticFusionPowerPort`.

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
- `https://mods.factorio.com/api/mods?page_size=max&version=2.0` — every 2.0 mod, about 9,600 entries.

**A mod missing under one name is not a mod that does not exist.** Learned the expensive way on
2026-09-20: `SpaceMod` has no 2.0 release, and reporting "SpaceX is dead" from that was wrong —
`SpaceModFeorasFork` is a live fork on 2.1. Search titles and summaries, not just names, before
concluding anything is gone. The same trap may be hiding successors for the seven dropped Picker mods.

**Check `factorio_version` for any `2.x`, not `== "2.0"` exactly.** A mod that has moved to 2.1 is not
missing.

## Conventions

- Default branch `main`. Commit email is set per-repo — do not change it.
- `CLAUDE.local.md` is personal and git-ignored. Never commit it, and never move its contents into a
  tracked file.
- **`info.json` is strict JSON — no comments.** Anything that needs explaining goes in
  `docs/porting-notes.md`, next to the mod it explains.
- **Two documents, two jobs.** `docs/porting-notes.md` records what happened to the 1.1 packs;
  `docs/catalogue/<pack>.md` records what is in each pack now and why, one entry per mod.
  `docs/mod-catalogue.md` is the entry format. A fact about the port goes in the notes, a fact about
  a mod goes in its catalogue entry.
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
  the title is display only. `CONTEXT.md` is the glossary: six terms, these two among them, each
  of which has been used here to mean two things. *Nine since 2026-09-24: `Promise` had already
  made it seven, and #43 added `Resolve` and #16 `Declared line`.*

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

Single-context: `CONTEXT.md` and `docs/adr/` at the repo root. See
`docs/agents/domain.md`.
