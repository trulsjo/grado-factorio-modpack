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
coverage identified, and only `PickerInventoryTools` leaves a real gap. Closed 2026-09-22 by #7:
there is no gap - all four stay dropped and the pack lost no feature.** The requester-chest-from-
blueprint trick is base-game in 2.0. See `docs/catalogue/Grado_NonChanging.md`. The heading below
describes the original port search, not the current state.

- `PickerAtheneum`
- `PickerBeltTools`
- `PickerBlueprinter`
- `PickerInventoryTools`

## Grado_ChangingBase

31 entries in the 1.1 pack, of which 29 are members and 2 are optional: **17 carried over,
8 replaced, 6 dropped** -> **25 in the 2.0 pack**. The count only balances once the optionals are
named: `reverse-factory` carried over and `Squeak Through` was replaced, and both were `?` optional
upstream and are mandatory here. That change is issue #11, not a counting artefact.

**Changed again after the port, 2026-09-22 (#8): 25 members to 20.** The figures above describe
the 1.1 -> 2.0 port and are left as they were, because that is what this file records. #8 then
removed **five** members by decision rather than by an upstream gap - three of the four LTN mods,
`UltimateBeltsSpaceAge` and `StoneWaterWell-ActuallyUpdated` - and **replaced three**:
`LogisticTrainNetwork` with `cybersyn2`, `safefill` with `Waterfill_v17`, and
`ModuleInserterSimplified` with `ModuleInserterEx`. 25 - 5 - 3 + 3 = 20. Two of the
removals were the first application of this pack's promise, which was only written on 2026-09-22.
Per-mod reasons are in `docs/catalogue/Grado_ChangingBase.md` under *Decisions, 2026-09-22 (#8)* and
*Ruled out after the port*. #8 also settled #11 and #23.

**Corrected 2026-09-21: the carried-over figure read 16.** It was the members-only count sitting
next to the all-entries count for replacements, so the line added up to neither 31 nor 25. On the
all-entries basis this sentence uses, the two optionals are what separate it from the members-only
table below: `reverse-factory` makes carried-over 17 rather than 16, and `Squeak Through` makes
replacements 8 rather than 7. Both bases are now internally consistent - 17 + 8 + 6 = 31 entries,
17 + 8 = 25 mods in the 2.0 pack, and 16 + 7 + 6 = 29 members - and neither is comparable to the
other without saying which is being counted. Found by the review of #3; the measurement is release
`0.0.2` diffed against `Grado_ChangingBase/info.json`.

### Replaced

| 1.1 mod | 2.0 replacement | since |
|---|---|---|
| `LTN_Content_Reader` | `LTN_Content_Reader_Updated` | **out 2026-09-22 (#8)**, with LTN; no successor found |
| `miniloader` | `miniloader-redux` | |
| `ModuleInserter` | `ModuleInserterSimplified` | **replaced again 2026-09-22 (#8)** by `ModuleInserterEx`, the configurable successor the 1.1 mod actually had |
| `Nanobots` | `Nanobots2` | |
| `Squeak Through` | `squeak-through-2` | confirmed the right replacement, 2026-09-22 (#8, #11) |
| `UltimateBelts` | `UltimateBeltsSpaceAge` | **out 2026-09-22 (#8)** - the belt-tier layer fails this pack's promise |
| `UltimateResearchQueue` | `UltimateResearchQueue2` | |
| `WaterWell` | `StoneWaterWell-ActuallyUpdated` | **out 2026-09-22 (#8)** - free water fails this pack's promise |

**The `1.1 mod` column is the port's record and does not change.** **Four** of these eight
replacements did not survive #8 - `LTN_Content_Reader_Updated`, `ModuleInserterSimplified`,
`UltimateBeltsSpaceAge` and `StoneWaterWell-ActuallyUpdated` - and **three of the four took the 1.1
feature out of the pack with them**. The exception is `ModuleInserterSimplified`, which was replaced
again rather than dropped, so `ModuleInserter`'s feature is still here under a third name.
`safefill` and `LogisticTrainNetwork` are not in this table because they were carried over rather
than replaced during the port - see the pack header above for what #8 did to them.

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

**Ruled 2026-09-22 (#8): all six stay dropped.** The four the survey recommended keeping dropped
were ratified as they stood. `PickerPipeTools` and `PickerVehicles` close against
`kry-picker-complete`, which #8 declined for this pack on the same grounds #7 used one layer down -
it is an addition of a mod never in the 1.1 pack. Restoring either feature-by-feature would mean two
or three mods for one, and `Orphan Finder`, the closest single successor, declares
`factorio_version` 2.0 and is unreachable at this pack's floor. **`PickerPipeTools`' pipe clamps
remain the one feature in this pack's drops with no successor found - searched by name, title and
summary, which is the strongest search this project runs and still not a proof of absence.** The
bundle's members are ticketed for assessment one at a time, as #46.

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

**Changed again after the port, 2026-09-23 (#9): 44 mods to 41.** The figures above describe the
1.1 -> 2.0 port and are left as they were (the 45 counted `bobinserters`, whose line #8 removed on
2026-09-22). #9 made these changes:

- **Out:** the three Deadlock mods (`deadlock-beltboxes-loaders`, `DeadlockStackingForBobs`,
  `DeadlockStackingForVanilla`). The stacking feature is dropped entirely, because it covered vanilla
  and Bob's items and not Angel's or Clowns ones, and Truls is not sure he wants it at all.
- **Out:** `signalstrings`, a library nothing depends on, with no reason for it on record.
- **In:** `RealisticFusionPowerPort` (`Durikkan`, `1.9.2`), replacing `RealisticFusionPower` as a
  **comparison slot**. Truls wants it beside his own `realistic-fusion-refreshed`, which may replace
  it once published. The two share no prototype names, so they do not conflict.
- **Kept for now:** `angels-smelting-extended`. #50 assesses `angelsextended-remelting`, which #9
  did not accept as an alternative.
- **Deferred to #49**, the additions survey: `ScienceCostTweakerM`, `deadlock-compat-AngelBobPlus`,
  `angelsaddons-bots` and `bobclasses`.

`angelsindustries` stays dropped, and a 2.x port would reopen the question rather than add it back
automatically. The pack's `description` now says it is not included. The pack also gained a promise
(`CONTEXT.md`). Per-mod reasons are in `docs/catalogue/Grado_ABC.md` under *Decisions, 2026-09-23
(#9)*.

### Replaced

| 1.1 mod | 2.0 replacement |
|---|---|
| `RealisticReactors` | `RealisticReactorsReborn` |
| `spidertrontiers` | `spidertrontiers-community-updates` |
| `True-Nukes` | `True-Nukes_Continued` |
| `True-Nukes-Graphics` | `True-Nukes-Graphics_Continued` |
| `RealisticFusionPower` | `RealisticFusionPowerPort`, **added after the port** (2026-09-23, #9). It was listed as dropped below until then |

### Dropped - no 2.0 release, no replacement found

**Re-checked 2026-09-21 by the `Grado_ABC` part 1 survey: three of these ten - `angelsexploration`,
`angelsindustries` and `Clowns-Science` - now have their reason established, and the heading is
wrong about all three in the same way.** Both authors are active on 2.x and ported everything else;
these are the mods they chose not to bring forward, not casualties of a dying ecosystem.
`angelsexploration` and `angelsindustries` have no successor of any kind and stay dropped, the
second one being the largest single loss in the
project; `Clowns-Science` is `reconsider:` against `ScienceCostTweakerM`, which covers its recipes
and labs but not its fluid-and-power science generation. See `docs/catalogue/Grado_ABC.md`.

**The other seven were re-checked the same day by #5, and here the pattern breaks: two of them
genuinely are cases of nothing existing.** `baron-turrets` has no 2.x successor and its mandatory
`baron-library` has no 2.x release either, so it is blocked twice over; `MilesBobsExpansion` has
none either. What softens both is that the pack covers their ground another way -
`bobwarfare` for turrets, `bobassembly` for the machine ladder - which is a different claim from a
replacement existing. Four stay dropped for reasons of their own - `DeadlockCrating` is a
higher-ratio version of a
feature `deadlock-beltboxes-loaders` still supplies, and
`beautiful_bridge_railway_bob_fix_updated_new` patches a mod that is itself dropped from
`Grado_ChangingBase`, so it is the one drop whose disposal another pack decides.
`RealisticFusionPower` stays dropped with no slot held: the sibling `realistic-fusion-refreshed`
is unpublished, and more to the point it declares no Angel's or Bob's compatibility at all where
the mod it succeeds declared six optional hooks. The remaining two -
`DeadlockStackingForAngels` and `DeadlockStackingForMadclown` - are `reconsider:` as **one
question with the three Deadlock mods still in the pack**, because the only 2.x candidate replaces
the whole family's stacking recipes rather than filling either gap. See
`docs/catalogue/Grado_ABC.md`.

**Ruled 2026-09-23 (#9).** Nine of the ten stay dropped. `RealisticFusionPower` is replaced by
`RealisticFusionPowerPort` (see *Replaced* above). The Deadlock question was answered by dropping
the whole family, including the three members still in the pack.

The heading below describes the original port search, not the current state.

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

**Ruled on 2026-09-23 (#10): unchanged.** `SpaceModFeorasFork` stays the only member, and the
pack's own `! space-age` line stays. Reasons in `docs/catalogue/Grado_ABCX.md`.

## Grado_ABCS

**1 mod, and it is new.** `Grado_ABCS` did not exist in 1.1, so nothing here was carried over,
replaced or dropped.

**Ruled on 2026-09-23 (#10): unchanged.** `space-age` stays the only member: no bridge mod, and
`quality` and `elevated-rails` not named. Reasons in `docs/catalogue/Grado_ABCS.md`.

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

## Effective Factorio floor, measured 2026-09-23 (#15)

What each pack declares against what it needs, for all five at once and against the memberships as
settled by #7-#10. **This table supersedes the per-pack readings under *Open questions* below**,
whose member counts predate those settlements. It is evidence for #16 and decides nothing.

**The mechanism.** `factorio_version` decides which game a mod is *served* to; a `base >=` in a
dependency list decides which game it *installs* on. They fail separately. On a 2.0 game the
member floor bites first: a pack can declare 2.0 and be fine, or declare 2.0 and be uninstallable,
depending on its members. On a 2.1 game the pack's own declaration bites first. Every pack below
declares `factorio_version` `2.0` and `base >= 2.0.0`. The `base` line never constrains anything.
The `factorio_version` does: as declared, each pack is served to 2.0 games only, so the newest-2.0
column is what the packs as they stand would meet, and the latest-2.x column is what a 2.1
declaration would.

**Method, so it can be re-run.** Each pack's named members from its `info.json`, plus the lower
packs' members, walked to the full mandatory closure (every dependency without `?`, `(?)` or `!`)
through `https://mods.factorio.com/api/mods/<name>/full`, and each mod's `base >=` read. Done twice:
from each mod's **latest 2.x release**, which is what a 2.1 game would be served (where that
release declares 2.0, a 2.1 game is served nothing - see the last list below), and from its
**newest release declaring `factorio_version` 2.0**, which is what a 2.0 game would be served. The
closure is 29 mods for `Grado_NonChanging`, 52 for `Grado_ChangingBase`, 107 for `Grado_ABC` and
`Grado_ABCS`, and 108 for `Grado_ABCX`, one of each count being `Automatic_Train_Painter`'s
`+FluidWagonColorMask`, which is not a portal name. It is almost certainly a mangled prefix on
`FluidWagonColorMask`, already a named `Grado_NonChanging` member: `Automatic_Train_Painter`'s newest
2.0 release, `2.0.1`, lists `?FluidWagonColorMask`. Whether the game accepts the `+` is checkable
only in game. Every other mod in every closure has a 2.0 release. The 2.0 closure is one smaller for
the two lower packs (that entry) and four smaller for the three above them (that entry and three
Artisanal Reskins libraries, `reskins-assets-base`, `reskins-assets-bobs` and
`reskins-sprite-utils`, that the older releases do not pull).

| Pack | Declares | Highest own member, latest 2.x | Effective floor, latest 2.x | Effective floor, newest 2.0 | Honours `base >= 2.0.0`? |
|---|---|---|---|---|---|
| `Grado_NonChanging` | `2.0`, `>= 2.0.0` | `>= 2.1.7` | `>= 2.1.20` | `>= 2.0.67` | **No** |
| `Grado_ChangingBase` | `2.0`, `>= 2.0.0` | `>= 2.1.12` | `>= 2.1.20` | `>= 2.0.74` | **No** |
| `Grado_ABC` | `2.0`, `>= 2.0.0` | `>= 2.1.0` | `>= 2.1.20` | `>= 2.0.74` | **No** |
| `Grado_ABCX` | `2.0`, `>= 2.0.0` | `>= 2.1.9` | `>= 2.1.20` | `>= 2.0.74` | **No** |
| `Grado_ABCS` | `2.0`, `>= 2.0.0` | unreadable (`space-age`) | `>= 2.1.20`, plus the expansion | `>= 2.0.74` | **No** |

**No pack honours its declaration on either reading.** The members responsible:

- **`Grado_NonChanging`.** Five members at `>= 2.1.7`: `BlueprintTools`, `Tapeline`,
  `even-distribution`, `even-pickier-dollies` and `helmod`. Eleven of its 26 require `>= 2.1`. Above
  them is the hidden `kry_stdlib`, pulled by `kry-picker-extended`, at `>= 2.1.20` - see below. On
  the 2.0 reading, `helmod`'s newest 2.0 release asks `>= 2.0.67`.
- **`Grado_ChangingBase`.** `cybersyn2` `0.4.0` and the hidden `0-things` it pulls, both
  `>= 2.1.12`. Eleven of its 20 require `>= 2.1`. On the 2.0 reading, `miniloader-redux`'s newest
  2.0 release asks `>= 2.0.74`, the highest in the project on that reading.
- **`Grado_ABC`.** Nothing of its own above `>= 2.1.0`. 25 of its 41 require `>= 2.1`: 22 write it
  `2.1.0`, and `angelsaddons-storage`, `pump` and `rso-mod` write `2.1`. The hidden `boblibrary` is
  at `2.1.0` too. Its floor is inherited.
- **`Grado_ABCX`.** `SpaceModFeorasFork` `1.3.4`, `>= 2.1.9`, below what it inherits.
- **`Grado_ABCS`.** `space-age` is not a portal mod, so this method cannot read it. Its `2.0.77`
  build, read from the installed game for #10, asks `base >= 2.0.0` and raises nothing on the 2.0
  reading; a 2.1 build is unread and is #29's.

**`Grado_NonChanging`'s known answer, re-derived.** #2 found six members at `>= 2.1.7` out of 29,
and #43 found five after #7. This run finds the same five by name, which proves the method on the
case with a known result. The ten-of-29 count at `>= 2.1` is now eleven of 26, on a membership #7
changed by five; `BottleneckLite` and `RateCalculator`, both in with #7, are two of the eleven.

**The 2.1.20 rests on one release, published the day of this measurement.** `kry_stdlib` `2.2.21`
(2026-09-23) is the first 2.2.x release of that library to declare a floor, and the first of any to
ask for more than `2.0.0`; `2.2.20` (2026-09-22) and everything back to `2.2.13` declare a bare
`base`. `kry-picker-extended` `1.2.4` asks only `kry_stdlib >= 2.2.13`, so a resolver that picked
an older release would leave the project high at `cybersyn2`'s `>= 2.1.12`, which is the previous
reading, and `Grado_NonChanging` at `>= 2.1.7`. Which release the game's mod manager actually
installs is not something the portal says, and is checkable only in game.

**Not served to a 2.1 game**, because the member's latest release declares `factorio_version` 2.0 -
the other half of the same question, and #43's rather than this table's: six in `Grado_NonChanging`
(`CleanFloor`, `PipeVisualizer-Updated`, `SpeedControl`, `WhereIsMyBody`, `YARM`, `solar-calc`),
three in `Grado_ChangingBase` (`Nanobots2`, `qol_research` and the hidden `stdlib2`) and eight in
`Grado_ABC` (`RealisticFusionPowerPort`, `RealisticReactorsReborn`, `True-Nukes-Graphics_Continued`,
`True-Nukes_Continued`, `WideChestsBobs`, `angels-smelting-extended`,
`spidertrontiers-community-updates` and the hidden `Warheads_Continued`).

Not checked: whether the version constraints the members place on each other are satisfiable
together on the 2.0 reading. Every closure member but the bad name has a 2.0 release, but a mod
asking for a library `>= x` whose newest 2.0 release is below `x` would not show up here.
*Checked 2026-09-24 (#43): they are satisfiable on 2.0.77 - see the next section.*

## Resolves on stable 2.0.77, measured 2026-09-24 (#43)

**Factorio's stable release is 2.0.77; 2.1.20 is experimental** (`https://factorio.com/api/latest-releases`,
read 2026-09-24). So the question that decides whether a pack installs today is the 2.0 one, and
on portal metadata **all five packs resolve on 2.0.77 with no conflict**. This retires #43's
premise, that `Grado_NonChanging` "installs on no version of Factorio": the 2.1 end is closed, the
2.0 end is open. It does not choose the packs' declared target, which stays #16's.

**Method, so it can be re-run.** For each mod, take its newest release that declares
`factorio_version` 2.0 and whose `base` floor 2.0.77 satisfies - the release a 2.0.77 game is
served. Walk the mandatory closure of all five packs from those releases, then check every
dependency line of every picked release against the other picks: mandatory version constraints,
`!` incompatibilities, and version ranges on optional dependencies whose mod is in the closure.
The union of all five packs is checked at once, which is stricter than checking each pack alone.
The game's own mods (`space-age`, `quality`, `elevated-rails`) are left out of the walk: the fork's
`! space-age` is the designed ABCX/ABCS exclusion, and the optional `space-age >= 2.0.0` lines
elsewhere are met by 2.0.77.

**Result.** The closure is 104 mods, 88 of them named members; the 108 of the 2.1 reading
(`Grado_ABCX`'s closure, which is the five-pack union because `space-age` is not counted) less
`+FluidWagonColorMask` and the three Artisanal Reskins libraries, as in the section above. Every
one has a qualifying release. **Zero constraint violations** of any of the three kinds. That
includes the case #9 left open, `WideChestsBobs` asking `WideChests >= 6.0.0`.

**What this does not prove.** It assumes the mod manager picks the newest qualifying release,
which is what the portal serves - and for all 104, the newest 2.0 release already satisfies the
2.0.77 floor, so the filter changed no pick. It reads metadata, and nothing has been loaded in game. `space-age`
is not a portal mod, and its 2.0.77 build asks only `base >= 2.0.0` (#10).

**Not served at 2.1: seventeen, kept as a watch list for when 2.1 goes stable.** Their newest
release declares `factorio_version` 2.0, and `?version=2.1&namelist=` returns none of them
(2026-09-24). Fifteen are named members and two are hidden, the same set as the list in the section
above:

| Introduced by | Mod | Newest release |
|---|---|---|
| `Grado_NonChanging` | `CleanFloor` | `2.0.0`, 2024-10-20 |
| | `SpeedControl` | `2.0.1`, 2024-10-27 |
| | `WhereIsMyBody` | `2.0.15`, 2024-11-19 |
| | `YARM` | `1.0.5`, 2025-01-01 |
| | `PipeVisualizer-Updated` | `2.4.4`, 2025-11-16 |
| | `solar-calc` | `0.5.72`, 2025-12-21 |
| `Grado_ChangingBase` | `Nanobots2` | `3.3.2`, 2025-03-12 |
| | `qol_research` | `3.4.2`, 2025-05-04 |
| | `stdlib2` (hidden, via `Nanobots2`) | `2.0.1`, 2024-10-29 |
| `Grado_ABC` | `RealisticFusionPowerPort` | `1.9.2`, 2025-12-13 |
| | `RealisticReactorsReborn` | `2.0.27`, 2025-08-01 |
| | `True-Nukes_Continued` | `0.3.36`, 2026-01-17 |
| | `True-Nukes-Graphics_Continued` | `0.0.3`, 2025-12-29 |
| | `Warheads_Continued` (hidden, via `True-Nukes_Continued`) | `0.0.21`, 2025-12-29 |
| | `WideChestsBobs` | `2.0.0`, 2025-07-27 |
| | `angels-smelting-extended` | `2.0.01`, 2026-08-22 |
| | `spidertrontiers-community-updates` | `0.3.1`, 2024-11-16 |

`Grado_ABCX` and `Grado_ABCS` add none: `SpaceModFeorasFork` is 2.1, and `space-age` is the game's.
Upstream 2.1 plans and served replacements were not researched for these. They matter only at a
2.1 target, and whether to target 2.1 is #16's choice; Truls closed #43 on the 2.0.77 result with
this list kept as a watch list rather than a sweep.

## Open questions

- **`alien-biomes-hr-terrain` was dropped on the assumption that 2.0 `alien-biomes` absorbed the
  HR terrain. Answered 2026-09-21 and closed 2026-09-22 (#8): the drop was right, the mechanism was
  wrong, and the mod stays dropped - now by ruling and not only by recommendation.** `Earendel` did not grow `alien-biomes` to contain the terrain - he split *all* the
  graphics into `alien-biomes-graphics`, created 2024-10-17 for the 2.0 port and now a mandatory
  dependency of `alien-biomes` (`0.8.0`, 2.1, 2026-06-24), and edited the old mod's page to read
  "Not required for Factorio 2.0 games". A ChangingBase player gets the high-resolution terrain
  automatically. The difference matters: there is a third mod in the chain, named in none of our
  five dependency lists, that can go stale on its own. Evidence in
  `docs/catalogue/Grado_ChangingBase.md`. **This is now a pattern rather than an incident.** The
  `Grado_ABC` survey found **fifteen** such mods on 2026-09-21 - nine from part 1 (`boblibrary`,
  `Clowns-Nuclear` and seven Angel's graphics packages) and six more from part 2 (four Artisanal
  Reskins packages, `rusty-locale` and `Warheads_Continued`) - every one mandatory, every one
  absent from all five dependency lists. The set was computed as the mandatory closure of all 45
  members minus what the two lower packs already pull in, which is what keeps `flib` out of the
  count: it is a mandatory dependency here but `Grado_NonChanging` already installs it. Two are
  worth naming: `rusty-locale` is staler than any named member of the pack, and
  `Warheads_Continued` is content rather than art. Any survey reading a dependency list should
  expect this and should walk the closure rather than one level. See
  `docs/catalogue/Grado_ABC.md`.
- **`factorio_version` is declared `2.0`** on all five packs, while several member mods (Bob's,
  Angel's, MadClown) have moved to `2.1`. **Re-measured for all five on 2026-09-23 against the
  settled memberships (#15): see *Effective Factorio floor* above, which supersedes the readings in
  this entry.** **The member counts below are each pack as it stood when
  it was measured**: #7 and #8 then took the three lower lists to 26, 20 and 44 members, #9 took the third to 41
  on 2026-09-23, and the
  numerators have not been re-derived against them. **Answered for `Grado_NonChanging` on
  2026-09-21, and the answer is no:** ten of its 29 members require `base >= 2.1`, six of them
  `>= 2.1.7`, so a player on
  2.0.x cannot satisfy the pack. See `docs/catalogue/Grado_NonChanging.md`. The mechanism is the
  members' own `base` requirements rather than the `factorio_version` field. **Answered the same way
  for `Grado_ChangingBase` on 2026-09-21, and it raises the floor:** eleven of its 25 members require
  `base >= 2.1`, and `WideChests` `6.3.0` requires `>= 2.1.8`, the highest seen in any pack at the
  time. **#8 raised it again on 2026-09-22, to `base >= 2.1.12`** - `cybersyn2`, and the `0-things`
  library it pulls, both require it, which is above `Grado_ABCX`'s 2.1.9 and is now the project
  high. That floor is inherited by `Grado_ABC`, `Grado_ABCX` and `Grado_ABCS`, so the swap changed
  the answer for four packs. Removing the four LTN mods took out one `>= 2.1.7` member and two
  `>= 2.1` ones, which lowers nothing, because the new member is higher than all of them.
  See `docs/catalogue/Grado_ChangingBase.md`. **Answered the same way for `Grado_ABC` on
  2026-09-21:** all 29 of the overhaul-core members require `base >= 2.1`, 22 of them in their own
  dependency list, and the pack is now measured in full - **twenty-six of the 45 declare it
  directly** and the other nineteen are neutral or inherit it. It does not raise the floor - the
  highest requirement from ABC's own members is `>= 2.1.0` - but the pack inherits
  `Grado_ChangingBase`'s floor, which was `>= 2.1.8` when this was measured and is `>= 2.1.12` after
  #8, so that is the effective minimum for an ABC install. See
  `docs/catalogue/Grado_ABC.md`. **Answered for both end-game branches on 2026-09-22, and
  `Grado_ABCX` raises the floor again:** `SpaceModFeorasFork` `1.3.4` requires `base >= 2.1.9`, one
  patch above `WideChests` and, until 2026-09-22, **the highest requirement anywhere in the
  project** - measured across
  the chain's full mandatory closure, 98 distinct named members of the three lower packs and 19
  hidden mandatory dependencies, 117 mods, latest 2.x release each. `Grado_ABCS` adds nothing to the
  floor that can be read, because `space-age` is
  not a portal mod and its `base` requirement is unreadable by this method at all; from the portal
  alone it inherits `Grado_ChangingBase`'s floor, `>= 2.1.8` when this was measured and `>= 2.1.12`
  after #8. See `docs/catalogue/Grado_ABCX.md` and
  `docs/catalogue/Grado_ABCS.md`. **So the measurement is complete for four packs and not completable
  for the fifth without the game**, which is issue #29. The number itself is Truls's to set.
  *(Partly read 2026-09-23, #10: `space-age` `2.0.77` in the installed game declares
  `base >= 2.0.0`, below the inherited `2.1.12`, so on 2.0.77 it does not raise the floor. A 2.1
  build is unread. See `docs/catalogue/Grado_ABCS.md`, What the portal actually returns.)*
  **Every reading above is of each member's *latest* release, and that turns out to matter
  (2026-09-23, #9).** All 91 named mods checked (the three lower packs' lists before #9's removals,
  plus `RealisticFusionPowerPort`, so a superset of the 87 members after it) have at least one
  release declaring `factorio_version` 2.0, and none of those newest 2.0
  releases asks for `base >= 2.1`. On a 2.0 game the portal serves each mod its newest 2.0 release,
  so the 2.1 floor measured here is a floor for a 2.1 target and not a proof that 2.0 is
  impossible. The hidden mandatory members pass the same check: `Grado_ABC`'s fourteen after #9, plus `flib`,
  `alien-biomes-graphics`, `kry_stdlib`, `stdlib2` and `0-things`. Not checked: whether the
  old releases' version floors on each other are consistent. See #43 and #16. *(Checked
  2026-09-24, #43: consistent on stable 2.0.77, zero violations across all five packs - see
  *Resolves on stable 2.0.77* above.)*
- **`RealisticFusionPower` is among the drops.** It is the mod the separate
  *realistic-fusion-refreshed* project exists to succeed; that mod is a candidate to add here once it
  ships. **Answered in part 2026-09-23 (#9):** `RealisticFusionPowerPort` holds the slot for now, as a
  comparison against the sibling project, which may replace it once published.
- **The Picker family lost seven of nine - and for `Grado_NonChanging` that is now closed.**
  **#7 settled it on 2026-09-22: the four drops cost that pack nothing.** `kry-picker-extended` and
  `BlueprintTools` are already members and cover the belt, planner and sorting features, and the one
  feature thought to be missing - `PickerInventoryTools`' requester-chest-from-blueprint - turned out
  to be base-game. Dropping a blueprint on a requester chest's "Add section" button is vanilla 2.0;
  the suggestion asking for it was closed Implemented, and a sweep of every 2.x mod by title and
  summary found nothing reproducing it because nothing needs to. The sentence below, that only
  `PickerInventoryTools`' requester-chest-from-blueprint has no successor found, is superseded. See
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
  **#7 declined it for `Grado_NonChanging` on 2026-09-22** - out of that ticket's scope as an
  addition, and it carries `EvenDistributionLite` as a mandatory member, which would have overruled
  the decision to keep `even-distribution`. Its individual members are ticketed separately.
  `Grado_ChangingBase`'s share is still #8's and is not settled by that.
  **#8 settled it on 2026-09-22 and declined it here too**, on the same grounds: an addition of a mod
  never in the 1.1 pack, plus the structural objection that a pack depending on a pack hands a third
  party control of several members at once. `PickerPipeTools` and `PickerVehicles` stay dropped, and
  the pipe clamps stay the one feature with no successor found. **So the Picker question is now
  closed for both packs that owned a share of it**, and the bundle's members are ticketed for
  assessment one at a time, for whichever pack each fits.
  See `docs/catalogue/Grado_ChangingBase.md`. Original note follows.
- **The Picker family lost seven of nine - and that is now disputed.** The name-only search found
  replacements for `PickerDollies` (`even-pickier-dollies`) and `PickerExtended`
  (`kry-picker-extended`) alone. Searching titles instead turns up `kry-picker-complete`, a 2.1
  modpack that reassembles the family; see its entry in `docs/mod-catalogue.md`. Adopting it is not
  straightforward, so the question is reopened, not closed - #2's to assess and #7's to settle.
- **Two dependencies the 1.1 pack declared optional became mandatory in the port. Closed
  2026-09-22 (#8, settling #11): both stay mandatory, by decision this time.** `? reverse-factory`
  and `? Squeak Through` were the only optional entries in any of the three published 1.1 packs, and
  the port flattened both without anyone choosing to. The reason for keeping the result: an optional
  dependency installs nothing - it only orders load if the player already has the mod - so a pack
  whose members are optional hands the player less than its list implies. `squeak-through-2` was
  also confirmed the right replacement for `Squeak Through`: it declares `! Squeak Through`, and the
  only other 2.1 candidate a name, title and summary search returns is `Exteros-QoL-System`, a QoL
  bundle that carries a Squeak Through among several features — declined as an addition, not absent.
- **The train-logistics paradigm was reopened and changed. Closed 2026-09-22 (#8, settling #23):
  `Grado_ChangingBase` moves from LTN to Cybersyn 2.** The four LTN mods are out and `cybersyn2` is
  in - and it is author-declared **alpha**, which was read and accepted rather than overlooked. The
  reasoning is that Project Cybersyn CS1, which #23 was written to weigh, has no migration to its own
  successor and so is a dead end, while doing this before any release costs nobody an invalid entity
  and doing it after would cost every logistic train stop in a player's base. The content-reader
  feature leaves the pack outright, because no CS2 content reader exists. See
  `docs/catalogue/Grado_ChangingBase.md`.
- **Nothing has been play-tested.** No pack has been loaded in Factorio, and no compatibility Lua has
  been written or shown to be needed. **This now matters more than it did**: as of 2026-09-22
  `Grado_ChangingBase`, and therefore the three packs above it, depend on a mod whose author
  describes it as having "known issues, bugs, missing features, and even the occasional crash".
