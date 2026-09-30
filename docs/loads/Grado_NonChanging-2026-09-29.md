# Load record: `Grado_NonChanging`, 2026-09-29

The first recorded **load** of any pack (`CONTEXT.md`, *Load*), for #17. Two loads, both clean. The
**play session** is mostly run: items 1-3 and 6 in full, item 4 in part. It found one key-binding clash, `Alt+Y`, between
`YARM` and `PipeVisualizer-Updated` - see *Conflicts*. Until the session is finished, this record
says little about how the members behave in play.

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

**None found in the loads.** Neither load showed a failure or a warning between any two members.
Compatibility Lua is not needed on this evidence. The play session found one key-binding clash, below.

That verdict covers only what a load can see: the prototype stages and `on_init`. Clashing key
bindings, GUIs drawn over each other, two mods handling the same event, and anything that shows up
after the first tick are the play session's to find.

### Key bindings

**One clash confirmed in play: `Alt+Y`.** `YARM`'s selector and `PipeVisualizer-Updated`'s mouse-over
toggle both default to it. Pressed in the play session, it toggled the pipe visualizer and did not
give the YARM selector. Rebinding YARM's key in the Controls menu fixed it. **Compatibility Lua is not
needed to make the pack usable**, because a player can rebind. Whether the pack should change a
default anyway is open: it would be the first Lua any pack carries, and that decision is Truls's.

**How the list was made.** The game's Controls menu does not mark clashes, because two bindings
on one key are often meant for different situations. So the list comes from the data stage
instead. A `--dump-data` run through the harness's `Invoke-HarnessDump`, with the pack enabled
(base only), gave 85 `custom-input` prototypes. A second dump with every member disabled gave
base's own 14. Each of the other 71 was attributed by finding its name in a member's Lua. Seven keys
are bound by default by more than one:

| Default key | Bound by (`custom-input` name) | Seen in play |
|---|---|---|
| `Alt+Y` | `YARM` (`get-yarm-selector`), `PipeVisualizer-Updated` (`pv-toggle-mouseover`), base (`give-discharge-defense-remote`, a Space Age item) | **clash** - YARM does not fire |
| `Shift+C` | `even-distribution` (`inventory-cleanup`), `BlueprintTools` (`bpt-swap-wire-colors`), `kry-picker-extended` (`picker-copy-chest`) | not tried |
| `Shift+V` | `VehicleSnap` (`VehicleSnap-toggle`), `kry-picker-extended` (`picker-paste-chest`) | not tried |
| `Shift+G` | `BlueprintTools` (`bpt-quick-grid`), `kry-picker-extended` (`toggle-ghost-revive`) | not tried |
| `Shift+T` | `Todo-List` (`todolist-toggle-ui`), `BlueprintTools` (`bpt-set-tiles`) | Todo-List opens; BlueprintTools not seen |
| `Ctrl+R` | `Fill4Me` (`fill4me-keybind-reload`), `kry-picker-extended` (`picker-reverse-belts`) | not tried |
| `Y` | `helmod` (`helmod-recipe-explorer-open`), `PipeVisualizer-Updated` (`pv-visualize-selected`) | not tried |

A shared default is not automatically a clash. Several of these act only in one situation:
`BlueprintTools` with a blueprint in hand, `VehicleSnap` in a vehicle, the Picker chest keys with
a chest under the cursor. Only `Alt+Y` has been seen to fail.

**The list does not cover vanilla controls.** The game's own bindings are not `custom-input`
prototypes, so a member key that collides with a vanilla default does not appear in the dump.

## Play session

**Mostly run, by Truls, in two sittings: 2026-09-29 (about two hours) and 2026-09-30.** In the client (Steam, 2.0.77), base only, against the same
stage directory (`.mod-cache/Grado_NonChanging`, staged 2026-09-29). Its prototype list checksum,
`169335276`, is the same as load 1's, so the play session ran the configuration recorded above. A
hand-written `mod-list.json` in the stage directory turned `space-age`, `quality` and
`elevated-rails` off - without one the game enables them. The second sitting reloaded the first's
save against the same stage directory, and the checksum was the same. Items 1-3 and 6 are done, and
item 4 is done in part. Item 5 and the rest of item 4 are still to run. The checklist was written in advance, so what was tried is recorded rather than remembered.
`/editor` is fine for getting items.

1. **Key bindings.** *As planned:* "Settings → Controls: note any binding the game marks as
   conflicting". *Could not be done that way:* the game marks no clashes. It was done from the data
   dump instead - see *Key bindings* under *Conflicts*.
2. **Settings → Mod settings:** open each tab once. *Done:* all three tabs, from the main menu and
   again when starting a new game. Nothing unusual.
3. **Open each GUI or tool once:** `helmod`, `FNEI`, `RateCalculator`, `FactorySearch`, `Todo-List`,
   `YARM` (place a resource monitor), `Tapeline`, `solar-calc`, `BlueprintTools`, `SpeedControl`,
   `PipeVisualizer-Updated`. *Done:*
   - `helmod`: opens with `U` or `I`, closes with `U` or `Esc`.
   - `FNEI`: opens and closes with `Ctrl+E`, or closes with `Esc`.
   - `RateCalculator`: the selection tool comes with `Alt+X` and goes with `Q`.
   - `FactorySearch`: opens and closes with `Shift+F`.
   - `Todo-List`: opens and closes with `Shift+T`.
   - `Tapeline`: opens and closes with `Alt+M`.
   - `solar-calc`: no default key. Opens from its button.
   - **`YARM`: `Alt+Y` does not give the selector.** It toggles `PipeVisualizer-Updated`'s mouse-over
     instead. With a custom binding, the selector works. See *Key bindings*.
   - `PipeVisualizer-Updated`: `Shift+Y` works - one colour per fluid system. `Alt+Y` (mouse-over
     toggle) made no visible difference: networks looked the same with it on or off. That may be
     the toggle working with nothing to show, or not working. Not settled.
   - `SpeedControl`: works, on keys that read oddly on a Norwegian layout. Its bindings are
     `MINUS` and `EQUALS`, which Factorio names by US key position. On a Norwegian keyboard those are
     `+` (slower) and `\` (faster), each also with `Shift` and `Alt`. It is a layout quirk, not a
     clash.
   - `BlueprintTools`: **no effect seen**, and not every binding was tried. Three of its keys are
     shared (`Shift+G`, `Shift+T`, `Shift+C`), and `Shift+T` opened Todo-List. Its other defaults
     are `Shift+B` (configure), `Alt+I` (import string), and middle-click with `Shift`, `Ctrl` or
     `Shift+Alt` (pipette add, remove, downgrade). Not settled.
4. **Use each in-world mod once.** *Done in part (2026-09-30):*
   - `even-pickier-dollies`: moving an entity works.
   - `even-distribution`: drag-distribution works.
   - `Fill4Me`: a placed burner mining drill was fuelled.
   - `VehicleSnap`: steering snaps when driving a car.
   - `Automatic_Train_Painter`, `automatic-station-painter`: trains and stations were coloured, and
     the colours survived a reload (item 6). That the mods did the painting is inferred from the
     colours, not watched.
   - `ixuAutoSave`: not tried on purpose. The first sitting's first autosave was named
     `_autosave-nonchanging-test` and the later ones `_autosave1`-`3`, which looks like its prefix
     at work. Not confirmed.
   - *Still to run:* paste modules (`CopyPasteModules`), deconstruct floor tiles (`CleanFloor`),
     a stalled assembler's light (`BottleneckLite`), a running lab (`DiscoScience`), a lamp
     (`Brighter-Lamps`), a fluid wagon (`FluidWagonColorMask`), die once (`WhereIsMyBody`).
5. **One blueprint round trip:** capture, flip, place.
6. **Save, quit to the menu, load the save.** This is the only item that exercises `on_load` and the
   data members keep in the save. *Done (2026-09-30):* the first sitting's save loaded in a new game
   process with no error and no mod-mismatch prompt. The session then saved again and reloaded a
   second time. Survived the reload: `YARM` sites, `Todo-List` entries, `SpeedControl`'s game
   speed, and the train and station colours. Not reported: `Tapeline`'s persistent measurements.
7. **Anything else that looked wrong**, with the mod if it can be told. *So far:* nothing reported.
   Neither sitting's `factorio-current.log` has an error or a script message from any mod. The one
   warning, `Time to sync storage to the game state: 2.095 sec`, comes from the game's own blueprint
   library, not from a member.

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
