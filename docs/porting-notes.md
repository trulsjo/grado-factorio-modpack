# Porting notes

Measured against the mod portal API on **2026-09-20**. Every mod here was
checked **by name only**, which is weaker than it sounds: a mod listed as dropped has no 2.0 release
*under that name*, and no replacement was found *by that search*.

**That search was not good enough, and one drop has already fallen to a better one.** Searching
titles and summaries rather than names turns up `kry-picker-complete`, a 2.1 modpack that
reassembles the Picker family; see `docs/mod-catalogue.md`. Treat every "dropped" line below as
unconfirmed until a survey has re-checked it that way.

## Grado_NonChanging

33 mods in the 1.1 pack: **26 carried over, 3 replaced, 4 dropped** -> **29 in the 2.0 pack**.

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

31 entries in the 1.1 pack, of which 29 are members and 2 are optional: **16 carried over,
8 replaced, 6 dropped** -> **25 in the 2.0 pack**. The count only balances once the optionals are
named: `reverse-factory` carried over and `Squeak Through` was replaced, and both were `?` optional
upstream and are mandatory here. That change is issue #11, not a counting artefact.

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

The 1.1 `Grado_ABCX` held 56 mods and is split here between `Grado_ABC` and `Grado_ABCX`. This
pack takes **41 carried over, 4 replaced** -> **45 in the 2.0 pack**. The **10 dropped** below are
the whole branch's.

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

**1 replaced, nothing carried over or dropped** -> **1 in the 2.0 pack**. It is the 56th mod of the
1.1 `Grado_ABCX` list; the other 55 are accounted for under `Grado_ABC` above.

### Replaced

| 1.1 mod | 2.0 replacement |
|---|---|
| `SpaceMod` | `SpaceModFeorasFork` |

## Grado_ABCS

**1 mod, and it is new.** `Grado_ABCS` did not exist in 1.1, so nothing here was carried over,
replaced or dropped.

## Verified against the portal, 2026-09-20

The kept/replaced/dropped tables above were rebuilt from the published 1.1 entries under `ostogvin`
and diffed against this repo, rather than trusted. Every 1.1 mod is accounted for; none vanished
silently.

| Pack (1.1 -> 2.0) | 1.1 members | carried over | replaced | dropped |
|---|---|---|---|---|
| `Grado_NonChanging` `0.0.1` | 33 | 26 | 3 | 4 |
| `Grado_ChangingBase` `0.0.2` | 29 | 16 | 7 | 6 |
| `Grado_ABCX` `0.0.2` -> ABC + ABCX | 56 | 41 | 5 | 10 |

Drops total **20**, replacements total **16**. `CLAUDE.md` claimed sixteen drops until this check;
it had picked up the replacement count.

The column is *carried over*, not *kept*: it counts mods present under the same name in both,
which is not the size of the 2.0 pack. It also counts members only, so `Grado_ChangingBase` shows 7
replacements where the section above lists 8 - the eighth, `Squeak Through`, was optional upstream.

Counting note: `Grado_ChangingBase` has two 1.1 releases, and `0.0.2` swapped `reverse-factory` for
`crafting_combinator`. Its dependency list holds 31 entries but only 29 members, because
`? reverse-factory` and `? Squeak Through` are optional. Counting those two as members is what
produced the "31" in the brain page.

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
- **The Picker family lost seven of nine - and that is now disputed.** The name-only search found
  replacements for `PickerDollies` (`even-pickier-dollies`) and `PickerExtended`
  (`kry-picker-extended`) alone. Searching titles instead turns up `kry-picker-complete`, a 2.1
  modpack that reassembles the family; see its entry in `docs/mod-catalogue.md`. Adopting it is not
  straightforward, so the question is reopened, not closed - #2's to assess and #7's to settle.
- **Nothing has been play-tested.** No pack has been loaded in Factorio, and no compatibility Lua has
  been written or shown to be needed.
