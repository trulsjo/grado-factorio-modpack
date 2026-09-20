# Porting notes

Measured against the mod portal API on **2026-09-20**. Every mod here was
checked by name; a mod listed as dropped has no 2.0 release under that name and no
replacement was found.

## Grado_NonChanging

Kept 29, replaced 3, dropped 4.

### Replaced

| 1.1 mod | 2.0 replacement |
|---|---|
| `PickerDollies` | `even-pickier-dollies` |
| `PickerExtended` | `kry-picker-extended` |
| `PipeVisualizer` | `PipeVisualizer-Updated` |

### Dropped - no 2.0 release, no replacement found

- `PickerAtheneum`
- `PickerBeltTools`
- `PickerBlueprinter`
- `PickerInventoryTools`

## Grado_ChangingBase

Kept 25, replaced 8, dropped 6.

### Replaced

| 1.1 mod | 2.0 replacement |
|---|---|
| `LTN_Content_Reader` | `LTN_Content_Reader_Updated` |
| `miniloader` | `miniloader-redux` |
| `ModuleInserter` | `ModuleInserterSimplified` |
| `Nanobots` | `Nanobots2` |
| `Squeak Through` | `squeak-through-2` |
| `UltimateBelts` | `UltimateBeltsSpaceAge` |
| `UltimateResearchQueue` | `UltimateResearchQueue2` |
| `WaterWell` | `StoneWaterWell-ActuallyUpdated` |

### Dropped - no 2.0 release, no replacement found

- `PickerPipeTools`
- `PickerTweaks`
- `PickerVehicles`
- `alien-biomes-hr-terrain`
- `beautiful_bridge_railway`
- `crafting_combinator`

## Grado_ABC

Kept 45, replaced 4, dropped 10.

### Replaced

| 1.1 mod | 2.0 replacement |
|---|---|
| `RealisticReactors` | `RealisticReactorsReborn` |
| `spidertrontiers` | `spidertrontiers-community-updates` |
| `True-Nukes` | `True-Nukes_Continued` |
| `True-Nukes-Graphics` | `True-Nukes-Graphics_Continued` |

### Dropped - no 2.0 release, no replacement found

- `Clowns-Science`
- `DeadlockCrating`
- `DeadlockStackingForAngels`
- `DeadlockStackingForMadclown`
- `MilesBobsExpansion`
- `RealisticFusionPower`
- `angelsexploration`
- `angelsindustries`
- `baron-turrets`
- `beautiful_bridge_railway_bob_fix_updated_new`

## Grado_ABCX

Kept 1, replaced 1, dropped 0.

### Replaced

| 1.1 mod | 2.0 replacement |
|---|---|
| `SpaceMod` | `SpaceModFeorasFork` |

## Grado_ABCS

Kept 1, replaced 0, dropped 0.

## Open questions

- **`alien-biomes-hr-terrain` was dropped on the assumption that 2.0 `alien-biomes` absorbed the
  HR terrain.** NOT verified. Check before releasing ChangingBase.
- **`factorio_version` is declared `2.0`** on all five packs, while several member mods (Bob's,
  Angel's, MadClown) have moved to `2.1`. Confirm a `2.0` pack still loads them.
- **Version `0.1.0`** starts a fresh line rather than continuing the 1.1 `0.0.x` series. Change it if
  the portal entries should continue their numbering instead.
- **`RealisticFusionPower` is among the drops.** It is the mod the separate
  *realistic-fusion-refreshed* project exists to succeed; that mod is a candidate to add here once it
  ships.
- **The Picker family lost seven of nine.** Only `PickerDollies` (`even-pickier-dollies`) and
  `PickerExtended` (`kry-picker-extended`) have replacements. Worth checking how much of the rest is
  now base-game behaviour in 2.0.
- **Nothing has been play-tested.** No pack has been loaded in Factorio, and no compatibility Lua has
  been written or shown to be needed.
