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

**Re-checked 2026-09-21 by the `Grado_NonChanging` survey: three of these four now have
coverage identified, and only `PickerInventoryTools` leaves a real gap.** See
`docs/catalogue/Grado_NonChanging.md`. The heading below describes the original port search, not the
current state.

- `PickerAtheneum`
- `PickerBeltTools`
- `PickerBlueprinter`
- `PickerInventoryTools`

## Grado_ChangingBase

31 entries in the 1.1 pack, of which 29 are members and 2 are optional: **17 carried over,
8 replaced, 6 dropped** -> **25 in the 2.0 pack**. The count only balances once the optionals are
named: `reverse-factory` carried over and `Squeak Through` was replaced, and both were `?` optional
upstream and are mandatory here. That change is issue #11, not a counting artefact.

**Corrected 2026-09-21: the carried-over figure read 16.** It was the members-only count sitting
next to the all-entries count for replacements, so the line added up to neither 31 nor 25. On the
all-entries basis this sentence uses, the two optionals are what separate it from the members-only
table below: `reverse-factory` makes carried-over 17 rather than 16, and `Squeak Through` makes
replacements 8 rather than 7. Both bases are now internally consistent - 17 + 8 + 6 = 31 entries,
17 + 8 = 25 mods in the 2.0 pack, and 16 + 7 + 6 = 29 members - and neither is comparable to the
other without saying which is being counted. Found by the review of #3; the measurement is release
`0.0.2` diffed against `Grado_ChangingBase/info.json`.

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

**Re-checked 2026-09-21 by the `Grado_ChangingBase` survey: none is recommended for adding back as
itself, and not one of the six is a case of nothing existing** - "no replacement found" turns out to
be false for all six once titles and summaries are searched. Four stay dropped - `crafting_combinator` was
absorbed by the base game, `alien-biomes-hr-terrain` by a mandatory dependency,
`beautiful_bridge_railway` has a two-mod functional replacement that was deliberately not taken, and
`PickerTweaks` is the wrong kind of mod for a pack that must survive an overhaul. Two,
`PickerPipeTools` and `PickerVehicles`, are `reconsider:` against `kry-picker-complete`: assessed by
#3, and adopting it into this pack is #8's rather than this file's. See
`docs/catalogue/Grado_ChangingBase.md`. The heading below describes the original port search, not the
current state.

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
which is not the size of the 2.0 pack. It also counts members only, so `Grado_ChangingBase` shows 16
carried over and 7 replacements where the section above lists 17 and 8. The two differences are the
same two mods: `reverse-factory` carried over and `Squeak Through` was replaced, and both were `?`
optional upstream, so neither counts as a 1.1 member.

Counting note: `Grado_ChangingBase` has two 1.1 releases. Its `0.0.2` dependency list holds 31
entries but only 29 members, because `? reverse-factory` and `? Squeak Through` are optional.
Counting those two as members is what produced the "31" in the brain page.

**Corrected 2026-09-21.** This paragraph said `0.0.2` "swapped `reverse-factory` for
`crafting_combinator`". Both 1.1 releases were read from the portal API that day and it is narrower
than that: `0.0.1` (2024-09-29) carried `reverse-factory` as a mandatory member with no
`crafting_combinator` and no `Squeak Through`; `0.0.2` (2024-10-08) **added** `crafting_combinator`
and `? Squeak Through` and **demoted** `reverse-factory` to optional. Nothing was swapped out. The
31/29 arithmetic above is unaffected. The demotion is half of issue #11 - `reverse-factory` was made
optional in 1.1 and mandatory again in 2.0, rather than simply staying optional through the port.

## Publishing identity, settled 2026-09-21

Three questions that had to be answered before anything reaches the portal. Measured against the
portal API on 2026-09-21: `Grado_NonChanging` had `0.0.1`, `Grado_ChangingBase` and `Grado_ABCX` had
`0.0.2`, all Factorio 1.1, all owned by `ostogvin`, 20-23 downloads each. `Grado_ABC`, `Grado_ABCS`
and `GradoABCS` were all unclaimed.

**The 2.0 packs reuse the three existing portal entries.** One entry holds releases for several game
versions and serves each player the newest one matching their build, so the 1.1 releases stay in
place and 1.1 players keep a working install. Publishing new entries instead would have left three
stale 1.1 entries that searchers still find. The download counts were not the argument - twenty
downloads is nothing - one URL per pack was.

**Version `0.1.0` on all five, and packs version independently from there.** `0.1.0` sits above every
published number, so it is legal on the reused entries, and the minor bump marks the 1.1 -> 2.0 break
without claiming a stability nothing supports: no pack has been loaded in Factorio. `1.0.0` would
have been a lie and `2.0.0` would have read as tracking the game version, which breaks the moment a
pack targets 2.1. Continuing each entry's own line (`0.0.2` / `0.0.3` / `0.0.3`) was the alternative;
it left the largest change these packs will ever have looking like a patch. Lockstep versioning was
rejected with it - a pack's version answers "did this pack's dependency list change", and lockstep
would publish four no-op releases every time one mod is swapped. What a bump *means* is a standing
rule, not a port fact: see `CLAUDE.md` and `docs/adr/0001-version-major-tracks-save-compatibility.md`.

**The name is `Grado_ABCS`, with the underscore.** `GradoABCS` was the alternative. A name is what
`info.json` resolves and what the portal URL carries, and it cannot be changed without abandoning the
entry, so this one is permanent. Its own sibling `Grado_ABCX` is already published with the
underscore, as are the other two; `ABCX` and `ABCS` sitting next to each other spelled differently
was the outcome to avoid.

**The titles changed too, which nobody had decided.** The three published entries carry their raw
name as the title (`Grado_NonChanging`); the repo had quietly moved to spaced titles
(`Grado Non-Changing`). Publishing to a reused entry would have renamed what players see as a side
effect. Settled deliberately instead: short identity, colon, descriptor - `Grado ABCX: Angel's,
Bob's, MadClown, SpaceX`. The initialisms are the vocabulary the docs and commit scopes already use,
but they mean nothing to someone browsing, and the descriptor names the mods people actually search
for. A title is display only and can be changed in any release, unlike the name.

## Open questions

- **`alien-biomes-hr-terrain` was dropped on the assumption that 2.0 `alien-biomes` absorbed the
  HR terrain. Answered 2026-09-21: the drop was right, the mechanism was wrong, and the mod stays
  dropped.** `Earendel` did not grow `alien-biomes` to contain the terrain - he split *all* the
  graphics into `alien-biomes-graphics`, created 2024-10-17 for the 2.0 port and now a mandatory
  dependency of `alien-biomes` (`0.8.0`, 2.1, 2026-06-24), and edited the old mod's page to read
  "Not required for Factorio 2.0 games". A ChangingBase player gets the high-resolution terrain
  automatically. The difference matters: there is a third mod in the chain, named in none of our
  five dependency lists, that can go stale on its own. Evidence in
  `docs/catalogue/Grado_ChangingBase.md`.
- **`factorio_version` is declared `2.0`** on all five packs, while several member mods (Bob's,
  Angel's, MadClown) have moved to `2.1`. **Answered for `Grado_NonChanging` on 2026-09-21, and the
  answer is no:** ten of its 29 members require `base >= 2.1`, six of them `>= 2.1.7`, so a player on
  2.0.x cannot satisfy the pack. See `docs/catalogue/Grado_NonChanging.md`. The mechanism is the
  members' own `base` requirements rather than the `factorio_version` field. **Answered the same way
  for `Grado_ChangingBase` on 2026-09-21, and it raises the floor:** eleven of its 25 members require
  `base >= 2.1`, and `WideChests` `6.3.0` requires `>= 2.1.8`, the highest seen in any pack so far.
  See `docs/catalogue/Grado_ChangingBase.md`. Still unchecked on the other three packs; the same
  check is one command each. The number itself is Truls's to set.
- **`RealisticFusionPower` is among the drops.** It is the mod the separate
  *realistic-fusion-refreshed* project exists to succeed; that mod is a candidate to add here once it
  ships.
- **The Picker family lost seven of nine - and for `Grado_NonChanging` that is now answered.**
  Its four drops cost that pack one feature, not four mods: `kry-picker-extended` and
  `BlueprintTools` are already members and cover the belt, planner and sorting features, and only
  `PickerInventoryTools`' requester-chest-from-blueprint has no successor found. See
  `docs/catalogue/Grado_NonChanging.md`. **The three in `Grado_ChangingBase` were assessed on
  2026-09-21 and reach the same place from a different direction:** `PickerTweaks` is recommended to
  stay dropped on its own merits - a mod that adjusts base item values does not belong under an
  overhaul - while `PickerPipeTools` and `PickerVehicles` split into features covered mostly by
  `kry-picker-complete` members and optionals, and partly by mods already in the chain
  (`PipeVisualizer-Updated` and `VehicleSnap`, both `Grado_NonChanging` members, which are in neither
  that modpack's dependency list nor its optionals). Only `PickerPipeTools`' pipe clamps have no
  successor found. That is the second pack to arrive at the same modpack question, from a different
  direction. **Adoption is pack membership and splits by pack: `Grado_NonChanging`'s share is #7 and
  `Grado_ChangingBase`'s is #8.** No ticket owns it for the chain, and one answer would serve both.
  See `docs/catalogue/Grado_ChangingBase.md`. Original note follows.
- **The Picker family lost seven of nine - and that is now disputed.** The name-only search found
  replacements for `PickerDollies` (`even-pickier-dollies`) and `PickerExtended`
  (`kry-picker-extended`) alone. Searching titles instead turns up `kry-picker-complete`, a 2.1
  modpack that reassembles the family; see its entry in `docs/mod-catalogue.md`. Adopting it is not
  straightforward, so the question is reopened, not closed - #2's to assess and #7's to settle.
- **Nothing has been play-tested.** No pack has been loaded in Factorio, and no compatibility Lua has
  been written or shown to be needed.
