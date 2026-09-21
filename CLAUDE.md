# Grado Factorio Modpack — agent notes

Factorio modpack project. Five packs, ported from the three 1.1 packs Truls publishes on the mod
portal as `ostogvin`. See `README.md` for what the packs are; this file is how to work in the repo.

**Long-term context lives in the brain**, not here — the decision trail, the upstream survey, what was
measured and what is still assumed. `CLAUDE.local.md` has the path and is git-ignored. Read it at
session start.

## State

**Skeleton.** Five `info.json` files with resolved dependency lists, a README and
`docs/porting-notes.md`. First commit `3ab917c`, 2026-09-20.

**Nothing has been launched in Factorio.** No pack has been loaded, no member mod downloaded, no
compatibility Lua written or shown to be needed. Every dependency list is a portal-API reading, not a
tested configuration. Treat "it resolves on the portal" and "it loads in the game" as different
claims, because right now only the first is true.

## What a modpack is here

A pack is an `info.json` whose `dependencies` list *is* the pack. There is no Lua unless two member
mods need glue between them — and that is the only code these packs are expected to ever carry. If a
change can be made by editing a dependency list, it should be.

## The chain

```
Grado_NonChanging        quality of life; does not change save state or the factory
  └─ Grado_ChangingBase    may change saves/factory; compatible with most overhauls
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

## Decisions still open

Listed in full with their evidence in `docs/porting-notes.md`. Do not close one silently.

- `factorio_version` is declared `2.0` on all five packs while several members have moved to `2.1`.
  **Answered for `Grado_NonChanging`, `Grado_ChangingBase` and `Grado_ABC`, and the answer is no** —
  10 of 29 members, 11 of 25, and 26 of 45 declare `base >= 2.1` directly — the last now measured
  across the whole pack rather than half of it. `WideChests` needs `>= 2.1.8`, the highest floor
  found so far and the one `Grado_ABC` inherits through the chain. Still unverified on
  `Grado_ABCX` and `Grado_ABCS` — that measurement
  is #15, and the number to declare instead is #16.
- ~~`alien-biomes-hr-terrain` was dropped **assuming** 2.0 `alien-biomes` absorbed the HR terrain.~~
  **Checked 2026-09-21: recommended to stay dropped, and the assumption's mechanism was wrong.**
  The graphics moved into `alien-biomes-graphics`, a mandatory dependency of `alien-biomes`, rather
  than being absorbed by it — so a third mod nobody names is pinned into the chain. Whether a drop
  stands is still Truls's; the evidence makes this one close to forced. See
  `docs/catalogue/Grado_ChangingBase.md`.
- Twenty mods are dropped with no replacement found, including seven of the nine Picker mods,
  `angelsexploration`, `angelsindustries` and `Clowns-Science`. **Thirteen have been re-checked
  since** — `Grado_NonChanging`'s four, `Grado_ChangingBase`'s six, and the three named above,
  which are `Grado_ABC`'s and were re-checked on 2026-09-21. **Neither of the first two surveys
  recommends adding any of their ten back as itself, and almost none stayed dropped for the reason
  originally recorded:**
  features turned out to be covered by mods already in the packs, by `kry-picker-complete`, or by the
  base game. Three of the ten end in `reconsider:` rather than `stay dropped` — two against
  `kry-picker-complete`, and `PickerInventoryTools` over whether its one feature is still wanted.
  **All twenty have now been re-checked** — `Grado_ABC`'s remaining seven on 2026-09-21 by #5 — so
  "no replacement found" no longer means "not yet checked" anywhere. Its three core drops broke the
  earlier pattern: two have no successor of any kind and stay dropped, `angelsindustries` being the
  largest single loss in the project, and `Clowns-Science` is `reconsider:` against
  `ScienceCostTweakerM`. Of the seven add-on drops, four stay dropped, `RealisticFusionPower` stays
  dropped with no slot held for the sibling project, and the two Deadlock stacking bridges are
  `reconsider:` **as one question together with the three Deadlock mods still in the pack**,
  because the only 2.x candidate replaces the whole family's recipes rather than filling either
  gap. Across the project, a drop is far more often an author's choice not to port than an
  ecosystem failing. See `docs/catalogue/Grado_ABC.md`. (Sixteen is the number of *replacements*;
  this line carried it by mistake until 2026-09-20.)
- Two dependencies the 1.1 `Grado_ChangingBase` declared optional, `? reverse-factory` and
  `? Squeak Through`, are mandatory in the 2.0 pack. Nobody decided that.

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
- **A pack's major version tracks save compatibility**, not maturity. Major = a dependency change an
  existing save cannot survive (a member mod of `Grado_ChangingBase` or below added or removed);
  minor = a save-safe dependency change; patch = metadata only. Same rule as the `!` in a commit
  subject. `Grado_NonChanging` can never go major. Reasoning in
  `docs/adr/0001-version-major-tracks-save-compatibility.md`.
- **Packs version independently.** A bump means that pack's dependency list changed, so do not
  bump the other four to match.
- **A title is short identity, colon, descriptor** — `Grado ABC: Angel's, Bob's, MadClown`. Keep
  `Grado` leading all five so the family sorts together on the portal. The descriptor names the
  mods a player would search for; the initialism alone means nothing to someone browsing.
- **`name` and `title` are not the same field.** The name is permanent and resolves dependencies;
  the title is display only. `CONTEXT.md` is the glossary: six terms, these two among them, each
  of which has been used here to mean two things.

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
  chain. `Grado_NonChanging` is the one pack that by definition cannot trigger this. It breaks
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

The check came from `realistic-fusion-refreshed` and was **adopted through the tooling repo on
2026-09-21**; before that this repo carried its own byte-identical copy of both files. The rule
rotted here as it had there: on 2026-09-20 all three commits in this repo failed, on 14 body lines
over 72 and one subject with no gitmoji at all — including a commit written minutes after the rule
was recorded. History is left alone; the hook stops it growing. `-Range origin/main..HEAD` checks a
branch before a push, and `-SelfTest` proves the check can still fail.

The first commit `3ab917c` predates this section and does not follow it.

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
