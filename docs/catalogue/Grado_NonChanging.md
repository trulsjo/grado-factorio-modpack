# Catalogue: `Grado_NonChanging`

The quality-of-life pack. Its promise is that it **adds no content**: it may tune vanilla
prototypes, may store its own data in the save, and changes the built factory only when the player
asks it to. Stated once in `CONTEXT.md` under *Promise*, settled 2026-09-22 by #7. The pack was
described here as one that "does not change save state or the factory" until that date; *The
promise* below is where that wording was measured against the members and found false.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-20** and is reproduced from the fetched data rather than retyped, except where a later
date is given inline, such as the notes marked *Superseded 2026-09-23 by #15*.

**All 26 current members have a 2.x release.** None is stranded on 1.1 — nor were the 29 the
survey read on 2026-09-20, before #7 removed three of them. That is not the same as being
installable: see *Six members cannot be downloaded* below, found on 2026-09-22 - at a 2.1 target
only. *On stable 2.0.77 the pack resolves (2026-09-24, #43).*

## Decisions, 2026-09-22 (#7)

Truls ruled on every recommendation. The survey text below is left as written; each affected entry
carries its ruling inline. **29 members to 26.**

| mod | ruling |
|---|---|
| `AfraidOfTheDark` | **out** - adds craftable content, which the promise now forbids |
| `blueprint-sandboxes` | **out** - `EditorExtensions` covers it at the `Grado_ChangingBase` tier |
| `blueprint_flip_and_turn` | **out** - base game since 1.1.0 |
| `Bottleneck` | **replaced** by `BottleneckLite` |
| `MaxRateCalculator` | **replaced** by `RateCalculator` |
| `even-distribution` | kept over `EvenDistributionLite` |
| `Todo-List` | kept over `TaskList` |
| `PickerInventoryTools` | stays dropped - the feature is base-game |
| `kry-picker-complete` | declined |
| everything else | kept as recommended |

**The promise was settled first, because three memberships hung off it.** It is stated once, in
`CONTEXT.md` under *Promise*: `Grado_NonChanging` adds no content - no craftable item, entity or
recipe - may tune vanilla prototypes, may store its own data in the save, and changes the built
factory only when the player asks. The old wording, "does not change save state or the factory", is
retired as false. See *The promise* below for the evidence that produced it.

Two questions were deferred rather than answered, each with its evidence carried forward: candidate
additions that were never in the 1.1 pack, and a night-lighting replacement for `AfraidOfTheDark`.

## In the pack

In dependency-list order.

### `Automatic_Train_Painter`

| | |
|---|---|
| **Title** | Automatic Train Painter |
| **Does** | Colours locomotives and wagons automatically from whatever cargo they carry |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 131,257 |
| **Owner** | `yeahtoast` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **[`TaskList`](https://mods.factorio.com/mod/TaskList) by `raiguard`** — `0.6.0`, `factorio_version` **2.1**, 2026-07-02, 86,183 downloads, described as "simple and unobtrusive". Both are current and on 2.1, four days apart. This is a scope preference, not a maintenance question: the incumbent syncs between players in multiplayer and is three times more used; the alternative is deliberately smaller.

**Recommendation: keep**, unless a simpler interface is preferred over multiplayer sync. A genuine preference call with no wrong answer, which is why it is not resolved here. It writes entity colour, which is save state, but only for trains and only cosmetically.

**Ruled 2026-09-22 (#7): keep.** Both are current, so there is no maintenance argument for churn; multiplayer sync is a feature rather than a footprint. (This entry's *Alternatives considered* compares `TaskList`, which is `Todo-List`'s counterpart, not this mod's - the paragraph is misfiled and the ruling applies to `Todo-List`.)

### `BlueprintTools`

| | |
|---|---|
| **Title** | Blueprint Tools |
| **Does** | Blueprint manipulation: swap wire colours, set tiles, quick-configure hotkey |
| **Latest** | `1.6.0`, `factorio_version` **2.1**, 2026-07-02 |
| **Downloads** | 29,789 |
| **Owner** | `raiguard` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** It is itself the successor to Blueprint Extensions, per its own summary. `raiguard` also maintains `Tapeline` in this pack.

**Recommendation: keep.** Current on 2.1 and operates on blueprints in hand, never on placed entities.

*Against base 2.0.77's own controls (#96, 2026-10-02): `bpt-pipette-add` (`Shift+mouse-button-3`)
shares its default with the map editor's `editor-previous-variation` and `editor-clone-item`, and
`bpt-pipette-remove` (`Ctrl+mouse-button-3`) with the editor's `editor-delete-item`. Which acts
was not tried. For #73; see* Keys against base 2.0.77's own controls.

### `BottleneckLite`

| | |
|---|---|
| **Title** | Bottleneck Lite |
| **Does** | Colours a small status light on each machine so starved or blocked ones are visible at a glance |
| **Latest** | `1.4.1`, `factorio_version` **2.1**, 2026-08-17 |
| **Downloads** | 228,138 |
| **Owner** | `raiguard` |
| **Supersedes** | `Bottleneck` by `trold`, last `0.12.1` on 2024-12-03, 319,119 downloads |
| **Read on** | 2026-09-22 |

**Alternatives considered.** It is itself the alternative — `Bottleneck` was the incumbent and the comparison lives in that entry, under *Ruled out after the port*. Its summary claims "zero runtime overhead and instant response to changes in status", against the original's per-tick polling.

**Recommendation: keep.** Added by #7 on 2026-09-22. Current on 2.1, and it declares `base >= 2.1.0` and `flib >= 0.17.0` — under the pack's 2.1.7 floor, and `flib` was already demanded at that same version by `BlueprintTools` and `Tapeline`, so nothing new entered the pack with it. Its third dependency, `(?) space-exploration-postprocess`, is a hidden optional and pulls in nothing.

### `Brighter-Lamps`

| | |
|---|---|
| **Title** | Brighter Lamps |
| **Does** | Increases the vanilla lamp's light radius, by default from 40 to 70 |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 22,821 |
| **Owner** | `Krydax` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None searched.

**Recommendation: keep**, with the same caveat as `AfraidOfTheDark`: this edits a vanilla prototype, so it changes how an existing factory behaves rather than only how it is displayed.

### `CleanFloor`

| | |
|---|---|
| **Title** | Clean Floor |
| **Does** | Removes ground decoratives when floor tiles are placed over them |
| **Latest** | `2.0.0`, `factorio_version` **2.0**, 2024-10-20 |
| **Downloads** | 124,157 |
| **Owner** | `Skrundz` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None searched. Last touched 2024-10-20.

**Recommendation: keep.** It deletes decoratives, which is map state, but only where the player has already chosen to tile over them.

### `CopyPasteModules`

| | |
|---|---|
| **Title** | Copy Paste Modules |
| **Does** | Carries modules along when machine settings are copy-pasted, instead of settings alone |
| **Latest** | `0.2.1`, `factorio_version` **2.1**, 2026-07-17 |
| **Downloads** | 40,452 |
| **Owner** | `kajacx` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed. The 2.0 fix came from `brandon942` rather than the original author, per the portal description — worth knowing if it goes quiet again.

**Recommendation: keep.** Current on 2.1.

### `DiscoScience`

| | |
|---|---|
| **Title** | Disco Science |
| **Does** | Lights labs in the colours of the science packs they are consuming |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-07-01 |
| **Downloads** | 330,311 |
| **Owner** | `danielbrauer` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed; current on 2.1.

**Recommendation: keep.** Purely cosmetic and the largest download count of the cosmetic members.

*Checked 2026-09-24 (#25): holds.* The file never defines "the cosmetic members", so it was checked
against every member that could be counted as one - `Automatic_Train_Painter` (131,257),
`FluidWagonColorMask` (93,231), `automatic-station-painter` (31,472), `Brighter-Lamps` (22,821)
and, while it was a member, `AfraidOfTheDark` (207,551), all read 2026-09-20. `DiscoScience` is
above all of them, and on 2026-09-24 still leads the next, `Automatic_Train_Painter`, 330,812 to
131,422.

### `FNEI`

| | |
|---|---|
| **Title** | FNEI |
| **Does** | Recipe browser: what makes an item and what an item is used for |
| **Latest** | `0.4.7`, `factorio_version` **2.1**, 2026-07-11 |
| **Downloads** | 360,567 |
| **Owner** | `npo6ka` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** Not compared against `factoryplanner` or `Recipe Book`, which cover overlapping ground. `helmod` is in this pack and overlaps on planning but not on recipe lookup.

**Recommendation: keep.** Current on 2.1.

*Against base 2.0.77's own controls (#96, 2026-10-02): `pressed-fnei-back-key` (`Backspace`)
shares its default with `previous-mod`, "Select previous mod". Which acts was not tried. For #73;
see* Keys against base 2.0.77's own controls.

### `FactorySearch`

| | |
|---|---|
| **Title** | Factory Search |
| **Does** | Searches the factory for items, fluids, entities, signals and tags, and opens results on the map |
| **Latest** | `1.15.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 117,363 |
| **Owner** | `Xorimuth` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed; current on 2.1 and maintained by `Xorimuth`.

**Recommendation: keep.**

### `Fill4Me`

| | |
|---|---|
| **Title** | Fill4Me |
| **Does** | Inserts fuel or ammunition from the player's inventory into entities as they are placed |
| **Latest** | `1.0.2`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 182,030 |
| **Owner** | `kovus` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** It describes itself as the replacement for `Autofill`, so that comparison is already made upstream.

**Recommendation: keep.** Current on 2.1.

### `FluidWagonColorMask`

| | |
|---|---|
| **Title** | Fluid Wagon Color Mask |
| **Does** | Adds a colour mask to the fluid wagon so it can be tinted like other rolling stock |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 93,231 |
| **Owner** | `yeahtoast` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed. Same author as `Automatic_Train_Painter`, and the two are usually wanted together.

**Recommendation: keep.** Cosmetic prototype change; pairs with the train painter.

### `PipeVisualizer-Updated`

| | |
|---|---|
| **Title** | Pipe Visualizer 2.0 |
| **Does** | Draws fluid network layout and contents as an overlay |
| **Latest** | `2.4.4`, `factorio_version` **2.0**, 2025-11-16 |
| **Downloads** | 19,692 |
| **Owner** | `Ashier` |
| **Supersedes** | `PipeVisualizer` by `raiguard`, last `2.2.1` on 2024-03-29, 93,024 downloads |
| **Read on** | 2026-09-20 |

**Alternatives considered.** It is already the replacement for `PipeVisualizer`, made during the port. Original is 1.1-only.

**Recommendation: keep.** Read-only overlay; last touched 2025-11-16.

*Seen in play 2026-09-29 (#17): its default `Alt+Y` clashes with `YARM`'s, and
`PipeVisualizer-Updated` wins. A player can rebind the key. Base's `give-discharge-defense-remote`
defaults to `Alt+Y` too (#71, 2026-09-30). Whether the pack changes a default is open (#73). See
`docs/loads/Grado_NonChanging-2026-09-29.md`, *Key bindings*.*

### `RateCalculator`

| | |
|---|---|
| **Title** | Rate Calculator |
| **Does** | Selects an area and reports the maximum production and consumption rates of what is in it |
| **Latest** | `3.4.1`, `factorio_version` **2.1**, 2026-07-14 |
| **Downloads** | 440,038 |
| **Owner** | `raiguard` |
| **Supersedes** | `MaxRateCalculator` by `Theanderblast`, last `200.0.53` on 2024-11-02, 163,584 downloads |
| **Read on** | 2026-09-22 |

**Alternatives considered.** It is itself the alternative — the comparison lives in the `MaxRateCalculator` entry, under *Ruled out after the port*. Releases run 0.18 through 2.1, and unlike the incumbent it does not exclude Quality.

**Recommendation: keep.** Added by #7 on 2026-09-22. Declares `base >= 2.1.0` and `flib >= 0.17.0`, so it enters under the pack's 2.1.7 ceiling and brings no transitive dependency the pack did not already carry. `helmod`, also a member, overlaps on throughput maths but plans a factory rather than measuring a built one.

### `SpeedControl`

| | |
|---|---|
| **Title** | Speed Control |
| **Does** | Hotkeys and buttons to raise or lower game speed |
| **Latest** | `2.0.1`, `factorio_version` **2.0**, 2024-10-27 |
| **Downloads** | 42,478 |
| **Owner** | `s2upidperson` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None searched.

**Recommendation: keep**, and note it is the member least like the others: changing game speed alters how the game runs rather than what it shows. It does not touch the factory.

### `Tapeline`

| | |
|---|---|
| **Title** | Tapeline |
| **Does** | Measures distances, and can leave persistent adjustable measurement overlays |
| **Latest** | `3.1.0`, `factorio_version` **2.1**, 2026-07-02 |
| **Downloads** | 50,702 |
| **Owner** | `raiguard` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed; current on 2.1, same author as `BlueprintTools`.

**Recommendation: keep.** Persistent measurements are stored in the save but place nothing in the factory.

*Against base 2.0.77's own controls (#96, 2026-10-02): four of its keys are base defaults.
`tl-edit-tape` (`mouse-button-2`) shares with `mine`, `use-item`, `reverse-select`, `craft-5`,
`cancel-craft-5`, `cursor-split` and `open-item`; `tl-delete-tape` (`Shift+mouse-button-2`) with
`alternative-use-item`, `copy-entity-settings`, `alt-reverse-select`, `stack-split`,
`copy-inventory-filter`, `editor-set-clone-brush-source` and `editor-remove-scripting-object`;
`tl-increase-divisor` and `tl-decrease-divisor` (`Alt+mouse-wheel-up` and `-down`) with
`cycle-quality-up` and `cycle-quality-down`. Which acts was not tried.
For #73; see* Keys against base 2.0.77's own controls.

### `Todo-List`

| | |
|---|---|
| **Title** | Todo List |
| **Does** | An in-game todo list, shared between players in multiplayer |
| **Latest** | `19.15.3`, `factorio_version` **2.1**, 2026-06-28 |
| **Downloads** | 279,321 |
| **Owner** | `JasonMiles` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed; current on 2.1.

**Recommendation: keep.**

*Against base 2.0.77's own controls (#96, 2026-10-02): `todo-search-shortcut` (`Ctrl+F`)
shares its default with `focus-search`. Which acts was not tried.
For #73; see* Keys against base 2.0.77's own controls.

### `VehicleSnap`

| | |
|---|---|
| **Title** | VehicleSnap |
| **Does** | Snaps car and tank steering to fixed angles for straight driving |
| **Latest** | `2.0.4`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 294,230 |
| **Owner** | `Zaflis` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed; current on 2.1.

**Recommendation: keep.**

### `WhereIsMyBody`

| | |
|---|---|
| **Title** | Where Is My Body |
| **Does** | Draws a line from the player to their corpses after death |
| **Latest** | `2.0.15`, `factorio_version` **2.0**, 2024-11-19 |
| **Downloads** | 37,332 |
| **Owner** | `darkfrei` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None searched. Last touched 2024-11-19.

**Recommendation: keep.**

### `YARM`

| | |
|---|---|
| **Title** | YARM - Resource Monitor |
| **Does** | Tracks mining sites and reports percentage mined and time to depletion |
| **Latest** | `1.0.5`, `factorio_version` **2.0**, 2025-01-01 |
| **Downloads** | 169,866 |
| **Owner** | `Narc` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed. Last touched 2025-01-01.

**Recommendation: keep.** Stores monitored sites in the save; changes nothing in the factory.

*Seen in play 2026-09-29 (#17): its default `Alt+Y` clashes with `PipeVisualizer-Updated`'s, and
`PipeVisualizer-Updated` wins. A player can rebind the key. Base's `give-discharge-defense-remote`
defaults to `Alt+Y` too (#71, 2026-09-30). Whether the pack changes a default is open (#73). See
`docs/loads/Grado_NonChanging-2026-09-29.md`, *Key bindings*.*

### `automatic-station-painter`

| | |
|---|---|
| **Title** | Automatic Station Painter |
| **Does** | Colours train stations to match the trains that use them |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 31,472 |
| **Owner** | `doktorstick` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None needed; current on 2.1. Pairs with `Automatic_Train_Painter`.

**Recommendation: keep.** Writes station colour, which is save state, cosmetically.

### `even-distribution`

| | |
|---|---|
| **Title** | Even Distribution |
| **Does** | Ctrl-click-drag spreads items evenly across several machines, plus a hotkey to push spare inventory into nearby machines |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-24 |
| **Downloads** | 525,156 |
| **Owner** | `321freddy` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **[`EvenDistributionLite`](https://mods.factorio.com/mod/EvenDistributionLite) by `raiguard`** — `1.5.0`, `factorio_version` **2.1**, 2026-07-02, 52,179 downloads. **This is the one comparison where the incumbent wins on the evidence.** Both are current and both on 2.1, eight days apart. The Lite does ctrl+drag distribution only; this one adds the Inventory Cleanup hotkey that pushes spare inventory into nearby machines, which the Lite has no equivalent for. The download gap is ten to one in the incumbent's favour and both are live, so it is not legacy accumulation this time.

**Recommendation: keep**, unless the Inventory Cleanup hotkey is unwanted — in which case the Lite is the smaller mod doing the part that is used. Recorded because Truls leans toward the Lite; the evidence here leans the other way and both readings are defensible.

**Ruled 2026-09-22 (#7): keep `even-distribution`.** The lean did not survive the Inventory Cleanup hotkey having no equivalent in the Lite.

### `even-pickier-dollies`

| | |
|---|---|
| **Title** | Even Pickier Dollies |
| **Does** | Moves and rotates already-placed entities without rebuilding them |
| **Latest** | `3.0.2`, `factorio_version` **2.1**, 2026-07-24 |
| **Downloads** | 34,554 |
| **Owner** | `hgschmie` |
| **Supersedes** | `PickerDollies` by `Nexela`, last `1.2.6` on 2022-12-15, 53,375 downloads |
| **Read on** | 2026-09-20 |

**Alternatives considered.** It is the replacement for `PickerDollies`, made during the port, and `kry-picker-complete` bundles this same mod — so the two routes agree on it.

**Recommendation: keep.** Current on 2.1, and maintained by `hgschmie`, who also maintains `miniloader-redux` in `Grado_ChangingBase`.

*Against base 2.0.77's own controls (#96, 2026-10-02): `dolly-move-north`, `-east`, `-south`
and `-west` (`Shift+Up`, `Right`, `Down`, `Left`) share their defaults with
`move-blueprint-entities-up`, `-right`, `-down` and `-left`, and `dolly-rotate-rectangle` (`KP_0`)
with the map editor's `editor-toggle-pause`. Which acts was not tried.
For #73; see* Keys against base 2.0.77's own controls.

### `helmod`

| | |
|---|---|
| **Title** | Helmod: Assistant for planning your factory |
| **Does** | Factory planner: computes ingredients, machines, modules, beacons and power for a production target |
| **Latest** | `2.3.3`, `factorio_version` **2.1**, 2026-07-05 |
| **Downloads** | 543,689 |
| **Owner** | `Helfima` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** `MaxRateCalculator` overlaps on throughput but measures rather than plans. Not compared against `factoryplanner`.

**Recommendation: keep.** Current on 2.1 and the second most downloaded member.

**Corrected 2026-09-24 (#25): it is the most downloaded member, not the second.** The recommendation
above is left as the survey wrote it. `helmod` is first of the 26, and was first of the 29 the
survey read: 543,689 against `even-distribution`'s 525,156 in the table above (2026-09-20),
543,866 against 525,364 on 2026-09-21 (the reading issue #25 was filed with), and 544,227 against
525,774 on 2026-09-24. No member has been above it on any reading.

*Against base 2.0.77's own controls (#96, 2026-10-02): `helmod-close` (`Escape`) shares its
default with `toggle-menu`, and `helmod-recipe-selector-open` (`O`) with `open-trains-gui`. Which
acts was not tried. For #73; see* Keys against base 2.0.77's own controls.

### `ixuAutoSave`

| | |
|---|---|
| **Title** | ixuAutoSave |
| **Does** | Configurable autosave frequency and filename prefix |
| **Latest** | `0.1.17`, `factorio_version` **2.1**, 2026-06-27 |
| **Downloads** | 657 |
| **Owner** | `ixu` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **Searched, nothing better found.** *Checked 2026-10-01 (#44, #83): the terms were not recorded. "autosave" and "auto save" over the union of both listings return no mod in the 2.1 listing alone.* At 657 downloads this is by a wide margin the least used mod in the pack — the next lowest has over five times as many. That is a bus-factor observation, not a quality one. *Checked 2026-09-24 (#25): holds.* The next lowest of the 26 is `kry-picker-extended`, 4,127 against 657 on 2026-09-20 and 4,177 against 658 on 2026-09-24 - 6.3 times on both.

**Recommendation: keep**, and know what it is: current on 2.1, but a one-author mod with almost no users. If it goes quiet, base-game autosave settings cover most of what it does.

### `kry-picker-extended`

| | |
|---|---|
| **Title** | Picker Extended Reborn |
| **Does** | The Picker pipette toolkit: planner menu and cycler, belt brush, belt reverser, automatic ghost reviver, inventory sort, chest limiter and more |
| **Latest** | `1.2.4`, `factorio_version` **2.1**, 2026-08-10 |
| **Downloads** | 4,127 |
| **Owner** | `Kryzeth` |
| **Supersedes** | `PickerExtended` by `Nexela`, last `4.1.4` on 2022-05-04, 23,787 downloads |
| **Read on** | 2026-09-20 |

**Alternatives considered.** It is the replacement for `PickerExtended`, made during the port, and states outright that it is the 2.0/2.1 update of `Nexela`'s original. `kry-picker-complete` is its companion pack.

**Recommendation: keep.** Current on 2.1 and, as it turns out, the single most important member for the question below.

*Against base 2.0.77's own controls (#96, 2026-10-02): none of its unlinked keys is a base
default. `picker-select` (`Q`), `adjustment-pad-increase` and `adjustment-pad-decrease` are linked to
`pipette`, `larger-terrain-building-area` and `smaller-terrain-building-area`, so they fire on those
controls' keys by design, whatever they declare. For #73; see* Keys against base 2.0.77's own
controls.

### `solar-calc`

| | |
|---|---|
| **Title** | Solar Calculator |
| **Does** | Calculates solar panel and accumulator counts for a given power demand |
| **Latest** | `0.5.72`, `factorio_version` **2.0**, 2025-12-21 |
| **Downloads** | 84,837 |
| **Owner** | `Kaktusbot` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None searched. Last touched 2025-12-21.

**Recommendation: keep.**

## Dropped during the port

Four mods, and they are one question, not four. See *The Picker family* below.

### `PickerAtheneum`

| | |
|---|---|
| **Title** | Picker Atheneum |
| **Does** | Shared library for the Picker family, plus a few interface tweaks of its own |
| **Latest** | `1.2.5`, `factorio_version` **1.1**, 2022-06-05 |
| **Downloads** | 30,639 |
| **Owner** | `Nexela` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **`kry-picker-extended` does not use it.** Its dependency list is `base`, `kry_stdlib >= 2.2.13` and an optional `ModuleInserterSimplified` — the successor brought its own library. A library with no dependants has nothing to do.

**Recommendation: stay dropped.** Nothing depends on it and nothing would use it. This is the cleanest of the four.

### `PickerBeltTools`

| | |
|---|---|
| **Title** | Picker Belt Tools |
| **Does** | Belt brush and belt reversing |
| **Latest** | `1.2.6`, `factorio_version` **1.1**, 2022-03-20 |
| **Downloads** | 7,224 |
| **Owner** | `Nexela` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **Both features are already in this pack.** `kry-picker-extended`, which is a current member, lists *Belt Brush* and *Belt Reverser* in its own summary.

**Recommendation: stay dropped — already restored.** The feature is present; only the old mod is gone.

### `PickerBlueprinter`

| | |
|---|---|
| **Title** | Picker Blueprinter |
| **Does** | Blueprint-related scripts |
| **Latest** | `1.1.6`, `factorio_version` **1.1**, 2022-06-05 |
| **Downloads** | 6,068 |
| **Owner** | `Nexela` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-20 |

**Alternatives considered.** Partly covered twice over. `kry-picker-extended` provides the Planner Menu, Planner Cycler and Planner Zapper; `BlueprintTools`, also already in this pack, covers wire swapping, tile setting and quick configuration. Neither is a stated feature-for-feature replacement, and the original's portal page lists no feature detail to check against.

**Recommendation: stay dropped**, on the evidence that its ground is covered by two current members. Note the weakness honestly: the original documents almost nothing, so "covered" is inferred from the successors' feature lists rather than from a comparison.

### `PickerInventoryTools`

| | |
|---|---|
| **Title** | Picker Inventory Tools |
| **Does** | Inventory filtering and sorting, and filling requester chests from a blueprint placed in the first slot |
| **Latest** | `1.1.15`, `factorio_version` **1.1**, 2022-06-05 |
| **Downloads** | 9,773 |
| **Owner** | `Nexela` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-20 |

**Alternatives considered.** Partly covered. `kry-picker-extended` lists *Auto Inventory Sort* and a *Chest Limiter*. The requester-chest-from-blueprint trick is the piece with no successor found, and 2.0 added logistic groups, which may or may not cover it — not confirmed.

**Recommendation: reconsider:** whether the requester-chest-from-blueprint feature is still wanted, and if so whether 2.0's logistic groups already provide it. The sorting half is restored; this one feature is the only genuine gap the Picker drops leave in this pack.

**Ruled 2026-09-22 (#7): stay dropped, and the gap does not exist.** The question was never resolved as "is the feature wanted" because it did not need to be: base 2.0 does it. A suggestion asking for exactly it - *"provide a blueprint to a request chest and it automatically request all items in the blueprint"*, 2024-12-13 - was answered the same day by a moderator with *"just drop a blueprint on the 'add section' button"* and moved to Implemented Suggestions; the player-side equivalent is marked *"Implemented in 2.0"*. The wiki confirms requests travel in a blueprint: *"If an entity which uses a logistics group is captured in a blueprint, all of the requests in that group will be stored in the blueprint."*

**A sweep of all 2.x mods by title and summary found nothing reproducing the chest-slot form**, because nothing needs to - `BlueprintRequester`'s own summary reads *"THIS IS A VANILLA MECHANIC! hold the blueprint in hand while clicking 'Add section'"*, and `folk-janitor`'s author heads a section "LOL" conceding the same. Read 2026-09-22. *Checked 2026-10-01 (#44, #83): the terms were not recorded. "requester", "request chest" and "blueprint request" over the union add six mods from the 2.1 listing alone, and none fills a requester from a blueprint. The nearest, `craft-anything`, generates a blueprint that includes a requester chest.*

**What was not checked, named so absence is not read as evidence.** There is no base 2.0.x *changelog* line for this; it rests on the moderator's Implemented ruling plus the wiki. Two residual gaps in the base mechanic are filled by nothing found: blueprint *books* are unsupported, and item-requests nested inside blueprinted entities (turret ammo) can be missed. Neither is what `PickerInventoryTools` did. Separately, a named logistic group that already exists in the world is not overwritten on paste - the entity adopts the existing one.

## Ruled out after the port

Five mods that survived the 1.1 -> 2.0 port and were removed on 2026-09-22 by #7 — by a
decision, not by an upstream gap. Entry format: `docs/mod-catalogue.md`, *a mod ruled out after
the port*. Each keeps the recommendation the survey wrote, with the ruling appended below it, so
what was recommended and what was decided stay separable.

In former dependency-list order.

### `AfraidOfTheDark`

| | |
|---|---|
| **Title** | Afraid Of The Dark (enforced personal lights + more) |
| **Does** | Tunes character, car and locomotive light prototypes, and adds craftable balloon lights and tinted night-vision glasses |
| **Latest** | `1.0.31`, `factorio_version` **2.0**, 2024-10-30 |
| **Downloads** | 207,551 |
| **Owner** | `binbinhfr` |
| **Read on** | 2026-09-20 |
| **Status** | dropped 2026-09-22 (#7) |

**Alternatives considered.** None searched. The mod is current for 2.0 and nothing here needs replacing.

**Recommendation: keep**, but see *The promise* below. This is the one member that adds craftable items and entities rather than only changing how the game is displayed or operated, so it is the clearest candidate for not belonging in this pack at all. Last touched 2024-10-30, which is 2.0-era rather than abandoned.

**Ruled 2026-09-22 (#7): out.** The promise forbids content, and this is the only member that adds any - `balloon-light`, `short-balloon-light` and `perfect-night-glasses`, enabled off the vanilla `lamp` and `night-vision-equipment` technologies. Confirmed from source, not from the portal blurb.

**The "Does" row above was wrong until 2026-09-22 and is corrected.** It read "forces the personal flashlight on". The mod contains no flashlight toggle and no force-on logic; vanilla already keeps the flashlight on permanently and offers no control for it, which is why `FlashlightOnOff` exists to add an *off* switch. What the mod actually does, in `data-updates.lua`, is tune light prototypes - `minimum_darkness` 0.2 against vanilla's 0.3, cone intensity 0.8 against 0.6, personal halo intensity 0.7 against 0.4 and size **100** against 25 - hardcoded in `config.lua` rather than exposed as settings. `data-final-fixes.lua` also sets `fast_replaceable_group = "lamps"` on every lamp.

**Moving it to `Grado_ChangingBase` was decided and then reversed on the evidence.** The collision check came back clean on every count: `bobequipment` restyles the vanilla `night-vision-equipment` technology's icon and hangs two new tiers off it without removing or re-parenting it, so `perfect-night-glasses` sits alongside as a fourth option rather than conflicting; the Angel's mods that touch that technology, `angelsindustries` and `angelsexploration`, are both already dropped; `angelsaddons-cab` uses the prototype *type* under its own `angels-cab` category; MadClown's only references are in the dropped `Clowns-Science`. The mod's own `control.lua` even guards for the technology being absent, and its changelog records why - *"Added a check for removed night vision research"*, v1.0.26.

**What sank the move was reachability, not compatibility.** It declares `factorio_version: 2.0`, and the portal does not serve it to a 2.1 game - `version=2.1&namelist=AfraidOfTheDark` returns `[]`, read 2026-09-22. `Grado_ChangingBase` inherits the 2.1.7 floor, so the move would have installed nothing on any version while handing three overhaul packs a dependency they cannot resolve. It is dropped instead, and recorded as the strongest candidate on the night-lighting ticket: it is the incumbent, and it is leaving over a version field rather than a fault. Its GitHub carries an open issue *"Update for Factorio 2.1"* (2026-08-19), so it may come back.

**Alternatives searched 2026-09-22, none adopted.** Seven candidates, and no clean replacement among them. `realistic-flashlight-fixed` (`0.2.7`, fv 2.0, 2025-10-05, 2,772 downloads) is the closest and the only one verified craftable-free **from source**; it overshoots two knobs (`minimum_darkness` 0.1, cone intensity 0.9) but **does not cover the halo at all** - by default it writes `character.light = {flashlight}`, deleting vanilla's omni light, and even with `rf-enable-light-halo` gives intensity 0.3 at size 40 against 0.7 at size 100. Its 2.1 fork `realistic-flashlight-fixed-fork` (`1.0.0`, 2026-08-13) has 34 downloads. `light-overhaul` (Earendel, 37,337 downloads, `0.3.0`, fv 2.1, 2026-06-24) is categorically larger - global LUT lighting, darker nights, nightvision no longer desaturating, a standalone extract of AAI Industry's lighting - not a like-for-like swap. `adjustable_flashlight` (`0.1.0`, fv 2.0, 2024-10-16, 1,116), `EvenMoreLight` (`0.2.0`, fv 2.0, 2024-10-21, 7,208) and `Pro-Flashlight` (`1.5.9`, fv 2.1, 2026-08-22, 5,941) publish no reachable source, so "adds no craftables" is inferred from their descriptions - which is the inference that was just wrong about this mod.

*Superseded 2026-10-01 (#42): every candidate above, and two new ones, was read from its portal release zip, which is source enough; none adds content. No portal mod reproduces this tune by default, and the recommendation is to ship vanilla night lighting. See* Night lighting: what replaces AfraidOfTheDark's tune *under* Candidates, not members.

### `Bottleneck`

| | |
|---|---|
| **Title** | Bottleneck |
| **Does** | Colours a small status light on each machine so starved or blocked ones are visible at a glance |
| **Latest** | `0.12.1`, `factorio_version` **2.0**, 2024-12-03 |
| **Downloads** | 319,119 |
| **Owner** | `trold` |
| **Read on** | 2026-09-20 |
| **Status** | replaced by `BottleneckLite`, 2026-09-22 (#7) |

**Alternatives considered.** **[`BottleneckLite`](https://mods.factorio.com/mod/BottleneckLite) by `raiguard`** — `1.4.1`, `factorio_version` **2.1**, 2026-08-17, 227,907 downloads. Same job; its summary claims "zero runtime overhead and instant response to changes in status", against the original's per-tick polling. It is a month old where this one is from 2024-12-03, and it is on 2.1 where this one is on 2.0. The download gap (319,119 against 227,907) is legacy accumulation, not current preference: the original ran through 1.1 when the player base was larger.

**Recommendation: replace with `BottleneckLite`.** It is the better-maintained of the two on every reading taken, and the runtime-overhead claim matters in a pack meant to be unobtrusive. This is the strongest replace case in the pack.

**Ruled 2026-09-22 (#7): replaced by `BottleneckLite`.** A second reason emerged after the ruling and points the same way: `Bottleneck` declares `factorio_version: 2.0` and is not served to a 2.1 game, so it was unreachable in a pack whose effective floor is 2.1.7. `BottleneckLite 1.4.1` declares `base >= 2.1.0` and `flib >= 0.17.0`; `flib` is already demanded by `BlueprintTools` and `Tapeline` at that same version, so nothing new enters the pack.

### `MaxRateCalculator`

| | |
|---|---|
| **Title** | Max Rate Calculator |
| **Does** | Selects an area and reports the maximum production and consumption rates of what is in it |
| **Latest** | `200.0.53`, `factorio_version` **2.0**, 2024-11-02 |
| **Downloads** | 163,584 |
| **Owner** | `Theanderblast` |
| **Read on** | 2026-09-20 |
| **Status** | replaced by `RateCalculator`, 2026-09-22 (#7) |

**Alternatives considered.** **[`RateCalculator`](https://mods.factorio.com/mod/RateCalculator) by `raiguard`** — `3.4.1`, `factorio_version` **2.1**, 2026-07-14, **439,485 downloads**, with releases running 0.18 through 2.1. It is the same job, 2.7 times more used, and current where this one is from 2024-11-02. `helmod`, already in the pack, overlaps on throughput maths but plans a factory rather than measuring a built one, so it does not replace either.

**Recommendation: replace with `RateCalculator`.** The incumbent's own portal summary admits it "supports Space Age but NOT anything to do with Quality", and Quality is a 2.0 mechanic this pack's players will meet. A mod that is behind on a core mechanic, less used, and eighteen months staler than an actively maintained equivalent has a weak case.

**Ruled 2026-09-22 (#7): replaced by `RateCalculator`.** `RateCalculator 3.4.1` declares `base >= 2.1.0` and `flib >= 0.17.0`, so like `BottleneckLite` it enters under the pack's 2.1.7 ceiling and brings no new transitive dependency.

### `blueprint-sandboxes`

| | |
|---|---|
| **Title** | Blueprint Sandboxes |
| **Does** | Gives a separate lab-like surface with editor-lite permissions for designing blueprints |
| **Latest** | `3.3.0`, `factorio_version` **2.1**, 2026-07-11 |
| **Downloads** | 117,279 |
| **Owner** | `somethingtohide` |
| **Overlaps** | `EditorExtensions` (`Grado_ChangingBase`) |
| **Read on** | 2026-09-20 |
| **Status** | dropped 2026-09-22 (#7) |

**Alternatives considered.** **[`EditorExtensions`](https://mods.factorio.com/mod/EditorExtensions) by `raiguard`** — `2.6.1`, `factorio_version` **2.1**, 2026-06-26, 139,996 downloads. Its own summary says it "adds a separate editor lab that can be used to design blueprints separately from your main factory", which is this mod's whole job. **And it is already in `Grado_ChangingBase`**, one layer up, so every player of ChangingBase or anything above it already has both. It names `Edit-Blueprints` and `Blueprint Designer Lab` as its own predecessors.

**That optional dependency is not friendly integration. It is a shim for an incompatibility, and it resolves it by switching the other mod's feature off.** `blueprint-sandboxes` states in its own FAQ:

> When Editor Extensions is enabled, its Lab Setting is disabled because it is incompatible with this mod.

and its changelog records when: *"Editor Extensions' Lab setting is forcefully disabled due to compatibility issues"*, version `1.16.6`, 2023-11-06. The `? EditorExtensions >= 2.3.0` line exists to guarantee load order so it can reach in and disable that setting.

**So the two labs never coexist.** With both installed the player gets `blueprint-sandboxes`, and `EditorExtensions`' lab is off. The choice is already being made, silently, in favour of the mod in the lower-promise pack.

#### What `blueprint-sandboxes` delivers that the `EditorExtensions` lab does not

`EditorExtensions`' lab is one paragraph of a mod that is mostly about something else — map-editor conveniences, infinity chests and pipes, cheat mode, a testing scenario. The lab itself:

> Enable the testing lab in the per-player mod settings to teleport to an isolated testing space when entering the map editor. This testing lab will run alongside your actual factory, and you can freely design and test within the lab without cheating in your actual game.

Personal or shared, entered through the map editor. Against that, `blueprint-sandboxes` carries:

| | `EditorExtensions` lab | `blueprint-sandboxes` |
|---|---|---|
| How you enter | through the map editor | its own shortcut, default Shift+B |
| Isolation | one behaviour | two, **Full** and **None**, chosen in settings |
| Remote View (2.0) | not integrated | **Isolation: None is built on it** — sandboxes are viewable from outside, and teammates can see, view and use each other's |
| Undo/redo across the boundary | not stated | works under Isolation: None; resets under Full |
| Research tree | not stated | separate Force under Full, with an all-tech setting; fully synchronized under None |
| Alerts, chat, statistics, logistic and train groups | not stated | synchronized under None, separate under Full |
| Character | not stated | swapped to God-mode under Full; **remains yours** under None |
| Per-team surfaces | shared lab | personal *and* team sandboxes |
| Other | — | daylight slider, tips-and-tricks onboarding, Factorissimo and Space Exploration integrations |

**The answer to the question, plainly: yes, it delivers things the lab does not.** The substantial one is *Isolation: None*, which its own description says was "made possible by the Remote View in 2.0" — a mode where the sandbox is a viewable, shared, undo-continuous part of the same game rather than a place you teleport into. `EditorExtensions` has no equivalent, and could not have had one before 2.0.

**What that does not settle** is whether any of it is wanted. If the sandbox is used as "somewhere to lay out a blueprint alone, occasionally", the lab covers that and the second mod is a mod for nothing. If it is used with someone else, or via Remote View, or with undo carried across, it is not. That is a question about how Truls actually plays, which no amount of portal reading answers.

**Recommendation: reconsider:** which layer the sandbox feature belongs in. Three things point the same way and one points back:

- `EditorExtensions` is in `Grado_ChangingBase`, the layer whose promise *permits* save changes. This mod creates surfaces, which is the heaviest save-state footprint of any member of `Grado_NonChanging` — the layer whose promise forbids exactly that. The feature is arguably sitting one layer too low.
- Everyone from ChangingBase upward already gets `EditorExtensions`, so for four of the five packs this member is redundant capability.
- It is the only member of this pack that duplicates a member of another pack in *function*. `bobinserters` duplicates by *name* across two packs, which is #8's and #9's; this is the other kind, and `docs/mod-catalogue.md` gained a rule for it on 2026-09-21 off the back of this entry. This pack is the lower one, so the comparison above is the one the format says lives here.
- **Against all that:** a player using `Grado_NonChanging` alone gets no sandbox at all if this is dropped, and that is the pack with the most users. Dropping it to remove a redundancy that only exists in the packs above it would take the feature away from the one pack where it is not redundant.

Which layer it belongs in is pack membership, so it is #7's and #8's jointly. Recorded, not settled.

**Ruled 2026-09-22 (#7): out.** `EditorExtensions` does the job alone, and a mod that creates whole surfaces belongs at the tier whose promise permits save changes. `Grado_NonChanging`-only players get no sandbox; that is the accepted cost.

**One consequence lands outside this pack.** `blueprint-sandboxes` has been force-disabling the `EditorExtensions` lab setting since 2023-11-06. Removing it *restores* that lab for `Grado_ChangingBase` and every pack above it - four packs change behaviour, none of them this one. Recorded for #8.

**Checked 2026-09-24 (#25): "the pack with the most users" is unmeasured.** The recommendation
above is left as written. The portal does not support it: of the three existing entries,
`Grado_NonChanging` has the fewest downloads - 20, against `Grado_ChangingBase`'s 21 and
`Grado_ABCX`'s 23 - though a gap of one to three proves nothing either way. Nor does it refute it:
every player of every pack gets this pack as a dependency, and whether the portal counts a
dependency the mod manager fetches as a download of it is not known. The number the sentence needs
is how many play this pack alone, and nothing measures that. It did not decide the ruling: #7 took
the feature away from this pack as an accepted cost.

### `blueprint_flip_and_turn`

| | |
|---|---|
| **Title** | Blueprint Flip and Turn |
| **Does** | Mirrors and flips a blueprint held in hand |
| **Latest** | `200.8.6`, `factorio_version` **2.0**, 2025-01-23 |
| **Downloads** | 59,710 |
| **Owner** | `NovaM` |
| **Read on** | 2026-09-20 |
| **Status** | dropped 2026-09-22 (#7) |

**Alternatives considered.** **Not settled.** Modern Factorio flips blueprints natively, and this mod's own summary already describes a workaround for base-game versions that do so. Whether 2.0's native flipping makes it fully redundant was not confirmed against a primary source — see *What was not checked*.

**Recommendation: keep for now, and re-check before release.** This is the one member with a live chance of being redundant against the base game. Last touched 2025-01-23.

**Ruled 2026-09-22 (#7): out.** The re-check was done and it is redundant. Base Factorio **1.1.0** (2020-11-23) shipped *"Added vertical/horizontal blueprint flipping"*; flip horizontal `H`, flip vertical `V` and rotate `R` are all vanilla keybinds, covering all three operations the mod's name advertises. FFF-442 (2026-06-12) records 2.0 widening base flipping further - pumpjacks and burner miners became flippable, inserter drop-sides flip with the blueprint. The mod claims nothing beyond "mirrors/flips a blueprint in hand" and has no post-2020 feature claims: its releases run `100.8.6` to `101.8.6` to `200.8.6`, the same feature level throughout, last functional change 2020-08, and its 2.0 changelog entry reads in full *"Try to support Factorio 2.0 (Spage Age)"*. No replacement needed and no feature lost.

## Candidates, not members

Every mod #41 names as a candidate addition to this pack, and the two #89 added, assessed against
the pack's promise (`CONTEXT.md`, *Promise*): **no craftable item, entity or recipe**. Entry format:
`docs/mod-catalogue.md`, *a candidate assessed for a pack and not in it*, whose place in the format
#62 has still to confirm. **None of these mods is a member, and nothing here changes a dependency
list.** Every recommendation is only that; membership is Truls's. Every reading in this section was
taken on **2026-10-01**.

**23 distinct mods are named across #41's three sets**: seven by `raiguard`, seven of the nine
mandatory members of `kry-picker-complete` `1.1.0` (the other two, `kry-picker-extended` and
`even-pickier-dollies`, are members already), its nine optional members, and `ghost-counter`.
That makes 24 names, but
`CursorEnhancements` is in both of the first two sets, so it gets one entry, under the raiguard set.
**Four get one sentence each here, not an entry of their own:** three because they already have
an entry in this catalogue, and one because #42 is assessing it.

- **`BottleneckLite`** is a member, added by #7 on 2026-09-22. See its entry under *In the pack*.
- **`EvenDistributionLite`** was assessed by #7 and is **not** a member: `even-distribution` was
  kept over it, because only the incumbent has the Inventory Cleanup hotkey. #41 says it was added
  by #7, which is wrong. See the `even-distribution` entry.
- **`squeak-through-2`** is a mandatory member of `Grado_ChangingBase` (#8, #11), so every player of
  that pack and above already has it. See its entry in `docs/catalogue/Grado_ChangingBase.md`.
- **`adjustable_flashlight`** is a night-lighting candidate, so #42 assesses it. See *Night
  lighting: what replaces AfraidOfTheDark's tune (#42)*.

That leaves **19 entries**, below. *#89 added two more on 2026-10-01, `Kux-BlueprintExtensions` and
`packing-tape`, so the section holds 21.*

**How each one was read:**

- **Content is read from source for all 19.** Each mod's newest release on the 2.0 line and, where
  there is one, on the 2.1 line was downloaded from the portal: 33 zips, 14 mods with both and 5
  with a 2.0 release only. Their data-stage Lua was read: `data.lua`, `data-updates.lua`,
  `data-final-fixes.lua` and whatever they require. Where runtime behaviour bears on the promise,
  the runtime scripts were read too: `AutoDeconstruct`, `ChangeInserterDropLane`,
  `CursorEnhancements`, `MouseOverConstruction`, `Shortcuts-ick`, `ghost-counter` and
  `ore-eraser-2`. No content verdict below is inferred from a portal description. Where the two
  releases differ, the entry says so.
- **Reachability is recorded at both lines.** #41 measures it against an "effective floor 2.1.7".
  That is stale twice over: #16 ruled on 2026-09-24 that the declared line is **2.0**, and on that
  line the pack declares `base >= 2.0.67` (#58). Stable Factorio is 2.0.77. So each entry gives the
  release a 2.0 game installs, with its `base` floor, and whether the portal serves the mod to a
  2.1 game at all, read from `?version=2.1&namelist=<name>`. All 19 have a 2.0 release. **Five are
  not served at 2.1:** `StatsGui`, `QuickbarTemplates`, `WireShortcutX`, `Renamer` and
  `Orphan Finder`.
- **None of the 19 adds a mandatory dependency the chain does not already have.** The mandatory
  dependencies beyond `base` are `flib` (five candidates) and `kry_stdlib` (`kry-vehicle-grids`),
  and both are already hidden members of this pack. A 2.0.77 game resolves them to `flib` `0.16.5`
  and `kry_stdlib` `2.1.2` (`docs/loads/Grado_NonChanging-2026-09-29.md`), and every candidate's
  2.0 release accepts those versions. **One candidate would move the pack's `base` floor:**
  `AutoDeconstruct` `1.0.14` asks `base >= 2.0.68`, one build above the declared `2.0.67`.
- **Key bindings were compared as text, not by a dump.** Each candidate's default `key_sequence`
  was matched against the Lua of every member of the three lower packs, using the releases
  `resolve-modpack.ps1` picked for `Grado_ABC` on line 2.0, build 2.0.77. That is less rigorous
  than the `--dump-data` method in the load record, and like that method it misses vanilla
  controls. *Vanilla controls checked 2026-10-02 (#96): see* Keys against base 2.0.77's own
  controls. Shared keys are recorded in each entry for #73. A shared key is not necessarily a
  clash: of the load record's seven shared keys, only `Alt+Y` has been seen to fail, and four
  were not tried in play.

**Which releases #41's lists come from.** #41's two `kry-picker-complete` lists are its `1.1.0`
release, `factorio_version` 2.1, 2026-07-24. A 2.0.77 game installs `1.0.1` instead, 2025-03-19, and
that release names five mods `1.1.0` does not: `yemtositemcount`, `beltbrush2`,
`belt-reverser-space-age`, `Kux-BlueprintExtensions` and `packing-tape`. They are outside #41 and
were not assessed. *#84 assessed the last two from source on 2026-10-01, under* Outside the bundle
*in `docs/catalogue/Grado_ChangingBase.md`: both are candidates for this pack. #89 assessed both in
this pack's terms on 2026-10-01: their entries follow `ghost-counter`, after #41's 19, and the
table below has a row for each.* `kry-picker-extended` says it switches off its own copies of the first three
features when the standalone mod is present.

**One question is not this survey's to answer.** Five candidates have no 2.1 release. Adding one
would put a new name on the 2.1 watch list on the same day it joined the pack. #7 and #8 kept
*existing* members in that state, on the rule that **unreachability breaks a tie but does not
decide alone**. Whether that rule also covers *additions* is Truls's call. The entries below apply
it as written.

| candidate | set | adds content? | 2.0 release | served at 2.1 | recommendation |
|---|---|---|---|---|---|
| `CursorEnhancements` | raiguard, picker mandatory | no | `2.2.2` | yes | add |
| `StatsGui` | raiguard | no | `1.6.1` | **no** | add |
| `QuickbarTemplates` | raiguard | no | `2.3.0` | **no** | reconsider |
| `MouseOverConstruction` | raiguard | no | `2.0.3` | yes | do not add |
| `BetterAlertArrows` | raiguard | no | `1.1.0` | yes | add |
| `FluidMustFlow` | raiguard | **yes** | `1.4.4` | yes | do not add |
| `ChangeInserterDropLane` | raiguard | no | `1.2.0` | yes | add |
| `belt-visualizer` | picker mandatory | no | `2.0.2` | yes | add |
| `Shortcuts-ick` | picker mandatory | no | `2.0.7` | yes | add |
| `AutoDeconstruct` | picker mandatory | no | `1.0.14` | yes | reconsider |
| `fluid-connection-indicators` | picker mandatory | no | `0.2.7` | yes | add |
| `WireShortcutX` | picker optional | no | `1.3.1` | **no** | do not add |
| `Renamer` | picker optional | no | `2.2.2` | **no** | do not add |
| `Honk` | picker optional | no | `5.1.1` | yes | add |
| `car-finder` | picker optional | no | `2.0.0` | yes | add |
| `Orphan Finder` | picker optional | no | `1.2.2` | **no** | add |
| `ore-eraser-2` | picker optional | no | `0.2.4` | yes | do not add |
| `kry-vehicle-grids` | picker optional | **yes** | `2.2.0` | yes | do not add |
| `ghost-counter` | loose find | no | `2.0.2` | yes | add |
| `Kux-BlueprintExtensions` | picker `1.0.1` only (#89) | no | `3.3.16` | yes | do not add |
| `packing-tape` | picker `1.0.1` only (#89) | no | `20.0.9` | yes | do not add |

**Of #41's 19: eleven `add`, six `do not add`, two `reconsider`. #89's two: both `do not add`,
and both pass the promise as worded, each with a reading that would fail it, named in its
entry.** **Two fail the promise**:
`FluidMustFlow` and `kry-vehicle-grids`. **Failing this pack's promise does not decline a mod
for `Grado_ChangingBase`.** Each entry records what that pack's assessment will need.
#46 assessed `kry-vehicle-grids` there on 2026-10-01 (`docs/catalogue/Grado_ChangingBase.md`,
*Candidates, not members*). `FluidMustFlow` is not a `kry-picker-complete` member, so #46 does not
cover it. #84 assessed it for `Grado_ChangingBase` on 2026-10-01, under *Outside the bundle* in
that file: a candidate for `Grado_ABC`, not for that pack.

In the order of the sets in #41, then #89's two.

### `CursorEnhancements`

| | |
|---|---|
| **Title** | Cursor Enhancements |
| **Does** | Swaps the cursor to a ghost when the held stack runs out and back when the item returns, hand-crafts the held or selected item with `Ctrl+Q`, recalls the last held item with `Shift+Q`, and scrolls through related items with `Shift+Alt+wheel` |
| **Latest** | `2.3.1`, `factorio_version` **2.1**, 2026-06-29. On the 2.0 line: `2.2.2`, 2024-12-17, `base >= 2.0.0`, `flib >= 0.15.0` |
| **Downloads** | 64,558 |
| **Owner** | `raiguard` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** The data stage only declares four `custom-input` prototypes,
and the two releases' data stages are identical. Quick-craft calls `player.begin_crafting`, which is
ordinary hand-crafting, started by a key the player presses. Served at 2.0 and 2.1. Its
`(?) space-exploration` is a hidden optional and pulls in nothing.

**Alternatives considered.** No member does any of the four things. `kry-picker-extended` has a
*Quality Item Scrolling* hotkey, but it scrolls through qualities, not related items. Whether base
2.0 already gives a ghost cursor when a stack runs out was not checked. **Shared keys:**
`Shift+Alt+wheel` up and down are also `ModuleInserterEx`'s defaults (`Grado_ChangingBase`).

**Recommendation: add.** It passes the promise, it is current on both lines, its only mandatory
dependency is already in the pack, and it is the mod `kry-picker-extended`'s own portal page
points players to. The one key overlap affects only the packs from `Grado_ChangingBase` up.

### `StatsGui`

| | |
|---|---|
| **Title** | Stats GUI |
| **Does** | Adds a line of statistics beside the FPS/UPS readout: estimated time to finish research, enemy evolution, playtime, daytime, pollution and position |
| **Latest** | `1.6.1`, `factorio_version` **2.0**, 2024-10-30 |
| **Downloads** | 180,333 |
| **Owner** | `raiguard` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** `data.lua` defines GUI styles and nothing else. The sensors
listed under **Does** are the files in its `scripts/sensor/` directory. On the 2.0 line it asks
`base >= 2.0.0` and `flib >= 0.15.0`. **It is not served at 2.1.**

**Alternatives considered.** No member shows any of these. None searched beyond the members.

**Recommendation: add**, at the declared 2.0 line, knowing it joins the 2.1 watch list. It passes
the promise, overlaps nothing, brings no new dependency and is the most downloaded of the five
2.0-only candidates. Missing 2.1 is the only thing against it, and under the rule above that alone
does not decide. One thing to watch: five of the seven raiguard candidates had a 2.1 release by
2026-07-10, and this one did not.

### `QuickbarTemplates`

| | |
|---|---|
| **Title** | Quickbar Templates |
| **Does** | Exports the quickbar's filters to a blueprint and imports them back, and can apply a default template to every new game |
| **Latest** | `2.3.0`, `factorio_version` **2.0**, 2024-12-18 |
| **Downloads** | 10,682 |
| **Owner** | `raiguard` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** The data stage declares two `sprite`s. On the 2.0 line it asks
`base >= 2.0.23`. **It is not served at 2.1.** Its own page says blueprint and blueprint-book
filters are left out of templates.

**Alternatives considered.** No member does it. Whether base 2.0 keeps quickbar filters across
games was not checked, and the answer decides most of the mod's value.

**Recommendation: reconsider:** whether moving a quickbar layout between saves is part of how Truls
plays. It is a setup tool, used once per game. It has 10,682 downloads, no release since
2024-12-18 and no 2.1 release. Nothing here makes it wrong for
the pack, and nothing makes it needed.

### `MouseOverConstruction`

| | |
|---|---|
| **Title** | Mouse-Over Construction |
| **Does** | While toggled on (`Shift+Y`), revives ghosts, applies upgrades, repairs and deconstructs entities in reach as the cursor passes over them, using items from the player's inventory |
| **Latest** | `2.1.1`, `factorio_version` **2.1**, 2026-07-10. On the 2.0 line: `2.0.3`, 2025-11-05, `base >= 2.0.60`, `flib >= 0.16.0` |
| **Downloads** | 19,477 |
| **Owner** | `raiguard` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** The data stage declares a `custom-input`, a toggle `shortcut`
and a `mod-data` list of ignored entities. In its runtime scripts, `common.build` builds nothing unless
`common.get_item` finds the item in the player's inventory, and `orchestrator.lua` checks
`can_reach_entity`. So it does
what the player could do by hand, and only while they have it switched on. That is inside the
promise. Served at 2.0 and 2.1. The pack's resolved `flib` `0.16.5` meets its 2.0 floor.

**Alternatives considered.** **`kry-picker-extended`, a member, already covers the core of it.**
Its *Automatic Ghost Reviver* places ghosts and ghost upgrades as the player hovers with the item in
hand, toggled on `Shift+G`, and has done since its `1.0.0`, the 2.0 line. Two hover revivers acting
on the same ghost was not tested. **Shared key:** `Shift+Y` is also `PipeVisualizer-Updated`'s
`pv-toggle-overlay`.

**Recommendation: do not add.** Its main feature is already in the pack. What it would add is
repair and deconstruction on hover, and that is small next to a second mod competing for the same
ghosts and a key the pack already uses.

### `BetterAlertArrows`

| | |
|---|---|
| **Title** | Better Alert Arrows |
| **Does** | Replaces the vanilla alert arrow sprite with a redrawn one, with tint and scale as startup settings |
| **Latest** | `1.2.0`, `factorio_version` **2.1**, 2026-07-02. On the 2.0 line: `1.1.0`, 2024-10-23, `base >= 2.0.8` |
| **Downloads** | 28,720 |
| **Owner** | `raiguard` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** The whole data stage is one assignment, to
`data.raw["utility-sprites"]["default"].alert_arrow`. That tunes a vanilla prototype, which the
promise allows. One of its two Lua files differs between the releases, and neither release defines a
prototype. Served at 2.0 and 2.1. It has no dependency except `base`.

**Alternatives considered.** None needed; no member touches alerts.

**Recommendation: add.** It is cosmetic in the way `DiscoScience` and `FluidWagonColorMask` are, it
is current on both lines, and it cannot interact with anything else in the chain.

### `FluidMustFlow`

| | |
|---|---|
| **Title** | Fluid Must Flow |
| **Does** | Adds ducts: very large pipes for moving large volumes of fluid over long distances, with curves, T-junctions, crosses, undergrounds, a non-return duct, intakes and exhausts |
| **Latest** | `1.5.0`, `factorio_version` **2.1**, 2026-06-25. On the 2.0 line: `1.4.4`, 2025-09-22, `base >= 2.0` |
| **Downloads** | 250,559 |
| **Owner** | `raiguard` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: yes, read from source, so it fails this pack's promise.** `prototypes/buildings/`
defines ten entities: six `storage-tank`s, three `pump`s and one `pipe-to-ground`. It also defines
ten items and ten recipes, and `prototypes/technologies.lua` adds a `ducts` technology costing
chemical science that unlocks them. Both releases do this. Served at 2.0 and 2.1.

**For a `Grado_ChangingBase` assessment** - not #46's, which covers `kry-picker-complete`'s
members only; #84 took it up on 2026-10-01, in `docs/catalogue/Grado_ChangingBase.md`. Two
findings, both from source:

- **It integrates with Bob's, but only when three Bob's mods are present.** When `bobelectronics`,
  `bobplates` and `boblogistics` are all loaded, `prototypes/compatibility/bobs-mods.lua` rewrites
  every duct recipe to use `bob-silicon-nitride`, `bob-titanium-plate` and `bob-pump-2`. All three
  mods are `Grado_ABC` members. Whether those three item names still exist in the 2.x Bob's
  releases was not checked. *Checked 2026-10-01 (#84): all three exist in the `2.1.1` releases a
  2.0.77 game installs.* There is no Angel's handling.
- **It claims ground an overhaul already holds.** `boblogistics` (`3.0.2`, 2.1, 2026-09-27)
  describes itself as adding *"many new pipes made from many different materials, spanning 5
  tiers"* and storage tank tiers 2 to 4. Six of the ten duct entities are storage tanks by prototype type. A large
  fluid-transport tier is exactly what `Grado_ChangingBase`'s promise asks that assessment to weigh.

**Alternatives considered.** Not searched; the promise decides this pack.

**Recommendation: do not add** to this pack. It adds craftable entities, recipes and a
technology, which is the one thing this pack's promise forbids.

### `ChangeInserterDropLane`

| | |
|---|---|
| **Title** | Change Inserter Drop Lane |
| **Does** | Switches which lane of a belt an inserter drops onto, with a hotkey (`Shift+L`) on the hovered inserter or ghost |
| **Latest** | `1.3.0`, `factorio_version` **2.1**, 2026-06-25. On the 2.0 line: `1.2.0`, 2025-10-10, `base >= 2.0.0`, `flib >= 0.15.0` |
| **Downloads** | 170,035 |
| **Owner** | `raiguard` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** `data.lua` declares a `custom-input`, a welding particle and
sound, a sprite and a tips-and-tricks entry. `data-updates.lua` sets `allow_custom_vectors` on every
inserter, which tunes existing prototypes. The lane changes only when the player presses the key.
Served at 2.0 and 2.1. Its page calls it a standalone version of a Krastorio 2 feature.

**It switches itself off when `bobinserters` is loaded.** `data.lua`, `data-updates.lua` and
`control.lua` each start by returning if `bobinserters` is present, in both releases.
`bobinserters` is a `Grado_ChangingBase` member: *"Adds hotkeys and a GUI to adjust inserter pickup
and drop locations"*. So this mod would work only for a player on `Grado_NonChanging` alone, and do
nothing in the other four packs. That is the clean way round, and the opposite of what
`blueprint-sandboxes` did to `EditorExtensions` (see its entry). `Shift+L` is also bound by
`bobinserters` and `boblogistics`, but because this mod declares no input when `bobinserters` is
loaded, that is never a clash.

**Alternatives considered.** `bobinserters`, above, which covers the feature from
`Grado_ChangingBase` upward.

**Recommendation: add.** It passes the promise and gives `Grado_NonChanging`-only players a feature
the higher packs already get from `bobinserters`. It steps aside on its own when the two meet, and
its only dependency is already in the pack.

### `belt-visualizer`

| | |
|---|---|
| **Title** | Belt Visualizer |
| **Does** | Highlights every belt connected to the one selected, cycling lanes on repeated presses; ghosts get their own key, and a toggle highlights whatever the cursor hovers |
| **Latest** | `2.1.4`, `factorio_version` **2.1**, 2026-07-07. On the 2.0 line: `2.0.2`, 2024-10-22, no dependencies |
| **Downloads** | 130,043 |
| **Owner** | `_CodeGreen` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** `custom-input`s and one toggle `shortcut`; the highlight is
drawn at runtime. Served at 2.0 and 2.1. Its page says 2.0's lane splitters are drawn as ordinary
belts until the author gets back to it. `_CodeGreen` also wrote `squeak-through-2`
(`Grado_ChangingBase`).

**Alternatives considered.** No member highlights belt lines. **Shared keys:** `Shift+G` is also
bound by `BlueprintTools` (`bpt-quick-grid`) and `kry-picker-extended` (`toggle-ghost-revive`). It
is already shared by those two in the load record, and this would make three. `2.1.4` adds
`Ctrl+G` for the hover toggle, which `ghost-counter` also defaults to. `2.0.2` does not have it, so
at the declared line the two do not share a key.

**Recommendation: add.** It is mandatory in `kry-picker-complete`, current, well used and
read-only. Note the `Shift+G` three-way for #73.

*Against base 2.0.77's own controls (#96, 2026-10-02): `bv-highlight-ghost` (`G`) shares its
default with `toggle-rail-layer` and with `toggle-driving-alternative`, the second slot of
"Enter/leave vehicle", in `2.0.2` and `2.1.4`. Which acts was not tried.
For #73; see* Keys against base 2.0.77's own controls.

### `Shortcuts-ick`

| | |
|---|---|
| **Title** | Shortcuts |
| **Does** | Twenty toolbar shortcuts, each switchable in startup settings: flashlight, chat flare, grid overlay, rail block view, personal logistics toggle, trash unrequested, far zoom, minimap, an environment deconstruction planner, equipment on/off toggles, an artillery jammer, and seven vehicle and train settings including manual mode |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-25. On the 2.0 line: `2.0.7`, 2024-11-15, `base >= 2.0.18` |
| **Downloads** | 68,914 |
| **Owner** | `ickputzdirwech` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none craftable, read from source.** No `recipe` or `technology` prototype appears
anywhere in either release. It adds three kinds of non-shortcut prototype, and none is craftable:

- the jammer, a `selection-tool`;
- `tree-killer`, a copy of the deconstruction planner. Both are flagged `only-in-cursor` and
  `spawnable`, so they come from the toolbar, not a recipe;
- `prototypes/updates-disabled-equipment.lua` makes a `disabled-` copy of every night-vision,
  belt-immunity and active-defense equipment prototype. Each copy has `take_result` set to the
  original, so taking it out returns the real item.

Served at 2.0 and 2.1. Five of its Lua files outside the runtime scripts differ between the two releases, and neither
release has a recipe.

**For other tickets.** Its *flashlight* toggle is relevant to #42: the `AfraidOfTheDark` entry
records that vanilla offers no flashlight control. The equipment copy is generic, so it would
also cover Bob's equipment in `Grado_ABC`. It skips only names starting `disabled`,
`personal-turret-` or `nullius-`. That was read, not loaded.

**Alternatives considered.** Its train manual-mode toggle overlaps `Honk`, below. Whether base 2.0
already ships any of the twenty, such as a personal logistics toggle, was not checked.

**Recommendation: add.** It passes the promise, and it is current, maintained and the most
complete toolbar bundle among the candidates. Its custom inputs have no default keys, so it adds no
key to #73's list.

### `AutoDeconstruct`

| | |
|---|---|
| **Title** | Auto Deconstruct |
| **Does** | When a drill's resources run out, marks it for deconstruction. By default it also marks the chest it fed and the beacons around it, and places pipe ghosts where a fluid-mining drill stood |
| **Latest** | `1.1.2`, `factorio_version` **2.1**, 2026-07-30. On the 2.0 line: `1.0.14`, the same day, **`base >= 2.0.68`** |
| **Downloads** | 364,741 |
| **Owner** | `mindmix` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** The data stage is one `mod-data` blacklist, and both releases
are identical there. Served at 2.0 and 2.1.

**But it changes the built factory without being asked, every time.** `control.lua` acts on
`on_resource_depleted`, which the game raises, not the player. `script/autodeconstruct.lua` then
calls `order_deconstruction` on the drill. Its runtime-global settings default to also removing the
target chest (`autodeconstruct-remove-target`) and beacons (`-remove-beacons`), and to building
pipe ghosts (`-build-pipes`). Belts, tiles and wired entities are off by default. There is no
per-player switch. The only consent is installing the mod.

**And it would raise the pack's floor.** On the 2.0 line it asks `base >= 2.0.68`, one build above
the `2.0.67` the pack declares (#58). That would be a metadata-only change to `info.json`.

**Alternatives considered.** No member does it. None searched beyond the members.

**Recommendation: reconsider:** whether "changes the built factory only when the player asks it to"
admits a mod that acts on its own once installed. The promise was written against tools the player
operates. The nearest precedent is `Automatic_Train_Painter`, which also acts without being asked
and was kept, but it only changes colour. This mod removes entities. That is a reading of the
promise, and the ruling is Truls's. If it is admitted, the mod is the most downloaded of the 19,
current on both lines, and a natural fit for the pack.

If it is not admitted here, #46 recommends adding it to `Grado_ChangingBase`, whose promise has
no "player asks" clause; see that pack's *Candidates, not members* (2026-10-01).

### `fluid-connection-indicators`

| | |
|---|---|
| **Title** | Connection Indicators |
| **Does** | Draws indicators on fluid connections, inserters and mining drills: connected, unconnected, or blocked by another entity |
| **Latest** | `0.2.9`, `factorio_version` **2.1**, 2026-07-01. On the 2.0 line: `0.2.7`, 2025-09-23, `base >= 2.0`, `flib >= 0.13.0` |
| **Downloads** | 3,193 |
| **Owner** | `Soul-Burn` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** Two `sprite`s; the indicators are drawn at runtime. Served at
2.0 and 2.1.

**Alternatives considered.** It partly overlaps `PipeVisualizer-Updated`, a member, which draws a
whole fluid network on demand. This mod instead marks single connections all the time, in its
default lightweight mode only where something needs attention, and it also covers inserters and
drills. `Grado_ChangingBase`'s `PickerPipeTools` entry already found it to be a different feature
from orphan-finding.

**Recommendation: add.** It is read-only, current, and small next to the visualiser it complements.
Its 3,193 downloads are the lowest of the 19, which is a bus-factor note, as for
`ixuAutoSave`, not a quality one.

### `WireShortcutX`

| | |
|---|---|
| **Title** | Wire Shortcuts X |
| **Does** | One shortcut and `Alt+W` to put a wire in hand, cycling red and green (and optionally copper) on repeat presses, with redrawn shortcut icons |
| **Latest** | `1.3.1`, `factorio_version` **2.0**, 2024-11-21 |
| **Downloads** | 9,144 |
| **Owner** | `Xorimuth` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** It declares `sprite`s, a `custom-input` and up to four
`shortcut`s. The `spawn-item` ones give the vanilla `copper-wire`, `red-wire` and `green-wire`
cursor items, which base 2.0 also hands out, so the wires are not free items. **It is not served
at 2.1.**

**Alternatives considered.** Covered twice. Its own page says it only *"adds some functionality
compared to the inbuilt shortcuts in 2.0"*. **And `kry-picker-extended`, a member, absorbed it**: its
changelog for `1.2.1` (2026-07-21) reads *"Integrated Wire Shortcuts X by Xorimuth, adds Alt+W
hotkey to cycle between wires"*. That release is on the 2.1 line. A 2.0.77 game installs
`kry-picker-extended` `1.1.0`, which predates it, so at 2.0 the cycle key is missing. At 2.1 it
returns through the member, and this mod is unreachable there anyway. `Xorimuth` also owns
`FactorySearch`, a member.

**Recommendation: do not add.** At 2.0 it adds one cycling key to vanilla's wire shortcuts. At 2.1
the member provides that and this mod cannot be installed.

### `Renamer`

| | |
|---|---|
| **Title** | Renamer |
| **Does** | `Ctrl+R` over a roboport, lab, train station, locomotive or radar opens a box to rename it, with rich text and a random-name button |
| **Latest** | `2.2.2`, `factorio_version` **2.0**, 2025-02-07 |
| **Downloads** | 8,791 |
| **Owner** | `GotLag` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** One `custom-input` and one GUI style. **It is not served at
2.1.**

**Alternatives considered.** The same story as `WireShortcutX`. `kry-picker-extended` `1.2.1`
*"Integrated Renamer by GotLag"*, on the 2.1 line only, so the member provides it at 2.1 and not at
2.0. Whether base 2.0 can rename these five entity types without a mod was not checked; train
stops, at least, have a name field in vanilla. **Shared key:** `Ctrl+R` is already bound by
`Fill4Me` and `kry-picker-extended` (the load record lists both), and by `bobinserters`
(`Grado_ChangingBase`). This would be a fourth.

**Recommendation: do not add.** Its feature reaches the pack through a member at 2.1, it cannot be
installed there itself, and at 2.0 it would add a fourth binding to `Ctrl+R`, already bound three
times in the chain.

### `Honk`

| | |
|---|---|
| **Title** | Honk |
| **Does** | Trains sound a horn when they start (two honks) and stop (one); `H` and `Shift+H` honk from a locomotive, there is a train manual-mode toggle, and the horns can be added as a programmable-speaker instrument |
| **Latest** | `5.2.1`, `factorio_version` **2.1**, 2026-06-30. On the 2.0 line: `5.1.1`, 2025-03-16, no `base` floor |
| **Downloads** | 120,932 |
| **Owner** | `GotLag`, with source kept by `robot256` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** `sound` and `custom-input` prototypes. `data-final-fixes.lua`
can append a `honk-horns` instrument to the vanilla programmable speaker, behind the startup
setting `honk-speakers`, which tunes a vanilla prototype. Served at 2.0 and 2.1. The manual-mode
toggle defaults to `J` in `5.1.1` and to no key in `5.2.1`. Its page still says `J`.

**Alternatives considered.** `Shortcuts-ick`, above, also has a train manual-mode toggle. **Shared
keys:** no member binds `H`, `Shift+H` or `J`. `H` is also base's flip-horizontal key (see
`blueprint_flip_and_turn`). Base keys are outside the text search, and the two apply in different
situations. *Base keys checked 2026-10-02 (#96): `H` is `flip-horizontal` and `J` is
`connect-train`; see the note at the end of this entry.*
*`J` is also the default of `packing-tape`, a candidate since #89 (2026-10-01); see its entry.*

**Recommendation: add**, as a cosmetic member in the same class as `DiscoScience`. Every train in
the save honks by default. That is a taste question its settings answer, not a promise one.

*Against base 2.0.77's own controls (#96, 2026-10-02): `honk` (`H`) shares its default with
`flip-horizontal` in `5.1.1` and `5.2.1`, and `toggle-train-control` (`J`, `5.1.1` only) with
`connect-train`. Which acts was not tried. For #73; see* Keys against base 2.0.77's own controls.

### `car-finder`

| | |
|---|---|
| **Title** | Car/Tank/Spidertron Locator Button (Find / Locate My Lost Car / Car Finder) |
| **Does** | A toolbar button and `Shift+V` that show where the player left their car, tank, spidertron or modded vehicle, and focus a held spidertron remote's spidertron |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-23. On the 2.0 line: `2.0.0`, 2024-10-21, no `base` floor |
| **Downloads** | 47,036 |
| **Owner** | `jeff.s` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none, read from source.** A `sound`, a `custom-input` and a `shortcut`, identical in both
releases. Served at 2.0 and 2.1.

**Alternatives considered.** No member finds vehicles; `WhereIsMyBody` does the same job for
corpses. **Shared key:** `Shift+V` is already bound by `VehicleSnap` and `kry-picker-extended`.
The load record lists that pair, and this would make three. *`Kux-BlueprintExtensions`, a
candidate since #89 (2026-10-01), binds it too, which would make four with both; see its entry.*

**Recommendation: add.** It is read-only, current and well used. It restores one of the three
features of the dropped `PickerVehicles` (`Grado_ChangingBase`) that no member covers; `Honk` and a
train manual-mode toggle are the other two. Note the
`Shift+V` three-way for #73, four-way if `Kux-BlueprintExtensions` is taken too (#89).

### `Orphan Finder`

| | |
|---|---|
| **Title** | Orphan Finder |
| **Does** | `Shift+O` marks underground belts and pipes near the player that have no connected other end |
| **Latest** | `1.2.2`, `factorio_version` **2.0**, 2025-01-25, no dependencies |
| **Downloads** | 25,905 |
| **Owner** | `GotLag` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none craftable, read from source.** It declares a `custom-input` and an `orphan-arrow`,
a copy of the vanilla `arrow` prototype used as a marker. An `arrow` is an entity type, but this
one has no item or recipe and is placed only by the script. **It is not served at 2.1.** The name
has a space in it, which is also how `info.json` has to spell it. *2026-10-01 (#83, named here by
#90): the function is served at 2.1 under two other names, both 2.1 only. `orphan-finder-v21`
(`ElderAxe`, `1.4.0`, 2026-07-01) is a fork of this mod; `OrphanPin` (`Hellrespawn`, `1.0.2`,
2026-07-14) drops map pins on the orphans instead. Read in `docs/catalogue/Grado_ChangingBase.md`'s
entry for this mod. Which, if either, follows it to the 2.1 release is #86's.*

**Alternatives considered.** `PipeVisualizer-Updated`, a member, shows undergrounds but does not
flag unpaired ones, and does nothing for belts. `fluid-connection-indicators`, above, is a different
feature (#8's reading in `Grado_ChangingBase`'s `PickerPipeTools` entry). Its page names
`underground-pipe-pack` (`Grado_ChangingBase`) as compatible, with one caveat about that mod's
rotation key. **Shared key:** `Shift+O` is also `bobinserters`' (`Grado_ChangingBase`).

**Recommendation: add**, at the 2.0 line, and onto the 2.1 watch list. It is the closest successor
to the orphan finder in `PickerPipeTools`, which `Grado_ChangingBase` dropped (#8). It costs
nothing, and only the missing 2.1 release counts against it, which alone does not decide. The
`Shift+O` overlap affects only the packs from `Grado_ChangingBase` up.

### `ore-eraser-2`

| | |
|---|---|
| **Title** | Ore Eraser |
| **Does** | A toolbar shortcut gives a selection tool that deletes the ore under the selected area, all of it or only one ore type picked by an alt-selection |
| **Latest** | `0.2.5`, `factorio_version` **2.1**, 2026-06-25. On the 2.0 line: `0.2.4`, 2025-04-26, no dependencies |
| **Downloads** | 14,468 |
| **Owner** | `No0Vad` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none craftable, read from source.** The `ore-eraser` `selection-tool` is `hidden`,
`only-in-cursor` and `spawnable`, has no recipe, and is handed out by a `shortcut` that needs no
technology. `control.lua` calls `entity.destroy()` on each `resource` in the selection, returns
nothing to the player, and deletes the tool if dropped. Served at 2.0 and 2.1. The promise does not
exclude it: deleting ore is a map change the player asks for, like `CleanFloor`'s.

**Its one piece of state is kept where the game does not save it.** The alt-select filter,
`filterOnOnlyThis`, is a file-level Lua variable, not a field in `storage`. The runtime API keeps
only `storage` in the save and gives it to joining players. So a filter set before a save is gone
after a reload, and a player who joins while one is set holds different state from the others,
which is a desync. This is the same in both releases. It was read, not reproduced in game.

**Alternatives considered.** Not searched.

**Recommendation: do not add.** Deleting resources for free cannot be undone, and it reaches the
ground `Grado_ABC`'s `rso-mod` and `angelsinfiniteores` lay out, so it is a cheat as much as a
convenience. The `storage` defect is a concrete fault in a mod with little else to recommend it.
The promise itself does not rule it out, and that is said here so the recommendation is not
mistaken for a promise ruling.

### `kry-vehicle-grids`

| | |
|---|---|
| **Title** | Vehicle Equipment Grids |
| **Does** | Gives cars, tanks, trains and modded vehicles equipment grids sized per vehicle, and adds a vehicle-only speed booster in place of exoskeletons in vehicles |
| **Latest** | `2.3.2`, `factorio_version` **2.1**, 2026-09-23, `kry_stdlib >= 2.2.21`. On the 2.0 line: `2.2.0`, 2026-06-09, `base >= 2.0`, `kry_stdlib >= 2.1.1` |
| **Downloads** | 8,247 |
| **Owner** | `Kryzeth` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: yes, read from source, so it fails this pack's promise.** `prototypes/equipment.lua`
copies each exoskeleton technology's recipe, technology, item and equipment into a craftable
vehicle speed booster: `Recipe(...):krycopy`, `Tech(...):krycopy`, `Item(...):krycopy`, at lines
159 to 162 of `2.3.2`. The grids added to vanilla vehicles would only be tuning; the booster is
content. Both releases have the same `data.lua`. Served at 2.0 and 2.1. Its 2.1 release asks
`kry_stdlib >= 2.2.21`, the release that already sets the project's highest 2.1 floor
(`CLAUDE.md`), so it moves nothing. A 2.0.77 game's `kry_stdlib` `2.1.2` meets its 2.0 floor.

**For #46, which assessed it for `Grado_ChangingBase`** on 2026-10-01 and recommends *do not add*
there either; see that pack's *Candidates, not members*. Its content is conditional, read from
`data.lua`:

- **It holds back its own booster when `bobvehicleequipment` or Krastorio 2 is loaded.**
  `bobvehicleequipment` is a `Grado_ABC` member, so in the three overhaul packs the mod adds grids
  and no craftable item.
- **On `Grado_ChangingBase` alone it adds the booster**, because nothing there suppresses it.
- When `bobequipment` and `bobvehicleequipment` are both loaded, `prototypes/category-updates.lua`
  keeps belt immunity, shields, batteries, solar panels and fission reactors out of vehicle grids,
  vanilla and Bob's tiers both, along with anything named `personal`. It names `bobequipment` as a
  hidden optional.

`Grado_ChangingBase`'s `PickerTweaks` entry already named this mod as the successor to that
bundle's vehicle grids.

**Alternatives considered.** `bobvehicleequipment` (`Grado_ABC`), above, for the packs that have it.

**Recommendation: do not add** to this pack. It adds craftable equipment, a recipe and a
technology.

### `ghost-counter`

| | |
|---|---|
| **Title** | Ghost Counter |
| **Does** | Lists the ghosts in a selected area or a held blueprint against what the player carries, and sets a one-time personal logistic request for the shortfall that restores the previous request once met |
| **Latest** | `2.1.1`, `factorio_version` **2.1**, 2026-07-14. On the 2.0 line: `2.0.2`, 2026-06-25, `base >= 2.0.7` |
| **Downloads** | 35,610 |
| **Owner** | `InappropriatePenguin` |
| **Status** | candidate, not a member (#41) |
| **Read on** | 2026-10-01 |

**Content: none craftable, read from source.** Its `selection-tool` is `hidden`, `only-in-cursor` and
`spawnable` and comes from a `shortcut`. Everything else is `sprite`s and a `custom-input`. The
logistic request is a section on the player's own requester point, added when they click for it,
which is the player's data, not the factory. Served at 2.0 and 2.1.

**Alternatives considered.** As #41 says, nothing in the pack does this. `kry-picker-extended`'s
*Held Item Count* shows how many of the held item the player has, and does not count ghosts. **Shared
key:** `Ctrl+G` is also `belt-visualizer` `2.1.4`'s hover toggle, a clash between two candidates and
only on the 2.1 line. No member binds it.

**Recommendation: add.** It passes the promise, overlaps no member, is current on both lines and
has no dependency except `base`. If `belt-visualizer` is added as well, the two need different
keys at 2.1.

### `Kux-BlueprintExtensions`

| | |
|---|---|
| **Title** | Blueprint Extensions (Kux Edition) |
| **Does** | Blueprint tools: flip and rotate a held blueprint, including fluid-mod buildings; clone a blueprint into a new one with a numbered label; swap its wire colours; add or remove landfill under it; snap and nudge its alignment on the number pad |
| **Latest** | `4.3.18`, `factorio_version` **2.1**, 2026-08-14, `Kux-CoreLib >= 4.17.10`. On the 2.0 line: `3.3.16`, 2025-06-29, `Kux-CoreLib >= 3.15.0`, no `base` floor |
| **Downloads** | 11,308 |
| **Owner** | `kuxynator` |
| **Status** | candidate, not a member (#89) |
| **Read on** | 2026-10-01 |

**Content: none craftable, read from source.** Read from `3.3.16`, the zip #84 fetched, whose SHA-1
matches the portal's. `data.lua` declares `custom-input`s, `shortcut`s and sprites, and
`prototypes/items.lua` one `selection-tool`, `Kux-BlueprintExtensions_cloned-blueprint`, with no
recipe. Its state is its own: per-player data in `storage`, and the blueprint being cloned, which
`modules/util.lua` parks as an item on the ground of a 1x1 surface, `surface_of_holding`. It creates
that surface on first use and nothing in the mod deletes it. The promise allows data of the mod's
own in the save, but a surface is more than a `storage` table. `blueprint-sandboxes`, which #7
removed, also created surfaces. Read, not run. It has a 2.1 release.

**It brings a new mandatory dependency, `Kux-CoreLib`** (105,092 downloads, same owner, in no
pack). Its newest 2.0 release, `3.17.8` (2025-06-14), asks `base >= 2.0.55`, below this pack's
`2.0.67`. Its newest release, `4.17.11` (2026-09-15, 2.1), asks `base >= 2.1.12`, below the
project's 2.1 high of `2.1.20`. Beyond `base` it declares only hidden optionals:
`factorissimo-2-notnotmelon`, `even-pickier-dollies` (a member) and `PickerDollies`. They set load
order and pull nothing in, so the chain grows by this one library. Read from `3.17.8`: its data
stage adds no prototype, its settings stage adds one runtime-global logging setting, and its
`control.lua` returns on its first line. Its portal summary tells players not to update it before
the mods that depend on it.

**What it adds over this pack and the base game**, read from `3.3.16`:

- **Already covered.** Flipping a held blueprint has been a base control since 1.1.0, and rotating
  one is too, which is why #7 dropped `blueprint_flip_and_turn` (the 1.1.0 changelog line and its
  date are cited in that entry, above). This mod binds them again, on `Shift+X`, `Shift+V`
  and `Ctrl+Alt+R`. Swapping wire colours is `BlueprintTools`' `Shift+C`, and landfill under a
  blueprint is its `Shift+T` *Set tiles*, whose default tile is `landfill` (`1.5.0`,
  `scripts/player-data.lua`).
- **Fluid-mod flipping, with nothing to act on in this pack.** It flips fluid inputs and outputs
  correctly only for its optional fluid mods. None is a member here. `underground-pipe-pack` is a
  member of `Grado_ChangingBase`, and `FluidMustFlow` a candidate for `Grado_ABC` (#84).
- **Clone.** `Shift+U` with a blueprint in hand gives a selection tool. The selected area becomes a
  new blueprint with the old label and icons, and a version suffix counted up (`v2` to `v3`) or
  added (`actions/updater.lua`). Base 2.0.77 can already re-record a blueprint in place: its core
  locale has *Select new contents for the blueprint* (`reassign-blueprint`). What the clone adds is
  keeping the original and numbering the copy.
- **Snap and nudge.** The number pad snaps the blueprint's anchor to an edge, a corner or the
  centre, and `Ctrl` with the number pad shifts its contents one tile. Whether base 2.0 does either
  was not checked. **Whether the keys bind on 2.0 was not checked either.** `3.3.16` spells them
  `PAD 1` to `PAD 9`. `4.3.18` rewrote them as `KP_1` to `KP_9`, which its changelog records only
  as "Keyboard shortcuts". The one member that binds the number pad, `even-pickier-dollies`, spells
  it `KP_0`.
- **Landfill removal** (`Ctrl+Shift+Alt+L`). Whether `BlueprintTools`' *Set tiles* can also clear
  tiles was not checked.

**Shared keys.** Compared as text, like #41's entries above: against the members' 2.0-line
releases staged for the 2026-09-29 load (`.mod-cache/Grado_NonChanging`), and against the newest
2.0 and 2.1 releases of #41's 19 and #42's 8 night-lighting candidates, and against `packing-tape`, fetched for #89 by the shared
`fetch-mods.ps1`. **`Shift+V` is bound by two members, `VehicleSnap` and `kry-picker-extended`
(`picker-paste-chest`), and by the candidate `car-finder`.** This mod would make three bindings in
the pack as it stands, four with `car-finder`. Its flip acts with a blueprint in hand, `VehicleSnap`
in a vehicle and the Picker paste with a chest under the cursor. The load record did not try
`Shift+V` in play. This is #73's ground. None of its other keys matched. Not covered: vanilla controls,
which a text search cannot see (*checked 2026-10-02, #96, see the note at the end of this
entry*), and `fluid-connection-indicators` `0.2.9`, which the fetch script
could not read. Its `0.2.7` binds no key.

**Alternatives considered.** `BlueprintTools`, a member, above. No wider search: not checked.

**Recommendation: do not add.** It passes the promise as worded, which allows data of the mod's
own in the save. On #7's reasoning for `blueprint-sandboxes`, that "a mod that creates whole
surfaces belongs at the tier whose promise permits save changes", its `surface_of_holding` would
place it in `Grado_ChangingBase` instead; which reading holds is Truls's. What it would add is at the edge of what
the pack has. The fluid-mod flipping has nothing to act on here. The clone is a variant of a base
action. The number-pad keys, its main new feature, may not bind on the declared line. Against that
it brings a mandatory library no pack has, a second blueprint mod beside `BlueprintTools`, a
persistent surface in the save, and a third binding on `Shift+V`.

*Against base 2.0.77's own controls (#96, 2026-10-02): none of its keys is a base default in
`3.3.16` or `4.3.18`. Not checked: whether 2.0.77 reads `3.3.16`'s `PAD 1` to `PAD 9` as the
number pad, which the game's own controls spell `KP_`. The engine's number-pad defaults are `KP_0`,
`KP_PERIOD`, `KP_PLUS`, `KP_MINUS`, and those or `KP_MULTIPLY` with a modifier, so neither
spelling would match one. For #73; see* Keys against base 2.0.77's own controls.

### `packing-tape`

| | |
|---|---|
| **Title** | Packing Tape |
| **Does** | Mining a chest, logistic chest, storage tank, car, tank, spidertron, locomotive, wagon or accumulator puts it in the player's inventory as one item that keeps its contents, fluid, charge, filters and requests, and placing that item rebuilds it |
| **Latest** | `21.0.4`, `factorio_version` **2.1**, 2026-08-14. On the 2.0 line: `20.0.9`, 2026-06-28. Both depend on `base` with no floor, with hidden optionals `quality`, `railloader` and `Transport_Drones` |
| **Downloads** | 15,093 |
| **Owner** | `calcwizard` |
| **Status** | candidate, not a member (#89) |
| **Read on** | 2026-10-01 |

**Content: none craftable, read from source.** Read from `20.0.9`, the zip #84 fetched, whose
SHA-1 matches the portal's. #84 read `21.0.4` as well. `data-updates.lua` adds, for every
player-placeable prototype of the nine types above, a hidden `packing-tape-<item>` with no recipe:
an `item-with-inventory` for chests and logistic chests, an `item-with-tags` for the rest. It sets
`placeable_by` on each source entity and flags the source item `primary-place-result`, which tunes
vanilla prototypes. `data.lua` adds one `custom-input`, `J`, and a toggle `shortcut`. There is one
startup setting, *Allow in rockets cheat*. It has a 2.1 release, no `base` floor and no mandatory
dependency. **It passes the promise as written**, in that nothing it adds is craftable. Its
packed items are items the player can hold, and whether hidden items of that kind count as
content is not something the promise's wording settles.

**What it does in play**, read from `20.0.9`'s `control.lua` and migration, not run:

- **It is on by default, for every player.** `on_player_created` switches the shortcut on for each
  new player. `migrations/18.2.0-shortcuts.lua` switches it on for every player already in the save,
  and the 2.0.77 migrations page says all of a mod's migrations run when it is added to a save.
  `J` toggles it.
- **While it is on, mining a chest that holds anything gives the packed item.** In vanilla the
  contents go to the player's inventory. The same goes for a vehicle or wagon with cargo, a tank
  with fluid and an accumulator with charge. An empty one is mined as normal. Robots pack too, when
  the player who marked the entity for deconstruction had the shortcut on.
- **A chest's contents go into the packed item's own inventory**, so a steel chest's 48 slots take
  one slot of the player's, and a robot carries the lot as one item. Each packed chest weighs
  1,000 t unless the startup setting is on, which keeps it off rockets.
- **Vehicle and wagon cargo goes into a script inventory** (`game.create_inventory`) that only the
  mod's `storage.items` refers to. Fluid and charge go into the item's tags.
- **A packed chest emptied in the inventory turns back into an ordinary chest** (`on_gui_closed`,
  changelog `20.0.4`).
- **The README says packed chests nest**: "Because these chests are items, they can be nested
  infinitely and as such this likely isn't balanced." Not tested. Whether the engine lets one
  item-with-inventory hold another was not checked.

**Quality of life or a rule change: a rule change, on this reading.** Vanilla already lets a player
take a chest's contents by mining it, so what is new is not access but capacity. One inventory
slot holds a whole chest, and the README says even that bound nests away. That changes the rule
the inventory size sets, not the player's interface to it. The promise does not rule it out, and
that is said here so the recommendation below is not mistaken for a promise ruling.

**Removing it from a save: not measured.** No save was made with it and then loaded without it.
What the source suggests, inferred:

- **Every packed item would go.** Their prototypes exist only while this mod is loaded. That the
  game deletes items whose prototype is gone is its general behaviour, not checked here for these
  types. The 2.0.77 migrations page says only that references in `storage` to a removed prototype
  become invalid.
- **A packed chest's contents would go with it**, because they are in its own inventory. So would
  a packed tank's fluid and an accumulator's charge, which are in its tags.
- **Packed vehicle and wagon cargo would become unreachable.** It is in script inventories that
  only this mod's `storage` refers to, and `storage` goes with the mod. The 2.0.77 runtime API gives
  a script inventory a `mod_owner`. What the game does with one whose owner is removed is not
  documented on the pages read.
- **Unpacked entities are ordinary entities** and would not be affected. So the loss would be what
  is packed when the mod is removed, and a player who unpacked everything first would lose nothing.

**Shared key: `J`.** No member binds it, by the same text search as
`Kux-BlueprintExtensions` above. **`Honk` `5.1.1`, the 2.0-line release of another candidate,
defaults its `toggle-train-control` to `J`.** `5.2.1` leaves it unbound. Taking both would put two
toggles on one key on the declared line. This is #73's ground. Vanilla controls are not covered.
*Superseded 2026-10-02 (#96): base's `connect-train` defaults to `J` too, so taking both would put
three controls on it, with only this mod's two toggles new; see the note at the end of this entry.*

**Overhaul fit**, #84's reading: its `blacklist.lua` excludes every entity matching `^WideChests`,
and other modded chests, including those of `angelsaddons-storage` and `boblogistics`
(`Grado_ABC`), are packed generically. Not loaded.

**Alternatives considered.** None searched: not checked.

**Recommendation: do not add.** It passes the promise as written, but it changes how much an
inventory holds rather than how the player handles it. It is on for every player, its own
author calls it likely unbalanced, and removing it is inferred to delete whatever is packed at the
time. If it is taken anyway, `Honk` `5.1.1` needs a different key for its train toggle, or this mod
does.

*Against base 2.0.77's own controls (#96, 2026-10-02): `packing-tape-pickup` (`J`) shares its
default with `connect-train`, in `20.0.9` and `21.0.4`. `Honk` `5.1.1` binds `J` too. Which acts
was not tried. For #73; see* Keys against base 2.0.77's own controls.

### Night lighting: what replaces AfraidOfTheDark's tune (#42)

#7 dropped `AfraidOfTheDark` on 2026-09-22 for its craftable content. Its other half, a prototype
tune, was wanted, and #42 asks what replaces it, or for a recorded decision that the pack ships
vanilla night lighting. Each candidate below is measured against what the tune set, not against
"does it do lighting". The five knobs are the four in #42 plus the lamp `fast_replaceable_group`.
Vanilla values were read on 2026-10-01 from the installed game, 2.0.77, in
`data/base/prototypes/entity/entities.lua`:

| knob | vanilla 2.0.77 | where | `AfraidOfTheDark` `1.0.31` |
|---|---|---|---|
| `minimum_darkness` (when lights come on) | 0.3 | character lights, lines 948 and 955 | 0.2 |
| cone intensity | 0.6 | character cone, line 966 | 0.8 |
| personal halo intensity | 0.4 | character omni light, line 949 | 0.7 |
| personal halo size | 25 | same light, line 950 | **100** |
| lamp `fast_replaceable_group` | `"lamp"` | `small-lamp`, line 2871 | `"lamps"` on every lamp |

**There is a new reading: the tune was wider than #42's table.** `data-updates.lua` in `1.0.31`
does three more things. It runs the same function over every `car`, which in vanilla means `car`
and `tank`. Those have two cones and no omni light (`entities.lua` 4033-4068), so each one gains a
**0.7 / size 100 halo** and 0.8 cones. It runs it over every `locomotive`'s `front_light` too, with
the same result. And it gives every locomotive's `stand_by_light` an extra omni light of 0.35 /
size 20. The stand-by and back lights carry `add_perspective = true` in vanilla
(`trains.lua` 48-66), so the tune leaves their intensity alone and only lowers their
`minimum_darkness`. A replacement that covers the character alone restores less than the pack lost.

**The fifth knob does nothing in this pack.** Base 2.0.77 defines one lamp, `small-lamp`.
Renaming its group to `"lamps"` only matters once a mod adds another lamp, and
`AfraidOfTheDark`'s reason was its own balloon lights. `Grado_NonChanging` adds no content, so no
member adds a lamp. Whether any lamp in the overhaul packs would want the group was not checked.
`Brighter-Lamps`, already a member, does not touch the group either. Its `2.0.0` and `2.1.0`
releases are identical code: they set `small-lamp`'s `light.size` from a startup setting,
default 70 against vanilla's 40, and nothing else.

**Search, 2026-10-01.** The 2.0 listing returns 9,791 mods and the 2.1 listing 4,334. Their union
is 10,845, so 1,054 mods are served only at 2.1, and the search ran over the union. Name, title and
summary were matched against `flashlight`, `night vision`, `darkness`, `dark`, `night`,
`nighttime`, `personal light`, `light radius`, `brighter`, `headlight`, `lighting` and
`light cone`, which returned 65 mods. A second pass on `light` alone and a third on
`fast replace`, `halo`, `omni`, `character light` and `player light` turned up no further
candidate. Two candidates are new against #42: `afraid-of-the-dark` and `anti-gloom`. Both get
entries below. Every candidate's source was read from the portal release zip, downloaded with
SHA-1 checked against the portal. So every content verdict below comes **from source**, including
the four #42 had to infer. Reachability was read three ways for each: `/api/mods/<name>/full` for
the release list, then `namelist=<name>` at `version=2.0` and again at `version=2.1`.

**`AfraidOfTheDark` itself.** Its entry is under *Ruled out after the port*, and #7's ruling
stands. These are new readings against it, read 2026-10-01, kept here rather than as a
second entry. What is new since 2026-09-22:

- **Reachability.** It is served at 2.0 (`1.0.31`) and not at 2.1, read 2026-10-01, which is
  unchanged. What *has* changed is the declared line. #16 set it to `2.0` for the first release
  (applied by #58 on 2026-09-24), and the `Grado_ChangingBase` floor is now `base >= 2.0.74`, no
  longer the 2.1.7 the 2026-09-22 ruling measured against. **The objection that sank the move to
  `Grado_ChangingBase` does not hold on the 2.0 line.** It comes back when the 2.1 release does.
- **The GitHub "Update for Factorio 2.1" is a pull request, not an issue.** It is
  `StephanSteinert/AfraidOfTheDark#8`, by `pla`, opened 2026-08-19, still open with no comments on
  2026-10-01. It changes `factorio_version` to 2.1, bumps the version to `1.0.32` and adds a
  changelog line, and does nothing else. The repository's last push was 2024-11-01. An open issue,
  #7, *"Mod is incompatible with Factorio v2"* (2026-01-05), has an empty body.

**For this pack, nothing changes.** The content half still fails the promise,
and nothing about that has changed. The new reading belongs to `Grado_ChangingBase`'s membership:
the reachability reason for leaving it out is void on the declared 2.0 line, and the collision
check was already clean. That is #8's pack and a decision for Truls, so this entry only names it.

#### `realistic-flashlight-fixed`

| | |
|---|---|
| **Title** | Realistic Flashlight Fixed |
| **Does** | Replaces the character's and vehicles' light cones with a longer, brighter cone sprite, and by default removes the character's halo |
| **Latest** | `0.2.7`, `factorio_version` **2.0**, 2025-10-05 |
| **Downloads** | 2,781 |
| **Owner** | `actioninja` |
| **Status** | candidate, not a member (#42) |
| **Read on** | 2026-10-01 |

**Against the knobs**, from `script/realistic-flashlight.lua`:

- `minimum_darkness` is 0.1, so the lights come on before `AfraidOfTheDark`'s 0.2.
- Cone intensity is 0.9 against 0.8.
- **The halo is off by default.** `character.light = {flashlight}` deletes vanilla's 0.4 / 25
  omni light. With the startup setting `rf-enable-light-halo` it comes back at 0.3 / 40, which is
  still below vanilla's intensity and nowhere near 0.7 / 100.
- The lamp group is untouched.

Vehicles get a 1.0 cone, and a 0.2 / 30 halo only behind `rf-enable-vehicle-light-halo`. Car,
tank, spidertron and locomotive lights are all *replaced*. **No content**: there is no
`data:extend` outside `settings.lua`.

**Reachability.** Served at 2.0 (`0.2.7`). Not served at 2.1: there is no 2.1 release.

**Alternatives considered.** `realistic-flashlight-fixed-fork`, below.

**Recommendation: do not add.** By default it makes the character's surroundings darker than
vanilla, which is the opposite of the tune. The setting that softens this cannot be shipped by a
pack, because startup settings live in each player's `mod-settings.dat`.

#### `realistic-flashlight-fixed-fork`

| | |
|---|---|
| **Title** | Realistic Flashlight Fixed Fork |
| **Does** | The same as `realistic-flashlight-fixed`, rebuilt for 2.1 |
| **Latest** | `1.0.0`, `factorio_version` **2.1**, 2026-08-13 |
| **Downloads** | 40 |
| **Owner** | `NOiZE` |
| **Status** | candidate, not a member (#42) |
| **Read on** | 2026-10-01 |

**Against the knobs.** The same as `realistic-flashlight-fixed`. A `diff` of the two release zips
shows the Lua differing only in the two `__mod-name__` graphics paths, plus `info.json` and the
changelog. **No content.**

**Reachability.** Served at 2.1 only, with a single release. Not served at 2.0, which is the
declared line.

**Alternatives considered.** `realistic-flashlight-fixed`, above.

**Recommendation: do not add.** It has the same knob problem as its parent, and is unreachable on
the line the pack declares.

#### `light-overhaul`

| | |
|---|---|
| **Title** | Light Overhaul |
| **Does** | Replaces the night colour lookup tables with darker, higher-contrast ones, widens the character's and cars' flashlight sprite, and stops night vision desaturating |
| **Latest** | `0.3.0`, `factorio_version` **2.1**, 2026-06-24 |
| **Downloads** | 37,617 |
| **Owner** | `Earendel` |
| **Status** | candidate, not a member (#42) |
| **Read on** | 2026-10-01 |

**Against the knobs**, from `prototypes/light.lua`:

- `minimum_darkness` stays at 0.3.
- Cone intensity stays at 0.6. Only the sprite changes, to a 512-pixel torch at scale 1.5 against
  vanilla's 200-pixel cone at scale 2, so the cone is wider but no brighter.
- **The halo is replaced**, by an oriented "pin" sprite light, intensity 0.4. It is a different
  kind of light, not a larger omni light.
- The lamp group is untouched.

The default `night-lut-set` is `"Dark"`, so **nights get darker**, as the mod's summary says. It
writes the global `daytime_color_lookup`. **No content.** This was inferred on 2026-09-22 and is
now read from source: there is no `data:extend` outside `settings.lua`.

**Reachability.** Served at 2.0 (`0.2.2`, 2024-11-02, `base >= 2.0.0`) and at 2.1 (`0.3.0`,
`base >= 2.1.7`). `0.2.2` and `0.3.0` contain the same Lua.

**Alternatives considered.** The rest of this subsection.

**Recommendation: do not add.** It is well kept and reachable on both lines, but it moves the
night the other way, and it changes how every surface looks rather than how far the player sees.

#### `EvenMoreLight`

| | |
|---|---|
| **Title** | EvenMoreLight |
| **Does** | Replaces the character's, car's, tank's and locomotive's lights with a single large omni light each |
| **Latest** | `0.2.0`, `factorio_version` **2.0**, 2024-10-21 |
| **Downloads** | 7,227 |
| **Owner** | `Woetoo` |
| **Status** | candidate, not a member (#42) |
| **Read on** | 2026-10-01 |

**Against the knobs**, from `data.lua`, which is the whole mod at 63 lines:

- `minimum_darkness` stays at 0.3.
- **There is no cone at all.** `character.light` is overwritten with one omni light, so the
  flashlight disappears.
- The halo is 0.9 / size 60.
- The lamp group is untouched.

`car`, `tank` and `locomotive` lose their cones the same way, and each gets a 0.9 / 60 omni light,
two of them on the locomotive's front light. **No content.** This was inferred on 2026-09-22 and
is now read from source.

**Reachability.** Served at 2.0 (`0.2.0`). Not served at 2.1: there is no 2.1 release.

**Alternatives considered.** The rest of this subsection.

**Recommendation: do not add.** It trades the cone for the halo and has no 2.1 release.

#### `adjustable_flashlight`

| | |
|---|---|
| **Title** | Adjustable Flashlight |
| **Does** | Rebuilds the character's halo and cone from four startup settings |
| **Latest** | `0.1.0`, `factorio_version` **2.0**, 2024-10-16 |
| **Downloads** | 1,123 |
| **Owner** | `_CodeGreen` |
| **Status** | candidate, not a member (#42; routed here by #41) |
| **Read on** | 2026-10-01 |

**Against the knobs**, from `data-updates.lua` and `settings.lua`:

- `minimum_darkness` is hardcoded at 0.3, the vanilla value.
- Cone intensity is a setting, `cone-intensity`, default 0.6.
- Halo intensity is a setting, `area-intensity`, default 0.4.
- Halo size is a setting, `area-size`, default 25.
- The lamp group is untouched.

**Every default is vanilla**, the cone's shift included: `-6.5 * cone-size` gives -13 at the
default size 2, which is vanilla's `{0, -13}`. Only `data.raw.character.character` is touched, so
cars and locomotives stay vanilla. **No content.** This was inferred on 2026-09-22 and is now read
from source.

**Reachability.** Served at 2.0 (`0.1.0`). Not served at 2.1: there is no 2.1 release. It has not
been touched since 2024-10-16.

**Alternatives considered.** The rest of this subsection. It is the only candidate whose knobs
reach `AfraidOfTheDark`'s character values: 0.8, 0.7 and 100, with `minimum_darkness` staying at
0.3.

**Recommendation: reconsider:** whether a member that does nothing until a player changes its
settings is worth carrying. As a pack member it is invisible: the pack cannot ship setting values,
so every player starts at vanilla and has to set 0.8 / 0.7 / 100 themselves. Getting those values
by default would take a `settings-updates.lua` in the pack that rewrites the mod's
`default_value`s. That is Lua which is not glue between two members, and *What a modpack is here*
in `CLAUDE.md` rules that out. It would also be an 18th member on the 2.1 watch list.

#### `Pro-Flashlight`

| | |
|---|---|
| **Title** | Pro Flashlight |
| **Does** | Turns the standing character to face the entity under the cursor, adds a flashlight toggle key, and turns the flashlight off in map view |
| **Latest** | `1.5.9`, `factorio_version` **2.1**, 2026-08-22 |
| **Downloads** | 5,973 |
| **Owner** | `MrAlwaysAwesome` |
| **Status** | candidate, not a member (#42) |
| **Read on** | 2026-10-01 |

**Against the knobs.** It turns none of them. `data.lua` defines only a `custom-input`,
`flashlight-toggle` on `SEMICOLON`, and a `sound`. Everything else happens at runtime in
`control.lua`. **No content.** This was inferred on 2026-09-22 and is now read from source.

**A defect, read from source and not tested in game.** `control.lua` keeps per-player state in a
Lua variable named `global`. 2.0 renamed the saved table to `storage`, so that state is not saved
with the game. `control.lua` also loops over every player on every tick.

**Reachability.** Served at 2.0 (`1.5.8`, 2025-10-07) and at 2.1 (`1.5.9`). The two releases have
the same Lua.

**Alternatives considered.** `flashlight-pointer` (`1.3.2`, fv 2.0, 2026-06-17, 462 downloads)
does the facing half alone. It is 24 lines of `control.lua`, read from source.

**Recommendation: do not add.** It is not a lighting tune, so it cannot replace one.

#### `afraid-of-the-dark`

| | |
|---|---|
| **Title** | Bright Universe |
| **Does** | Swaps each planet's day/night colour lookup for a brighter preset, one startup setting per planet |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-07-01 |
| **Downloads** | 8,545 |
| **Owner** | `RedRafe` |
| **Status** | candidate, not a member (#42) |
| **Read on** | 2026-10-01 |

**Not `AfraidOfTheDark`.** The portal name differs only in case and hyphens, and a dependency
line typed from memory could resolve to the wrong mod.

**Against the knobs.** It turns none of them. `data-updates.lua` writes
`planet.surface_render_parameters.day_night_cycle_color_lookup` for `nauvis`, `vulcanus`,
`fulgora`, `gleba` and `aquilo`, wherever the planet exists. The default for each is `"bright"`,
which uses the sunset lookup at night. **No content.**

**Reachability.** Served at 2.0 (`2.1.0`, 2024-10-30) and at 2.1 (`3.0.0`). The two releases have
the same Lua.

**Alternatives considered.** `anti-gloom`, below.

**Recommendation: do not add** as a replacement. It changes how night looks, not how far the
player sees, and its name is a trap beside the mod it would be replacing.

#### `anti-gloom`

| | |
|---|---|
| **Title** | AntiGloom: Brighter, Less Dark Nights |
| **Does** | Replaces the global night colour lookups (normal view, zoom-to-world, night vision) with lookups 0-100% of the way from night to day, in steps of 10, default 30% |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 6,165 |
| **Owner** | `jeff.s` |
| **Status** | candidate, not a member (#42) |
| **Read on** | 2026-10-01 |

**Against the knobs.** It turns none of them. It writes `daytime_color_lookup` and
`zoom_to_world_daytime_color_lookup` in `utility-constants`, plus the night-vision lookup.
**No content.**

**Reachability.** Served at 2.0 (`2.0.0`, 2024-10-21) and at 2.1 (`2.1.0`). The diff between them
is `info.json`, the changelog and one added `luts/core` directory.

**Alternatives considered.** `afraid-of-the-dark`, above. Two more mods brighten night by colour
lookup alone and are also set aside: `light-overhaul` with its `"Bright"` set, and
`Rohlinheatagtmuf_Hdhaotaotfnllsape-atnsasri` (`3.210.1`, fv 2.1, 3,033 downloads), which works
per planet with a night-vision lookup.

**Recommendation: do not add** as a replacement for the tune: it answers a different question. If
the goal is "nights less dark" rather than "restore `AfraidOfTheDark`", this is the cleanest mod
found. It is content-free, configurable, current on both lines, and its effect is graphical only.

#### Searched and set aside

These are read from source, one line each, because none comes near the knobs or the promise:

- `rd-antidark` (`1.1.0`, fv 2.0, 177 downloads) adds `ad-area-light`, `ad-solar-light`, a
  technology and recipes. It is content.
- `NightvisionOverhaulSpaceAge` (`1.1.1`, fv 2.1; `0.8.3` at 2.0; 2,064 downloads) adds night
  vision MK2 and MK3 as items and recipes. It is content.
- `nocturnal` (`0.0.3`, fv 2.0, 213 downloads) sets `freeze_daytime` for permanent night. That
  changes the game, not the lighting.
- `PerfectNightvision` (`1.0.1`, fv 2.0, 358 downloads) retunes the night-vision equipment only.
- `JKIL-CarLight` (`0.4.0`, fv 2.0, 2,759 downloads) doubles the `car` cone only.
- `BigLight` (`0.3.1`, fv 2.1, 9,083 downloads) enlarges the lights of train stops, drills and
  similar entities.

#### Shipping vanilla night lighting

This is the status quo since #7, and it is a real option rather than a fallback:

- **What it costs.** The halo goes from 0.7 / 100 to 0.4 / 25, which is the knob a player
  notices. The cone goes from 0.8 to 0.6, and lights come on at 0.3 rather than 0.2. Cars, tanks
  and locomotives lose the large halo the tune gave them. The lamp group costs nothing in this
  pack.
- **What it keeps.** Lamps stay brighter than vanilla, because `Brighter-Lamps` remains
  (radius 70 against 40). Vanilla's own answer to darkness is the night-vision equipment, which
  is already in the game.
- **What it risks: nothing.** No member, no reachability on either line, no promise question, no
  settings a player has to find. Going back to vanilla does not touch a save, because the tune
  only edited prototypes.
- **What it leaves open.** If `AfraidOfTheDark` merges its 2.1 pull request, the content half
  still keeps it out of this pack, so its return would be a `Grado_ChangingBase` question. On the
  2.0 line that question is open now; see its entry above.

**Recommendation: ship vanilla night lighting, as a recorded decision.** Nothing found restores
the tune without either content or Lua in the pack. The vanilla option costs the halo most
visibly, and the cone, the earlier switch-on and the vehicles' halo with it, as listed above.
The decision is Truls's.

**No portal mod is a pure prototype tune that reproduces `AfraidOfTheDark`'s values by default.**
The search covered both listings on 2026-10-01. The only one whose knobs can reach them,
`adjustable_flashlight`, starts at vanilla and stops at the character. A tune that matches by
default would take Lua in the pack, which *What a modpack is here* rules out.

#### Comparison

Read 2026-10-01. "Served" means a release is returned for that game version. "Content" is read
from source in every row. The knob columns are given as character values: `min` is
`minimum_darkness`, then cone intensity, halo intensity / size.

| portal name | min | cone | halo | lamp group | vehicles | content | served 2.0 | served 2.1 |
|---|---|---|---|---|---|---|---|---|
| *vanilla 2.0.77* | 0.3 | 0.6 | 0.4 / 25 | `lamp` | cones only | - | - | - |
| `AfraidOfTheDark` | 0.2 | 0.8 | 0.7 / 100 | `lamps` | + 0.7 / 100 halo | **yes** | `1.0.31` | no (PR #8 open) |
| `realistic-flashlight-fixed` | 0.1 | 0.9 | **none** (0.3 / 40 by setting) | - | replaced | no | `0.2.7` | no |
| `realistic-flashlight-fixed-fork` | 0.1 | 0.9 | **none** (0.3 / 40 by setting) | - | replaced | no | no | `1.0.0` |
| `light-overhaul` | 0.3 | 0.6, wider | pin sprite 0.4 | - | cone widened | no | `0.2.2` | `0.3.0` |
| `EvenMoreLight` | 0.3 | **none** | 0.9 / 60 | - | cones removed | no | `0.2.0` | no |
| `adjustable_flashlight` | 0.3 | 0.6 by setting | 0.4 / 25 by setting | - | untouched | no | `0.1.0` | no |
| `Pro-Flashlight` | - | - | - | - | - | no | `1.5.8` | `1.5.9` |
| `afraid-of-the-dark` | - | - | - | - | - | no | `2.1.0` | `3.0.0` |
| `anti-gloom` | - | - | - | - | - | no | `2.0.0` | `2.1.0` |

A `-` in a knob column means the mod leaves that knob at vanilla. Every portal figure was re-read
on 2026-10-01. Against #42's table of 2026-09-22, downloads moved and nothing else did:
`realistic-flashlight-fixed` 2,772 to 2,781, the fork 34 to 40, `light-overhaul` 37,337 to 37,617,
`EvenMoreLight` 7,208 to 7,227, `Pro-Flashlight` 5,941 to 5,973, `adjustable_flashlight` 1,116 to
1,123 and `AfraidOfTheDark` 207,551 to 207,859. #42's "latest" column gives each mod's newest
release. For three of them that release is a 2.1 one, which a 2.0 game is not served:
`light-overhaul` (a 2.0 game gets `0.2.2`), `Pro-Flashlight` (`1.5.8`) and
`realistic-flashlight-fixed-fork` (nothing at all). That is why the table above has separate
served columns.

## The promise, and why it needs a ruling

`CLAUDE.md` and the README both said this pack "does not change save state or the factory", until
#7 retired that wording on 2026-09-22. Taken literally, **several members broke it**, and they break it in three different ways that are
worth separating before anyone decides anything.

**The four lists below are the survey's reading of the 29 members as they stood on 2026-09-20**, and
are kept as written because the ruling under *The ruling that is wanted* was taken against them. Four
of the mods they name are no longer in the pack: `AfraidOfTheDark` and `blueprint-sandboxes` were
dropped, `Bottleneck` and `MaxRateCalculator` replaced, and `blueprint_flip_and_turn` dropped — so
group 1 is now `Brighter-Lamps` and `FluidWagonColorMask`, group 2 is `SpeedControl`, `Tapeline`,
`Todo-List` and `YARM`, group 3 is unchanged, and the read-only group reads `BottleneckLite` and
`RateCalculator` for the two it replaced and loses `blueprint_flip_and_turn`.

**It alters a vanilla prototype, so an existing factory behaves differently the moment the mod
loads.** `AfraidOfTheDark`, `Brighter-Lamps`, `FluidWagonColorMask`. `Brighter-Lamps` triples the area a lamp covers; `FluidWagonColorMask` adds a colour
mask to a vanilla entity; `AfraidOfTheDark` goes furthest and adds *craftable items and entities* -
balloon lights and night-vision glasses. No player action is needed for any of these to take effect.

**It writes data into the save that is not there without it.** `SpeedControl`, `Tapeline`, `Todo-List`, `YARM`, `blueprint-sandboxes`. `blueprint-sandboxes` is the
heaviest: it creates whole surfaces. `Tapeline`'s persistent measurements, `Todo-List`'s list and
`YARM`'s monitored sites are smaller but the same shape. Nothing here reaches the factory, but the
save is not the same save.

**It changes the factory only when the player asks it to.** `Automatic_Train_Painter`, `CleanFloor`, `CopyPasteModules`, `Fill4Me`, `automatic-station-painter`, `even-distribution`, `even-pickier-dollies`, `kry-picker-extended`. `even-pickier-dollies` exists to move
placed entities; `kry-picker-extended` reverses belts and limits chests; `CleanFloor` deletes
decoratives under new tiles. These are tools, and the player does the changing.

**Read-only, and unambiguously inside the promise.** `BlueprintTools`, `Bottleneck`, `DiscoScience`, `FNEI`, `FactorySearch`, `MaxRateCalculator`, `PipeVisualizer-Updated`, `VehicleSnap`, `WhereIsMyBody`, `blueprint_flip_and_turn`, `helmod`, `ixuAutoSave`, `solar-calc`.

#### The ruling that is wanted

The third group is almost certainly fine - a pack of quality-of-life *tools* that could not do its
job otherwise. The first group is the real question, and `AfraidOfTheDark` is the sharp end of it:
adding craftable content is not quality of life by any reading, and it is the one member that would
look out of place if the promise were enforced strictly.

This is pack membership, so it is Truls's under `CLAUDE.md` and belongs to #7. Recorded here with the
evidence, not settled.

**Settled 2026-09-22 (#7): the promise forbids new content, and nothing else.** The pack may tune
vanilla prototypes, may store its own data in the save, and changes the built factory only when the
player asks it to. Of the three groups above, only the *content* half of group 1 fails - which is
`AfraidOfTheDark` alone. `Brighter-Lamps` and `FluidWagonColorMask` stay: tuning a lamp's radius and
adding a colour mask is visibility and cosmetics, which is what the pack is for. Group 2 stays; group
3 is the pack's reason to exist.

**The wording is now stated once, in `CONTEXT.md` under *Promise*,** and the three prose copies -
`CLAUDE.md`'s chain diagram, `README.md`, and this pack's portal-facing `description` - point at it
instead of restating it. "Does not change save state or the factory" is retired: it was false under
any reading that let the pack do its job, and it had three meanings in one sentence.

`Grado_ChangingBase` got a promise out of the same ruling, because a mod had to be tested against it:
it may add content, but not content that competes with an overhaul for the same ground, since all
three overhaul packs inherit it.

## The Picker family, as one question

The port recorded four Picker drops in this pack and seven across all packs, and read as a family
wiped out. **That reading is wrong, and most of it is already fixed.**

`Nexela`, who wrote all nine, has left Factorio modding - `kry-picker-extended` says so on its own
portal page. That is why nine mods went quiet at once, and it is one event rather than nine
judgements about nine mods.

**The successor is already in this pack.** `kry-picker-extended` is a current member, and its feature
list covers Belt Brush, Belt Reverser, Auto Inventory Sort, the Planner Menu/Cycler/Zapper and a
Chest Limiter. Measured against what the four dropped mods actually did:

| dropped mod | what it did | state now |
|---|---|---|
| `PickerAtheneum` | library for the family | obsolete - the successor ships `kry_stdlib` instead |
| `PickerBeltTools` | belt brush, belt reversing | **already restored** by `kry-picker-extended` |
| `PickerBlueprinter` | blueprint scripts | covered by `kry-picker-extended` and `BlueprintTools`, both current members |
| `PickerInventoryTools` | inventory filter/sort; fill a requester chest from a blueprint | sorting restored; **the requester-chest trick is the one real gap** |

So the four drops cost this pack **one feature**, not four mods. **Corrected 2026-09-22: they cost it none.** The requester-chest trick is base-game in 2.0 - see the `PickerInventoryTools` entry above. All four drops now end in keep-dropped.

**One of the four did not end where #2 asked it to, and now does.** That ticket's acceptance
criterion says each dropped mod ends in "keep-dropped or a named replacement". `PickerInventoryTools`
ended in `reconsider:` instead, which `docs/mod-catalogue.md` permits and #2 does not mention - #2 was
written before that format existed. The tension was not cosmetic: resolving it to *stay dropped*
would have decided that the requester-chest-from-blueprint feature is not wanted, and that is pack
membership, which `CLAUDE.md` reserves to Truls. Meeting the criterion literally would have meant
overstepping it, so the criterion was reported unmet rather than satisfied.

**Closed 2026-09-22 by #7, and by neither of the two routes anyone expected.** It is not "the feature
is unwanted" and not "a replacement was found" - the feature is base-game, so there was no membership
question to reserve. #2's criterion is met.

#### On `kry-picker-complete`

#1 found [`kry-picker-complete`](https://mods.factorio.com/mod/kry-picker-complete) and flagged it
here. Having now measured what is missing, the case for adopting it to *solve the Picker question* is
weak: this pack already has the two members that matter, so the bundle would be bought for one
feature it may not even carry.

**But one of the two objections #1 recorded has since weakened.** It said the bundle would duplicate
`Bottleneck` and `even-distribution`. Both of those entries above now recommend or seriously consider
moving to `BottleneckLite` and `EvenDistributionLite` — which are exactly what the bundle carries. If
those replacements happen, the bundle stops duplicating anything on that axis and starts looking like
a tidy way to get them plus `CursorEnhancements`, `belt-visualizer`, `AutoDeconstruct`,
`Shortcuts-ick` and `fluid-connection-indicators` in one dependency.

What has not weakened is the structural objection: **a pack depending on another pack** is a
commitment nobody has taken on, and it hands a third party control of six of this pack's members at
once. That is the question worth putting to Truls, and it is a different question from the Picker one
that brought the bundle up.

**The bundle is not the way to solve the Picker question**, because that question is nearly solved
already. Whether it is a good way to get the raiguard set is open, and it is #7's call.

**Ruled 2026-09-22 (#7): declined.** Three things closed it. It is an addition of a mod never in the
1.1 pack, and #7 ruled additions out of its own scope. It carries `EvenDistributionLite` as a
**mandatory** member, so taking it would overrule the decision to keep `even-distribution` as a side
effect. And the reading it was raised on came back empty: **no member of the bundle provides the
requester-chest feature**, checked across all 18 members' portal descriptions on 2026-09-22 - which
is moot anyway now that the feature is known to be base-game.

The rest of the ledger, read 2026-09-22 from `https://mods.factorio.com/api/mods/kry-picker-complete/full`:
`1.1.0`, `factorio_version` 2.1, 2026-07-24, owner `Kryzeth`, **748 downloads**. Nine mandatory
members and nine optional, and **not one of the 19 entries carries a version constraint**, `base`
included. Four of the nine optional members are stranded on 2.0, two of those untouched for nearly
two years. It pulls an undeclared transitive `kry_stdlib >= 2.2.13` through `kry-picker-extended`,
which its own list never names. Of its nine mandatory members, three are in this pack -
`kry-picker-extended`, `even-pickier-dollies` and `BottleneckLite`, the last of them put there by
this same ruling. **Six are not:** `belt-visualizer`, `CursorEnhancements`, `Shortcuts-ick`,
`AutoDeconstruct`, `fluid-connection-indicators` and `EvenDistributionLite`.

The structural objection #1 recorded still stands on its own and is the reason not to revisit this
lightly: **a pack depending on another pack** hands a third party control of six of this pack's
members at once. The individual members are worth assessing on their own merits, which is a separate
ticket. *Assessed for this pack on 2026-10-01 (#41): see* Candidates, not members.

One reading here belongs to another ticket rather than this one: the bundle carries `squeak-through-2`
as *optional*, where `Grado_ChangingBase` carries it as **mandatory**. That is the
optional-became-mandatory flattening #11 exists to decide.

## The raiguard pattern

Truls's observation that raiguard's mods are highly praised turns out to be load-bearing for this
pack, so it was checked rather than taken on faith.

**raiguard is already here, and further back than it first looked.** `BlueprintTools` and `Tapeline`
are current members, `EditorExtensions` is a member of `Grado_ChangingBase` one layer up, and
`PipeVisualizer` — the 1.1 mod that `PipeVisualizer-Updated` is a fork of — was raiguard's too. That
last one also explains `pipe-visualization-overlay` below: he wrote the visualiser, stopped, and
someone else forked it.

**Five members of this pack have a raiguard counterpart, and they do not all point the same way:**

| in the pack | last touched | raiguard alternative | last touched | verdict |
|---|---|---|---|---|
| `MaxRateCalculator` | 2024-11-02 | `RateCalculator`, 439,485 dl | 2026-07-14 | **replace** — 2.7× the use, current, and the incumbent admits it does not do Quality |
| `Bottleneck` | 2024-12-03 | `BottleneckLite`, 227,907 dl | 2026-08-17 | **replace** — current against a 2024 mod, and claims zero runtime overhead |
| `Todo-List` | 2026-06-28 | `TaskList`, 86,183 dl | 2026-07-02 | **preference** — both current; sync-in-multiplayer against deliberately simpler |
| `even-distribution` | 2026-06-24 | `EvenDistributionLite`, 52,179 dl | 2026-07-02 | **keep the incumbent** — both current, and only the incumbent has the Inventory Cleanup hotkey |
| `blueprint-sandboxes` | 2026-07-11 | `EditorExtensions`, 139,996 dl | 2026-06-26 | **cross-layer** — not a swap; `EditorExtensions` is already in `Grado_ChangingBase` and this mod optionally depends on it |

**Two look like counterparts and are not.** Worth recording so nobody re-runs the search:

- **`RecipeBook`** is not an alternative to `FNEI`. Its own summary says *"This mod will not be
  updated to Factorio 2.1"*, and its portal title carries "(2.0 ONLY)". It is a dead end regardless
  of quality.
- **`pipe-visualization-overlay`** is not an alternative to `PipeVisualizer-Updated`. It "draws a dark
  background behind the pipe visualization to improve contrast" — a companion to a visualiser, not
  one itself, and at 2,579 downloads from 2025-03-02.

**Out of scope here, but recorded:** raiguard maintains other 2.x mods this pack does not carry at
all — `CursorEnhancements`, `StatsGui`, `QuickbarTemplates`, `MouseOverConstruction`,
`BetterAlertArrows`, `FluidMustFlow`, `ChangeInserterDropLane`. #2 asks about the mods already in the
pack and the ones dropped from it, so none of these was assessed. Adding a mod that was never in the
1.1 pack is a different question and a bigger one. *Assessed for this pack on 2026-10-01 (#41): see* Candidates, not
members.

## The pack cannot load on the Factorio version it declares

*#43, 2026-09-24: this section reads each member's latest release, which is the 2.1 case. On stable
2.0.77 the pack resolves: each member's newest 2.0 release installs, and they satisfy each other.
The declared `base >= 2.0.0` is still not honoured - on that reading the floor is `>= 2.0.67`. See
`docs/porting-notes.md`, Resolves on stable 2.0.77. Honoured since 2026-09-24 (#58), when the
declaration was raised to `base >= 2.0.67`.*

Found while checking `EditorExtensions`, whose `info.json` requires `base >= 2.1.0`. That prompted
the same check across this pack, and the result is not a nuance.

**`Grado_NonChanging` declares `factorio_version: 2.0` and `base >= 2.0.0`. Ten of its 29 members
refuse to load below 2.1, and six of those require `base >= 2.1.7`:**

| member | requires |
|---|---|
| `BlueprintTools`, `Tapeline`, `blueprint-sandboxes`, `even-distribution`, `even-pickier-dollies`, `helmod` | `base >= 2.1.7` |
| `FNEI`, `automatic-station-painter` | `base >= 2.1.0` |
| `DiscoScience`, `Fill4Me` | `base >= 2.1` |

A player on Factorio 2.0.x cannot satisfy those dependencies, so the pack's declared floor of 2.0.0
is not a floor it can honour. **The effective requirement is 2.1.7**, and `base >= 2.0.0` advertises
something the pack cannot deliver. *Superseded 2026-09-22 by #7: eleven of the 26, re-read
2026-09-24 (#61) from each member's latest release. `blueprint-sandboxes` left the list above;
`BottleneckLite` and `RateCalculator` joined it. The six at `base >= 2.1.7` are five, since
`blueprint-sandboxes` was one of them - see the re-measurement below.*

`docs/porting-notes.md` carries this as an open question, worded as *"Confirm a `2.0` pack still
loads them"* and marked unverified. It is no longer unverified for this pack: it does not, and the
reason is the members' own `base` requirements rather than anything about the `factorio_version`
field itself. The two are separate mechanisms and the dependency floor is the one that bites first.

This is one of the decisions `CLAUDE.md` lists as still open, so it is reported rather than fixed.
The same check is worth running on the other four packs before any of them is published — #3 to #6
each own their own.

**Re-measured 2026-09-22 after #7's edits: the floor is unchanged at `base >= 2.1.7`.** All 26
remaining members were re-read rather than trusted. Five still demand it - `BlueprintTools`,
`Tapeline`, `even-distribution`, `even-pickier-dollies`, `helmod` - so removing `blueprint-sandboxes`,
which was the sixth, does not lower it. Both incoming mods enter under the ceiling at `base >= 2.1.0`,
and neither brings a transitive dependency the pack did not already carry. #15's measurement for this
pack survives the edit. **Superseded 2026-09-23 by #15:** 2.1.7 is still the highest of the named
members, but the pack's effective floor is higher: the hidden `kry_stdlib` `2.2.21`, released that
day, asks `base >= 2.1.20`. See *Effective Factorio floor* in `docs/porting-notes.md`, which also
says why that number rests on one release. *Checked 2026-09-24 (#25): still holds. Of the 26
named members' latest releases, five ask `base >= 2.1.7` - `BlueprintTools`, `Tapeline`,
`even-distribution`, `even-pickier-dollies`, `helmod` - and none asks more.*

## Six members cannot be downloaded

Found on 2026-09-22 while checking whether `AfraidOfTheDark` could move up a tier. It is the other
half of the problem the section above describes, and no `factorio_version` declaration fixes it.

**Six of the 26 remaining members declare `factorio_version: 2.0`, and the portal does not serve them
to a Factorio 2.1 game:**

| member | latest | `factorio_version` | released |
|---|---|---|---|
| `CleanFloor` | `2.0.0` | 2.0 | 2024-10-20 |
| `SpeedControl` | `2.0.1` | 2.0 | 2024-10-27 |
| `WhereIsMyBody` | `2.0.15` | 2.0 | 2024-11-19 |
| `YARM` | `1.0.5` | 2.0 | 2025-01-01 |
| `PipeVisualizer-Updated` | `2.4.4` | 2.0 | 2025-11-16 |
| `solar-calc` | `0.5.72` | 2.0 | 2025-12-21 |

The [mod structure docs](https://lua-api.factorio.com/2.1.19/auxiliary/mod-structure.html) are
explicit: *"A `factorio_version` of `"2.0"` indicates support for all releases under that major
version, and no other major releases. Even if a mod would otherwise work on a newer major release,
this field needs to be updated."* The only documented exception is 0.18 to 1.0; there is none for 2.0
to 2.1. The portal behaves accordingly - `?version=2.1&namelist=<name>` returns nothing for each of
the six, verified against a filter that returns 9,710 mods at 2.0 and 4,186 at 2.1.

**So the pack has no version it can be installed on.** Its effective floor is 2.1.7, forced by five
members; on a 2.0 game those five cannot be satisfied, and on a 2.1 game these six cannot be
downloaded. Both ends are closed.

**Overstated - corrected 2026-09-23 (#9).** The 2.1.7 floor reads each member's *latest* release.
On a 2.0 game the portal serves each mod its newest 2.0 release, and every member of the three lower
packs has one whose `base` floor is below 2.1. So a 2.1 target is closed and a 2.0 target is
unproven, not closed. Whether those old releases' floors on each other are consistent is not yet
checked. See #43 and #16. *#43, 2026-09-24: checked - they are consistent on stable 2.0.77.*

**Settled 2026-09-24 (#43): the 2.0 end is open.** On stable 2.0.77 this pack resolves, on portal
metadata; the six above matter only at a 2.1 target. The measurement, which covers all five packs,
is in `docs/porting-notes.md`, *Resolves on stable 2.0.77*.

**#7's edit improves this without fixing it**, taking the unserved count from ten to six by removing
`Bottleneck`, `MaxRateCalculator`, `blueprint_flip_and_turn` and `AfraidOfTheDark`.

**Across the chain's three lower packs — `Grado_NonChanging`, `Grado_ChangingBase` and `Grado_ABC` —
21 of 95 distinct members are in this state.** Measured 2026-09-22 *after* this edit, by taking the
union of the three dependency lists and asking the portal which names it serves at 2.1. The six
above are `Grado_NonChanging`'s share; the other fifteen are `Nanobots2`, `WideChestsBobs`,
`LTN_Content_Reader_Updated`, `StoneWaterWell-ActuallyUpdated`, `qol_research`, `safefill`,
`deadlock-beltboxes-loaders`, `DeadlockStackingForBobs`, `DeadlockStackingForVanilla`,
`angels-smelting-extended`, `RealisticReactorsReborn`, `True-Nukes_Continued`,
`True-Nukes-Graphics_Continued`, `spidertrontiers-community-updates` and `UltimateBeltsSpaceAge`.
This is #16's to act on: it cannot be answered by choosing a number until those members update or
are replaced - *true of a 2.1 target only; on stable 2.0.77 the chain resolves (#43, 2026-09-24).*

**#8 took four off that list on 2026-09-22, by settling `Grado_ChangingBase`.**
`LTN_Content_Reader_Updated`, `StoneWaterWell-ActuallyUpdated` and `UltimateBeltsSpaceAge` left the
pack, and `safefill` was replaced by `Waterfill_v17`, which the portal does serve at 2.1. **21 of 95
becomes 17 of 90** — the list above is left as measured, since re-deriving it across the chain is
#43's. `Nanobots2` and `qol_research` are the two that remain unserved in that pack and were kept
anyway, on the same precedent #7 set here. None of this touches this pack's own six.

**#9 changed it again on 2026-09-23, by settling `Grado_ABC`: 17 of 90 becomes 15 of 87.**
`deadlock-beltboxes-loaders`, `DeadlockStackingForBobs` and `DeadlockStackingForVanilla` left the
pack, `signalstrings` (served) left with them, and `RealisticFusionPowerPort` came in unserved. The
list above is still left as measured.

**Not confirmed:** whether a mod declaring `factorio_version: 2.0` would *run* correctly if installed
by hand on 2.1. The docs say it is unsupported and the portal will not serve it; nothing here has been
loaded in Factorio.

## Keys against base 2.0.77's own controls (#96)

Read **2026-10-02** on the installed 2.0.77 game. The key comparisons above, by the load record
(#17) and by #41 and #89, matched mods against mods and could not see the game's own controls.
This compares every member's and every candidate's default keys with them. It decides nothing
about rebinding; that is #73's.

**Engine controls** - moving, mining, the pipette, the map editor and the rest - are built into
the game and are not prototypes, so no `--dump-data` shows them. Their defaults were read from the
`[controls]` section of `%APPDATA%\Factorio\config\config.ini`, which the game writes with every
control it knows: the engine's first, then the custom inputs of the mods last enabled, grouped
roughly by mod. Linked custom inputs, below, are not written at all. A control the player
has not rebound is written as a comment holding its default (`; connect-train=J`). The file read
was written by the 2.0.77 game on 2026-09-30, and no engine control in it was rebound, so every
default was read: 192 controls, each with a keyboard-and-mouse primary and alternative, of which
163 primaries and 9 alternatives have a default. Gamepad bindings were not compared.

**Base's custom inputs** - the 14 in `data/base/prototypes/custom-inputs.lua`, the `Alt+` item
and toggle keys among them - were read from a `--dump-data` run with base alone.

**Space Age adds none.** A second dump with `space-age`, `quality` and `elevated-rails` enabled
gave the same 14 custom inputs on the same keys, and none of the three ships a `custom-input` or a
`[controls]` locale section. Some engine controls only make sense with the expansion -
`cycle-quality-up`, `cycle-quality-down` and `toggle-rail-layer` among those matched below - but
they are engine controls, listed whatever is enabled, and whether one acts without the expansion
is not readable from the files.

**The mods' keys** came from one `--dump-data` per mod with base alone, each set against a
baseline dump of base with `flib` and `kry_stdlib`, hidden members which add no custom input (and
`Kux-CoreLib` for `Kux-BlueprintExtensions`). So each input is attributed by the game, not by a
name search: the 26 members as staged for the load record (71 inputs, the record's count), and the
28 candidates with a release on the 2.0 line, at the release a 2.0.77 game installs. The 21
candidates' 2.1 releases cannot load on 2.0.77, so their keys were read from the Lua as text;
`realistic-flashlight-fixed-fork`, which has only a 2.1 release, binds no key. Keys were matched
exactly after putting the modifiers in one order and reading `COMMAND` as `CONTROL`, which
is how the game writes `Todo-List`'s `COMMAND + F` on Windows; primary and alternative slots
both.

| Mod | Input | Default | Base control with the same default |
|---|---|---|---|
| `BlueprintTools` | `bpt-pipette-add` | `Shift+mouse-button-3` | `editor-previous-variation`, `editor-clone-item` |
| `BlueprintTools` | `bpt-pipette-remove` | `Ctrl+mouse-button-3` | `editor-delete-item` |
| `FNEI` | `pressed-fnei-back-key` | `Backspace` | `previous-mod` |
| `PipeVisualizer-Updated` | `pv-toggle-mouseover` | `Alt+Y` | `give-discharge-defense-remote`, a custom input (#71) |
| `Tapeline` | `tl-edit-tape` | `mouse-button-2` | `mine`, `use-item`, `reverse-select`, `craft-5`, `cancel-craft-5`, `cursor-split`, `open-item` |
| `Tapeline` | `tl-delete-tape` | `Shift+mouse-button-2` | `alternative-use-item`, `copy-entity-settings`, `alt-reverse-select`, `stack-split`, `copy-inventory-filter`, `editor-set-clone-brush-source`, `editor-remove-scripting-object` |
| `Tapeline` | `tl-increase-divisor`, `tl-decrease-divisor` | `Alt+mouse-wheel-up`, `-down` | `cycle-quality-up`, `cycle-quality-down` |
| `Todo-List` | `todo-search-shortcut` | `Ctrl+F` | `focus-search` |
| `YARM` | `get-yarm-selector` | `Alt+Y` | `give-discharge-defense-remote`, a custom input (#71) |
| `even-pickier-dollies` | `dolly-move-north`, `-east`, `-south`, `-west` | `Shift+Up`, `Right`, `Down`, `Left` | `move-blueprint-entities-up`, `-right`, `-down`, `-left` |
| `even-pickier-dollies` | `dolly-rotate-rectangle` | `KP_0` | `editor-toggle-pause` |
| `helmod` | `helmod-close` | `Escape` | `toggle-menu` |
| `helmod` | `helmod-recipe-selector-open` | `O` | `open-trains-gui` |
| `Honk` (candidate) | `honk` | `H` | `flip-horizontal` |
| `Honk` (candidate) | `toggle-train-control` | `J`, `5.1.1` only | `connect-train` |
| `belt-visualizer` (candidate) | `bv-highlight-ghost` | `G` | `toggle-rail-layer`, `toggle-driving-alternative` |
| `packing-tape` (candidate) | `packing-tape-pickup` | `J` | `connect-train` |

Every base control in the last column is an engine control except `give-discharge-defense-remote`,
and the two `Alt+Y` rows were already recorded. No candidate's key is a base custom input's. Every
mod input in the table has `consuming` at `none`, set or by default, under which "the custom input
event will happen before the internal game event" (API 2.0.77, `ConsumingType`); so both should act,
but that was not tried in play for any row. Several act only in one situation, as the load record
says of the mod-to-mod pairs: the map editor's controls only in the editor,
`move-blueprint-entities-*` only with a blueprint in hand. Each row has a dated note in its mod's
entry.

**Linked inputs are left out of the table.** A custom input with `linked_game_control` "will fire
when the linked control is pressed" and does not show in the controls settings (API 2.0.77,
`CustomInputPrototype`), so it shares that control's key by design. Eleven member inputs are
linked: `BlueprintTools`' `bpt-linked-confirm-gui` and `bpt-linked-clear-cursor`,
`even-distribution`'s `fast-entity-transfer-hook` and `fast-entity-split-hook`,
`even-pickier-dollies`' `dolly-rotate-saved` and `dolly-rotate-saved-reverse`,
`kry-picker-extended`'s `picker-select`, `adjustment-pad-increase` and `adjustment-pad-decrease`,
`RateCalculator`'s `rcalc-linked-focus-search` and `Tapeline`'s `tl-linked-clear-cursor`; one
candidate's, `Kux-BlueprintExtensions_cleared_cursor_proxy`, on both lines. `picker-select` also
declares `Q`, the pipette's own default.

**Not checked.** Whether 2.0.77 reads a `PAD` spelling as the number pad, which the game writes
`KP_`. It matters for no row: `Kux-BlueprintExtensions` `3.3.16`'s `PAD 1` to `PAD 9` match no
engine default either way (see its entry), and `kry-picker-extended`'s `PAD +` and `PAD -` are
linked.

**To re-run on a later build:**

1. Start that build once, then read `[controls]` from its `config.ini` and take every entry before
   the first name a dump shows to be a custom input; the file does not mark the boundary. A
   commented line holds the default; an uncommented one is a player's own binding, and its default
   has to be read elsewhere.
2. Dump base alone and base with the three expansion mods, through the load harness's
   `Invoke-Factorio` with `--dump-data`, and read `custom-input` from each
   `script-output/data-raw-dump.json`.
3. Dump each member and candidate the same way beside a baseline, and keep the inputs the baseline
   does not have.
4. Compare the keys exactly, modifiers in one order and `COMMAND` read as `CONTROL`. Set linked
   inputs aside.

## What was not checked

Named so a later session does not read absence as evidence, per `docs/mod-catalogue.md`.

**Base-game 2.0 coverage was not confirmed from a primary source.** The 2.0.x wiki changelog and
FFF-373 were both read and neither settles which quality-of-life features 2.0 absorbed. The inference
used instead is indirect but sound: a maintained 2.1 mod would not still ship a feature the base game
provides, so anything `kry-picker-extended` still implements is still needed. That reasoning does not
extend to `blueprint_flip_and_turn`, which is why that one is flagged rather than resolved.

**`blueprint_flip_and_turn` may be redundant.** Modern Factorio flips blueprints natively and the
mod's own summary already describes itself as a workaround for base versions that do. This is the
single most likely removal in the pack and it was not settled. *Settled 2026-09-22 (#7): it was
redundant and is out - see its entry under* Ruled out after the port.

**Overlapping members were not compared feature by feature.** `Bottleneck` against `BottleneckLite`,
`even-distribution` against `EvenDistributionLite`, `helmod` against `MaxRateCalculator`, `FNEI`
against `factoryplanner`. Each pair is known to overlap; none was measured.

**Nothing has been loaded in Factorio.** No mod here has been downloaded or run, and no compatibility
between any two of them has been tested. Every judgement above is from portal metadata and mod
descriptions. *Superseded 2026-09-29 (#17): every member was downloaded and **loaded** on 2.0.77,
base only and with Space Age, and both loads were clean. Starting together is now checked. Working
together in play is not - that is the play session's, still to run. The judgements above are
still portal and description readings. See `docs/loads/Grado_NonChanging-2026-09-29.md`.*
*Superseded again 2026-09-30 (#17): the play session is complete. 24 of the 26 members were seen
working (`ixuAutoSave` and `kry-picker-extended` not confirmed), and the save survived a reload
with the members' data that was checked. One clash was found, `Alt+Y` between
`YARM` and `PipeVisualizer-Updated`, noted in both entries; base's discharge-defense remote
shares the default (#71, 2026-09-30). "Working together in play" is now
checked for one player, one build and default settings.*

**Download counts are context, not evidence.** `ixuAutoSave` at 657 is flagged for bus factor, not
for quality.
