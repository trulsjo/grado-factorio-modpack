# Load record: `Grado_NonChanging`, 2026-09-29

The first recorded **load** of any pack (`CONTEXT.md`, *Load*), for #17. Two loads, both clean. The
**play session** has not been run yet. Until it is, this record says the pack's prototypes and
start-up scripts work together on 2.0.77, and nothing about how the members behave in play.

## Configuration

| | |
|---|---|
| Date | 2026-09-29 |
| Game | Factorio **2.0.77** (build 84539, win64, Steam), headless |
| Declared line | `2.0`, `base >= 2.0.67` |
| Repo | `5c89815` (`main`), `Grado_NonChanging` `0.1.0` |
| Tools | `vendor/grado-factorio-tools` at `d09fba3` |
| Bundled mods | load 1: none (base only); load 2: `space-age`, `quality`, `elevated-rails` |

Commands, from the repo root:

```
pwsh -File scripts/stage-pack.ps1 Grado_NonChanging
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -Mods .mod-cache/Grado_NonChanging -KeepTemp
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -Mods .mod-cache/Grado_NonChanging -With space-age -KeepTemp
```

The resolve read line `2.0` on build 2.0.77: 28 mods, every one resolved, no constraint violated,
effective floor `base >= 2.0.67` from `helmod` `2.2.14`. It matches the declared floor.

## Resolved closure

The 26 named members plus two hidden ones (`flib`, `kry_stdlib`), and the pack. The pack names none
of them with a version, so these are what the portal served on this date. A later load may get
other versions.

| Mod | Release | | Mod | Release |
|---|---|---|---|---|
| `Automatic_Train_Painter` | 2.0.1 | | `helmod` | 2.2.14 |
| `automatic-station-painter` | 2.0.0 | | `ixuAutoSave` | 0.1.16 |
| `BlueprintTools` | 1.5.0 | | `kry_stdlib` (hidden) | 2.1.2 |
| `BottleneckLite` | 1.3.4 | | `kry-picker-extended` | 1.1.0 |
| `Brighter-Lamps` | 2.0.0 | | `PipeVisualizer-Updated` | 2.4.4 |
| `CleanFloor` | 2.0.0 | | `RateCalculator` | 3.3.8 |
| `CopyPasteModules` | 0.2.0 | | `solar-calc` | 0.5.72 |
| `DiscoScience` | 2.0.1 | | `SpeedControl` | 2.0.1 |
| `even-distribution` | 2.0.2 | | `Tapeline` | 3.0.4 |
| `even-pickier-dollies` | 2.7.5 | | `Todo-List` | 19.15.2 |
| `FactorySearch` | 1.14.3 | | `VehicleSnap` | 2.0.3 |
| `Fill4Me` | 0.12.1 | | `WhereIsMyBody` | 2.0.15 |
| `flib` (hidden) | 0.16.5 | | `YARM` | 1.0.5 |
| `FluidWagonColorMask` | 2.0.0 | | `FNEI` | 0.4.6 |
| `Grado_NonChanging` | 0.1.0 | | | |

`kry_stdlib` resolved to `2.1.2`, not its newest release. `CLAUDE.md` names `2.2.21` as the
project's highest floor (`base >= 2.1.20`), and a 2.0.77 game cannot install it. The resolver picked
the newest release this build accepts.

## Loads

**Load 1, base only.** Exit 0. 29 mods validated and a map created. The data stage ran 22 member
`data.lua` files and 8 later-stage files. Prototypes were ready at 15.1 s, the map was created and
23 member control scripts ran (the log's 24th script is the scenario's own `level`), and the run
ended at 33.1 s.

**Load 2, with `space-age`, `quality` and `elevated-rails`.** Exit 0. The same 29 mods validated
beside the three bundled ones, and a map was created. Prototypes were ready at 28.2 s, almost all of
it the expansion's own data stage, and the run ended at 33.6 s. The same 23 member control
scripts ran.

**`factorio-current.log`, both loads:** no line with an error, a warning, a failure or a
deprecation, and stderr was empty. The only lines that are not routine loading come from the
harness, not from any mod: `Blueprint storage "blueprint-storage-2.dat" was not found` (twice per
run) and `player-data.json unavailable` (local and cloud). Both are expected, because the harness
gives each run an empty write-data directory. `even-distribution` logs its own start-up at
info level and reports `Successfully initialized`.

The times are from one machine (i7-9850H) and one run each. They are context, not a benchmark.

## Conflicts

**None found.** Neither load showed a failure or a warning between any two members. Compatibility
Lua is not needed on this evidence.

That verdict covers only what a load can see: the prototype stages and `on_init`. Clashing key
bindings, GUIs drawn over each other, two mods handling the same event, and anything that shows up
after the first tick are the play session's to find.

## Play session

**Not yet run.** Truls runs it in the client, base only, against the same stage directory
(`.mod-cache/Grado_NonChanging`, staged 2026-09-29), so it uses the release versions in the table
above. The checklist below is written in advance, so what was tried is recorded rather than
remembered. `/editor` is fine for getting items.

1. **Settings → Controls:** note any binding the game marks as conflicting, and the two mods behind
   it.
2. **Settings → Mod settings:** open each tab once.
3. **Open each GUI or tool once:** `helmod`, `FNEI`, `RateCalculator`, `FactorySearch`, `Todo-List`,
   `YARM` (place a resource monitor), `Tapeline`, `solar-calc`, `BlueprintTools`, `SpeedControl`,
   `PipeVisualizer-Updated`.
4. **Use each in-world mod once:**
   - move an entity with `even-pickier-dollies`
   - drag-distribute items with `even-distribution`
   - place a burner entity and watch `Fill4Me` fuel it
   - paste modules with `CopyPasteModules`
   - drive a car (`VehicleSnap`)
   - deconstruct floor tiles (`CleanFloor`)
   - watch a stalled assembler's light (`BottleneckLite`)
   - run a lab (`DiscoScience`)
   - place a lamp (`Brighter-Lamps`)
   - build a train, a fluid wagon and a station (`Automatic_Train_Painter`,
     `automatic-station-painter`, `FluidWagonColorMask`)
   - die once (`WhereIsMyBody`)
5. **One blueprint round trip:** capture, flip, place.
6. **Save, quit to the menu, load the save.** This is the only item that exercises `on_load` and the
   data members keep in the save.
7. **Anything else that looked wrong**, with the mod if it can be told.

Record for each item: what was done, what happened, and a verdict on compatibility Lua for any
conflict.

## Not checked

- **The floor itself.** 2.0.77 is above `base >= 2.0.67`, so this confirms only that the floor is at
  or below 2.0.77. No older build was tried (decided 2026-09-29, #17).
- **Runtime behaviour** beyond the first tick. The play session's checklist is its only coverage.
- **Multiplayer.** No server, no second player, no desync check.
- **The 2.1 line.** These are 2.0 releases on a 2.0 build. The 17-mod watch list in
  `docs/porting-notes.md` is untouched.
- **Mod settings other than the defaults.**
