# Load record: `Grado_NonChanging`, 2026-09-29

The first recorded **load** of any pack (`CONTEXT.md`, *Load*), for #17. Two loads, both clean. The
**play session** is complete (2026-09-30). 24 of the 26 named members were seen working - the two
train painters inferred from the colours, and `PipeVisualizer-Updated`'s `Alt+Y` toggle not
settled. `ixuAutoSave` and `kry-picker-extended` were not confirmed. The save survived a reload
with `YARM`'s, `Todo-List`'s, `SpeedControl`'s and the painters' data, and seemingly `Tapeline`'s.
One key-binding clash turned up: `Alt+Y`, between `YARM` and `PipeVisualizer-Updated` - see
*Conflicts*.

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
| `Alt+Y` | `YARM` (`get-yarm-selector`), `PipeVisualizer-Updated` (`pv-toggle-mouseover`), base (`give-discharge-defense-remote`) | **clash** - YARM does not fire |
| `Shift+C` | `even-distribution` (`inventory-cleanup`), `BlueprintTools` (`bpt-swap-wire-colors`), `kry-picker-extended` (`picker-copy-chest`) | not tried |
| `Shift+V` | `VehicleSnap` (`VehicleSnap-toggle`), `kry-picker-extended` (`picker-paste-chest`) | not tried |
| `Shift+G` | `BlueprintTools` (`bpt-quick-grid`), `kry-picker-extended` (`toggle-ghost-revive`) | `BlueprintTools` fires (quick grid, 2026-09-30); the ghost reviver not checked |
| `Shift+T` | `Todo-List` (`todolist-toggle-ui`), `BlueprintTools` (`bpt-set-tiles`) | Todo-List opens; BlueprintTools not seen |
| `Ctrl+R` | `Fill4Me` (`fill4me-keybind-reload`), `kry-picker-extended` (`picker-reverse-belts`) | not tried |
| `Y` | `helmod` (`helmod-recipe-explorer-open`), `PipeVisualizer-Updated` (`pv-visualize-selected`) | not tried |

A shared default is not automatically a clash. Several of these act only in one situation:
`BlueprintTools` with a blueprint in hand, `VehicleSnap` in a vehicle, the Picker chest keys with
a chest under the cursor. Only `Alt+Y` has been seen to fail.

**The list does not cover vanilla controls.** The game's own bindings are not `custom-input`
prototypes, so a member key that collides with a vanilla default does not appear in the dump.

#### `Alt+Y` measured for the decision (2026-09-30, #71)

What #73 needs, measured rather than read off the one release pair the play session resolved.
Nothing here changes a pack; #73 decides.

**The clash survives upstream, because neither mod has a 2.1 release.** Portal, read 2026-09-30:

| Mod | Newest 2.0 release | Newest 2.1 release | Input | `key_sequence` | `alternative_key_sequence` |
|---|---|---|---|---|---|
| `YARM` | `1.0.5` (2025-01-01) | none | `get-yarm-selector` (`prototypes/prototypes.lua`) | `ALT + Y` | not set |
| `PipeVisualizer-Updated` | `2.4.4` (2025-11-16) | none | `pv-toggle-mouseover` (`data.lua`) | `ALT + Y` | not set |

Both newest 2.0 releases are the ones a 2.0.77 game resolves, and were read from the staged
copies. With no 2.1 release of either, moving the declared line to 2.1 does not end the clash:
it strands both mods, which are already on the 2.1 watch list in `docs/porting-notes.md`.

**Space Age does not widen it: the third claim is base's, and it is live without Space Age.**
*The table above called the discharge-defense remote "a Space Age item" until 2026-09-30. It is
not.* `give-discharge-defense-remote` (`custom-input`, `ALT + Y`, `consuming = "game-only"`,
`action = "spawn-item"`), the `discharge-defense-remote` capsule, its toolbar shortcut and the
`discharge-defense-equipment` technology are all defined in `base` (2.0.77,
`data/base/prototypes/custom-inputs.lua`, `item.lua`, `shortcuts.lua`, `technology.lua`).
`space-age` touches only the equipment's recipe category (`space-age/base-data-updates.lua`), and
neither `space-age`, `quality` nor `elevated-rails` defines a `custom-input`. Two `--dump-data`
runs through `Invoke-HarnessDump`, 2.0.77, against `.mod-cache/Grado_NonChanging`, one base only
and one with `space-age` (so `quality` and `elevated-rails` too), each gave 85 `custom-input`
prototypes and the same three on `ALT + Y`: `give-discharge-defense-remote`,
`get-yarm-selector` and `pv-toggle-mouseover`. So it is a three-way default on every pack from
`Grado_NonChanging` up, with or without Space Age.

What the dump does not say is which fires. `consuming = "game-only"` blocks game events on the
same key and lets other custom inputs fire (API 2.0.77, `ConsumingType`), so base's claim should not
be what stops YARM - but why `pv-toggle-mouseover` wins over `get-yarm-selector`, both
`consuming` unset, was not measured. The base remote's shortcut is `unavailable_until_unlocked`
behind `discharge-defense-equipment`; whether the key spawns the remote before that research, or
after it beside a mod's action, was not tried in play.

**A pack-level override.** Against the pinned docs,
<https://lua-api.factorio.com/2.0.77/prototypes/CustomInputPrototype.html>: "The key associated
with the custom input can be changed in the options. This means that `key_sequence` is simply the
default key binding."

- *Stage.* Prototype stage: set `data.raw["custom-input"]["<name>"].key_sequence` in the pack's
  own data file. The load order "takes into account their dependencies first" (2.0.77,
  `auxiliary/data-lifecycle.html`), so a pack that requires both mods already runs after them.
  Neither mod touches its input after `data.lua`, so `data-updates.lua` would do;
  `data-final-fixes.lua` also would, if a later member were ever to move it again.
- *Which one.* Either is a single field. `YARM`'s is the one that loses today, and the one
  Truls rebound in play. `pv-toggle-mouseover` is also the `associated_control_input` of
  `PipeVisualizer-Updated`'s toolbar shortcut, so moving it changes the key that shortcut shows;
  `YARM`'s shortcut has no associated input. Moving either leaves base's claim on `ALT + Y`. The new
  key would need checking against the dump's list, since seven keys already carry two defaults.
- *Does a player's rebinding survive?* The docs do not say. The evidence is how the binding is
  stored: `%APPDATA%\Factorio\config\config.ini`, `[controls]`, one entry per input name. A key
  left at its default is written commented out, with the default as its value
  (`; get-yarm-selector=ALT + Y`); the one Truls set in play is written live
  (`get-yarm-selector-alternative=CONTROL + SHIFT + ALT + Y`). A player's own key is therefore stored
  by name and apart from the default, which suggests a changed default moves only the commented
  line. That is an inference from the file, not a test: nobody has changed a default under a saved
  rebinding and looked.

## Play session

**Complete, run by Truls in three sittings: 2026-09-29 (about two hours), and two on 2026-09-30.** In the client (Steam, 2.0.77), base only, against the same
stage directory (`.mod-cache/Grado_NonChanging`, staged 2026-09-29). Its prototype list checksum,
`169335276`, is the same as load 1's, so the play session ran the configuration recorded above. A
hand-written `mod-list.json` in the stage directory turned `space-age`, `quality` and
`elevated-rails` off - without one the game enables them. The second sitting reloaded the first's
save against the same stage directory, and the checksum was the same. The third was a side run,
described under item 3's `BlueprintTools`. All seven items are done, though not every member
within them was confirmed - see the intro. The checklist was written in advance, so what was tried
is recorded rather than remembered.
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
   - `BlueprintTools`: **no effect seen** at first. Three of its keys are shared (`Shift+G`,
     `Shift+T`, `Shift+C`), and `Shift+T` opened Todo-List. *Settled 2026-09-30: it works.* With a
     blueprint in hand, `Shift+B` opens the configuration window and `Shift+G` sets a quick grid,
     both in the full pack - so `Shift+G` goes to `BlueprintTools` over `kry-picker-extended`'s
     ghost reviver. Its buttons were there all along, beside the held blueprint and in the library,
     in a spot Truls did not expect and among other mods' buttons. They were first noticed in a
     side run with only `BlueprintTools` and `flib` enabled. Its README still lists grid nudging
     (`Shift+arrows`), but release `1.5.0`'s changelog removed it as "now built into vanilla
     Factorio", so it has no clash with `even-pickier-dollies`' `Shift+arrows`. `Shift+C` and
     `Shift+T` were not retried.

     *The side run changed its own directory.* Loading the #17 save in it made the game's "sync
     mods with save" download all the other members into that directory, at the same releases as
     the table above, and restart with them. The reload in that run was therefore the full member
     set without the pack's own zip. Nothing was saved while any member was missing.
4. **Use each in-world mod once.** *Done (2026-09-30), `ixuAutoSave` excepted:*
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
   - `CopyPasteModules`: pasting machine settings brought the modules too.
   - `CleanFloor`: deconstructing floor tiles works.
   - `BottleneckLite`: a stalled assembler shows a red light.
   - `DiscoScience`: a running lab flashes in the science colours.
   - `FluidWagonColorMask`: a fluid wagon takes a colour.
   - `Brighter-Lamps`: a lamp lights a wider area than vanilla.
   - `WhereIsMyBody`: after a death, a line points to the corpse.
5. **One blueprint round trip:** capture, flip, place. *Done (2026-09-30):* the round trip works,
   with the members loaded. Flipping is vanilla (`H`/`V`), so this checks that no member breaks
   ordinary blueprint handling. `BlueprintTools` is item 3's.
6. **Save, quit to the menu, load the save.** This is the only item that exercises `on_load` and the
   data members keep in the save. *Done (2026-09-30):* the first sitting's save loaded in a new game
   process with no error and no mod-mismatch prompt. The session then saved again and reloaded a
   second time. Survived the reload: `YARM` sites, `Todo-List` entries, `SpeedControl`'s game
   speed, the train and station colours, and `Tapeline`'s measurements (these last "seem to have
   survived", in Truls's words).
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
