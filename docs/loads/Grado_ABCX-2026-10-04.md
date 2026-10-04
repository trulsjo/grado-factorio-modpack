# Load record: `Grado_ABCX`, 2026-10-04

The first recorded **load** (`CONTEXT.md`, *Load*) of `Grado_ABCX`, for #117, and the first time
the exclusion the five-pack structure rests on was seen in the game. Two runs:

- **Base only: clean.** 105 mods validated and a map created.
- **With Space Age: refused, as expected.** The game names both `! space-age` declarations, the
  pack's and `SpaceModFeorasFork`'s, and loads nothing.

The shape is the first record's, `docs/loads/Grado_NonChanging-2026-09-29.md`. There is **no play
session** here; that is #28's.

## Configuration

| | |
|---|---|
| Date | 2026-10-04 |
| Game | Factorio **2.0.77** (build 84539, win64, Steam), headless |
| Declared line | `2.0`, `base >= 2.0.74` |
| Repo | `f2e51f4` (`main`), all four packs in the chain at `0.1.0` |
| Tools | `vendor/grado-factorio-tools` at `d251481` |
| Bundled mods | run 1: none (base only); run 2: `space-age`, `quality`, `elevated-rails` |

Commands, from the repo root:

```
pwsh -File scripts/stage-pack.ps1 Grado_ABCX
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -Mods .mod-cache/Grado_ABCX -KeepTemp
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -Mods .mod-cache/Grado_ABCX -With space-age -KeepTemp
```

The resolve read line `2.0` on build 2.0.77: 101 mods, every one resolved, no constraint violated,
effective floor `base >= 2.0.74` from `miniloader-redux` `1.2.0`. It matches the declared floor.
The resolver does not weigh a `!` line against a bundled mod, so it has nothing to say about run 2.

## Resolved closure

101 mods and the four packs, 105 rows.

| Mod | Release |
|---|---|
| `SpaceModFeorasFork` | **1.3.3** |
| `Grado_ABCX` | 0.1.0 |
| `Grado_ABC`, `Grado_ChangingBase`, `Grado_NonChanging` | 0.1.0 each |
| the 100 mods of `Grado_ABC`'s closure | as in `docs/loads/Grado_ABC-2026-10-04.md` |

The 100 were resolved again for this stage and compared with `Grado_ABC`'s pin file of the same
day: every one is at the same release, and the fork is the only addition. The table in that record
is therefore this pack's too, hidden members included. The fork brings no hidden member: its only
mandatory dependency is `base`.

**`SpaceModFeorasFork` resolved to `1.3.3`, not its newest release.** `1.3.4` (2026-07-10) declares
`factorio_version` 2.1 and `base >= 2.1.9`, so a 2.0.77 game is not served it. `1.3.3` (2025-11-10)
is the newest release on the 2.0 line. Its `info.json`, read from the staged copy, declares
`factorio_version` 2.0, `base >= 2.0.6`, and three incompatibilities: `! SpaceMod`,
`! space-exploration` and `! space-age`.

## Loads

**Run 1, base only.** Exit 0. **105 mods validated and a map created.** The log's per-mod checksum
list has 106 entries: `base` and the 105. The data stage ran 85 member `data.lua` files and 82
later-stage files, one more of each than `Grado_ABC`'s load, both the fork's. Prototypes were ready
at 41.7 s (prototype list checksum `1533854567`) and the run ended at 59.4 s.

**Run 2, with `space-age`, `quality` and `elevated-rails`: refused.** Exit 1 at 0.2 s, before any
mod's settings or data stage ran: the log is 18 lines and has no `Loading mod` line. No map was
created. The game's message, complete, from `factorio-current.log`:

```
   0.208 Error Util.cpp:81: Failed to load mod "Grado_ABCX": 
• Grado_ABCX
    • Incompatible with space-age
• SpaceModFeorasFork
    • Incompatible with space-age
```

It cites **both** declarations: `Grado_ABCX`'s own `! space-age` line and the fork's. So the
game reads the pack's line as well as the fork's on 2.0.77. Neither was tried without the other. The refusal is the game's dependency check, not a prototype failure. It was
seen with all three expansion mods enabled; `space-age` on its own cannot be enabled
(`docs/loads/Grado_ABCS-2026-10-04.md`).

**`factorio-current.log`, run 1:** no line the game marks as an error or a warning, no deprecation,
and stderr was empty. The search and the harness's own lines are as in
`docs/loads/Grado_ABC-2026-10-04.md`. Its `Script` lines are that load's, with the same three
complaints (`Nanobots2`, and `boblibrary` twice), plus one more group from the fork, under
*Conflicts*.

The times are from one machine (i7-9850H) and one run each. They are context, not a benchmark.

## Conflicts

**Nothing stopped the base-only load.** The complaints `Grado_ABC`'s record lists are all here
unchanged. The fork adds one group.

**`SpaceModFeorasFork` `1.3.3`'s Bob's integration asks `boblibrary` for two technologies that do
not exist** (data-final-fixes, `prototypes/technology-bobs.lua`, lines 158 and 172). Each with a
stack trace:

```
Script @__boblibrary__/error-functions.lua:19: Technology drydock-assembly does not exist.
Script @__boblibrary__/error-functions.lua:19: New prerequisite technology bob-battery-equipment-6 does not exist.
```

Line 158 adds `bob-advanced-processing-unit` as a prerequisite of `drydock-assembly`, and line 172
replaces `battery-mk2-equipment` with `bob-battery-equipment-6` in `space-ai-robots`. Neither
change is made, and the load goes on. The other calls in that file log nothing, so the rest of the
fork's Bob's technology changes are applied or skipped silently; which was not checked. In the
staged copies, the fork defines `drydock-assembly` as an item and a recipe and not as a technology,
and `bobequipment` `2.1.0` defines `bob-battery-equipment-4` and `-5` and no `-6`. Compatibility
Lua is not needed to load the pack; whether this is worth a report upstream is Truls's.

That verdict covers only what a load can see: the prototype stages and `on_init`. Anything after
the first tick, the launch tree included, is a play session's to find.

## Not checked

- **Play.** No play session. #28. The SpaceX end-game was not reached or even started.
- **The refusal in the client.** Run 2 is headless. What a player sees in the mod manager when
  enabling both was not looked at.
- **`Grado_ABCX` beside `Grado_ABCS`.** Not staged together, on purpose: it is the set that must
  never exist. Run 2 is the nearest thing.
- **The fork's `1.3.4`.** It is on the 2.1 line, and nothing here was run on 2.1.
- **The floor itself.** 2.0.77 is above `base >= 2.0.74`, so this confirms only that the floor is at
  or below 2.0.77.
- **Sprites**, **key bindings**, **multiplayer** and **mod settings other than the defaults**.
