# Catalogue: `Grado_NonChanging`

The quality-of-life pack. Its promise is that it does not change save state or the factory; see
*The promise* below, where that turns out to need a decision rather than a checkmark.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-20** and is reproduced from the fetched data rather than retyped.

**All 29 current members have a 2.x release.** None is stranded on 1.1.

## In the pack

In dependency-list order.

### `AfraidOfTheDark`

| | |
|---|---|
| **Title** | Afraid Of The Dark (enforced personal lights + more) |
| **Does** | Forces the personal flashlight on, and adds craftable balloon lights and tinted night-vision glasses |
| **Latest** | `1.0.31`, `factorio_version` **2.0**, 2024-10-30 |
| **Downloads** | 207,551 |
| **Owner** | `binbinhfr` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None searched. The mod is current for 2.0 and nothing here needs replacing.

**Recommendation: keep**, but see *The promise* below. This is the one member that adds craftable items and entities rather than only changing how the game is displayed or operated, so it is the clearest candidate for not belonging in this pack at all. Last touched 2024-10-30, which is 2.0-era rather than abandoned.

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

### `Bottleneck`

| | |
|---|---|
| **Title** | Bottleneck |
| **Does** | Colours a small status light on each machine so starved or blocked ones are visible at a glance |
| **Latest** | `0.12.1`, `factorio_version` **2.0**, 2024-12-03 |
| **Downloads** | 319,119 |
| **Owner** | `trold` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **[`BottleneckLite`](https://mods.factorio.com/mod/BottleneckLite) by `raiguard`** — `1.4.1`, `factorio_version` **2.1**, 2026-08-17, 227,907 downloads. Same job; its summary claims "zero runtime overhead and instant response to changes in status", against the original's per-tick polling. It is a month old where this one is from 2024-12-03, and it is on 2.1 where this one is on 2.0. The download gap (319,119 against 227,907) is legacy accumulation, not current preference: the original ran through 1.1 when the player base was larger.

**Recommendation: replace with `BottleneckLite`.** It is the better-maintained of the two on every reading taken, and the runtime-overhead claim matters in a pack meant to be unobtrusive. This is the strongest replace case in the pack.

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

### `MaxRateCalculator`

| | |
|---|---|
| **Title** | Max Rate Calculator |
| **Does** | Selects an area and reports the maximum production and consumption rates of what is in it |
| **Latest** | `200.0.53`, `factorio_version` **2.0**, 2024-11-02 |
| **Downloads** | 163,584 |
| **Owner** | `Theanderblast` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **[`RateCalculator`](https://mods.factorio.com/mod/RateCalculator) by `raiguard`** — `3.4.1`, `factorio_version` **2.1**, 2026-07-14, **439,485 downloads**, with releases running 0.18 through 2.1. It is the same job, 2.7 times more used, and current where this one is from 2024-11-02. `helmod`, already in the pack, overlaps on throughput maths but plans a factory rather than measuring a built one, so it does not replace either.

**Recommendation: replace with `RateCalculator`.** The incumbent's own portal summary admits it "supports Space Age but NOT anything to do with Quality", and Quality is a 2.0 mechanic this pack's players will meet. A mod that is behind on a core mechanic, less used, and eighteen months staler than an actively maintained equivalent has a weak case.

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

### `blueprint_flip_and_turn`

| | |
|---|---|
| **Title** | Blueprint Flip and Turn |
| **Does** | Mirrors and flips a blueprint held in hand |
| **Latest** | `200.8.6`, `factorio_version` **2.0**, 2025-01-23 |
| **Downloads** | 59,710 |
| **Owner** | `NovaM` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **Not settled.** Modern Factorio flips blueprints natively, and this mod's own summary already describes a workaround for base-game versions that do so. Whether 2.0's native flipping makes it fully redundant was not confirmed against a primary source — see *What was not checked*.

**Recommendation: keep for now, and re-check before release.** This is the one member with a live chance of being redundant against the base game. Last touched 2025-01-23.

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

### `ixuAutoSave`

| | |
|---|---|
| **Title** | ixuAutoSave |
| **Does** | Configurable autosave frequency and filename prefix |
| **Latest** | `0.1.17`, `factorio_version` **2.1**, 2026-06-27 |
| **Downloads** | 657 |
| **Owner** | `ixu` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** **Searched, nothing better found.** At 657 downloads this is by a wide margin the least used mod in the pack — the next lowest has over five times as many. That is a bus-factor observation, not a quality one.

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

## The promise, and why it needs a ruling

`CLAUDE.md` and the README both say this pack "does not change save state or the factory". Taken
literally, **several current members break it**, and they break it in three different ways that are
worth separating before anyone decides anything.

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

So the four drops cost this pack **one feature**, not four mods.

**One of the four does not end where #2 asked it to.** That ticket's acceptance criterion says each
dropped mod ends in "keep-dropped or a named replacement". `PickerInventoryTools` ends in
`reconsider:` instead, which `docs/mod-catalogue.md` permits and #2 does not mention - #2 was written
before that format existed. The tension is not cosmetic: resolving it to *stay dropped* would decide
that the requester-chest-from-blueprint feature is not wanted, and that is pack membership, which
`CLAUDE.md` reserves to Truls. Meeting the criterion literally would mean overstepping it, so the
criterion is reported unmet rather than satisfied.

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
1.1 pack is a different question and a bigger one.

## The pack cannot load on the Factorio version it declares

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
something the pack cannot deliver.

`docs/porting-notes.md` carries this as an open question, worded as *"Confirm a `2.0` pack still
loads them"* and marked unverified. It is no longer unverified for this pack: it does not, and the
reason is the members' own `base` requirements rather than anything about the `factorio_version`
field itself. The two are separate mechanisms and the dependency floor is the one that bites first.

This is one of the decisions `CLAUDE.md` lists as still open, so it is reported rather than fixed.
The same check is worth running on the other four packs before any of them is published — #3 to #6
each own their own.

## What was not checked

Named so a later session does not read absence as evidence, per `docs/mod-catalogue.md`.

**Base-game 2.0 coverage was not confirmed from a primary source.** The 2.0.x wiki changelog and
FFF-373 were both read and neither settles which quality-of-life features 2.0 absorbed. The inference
used instead is indirect but sound: a maintained 2.1 mod would not still ship a feature the base game
provides, so anything `kry-picker-extended` still implements is still needed. That reasoning does not
extend to `blueprint_flip_and_turn`, which is why that one is flagged rather than resolved.

**`blueprint_flip_and_turn` may be redundant.** Modern Factorio flips blueprints natively and the
mod's own summary already describes itself as a workaround for base versions that do. This is the
single most likely removal in the pack and it was not settled.

**Overlapping members were not compared feature by feature.** `Bottleneck` against `BottleneckLite`,
`even-distribution` against `EvenDistributionLite`, `helmod` against `MaxRateCalculator`, `FNEI`
against `factoryplanner`. Each pair is known to overlap; none was measured.

**Nothing has been loaded in Factorio.** No mod here has been downloaded or run, and no compatibility
between any two of them has been tested. Every judgement above is from portal metadata and mod
descriptions.

**Download counts are context, not evidence.** `ixuAutoSave` at 657 is flagged for bus factor, not
for quality.
