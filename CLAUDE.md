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

## Decisions still open

Listed in full with their evidence in `docs/porting-notes.md`. Do not close one silently.

- `factorio_version` is declared `2.0` on all five packs while several members have moved to `2.1`.
  **Answered for `Grado_NonChanging`, and the answer is no** — ten of its members require
  `base >= 2.1`. Still unverified on the other four.
- Version `0.1.0` starts a fresh line rather than continuing the 1.1 `0.0.x` numbering.
- `alien-biomes-hr-terrain` was dropped **assuming** 2.0 `alien-biomes` absorbed the HR terrain.
  Not checked.
- Twenty mods are dropped with no replacement found, including seven of the nine Picker mods,
  `angelsexploration`, `angelsindustries` and `Clowns-Science`. **Four of the Picker seven have been
  re-checked since** — `Grado_NonChanging`'s, where three turned out to be covered by mods already in
  the pack. "No replacement found" now means "not yet re-checked" for the rest. (Sixteen is the number of
  *replacements*; this line carried it by mistake until 2026-09-20.)
- Two dependencies the 1.1 `Grado_ChangingBase` declared optional, `? reverse-factory` and
  `? Squeak Through`, are mandatory in the 2.0 pack. Nobody decided that.
- `Grado_ABCS` uses the underscore to match the existing convention; Truls wrote `GradoABCS` once.

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

## Commit messages

[Conventional Commits](https://www.conventionalcommits.org/) with a [gitmoji](https://gitmoji.dev/)
prefix, same as the sibling `realistic-fusion-refreshed` repo. One format, no exceptions:

```
<emoji> <type>(<scope>): <subject>

<body>

<footer>
```

**Subject line**

- Imperative mood, lowercase after the colon, no trailing period, whole line ≤ 72 characters.
- `<scope>` is optional but preferred. Use the pack (`nonchanging`, `changingbase`, `abc`, `abcx`,
  `abcs`) or the area (`docs`, `repo`).
- The emoji is the *rendered* character, not the `:shortcode:`.

**Types, and the emoji that goes with each**

| Type | Emoji | Use for |
|---|---|---|
| `feat` | ✨ | a new capability |
| `fix` | 🐛 | a bug fix |
| `docs` | 📝 | documentation only |
| `refactor` | ♻️ | restructuring with no behaviour change |
| `perf` | ⚡️ | performance |
| `test` | ✅ | tests |
| `build` | 📦 | packaging, `info.json`, dependencies — the common one here |
| `chore` | 🔧 | tooling and config |
| `style` | 🎨 | formatting and code structure only |
| `revert` | ⏪️ | reverting a previous commit |

A few situational ones worth knowing: 🎉 to begin a project, 🚚 to move or rename files, 🔥 to remove
code or files, 🌐 for localisation, 💄 for icons and other visual assets, 🚧 for work in progress.

**Body** — explain *why*, not what the diff already shows. Wrap at 72. Cite a mod by its portal name
and pin the version or date behind a claim, because a portal reading goes stale.

**Breaking changes** — put `!` before the colon *and* a `BREAKING CHANGE:` footer explaining the
migration. Here that means a dependency change an existing save cannot survive: adding or removing a
member mod of `Grado_ChangingBase` or anything below it in the chain. `Grado_NonChanging` is the one
pack that by definition cannot trigger this. It breaks silently and players find out, not the build.

Example:

```
📦 build(changingbase): replace miniloader with miniloader-redux

The 1.1 miniloader has no 2.0 release. miniloader-redux (hgschmie, 22,472
downloads) is the maintained successor. Not yet loaded in game.
```

**A hook checks all of this, and it is not installed by default.** `.githooks/commit-msg` runs
`scripts/commit-check.ps1` on the message before the commit is written, and git does not track
`.git/hooks`, so every clone has to opt in once:

```
git config core.hooksPath .githooks
```

It checks the emoji-and-type pairing, the case after the colon, the trailing period, both 72-character
limits, the blank line, and that a `!` carries a `BREAKING CHANGE:` footer. Imperative mood is not
checkable and is not checked. Trailers like `Co-Authored-By:` are exempt, and so is a line whose
longest word is itself over 72 — a bare URL cannot be wrapped, and failing it would only teach
people to ignore the gate.

Both files are copied from `realistic-fusion-refreshed`, where the rule was measured to have rotted.
It rotted here too: on 2026-09-20 all three commits in this repo failed, on 14 body lines over 72 and
one subject with no gitmoji at all — including a commit written minutes after the rule was recorded.
History is left alone; the hook stops it growing. `-Range origin/main..HEAD` checks a branch before a
push, and `-SelfTest` proves the checker can still fail.

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
