# Load record: `Grado_ChangingBase`, 2026-10-04

The second pack with a recorded **load** (`CONTEXT.md`, *Load*), for #115. Two loads, both clean:
base only, and with Space Age. The shape is the first record's,
`docs/loads/Grado_NonChanging-2026-09-29.md`. There is **no play session** here. A load runs no
ticks, so this says nothing about how the 20 members behave in play; that is #26's.

## Configuration

| | |
|---|---|
| Date | 2026-10-04 |
| Game | Factorio **2.0.77** (build 84539, win64, Steam), headless |
| Declared line | `2.0`, `base >= 2.0.74` |
| Repo | `f2e51f4` (`main`), `Grado_ChangingBase` `0.1.0`, `Grado_NonChanging` `0.1.0` |
| Tools | `vendor/grado-factorio-tools` at `d251481` |
| Bundled mods | load 1: none (base only); load 2: `space-age`, `quality`, `elevated-rails` |

Commands, from the repo root:

```
pwsh -File scripts/stage-pack.ps1 Grado_ChangingBase
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -Mods .mod-cache/Grado_ChangingBase -KeepTemp
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -Mods .mod-cache/Grado_ChangingBase -With space-age -KeepTemp
```

The resolve read line `2.0` on build 2.0.77: 51 mods, every one resolved, no constraint violated,
effective floor `base >= 2.0.74` from `miniloader-redux` `1.2.0`. It matches the declared floor.

## Resolved closure

51 mods and the two packs, 53 rows. The 51 are the 20 named members of this pack, the 26 of
`Grado_NonChanging`, and five hidden members (`CONTEXT.md`, *Hidden member*): `flib` and
`kry_stdlib`, which `Grado_NonChanging`'s members pull in, and `0-things`, `alien-biomes-graphics`
and `stdlib2`, which this pack's do. No pack names a member with a version, so these are what the
portal served a 2.0.77 game on this date. A later load may get other versions.

| Mod | Release | | Mod | Release |
|---|---|---|---|---|
| `0-things` (hidden) | 0.2.6 | | `kry_stdlib` (hidden) | 2.1.2 |
| `AdditionalPasteSettings` | 2.0.16 | | `miniloader-redux` | 1.2.0 |
| `alien-biomes` | 0.7.4 | | `ModuleInserterEx` | 7.4.1 |
| `alien-biomes-graphics` (hidden) | 0.7.1 | | `Nanobots2` | 3.3.2 |
| `automatic-station-painter` | 2.0.0 | | `nixie-tubes` | 2.0.9 |
| `Automatic_Train_Painter` | 2.0.1 | | `PipeVisualizer-Updated` | 2.4.4 |
| `BlueprintTools` | 1.5.0 | | `qol_research` | 3.4.2 |
| `bobinserters` | 2.0.3 | | `RateCalculator` | 3.3.8 |
| `BottleneckLite` | 1.3.4 | | `reverse-factory` | 9.1.5 |
| `Brighter-Lamps` | 2.0.0 | | `solar-calc` | 0.5.72 |
| `CleanFloor` | 2.0.0 | | `SpeedControl` | 2.0.1 |
| `CopyPasteModules` | 0.2.0 | | `squeak-through-2` | 0.1.5 |
| `cybersyn2` | 0.1.10 | | `stdlib2` (hidden) | 2.0.1 |
| `DiscoScience` | 2.0.1 | | `Tapeline` | 3.0.4 |
| `EditorExtensions` | 2.5.2 | | `textplates` | 0.7.2 |
| `even-distribution` | 2.0.2 | | `Todo-List` | 19.15.2 |
| `even-pickier-dollies` | 2.7.5 | | `UltimateResearchQueue2` | 2.0.9 |
| `FactorySearch` | 1.14.3 | | `underground-pipe-pack` | 2.0.6 |
| `Fill4Me` | 0.12.1 | | `VehicleSnap` | 2.0.3 |
| `flib` (hidden) | 0.16.5 | | `Waterfill_v17` | 2.0.5 |
| `FluidWagonColorMask` | 2.0.0 | | `WhereIsMyBody` | 2.0.15 |
| `FNEI` | 0.4.6 | | `WideChests` | 6.2.4 |
| `Grado_ChangingBase` | 0.1.0 | | `WideChestsAllTypes` | 2.0.0 |
| `Grado_NonChanging` | 0.1.0 | | `WideChestsLogistic` | 3.1.1 |
| `helmod` | 2.2.14 | | `WideChestsUnlimited` | 2.0.0 |
| `ixuAutoSave` | 0.1.16 | | `YARM` | 1.0.5 |
| `kry-picker-extended` | 1.1.0 | |  |  |

**Against the 2026-09-29 record: nothing moved.** All 28 mods that record lists besides the pack -
`Grado_NonChanging`'s 26 named members, `flib` and `kry_stdlib` - resolved to the same release
here, compared row by row against its table. `kry_stdlib` is still `2.1.2`, the newest release a
2.0.77 game accepts, not its newest.

`cybersyn2` resolved to `0.1.10` and `0-things` to `0.2.6`. `CLAUDE.md` gives `cybersyn2`'s newest
release a floor of `base >= 2.1.12`; these are the older releases a 2.0.77 game is served.

## Loads

**Load 1, base only.** Exit 0. 53 mods validated and a map created. The log's per-mod checksum list
has 54 entries: `base` and the 53. The data stage ran 42 member `data.lua` files and 22 later-stage
files. Prototypes were ready at 7.8 s (prototype list checksum `1028326153`) and the run ended at
17.4 s.

**Load 2, with `space-age`, `quality` and `elevated-rails`.** Exit 0. The same 53 mods validated
beside the three bundled ones, and a map was created. The checksum list has 57 entries. Prototypes
were ready at 15.5 s (checksum `3302556857`) and the run ended at 19.6 s.

**`factorio-current.log`, both loads:** no error, no failure and no deprecation, and stderr was
empty. Searched for `error`, `warn`, `fail`, `deprecat`, `does not exist`, `traceback`, `Duplicate`,
`not a number`, `not a valid`, `missing`, `conflict`, `invalid`, `not found` and `unavailable`,
without regard to case. What matched:

- `Local player-data.json unavailable`, `Cloud player-data.json unavailable`, and
  `Blueprint storage "blueprint-storage-2.dat" was not found` (twice per run). From the harness, not
  from a mod: it gives each run an empty write-data directory. The first record saw the same.
- `[ cybersyn2 :: 0 T+0s WARN ] Log level set to WARN`. `cybersyn2` announcing its own log level,
  once per run. It is not a warning about anything.

Members that write to the log at info level, load 1: `reverse-factory` (45 lines: 20 recipes with no
ingredients, 20 with no results, 4 hidden, 1 manual recipe added), `alien-biomes` (22, the vanilla
trees it disables), `even-distribution` (18), `WideChests` (9), `UltimateResearchQueue2` (3),
`cybersyn2` (2) and `0-things` (1). 100 `Script` lines in all. Load 2 has 111: `reverse-factory`
logs 10 more, about `turbo-loader`, `copper-bacteria`, `iron-bacteria`, `quantum-processor`,
`cryogenic-science-pack`, `heat-interface`, `infinity-chest` and `infinity-pipe`, and
`alien-biomes` disables one more tree, `water-cane`. `UltimateResearchQueue2`'s three lines are
timings and differ. The rest are the same.

The times are from one machine (i7-9850H) and one run each. They are context, not a benchmark.

## Conflicts

**None found in the loads.** Neither load showed a failure, or a complaint by one member about
another. Compatibility Lua is not needed on this evidence.

That verdict covers only what a load can see: the prototype stages and `on_init`. Two mods defining
one prototype name load without a word, and the harness loads no sprites. Clashing key bindings,
GUIs drawn over each other and anything after the first tick are a play session's to find. The key
bindings of the 20 members added here were not dumped; the first record's list covers
`Grado_NonChanging`'s only.

## Not checked

- **Play.** No play session. #26.
- **The floor itself.** 2.0.77 is above `base >= 2.0.74`, so this confirms only that the floor is at
  or below 2.0.77.
- **`cybersyn2` doing anything.** Its author declares it alpha. It loaded and ran `on_init`; no
  train was dispatched.
- **Key bindings** of this pack's own 20 members.
- **Multiplayer**, **the 2.1 line**, and **mod settings other than the defaults**, as in the first
  record.
