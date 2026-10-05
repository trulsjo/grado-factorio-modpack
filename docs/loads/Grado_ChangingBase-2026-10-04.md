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
`cryogenic-science-pack`, `heat-interface`, `infinity-chest` and `infinity-pipe` (the two
`-bacteria` recipes twice each), and `alien-biomes` disables one more tree, `water-cane`. `UltimateResearchQueue2`'s three lines are
timings and differ. The rest are the same.

The times are from one machine (i7-9850H) and one run each. They are context, not a benchmark.

## Conflicts

**None found in the loads.** Neither load showed a failure, or a complaint by one member about
another. Compatibility Lua is not needed on this evidence.

That verdict covers only what a load can see: the prototype stages and `on_init`. Two mods defining
one prototype name load without a word, and the harness loads no sprites. Clashing key bindings,
GUIs drawn over each other and anything after the first tick are a play session's to find. The key
bindings of the 20 members added here were not dumped; the first record's list covers
`Grado_NonChanging`'s only. *Dumped later the same day (#127): see* Key bindings *below.*

### Key bindings (2026-10-04, #127)

The list the play session (#26) starts from, made the way the first record's was
(`docs/loads/Grado_NonChanging-2026-09-29.md`, *How the list was made*). **A shared default is not
a clash**: several of these act only in one situation, and nothing here was pressed.

A `--dump-data` run through the harness's `Invoke-HarnessDump`, with the pack enabled, base only,
on 2.0.77 (prototype list checksum `1028326153`, load 1's) gave **118 `custom-input` prototypes**:
base's own 14, the 71 of `Grado_NonChanging`'s members, which a dump of that pack shows unchanged
here, and **33 that this pack's members add**. 30 of the 33 were attributed by finding the name in
one member's Lua. The other three, `WideChests_rotate-blueprint-clockwise`,
`WideChests_rotate-blueprint-couterclockwise` and `WideChests_merge-tool`, are built from a prefix
in `WideChests`' `init.lua` and defined in its `prototypes/custom_input.lua`.

| Member | Inputs | With a default key |
|---|---|---|
| `bobinserters` | 7 | 7 |
| `EditorExtensions` | 5 | 1 |
| `0-things` (hidden) | 4 | 0 |
| `ModuleInserterEx` | 4 | 4 |
| `underground-pipe-pack` | 4 | 4 |
| `WideChests` | 3 | 0 |
| `AdditionalPasteSettings` | 2 | 2 |
| `cybersyn2` | 2 | 1 |
| `UltimateResearchQueue2` | 2 | 0 |

19 of the 33 have a default key. 11 have none and are linked to one of the game's own controls
(`linked_game_control`), so they fire on whatever key that control has: `0-things`' four on
rotate, reverse rotate and the two flips, `EditorExtensions`' four on open GUI, copy and paste
entity settings and clear cursor, `cybersyn2`'s on clear cursor, and `UltimateResearchQueue2`'s
two on focus search and open technology GUI. `WideChests`' three have no key and no link.

**Six default keys are bound by an input this pack adds and by at least one other input:**

| Default key | Bound by (`custom-input` name) | Seen in play |
|---|---|---|
| `Ctrl+R` | `bobinserters` (`bob-inserter-pickup-rotate`), `underground-pipe-pack` (`rotate-underground-pipe`), and from `Grado_NonChanging`: `Fill4Me` (`fill4me-keybind-reload`), `kry-picker-extended` (`picker-reverse-belts`) | not tried |
| `Ctrl+Shift+R` | `bobinserters` (`bob-inserter-drop-rotate`), `underground-pipe-pack` (`reverse-rotate-underground-pipe`), and from `Grado_NonChanging`: `Fill4Me` (`fill4me-keybind-enable`) | not tried |
| `Shift+E` | `bobinserters` (`bob-inserter-open-gui`), and from `Grado_NonChanging`: `kry-picker-extended` (`picker-manual-inventory-sort`) | not tried |
| `Shift+Alt+left click` | `AdditionalPasteSettings` (`additional-paste-settings-hotkey-alt`), and from `Grado_NonChanging`: `FactorySearch` (`open-search-prototype`) | not tried |
| `Numpad +` | `underground-pipe-pack` (`plus-valve`), and from `Grado_NonChanging`: `kry-picker-extended` (`adjustment-pad-increase`) | not tried |
| `Numpad -` | `underground-pipe-pack` (`minus-valve`), and from `Grado_NonChanging`: `kry-picker-extended` (`adjustment-pad-decrease`) | not tried |

Two of the six are shared inside this pack, `Ctrl+R` and `Ctrl+Shift+R`, and both also with a
`Grado_NonChanging` member. The other four are shared with a `Grado_NonChanging` member only.
**None is shared with one of base's own 14 inputs.** `Ctrl+R` was two inputs in the first record's
table and is four here. The seven keys of that table are all still shared in this pack, `Alt+Y`
with base's `give-discharge-defense-remote` among them, so the dump has twelve shared keys in all.

**The list does not cover vanilla controls.** The game's own bindings are not `custom-input`
prototypes, so a member key that is also an engine default is not in the dump. Four inputs were seen
while reading the game's `config.ini` (2.0.77, `[controls]`, the way #96 did for the first pack),
which is not a full check of the 19: `additional-paste-settings-hotkey` defaults to
`Shift+left click`, which is the engine's build ghost, paste entity settings and cancel
deconstruction; `cybersyn2-click` to left click, which is eight engine controls; and the two
`Numpad` keys above are the engine's larger and smaller terrain building area, which
`kry-picker-extended`'s two inputs are also linked to.

#### Against the engine's own controls (2026-10-05, #135)

The full check the paragraph above did not make, the way #96 made it for `Grado_NonChanging`
(`docs/catalogue/Grado_NonChanging.md`, *Keys against base 2.0.77's own controls*). **A shared
default is not a clash**, and nothing was pressed. Which input acts is #26's.

**The engine's controls** were read from the `[controls]` section of
`%APPDATA%\Factorio\config\config.ini`, the file the 2.0.77 game wrote on 2026-09-30 and #96
read. It holds **192 engine controls** for keyboard and mouse: every control in the section that
is not a `custom-input` in the dump. 163 have a default in the primary slot and 9 in the
alternative. None was rebound, so every default was read from its comment line. Gamepad bindings
were not compared. **The 33 inputs** are from a dump of the staged pack made again today, with the
checksum of #127's, `1028326153`.

**Keys were matched exactly** after putting the modifiers in one order, reading `COMMAND` as
`CONTROL` and ignoring case, in both slots. One spelling had to be bridged: the prototypes write
the numpad keys as `PAD +` and `PAD -`, and the game's file writes `KP_PLUS` and `KP_MINUS`. They
were taken as the same keys. That is not measured: the file has no line written from a `PAD`
spelling. It agrees with `kry-picker-extended`, which gives `adjustment-pad-increase` the key
`PAD +` and links it to the control whose default the file writes as `KP_PLUS`.

**Four of the 19 inputs with a default key share it with an engine control:**

| Member | Input | Default | Engine controls with the same default |
|---|---|---|---|
| `AdditionalPasteSettings` | `additional-paste-settings-hotkey` | `Shift+left click` | 13: `build-ghost`, `paste-entity-settings`, `select-for-cancel-deconstruct`, `remove-pole-cables`, `add-station`, `fast-wait-condition`, `place-in-chat`, `craft-all`, `cancel-craft-all`, `stack-transfer`, `paste-inventory-filter`, `editor-set-clone-brush-destination`, and `move-tag` in its alternative slot |
| `cybersyn2` | `cybersyn2-click` | `left click` | 8: `open-gui`, `build`, `select-for-blueprint`, `drag-map`, `move-tag`, `craft`, `cancel-craft`, `pick-item` |
| `underground-pipe-pack` | `plus-valve` | `Numpad +` | `larger-terrain-building-area` |
| `underground-pipe-pack` | `minus-valve` | `Numpad -` | `smaller-terrain-building-area` |

They are the four the paragraph above had seen. It named three controls for the first; the full
check finds 13. All four inputs have `consuming` at `none`, `cybersyn2-click` by default, under
which the input's event comes before the game's own (API 2.0.77, `ConsumingType`). So both should
act, which was not tried.

**The other 15 share with no engine control**: `bobinserters`' seven (`Ctrl+R`, `Ctrl+Shift+R`,
`Shift+E`, `Shift+L`, `Shift+N`, `Shift+O`, `Shift+P`), `underground-pipe-pack`'s other two
(`Ctrl+R`, `Ctrl+Shift+R`), `ModuleInserterEx`'s four (`Shift+Alt+E`, `Ctrl+I`,
`Shift+Alt+mouse wheel up` and `down`), `EditorExtensions`' `Ctrl+Alt+E` and
`AdditionalPasteSettings`' `Shift+Alt+left click`.

**Eleven are linked to an engine control by design**, apart from the four above. A linked input
has no key of its own and fires on whatever key its control has. Each control named is one of the
192:

| Member | Input | Linked to | That control's default |
|---|---|---|---|
| `0-things` (hidden) | `things-linked-rotate` | `rotate` | `R` |
| `0-things` (hidden) | `things-linked-reverse-rotate` | `reverse-rotate` | `Shift+R` |
| `0-things` (hidden) | `things-linked-flip-horizontal` | `flip-horizontal` | `H` |
| `0-things` (hidden) | `things-linked-flip-vertical` | `flip-vertical` | `V` |
| `EditorExtensions` | `ee-linked-open-gui` | `open-gui` | `left click` |
| `EditorExtensions` | `ee-linked-copy-entity-settings` | `copy-entity-settings` | `Shift+right click` |
| `EditorExtensions` | `ee-linked-paste-entity-settings` | `paste-entity-settings` | `Shift+left click` |
| `EditorExtensions` | `ee-linked-clear-cursor` | `clear-cursor` | `Q` |
| `cybersyn2` | `cybersyn2-linked-clear-cursor` | `clear-cursor` | `Q` |
| `UltimateResearchQueue2` | `urq-focus-search` | `focus-search` | `Ctrl+F` |
| `UltimateResearchQueue2` | `urq-toggle-gui` | `open-technology-gui` | `T` |

`WideChests`' three inputs have no key and no link, so there is nothing to compare.

## Not checked

- **Play.** No play session. #26.
- **The floor itself.** 2.0.77 is above `base >= 2.0.74`, so this confirms only that the floor is at
  or below 2.0.77.
- **`cybersyn2` doing anything.** Its author declares it alpha. It loaded and ran `on_init`; no
  train was dispatched.
- **Key bindings** of this pack's own 20 members. *Dumped 2026-10-04 (#127), under* Key bindings.
  *What is still not checked is which input acts when a shared key is pressed, and the members'
  keys against the engine's own controls.*
  *Checked 2026-10-05 (#135), under* Against the engine's own controls: *four of the 19 keyed
  inputs share a default with an engine control, and eleven are linked to one by design. Which
  input acts is still not checked.*
- **Multiplayer**, **the 2.1 line**, and **mod settings other than the defaults**, as in the first
  record.
