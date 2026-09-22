# Catalogue: `Grado_ABC`

The shared overhaul core — Angel's, Bob's and MadClown on top of `Grado_ChangingBase`, and the pack
both end-games build on. `Grado_ABCX` adds SpaceX to it and `Grado_ABCS` adds Space Age, and the two
are mutually exclusive, so a constraint that lands here lands on both branches at once. That is the
question running through every entry below that did not exist lower down: whether anything in the
core forecloses either end-game.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-21** and is reproduced from the fetched data rather than retyped.

The dependency list holds 47 entries: `base >= 2.0.0`, `Grado_ChangingBase` — a pack, catalogued in
`docs/catalogue/Grado_ChangingBase.md` — and **45 mods**. Ten more were dropped during the port.
**The pack is now catalogued in full**: #4 surveyed 29 members and 3 drops on 2026-09-21, #5 the
other 16 and 7 the same day. Which ticket took which is *The split between #4 and #5* below, kept
because two tickets writing one file is the only way a mod falls through.

Four findings hold across all 45:

- **Every member has a 2.x release.** Nothing in the pack is stranded on 1.1. **Thirty-six are on
  2.1 and nine declare 2.0** — and the nine are not spread evenly: eight of them are add-ons from
  #5's half, against one from the overhaul core.
- **The pack requires `base >= 2.1`**, which is fatal to its declared `factorio_version` for the
  third time in three surveys. All 29 of the core mods require it, 22 saying so themselves; the
  add-ons mostly declare no floor at all, which changes nothing because one member is enough. See
  *The pack cannot load on the Factorio version it declares*.
- **Fifteen mandatory dependencies are not named in the dependency list**, and every one is a real
  mod a player installing this pack will get. #4 found nine, #5 six more. See *The fifteen
  mandatory dependencies the list does not name*. This is the `alien-biomes-graphics` shape at
  fifteen times the size, and it is now the most reliable finding in the project.
- **Maintenance risk sits almost entirely in the add-ons.** Ranked by last release, **ten of the
  sixteen add-ons are staler than every one of the 29 core mods** — the oldest core release is
  2026-06-29, and those ten run from 2024-11-16 to 2026-06-26. The overhaul the pack is named for
  is its healthiest part; the things bolted around it are not.

## The split between #4 and #5

#4 is "the Angel's, Bob's and MadClown/Clowns mods"; #5 is "the add-ons around the overhaul core".
Applied to the list, and **the two sets are disjoint and cover all 45**:

| | Count | Members |
|---|---|---|
| **#4, here** | 29 | The 16 `bob*` mods; the 8 `angels*` mods by `Arch666Angel`; the 3 `Clowns-*` mods; and the two third-party Angel's extensions, `angels-smelting-extended` and `extendedangels` |
| **#5** | 16 | `DeadlockStackingForBobs`, `DeadlockStackingForVanilla`, `PlutoniumEnergy`, `RealisticReactorsReborn`, `True-Nukes-Graphics_Continued`, `True-Nukes_Continued`, `WideChestsBobs`, `botReplacer`, `deadlock-beltboxes-loaders`, `pump`, `reskins-angels`, `reskins-bobs`, `reskins-compatibility`, `rso-mod`, `signalstrings`, `spidertrontiers-community-updates` |

**The rule is authorship and role, not the name.** Four of #5's sixteen carry `Bobs`, `Angels` or
`bob` in the name — `DeadlockStackingForBobs`, `WideChestsBobs`, `reskins-bobs`, `reskins-angels` —
and none of them is an Angel's or Bob's mod. They are third-party mods *for* Angel's and Bob's, which
is #5's half by its own wording, and #5 names the Deadlock family and the reskin packs explicitly.
`angels-smelting-extended` and `extendedangels` are third-party too and went the other way, because
they extend the production chains rather than sitting alongside them, and assessing them apart from
`angelssmelting` would be assessing them in isolation from the thing they modify.

The drops split the same way: **#4 took `angelsexploration`, `angelsindustries` and
`Clowns-Science`** — its ticket names all three — and #5 the other seven.

**Both halves are done and the result was checked rather than assumed.** The 45 entries under *In
the pack* are in exact dependency-list order and match `Grado_ABC/info.json` name for name, with no
mod missing, duplicated or invented; the 10 under *Dropped during the port* match
`docs/porting-notes.md`. That is the acceptance criterion both tickets shared, and it is verifiable
by re-running the comparison rather than by reading.

## In the pack

### `Clowns-AngelBob-Nuclear`

| | |
|---|---|
| **Title** | MadClown01's AngelBob Nuclear Extension |
| **Does** | Thorium fuel cycles end to end, advanced processing for spent fuel and nuclear waste, and additional reactor fuels, built on top of Angel's refining rather than beside it |
| **Latest** | `2.1.01`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 20,403 |
| **Owner** | `MadClown01` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None exists. Searching the full 2.x list for "thorium" in name, title
and summary returns this mod and nothing else — it is the only thorium chain on 2.x.

Its mandatory `Clowns-Nuclear` is not in the dependency list; see *The fifteen mandatory
dependencies the list does not name*. That mod declares `(?) RealisticReactorsReborn`, which #5
catalogues, so
the Clowns nuclear pair and the pack's reactor mod are already integrated by their authors rather
than merely coexisting.

**Recommendation: keep.** Current on 2.1 within two months of this reading, and the only mod in the
game offering what it offers.

### `Clowns-Extended-Minerals`

| | |
|---|---|
| **Title** | MadClown01's Extended AngelBob Minerals |
| **Does** | Adds rare ores and minerals to the Angel's refining and Bob's ores chains, with refining paths for each, so the map's ore mix varies between saves |
| **Latest** | `2.1.01`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 19,042 |
| **Owner** | `MadClown01` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It extends two specific mods that are both in this pack;
a substitute would have to extend the same two, and the only candidates on 2.x for that are its own
siblings, which are already here.

It declares `! angelsaddons-refiningthorium`, a hard incompatibility. That mod has **no 2.x
release** — it does not appear in the 9,708-entry 2.x list — so the clash cannot be triggered by
anything a player on 2.x can install, and it is worth recording only so nobody re-derives it.

**Recommendation: keep.** Current on 2.1, and it is one of the three mods that make this an ABC pack
rather than an AB one.

### `Clowns-Processing`

| | |
|---|---|
| **Title** | MadClown01's Processing |
| **Does** | The Clowns production layer: sand sluicing for platinum, chrome and gold; a uranium chain in the style of Angel's Smelting; phosphorus to fertiliser; mercury from thermal water; neurotoxin; catalytic electrolysis and air filtering for bulk oxygen, hydrogen and nitrogen; osmium and depleted-uranium smelting; advanced centrifuging |
| **Latest** | `2.1.01`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 23,197 |
| **Owner** | `MadClown01` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched, for the same reason as its sibling: it is an extension of
Angel's Refining, Petrochem and Smelting specifically, all three of which are in this pack.

It is the most-downloaded of the three Clowns mods the list names — the hidden `Clowns-Nuclear` is
ahead of it at 27,050 — and the one the others lean on: `Clowns-AngelBob-Nuclear` and
`Clowns-Extended-Minerals` both require it, and `extendedangels` declares it optionally.

**Recommendation: keep.** Current on 2.1, load-bearing for the rest of the Clowns set, and the
largest single block of content in the pack that is neither Angel's nor Bob's.

### `DeadlockStackingForBobs`

| | |
|---|---|
| **Title** | Deadlock Stacking For Bobs |
| **Does** | The bridge between Deadlock's beltboxes and Bob's content: adds stacked variants of Bob's plates, ores and intermediates so they can be compressed onto belts like the base-game items |
| **Latest** | `2.0.2`, `factorio_version` **2.0**, 2025-07-17 |
| **Downloads** | 13,178 |
| **Owner** | `billbo99` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** One, and it is the same candidate that bears on the whole family:
`deadlock-compat-AngelBobPlus`. It is assessed once, under *The Deadlock stacking family is one
question*, because choosing it is a decision about all five Deadlock mods at once rather than about
this one.

It requires `rusty-locale`, which the dependency list does not name; see *The fifteen mandatory
dependencies the list does not name*. Its eighteen optional dependencies cover **fifteen of the
pack's sixteen Bob's mods** — all but `bobvehicleequipment`, which adds no items to stack — plus
`reskins-bobs`, so it is built for close to exactly this configuration.

**Recommendation: keep**, subject to the family question. Nothing is wrong with it on its own terms
— it is current for what it does and its author still ships it. What is unresolved is whether the
pack wants three of five Deadlock mods or a different arrangement entirely.

### `DeadlockStackingForVanilla`

| | |
|---|---|
| **Title** | Deadlock Stacking for Vanilla |
| **Does** | The same bridge for base-game items, adding stacked variants of vanilla plates, ores and intermediates |
| **Latest** | `2.0.3`, `factorio_version` **2.0**, 2025-10-18 |
| **Downloads** | 18,166 |
| **Owner** | `billbo99` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** As above — the family question covers it.

Its only dependencies are `base`, `rusty-locale` and `deadlock-beltboxes-loaders >= 2.5.0`. It knows
nothing about Angel's or Bob's, which is what makes it the one member of the family that would
survive any decision about the others.

**Recommendation: keep**, subject to the family question.

### `PlutoniumEnergy`

| | |
|---|---|
| **Title** | Plutonium Energy |
| **Does** | Extends the nuclear chain past uranium: plutonium bred from fission, reprocessed into fuel for a higher-output cycle, plus plutonium-based ammunition |
| **Latest** | `1.8.2`, `factorio_version` **2.1**, 2026-06-26 |
| **Downloads** | 79,842 |
| **Owner** | `JohnTheCoolingFan` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched as a substitute. It is one of six mods in this pack
touching the nuclear chain, which is a question about the subsystem rather than about this mod; see
*Six mods on one nuclear chain* below.

**Recommendation: keep.** Current on 2.1, the best-maintained of the pack's four nuclear add-ons by
both recency and downloads, and the only one of them requiring `base >= 2.1` on its own account.

### `RealisticReactorsReborn`

| | |
|---|---|
| **Title** | Realistic Reactors Reborn |
| **Does** | Replaces the vanilla reactor with a simulated one: control rods, coolant loops, emergency cooling, breeder operation and meltdowns if the heat is not managed |
| **Latest** | `2.0.27`, `factorio_version` **2.0**, 2025-08-01 |
| **Downloads** | 3,437 |
| **Owner** | `OwnlyMe` |
| **Supersedes** | `RealisticReactors` by `IngoKnieto`, last `3.1.5` on 2024-04-15, 23,678 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None found offering reactor simulation on 2.x. The mod it replaces has
no 2.x release and its last 1.1 release predates Factorio 2.0.

**The download gap is the thing to read carefully here.** 3,437 against the original's 23,678 is not
the usual successor asymmetry — `RealisticReactorsReborn` is a **2.0-only mod with no 1.1 history at
all**, its entire release list being `factorio_version` 2.0, so it has had the whole 2.x period to
accumulate 3,437 and no more. Three members sit below it —
`True-Nukes_Continued` at 2,777, `WideChestsBobs` at 805 and `True-Nukes-Graphics_Continued` at
346 — so it is fourth from the bottom of the 45 rather than last, and two of those three are its
neighbours in the nuclear subsystem. Its last release was 2025-08-01, over a year before this
reading.

`Clowns-Nuclear` — a hidden mandatory member, see below — declares `(?) RealisticReactorsReborn`,
so the Clowns nuclear chain already knows about it.

**Recommendation: keep**, and treat it as the member most worth watching for abandonment. Nothing
replaces it, and the pack's nuclear content is built around it; that is an argument for keeping it
and also the reason its staleness matters.

### `True-Nukes-Graphics_Continued`

| | |
|---|---|
| **Title** | True Nukes Graphics Continued |
| **Does** | The explosion animations for `True-Nukes_Continued`, shipped separately so a code update does not re-download the art |
| **Latest** | `0.0.3`, `factorio_version` **2.0**, 2025-12-29 |
| **Downloads** | 346 |
| **Owner** | `Daimonfire` |
| **Supersedes** | `True-Nukes-Graphics` by `BicycleEater`, last `0.0.1` on 2020-12-02, 11,805 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None possible. It is one mod's art package and has no meaning apart
from it.

The portal files it under the **internal** category, which is the category for exactly this — a
package not meant to be installed on its own. At 346 downloads it is the least-installed mod in the
pack by a wide margin, which measures that it is an accessory rather than anything about its
quality. Note that `True-Nukes_Continued` declares it **optionally**, not mandatorily, so this line
in the dependency list is doing real work: without it the pack would not pull the graphics in.

**Recommendation: keep**, and keep it named. This is the mirror image of the hidden-dependency
problem below: a graphics package that *is* named in the list, precisely because its parent does not
require it.

### `True-Nukes_Continued`

| | |
|---|---|
| **Title** | True Nukes Continued |
| **Does** | Rebuilds nuclear weapons around a blast model — scaled explosions, fallout, and a range of warhead sizes from tactical up — rather than the single vanilla atomic bomb |
| **Latest** | `0.3.36`, `factorio_version` **2.0**, 2026-01-17 |
| **Downloads** | 2,777 |
| **Owner** | `Daimonfire` |
| **Supersedes** | `True-Nukes` by `BicycleEater`, last `0.3.33` on 2023-11-27, 43,955 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It is a continuation of the mod the 1.1 pack carried,
by a new maintainer, and the original has no 2.x release.

It requires `Warheads_Continued`, which the dependency list does not name — another hidden member.
It declares optional support for `PlutoniumEnergy`, `Clowns-Nuclear` and `Clowns-AngelBob-Nuclear`,
all three in this pack, so three of the six nuclear mods are wired together by their authors.

**Recommendation: keep.** Current within eight months of this reading and the successor is real
rather than nominal — `0.3.36` against the original's last `0.3.33` is continued development, not a
republish.

### `WideChestsBobs`

| | |
|---|---|
| **Title** | Merging Chests Bobs |
| **Does** | Adds Bob's-material variants of the merged chests, so the `WideChests` merging mechanic covers Bob's chest tiers and not only the base-game ones |
| **Latest** | `2.0.0`, `factorio_version` **2.0**, 2025-07-27 |
| **Downloads** | 805 |
| **Owner** | `Atria` |
| **Overlaps** | `angelsaddons-storage` (`Grado_ABC`) |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None; it is the Bob's bridge for a specific mod in the pack below and
has no substitute that is not that mod.

It is the fifth member of the `WideChests` family and the only one in this pack — the other four are
`Grado_ChangingBase` members. Its mandatory dependencies are `WideChests >= 6.0.0`, `boblogistics`
and `bobplates`, all three already in the chain, so it adds no hidden member of its own.

**The overlap with `angelsaddons-storage` is within-pack and is the half #30 does not cover.**
`angelsaddons-storage` offers warehouses and silos; this mod extends a merging mechanic to Bob's
chests. Both are in `Grado_ABC`, so there is no lower pack to defer to and the comparison sits in
this file, under *Overlaps*. The four-mod cross-pack half is #30's, against
`docs/catalogue/Grado_ChangingBase.md`. Whether the row above may name a same-pack mod at all is
**#33**.

**Recommendation: keep**, with the caveat that it is the smallest mod in the pack at 805 downloads
and inherits whatever #30 concludes about the family's cost. Under
`docs/catalogue/Grado_ChangingBase.md`'s finding that the merging mods' load cost scales with the
number of chest types above them, this is the mod that adds those types.

### `angels-smelting-extended`

| | |
|---|---|
| **Title** | Angel's Extended Smelting and Compression |
| **Does** | Extends Angel's Smelting with metal-mixing recipes for the alloys (brass, bronze and the rest) as an alternative to the ingot route, compression and un-compression of cast metal forms, and an Ironworks that casts gears, pipes and underground pipes straight from molten metal |
| **Latest** | `2.0.01`, `factorio_version` **2.0**, 2026-08-22 |
| **Downloads** | 18,573 |
| **Owner** | `pezzawinkle` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** One real candidate, found by searching the 2.x list for the AngelBob
ecosystem rather than by name: **`angelsextended-remelting`**, *Angel's Extended - Remelting* by
`Aragas` — `2.0.0`, `factorio_version` 2.0, 2026-02-27, 1,206 downloads. It covers the same ground
from the other direction: remelting plates back to molten metal, and a four-tier Alloy Mixer that
"mixes molten metals into alloys directly, bypassing the ingot stage", which is this mod's alloy
feature almost word for word. It also declares optional support for `bobplates` and
`Clowns-Processing`, both of which are here. It is not obviously better — 1,206 downloads against
18,573, and no compression or Ironworks — but it is a genuine alternative and the first one recorded
for this pack.

**This is the entry to distrust in this survey, and the reason is its release history.** Its 2.x
release is a single one: `2.0.01` on 2026-08-22, the first release of any kind since `1.0.14` on
2024-05-28. It is the only part-1 member declaring `factorio_version` 2.0 rather than 2.1, and it
shipped *after* the whole Angel's set moved to 2.1 on 2026-07-27, so the author saw 2.1 and stayed
on 2.0. Its Angel's dependencies carry no version floors at all, so it will resolve against the 2.1
Angel's mods that are actually installed — resolving is not the same as working, and this mod
modifies Angel's Smelting's recipes directly.

**Recommendation: reconsider:** whether a one-release 2.0 port of a 2024-dormant mod should be a
mandatory member of the core both end-games build on, and if so whether `angelsextended-remelting`
covers enough of it. Not a recommendation to drop — the compression and Ironworks features have no
substitute found — but it is the member of this half most likely to be the first thing that breaks
when the pack is first loaded, and the only one where that can be said from the portal alone.

### `angelsaddons-cab`

| | |
|---|---|
| **Title** | Angel's Addons - C.A.B. |
| **Does** | Adds the C.A.B., a large crawler vehicle with equipment grids, as an alternative to the car-and-tank progression for moving around an Angel's base |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-07-11 |
| **Downloads** | 89,473 |
| **Owner** | `Arch666Angel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It is a vehicle from the Angel's set, wanted for being
that rather than for a capability another mod could supply.

Its only dependency is `base >= 2.1.0` — no Angel's mod at all. It is the most detachable member of
the Angel's half, which matters only if the pack is ever trimmed.

**Recommendation: keep.** Current on 2.1.

### `angelsaddons-mobility`

| | |
|---|---|
| **Title** | Angel's Addons - Mass Transit |
| **Does** | Themed train sets — a petrochem train, a smelting train and a crawler set — as locomotives and wagons with their own liveries rather than as new mechanics |
| **Latest** | `2.1.1`, `factorio_version` **2.1**, 2026-07-27 |
| **Downloads** | 102,571 |
| **Owner** | `Arch666Angel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched; it is the Angel's train set, not a capability.

It has **three mandatory graphics dependencies** that the pack's list does not name —
`angelsaddons-mobility-graphics-crawler`, `-petro` and `-smelting`. See *The fifteen mandatory
dependencies the list does not name*.

**Recommendation: keep.** Current on 2.1, released the same day as the Angel's core.

### `angelsaddons-storage`

| | |
|---|---|
| **Title** | Angel's Addons - Storage Options |
| **Does** | Oversized storage for an Angel's base: warehouses, ore silos, and pressure tanks that hold far more fluid than a vanilla tank |
| **Latest** | `2.1.1`, `factorio_version` **2.1**, 2026-07-14 |
| **Downloads** | 187,724 |
| **Owner** | `Arch666Angel` |
| **Overlaps** | `WideChests`, `WideChestsAllTypes`, `WideChestsLogistic`, `WideChestsUnlimited` (`Grado_ChangingBase`); `WideChestsBobs` (`Grado_ABC`) |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched as a substitute. The overlap is not with a candidate
replacement but with the `WideChests` family, which merges adjacent chests into one large entity —
the same player-facing outcome as a warehouse, reached by a different mechanism. **The family
straddles the pack boundary, so this overlap has two halves and they are governed differently.**

*Cross-pack, four mods.* `WideChests`, `WideChestsAllTypes`, `WideChestsLogistic` and
`WideChestsUnlimited` are `Grado_ChangingBase` members. That pack is the lower one, so under
`docs/mod-catalogue.md` the comparison belongs in its entry and not here; it is not written yet, and
issue **#30** is filed against that file for it. The `WideChests` entries there already flag that
their cost scales with whatever overhaul is layered above, which is this pack.

*Within-pack, one mod.* `WideChestsBobs` is a fifth family member and is in **this pack's own
dependency list**, as #5's to catalogue. Whether it belongs in the row above at all is #33 — the
format defines that row for cross-pack overlaps and this family straddles the boundary. A
within-pack overlap has no lower pack to defer to, so it is written under *Overlaps* below rather
than sent to #30 — and #30 is told, because whoever closes it would otherwise compare four mods
against a warehouse and miss the fifth.

**Recommendation: keep.** Current on 2.1 and the most-downloaded Angel's add-on. The overlap is
evidence for the question #30 asks, not a reason to dispose of either side here — which layer owns
bulk storage is pack membership, and that is #8's and #9's.

### `angelsbioprocessing`

| | |
|---|---|
| **Title** | Angel's Bio Processing |
| **Does** | Turns waste products back into inputs by biological means: tree and algae farming, nutrient and fertiliser chains, and processing routes that consume the residues the refining and petrochem chains produce |
| **Latest** | `2.1.1`, `factorio_version` **2.1**, 2026-07-27 |
| **Downloads** | 195,768 |
| **Owner** | `Arch666Angel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. It is one of the five Angel's core mods; replacing it would mean
replacing the overhaul.

It requires `angelsrefining`, `angelspetrochem` and `angelssmelting` at `>= 2.1.0` and the
unnamed `angelsbioprocessinggraphics`, and declares `(?) bobmodules`.

**Recommendation: keep.** Current on 2.1.

### `angelsinfiniteores`

| | |
|---|---|
| **Title** | Angel's Infinite Ores |
| **Does** | Gives ore patches an infinite-yield tail like vanilla crude oil, for the base ores, Bob's ores and Angel's own, with the yield configurable per resource |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-07-11 |
| **Downloads** | 119,725 |
| **Owner** | `Arch666Angel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It is the Angel's answer to ore exhaustion and is built
to know about `bobores` and `bobplates`, both of which are here.

**Every one of its mod dependencies is optional, including `angelsrefining`** — only `base >= 2.1.0`
is mandatory. Four of the eight Angel's members are detachable that way (this one and the three
add-ons), and one mod declares it at all: `Clowns-Extended-Minerals`, as `(?)`. It is the Angel's
mod people name alongside the core five that is not wired to them.
It declares `(?) rso-mod >= 7.0.0`,
which #5 catalogues; the two decide together what a map's ore looks like, and that cluster is
described under *Overlaps* below.

**Recommendation: keep.** Current on 2.1.

### `angelspetrochem`

| | |
|---|---|
| **Title** | Angel's Petrochemical Processing |
| **Does** | Replaces vanilla oil processing with a gas-and-liquid petrochemical web — cracking, reforming and separation across many intermediates — and ties the result into Bob's recipes and technologies |
| **Latest** | `2.1.2`, `factorio_version` **2.1**, 2026-07-27 |
| **Downloads** | 218,319 |
| **Owner** | `Arch666Angel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Angel's.

**Recommendation: keep.** Current on 2.1, and the second-most-downloaded Angel's mod.

### `angelsrefining`

| | |
|---|---|
| **Title** | Angel's Refining |
| **Does** | The mod the rest of Angel's hangs off: ores come out of the ground as compound ores that must be crushed, sorted and refined before they can be smelted, which is the change that makes an Angel's base look the way it does |
| **Latest** | `2.1.2`, `factorio_version` **2.1**, 2026-07-27 |
| **Downloads** | 222,486 |
| **Owner** | `Arch666Angel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. This is the most load-bearing mod in the pack after `bobplates`.
Enumerated: **eight of the thirteen other Angel's-side mods require it mandatorily**, directly or
through a sibling — `angelspetrochem`, `angelssmelting`, `angelsbioprocessing`,
`angels-smelting-extended`, `extendedangels`, `Clowns-Processing`, `Clowns-AngelBob-Nuclear` and
`Clowns-Extended-Minerals`. The five that do not are the three add-ons, `angelsinfiniteores` and the
hidden `Clowns-Nuclear`, each of which declares it optionally or not at all.

It carries fourteen optional dependencies — twelve of them Bob's mods, plus `rso-mod` and `Yuoki`
— which is where most of the AB integration actually lives.

**Recommendation: keep.** Current on 2.1, the most-downloaded Angel's mod, and the thing the pack is
named for.

### `angelssmelting`

| | |
|---|---|
| **Title** | Angel's Smelting |
| **Does** | Alternative routes from refined ore to plate — induction, casting and the molten-metal chain — that trade space and power for higher yield than direct furnace smelting |
| **Latest** | `2.1.1`, `factorio_version` **2.1**, 2026-07-27 |
| **Downloads** | 213,355 |
| **Owner** | `Arch666Angel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None as a replacement. Two mods in the pack extend it —
`angels-smelting-extended` and `extendedangels` — and a third outside the pack,
`angelsextended-remelting`, is recorded under the first of those.

**Recommendation: keep.** Current on 2.1.

### `bobassembly`

| | |
|---|---|
| **Title** | Bob's Assembling machines |
| **Does** | Extends the assembler ladder to tiers 4, 5 and 6, and adds matching higher tiers of the other crafting machines — chemical plants, refineries, electrolysers and furnaces |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-05 |
| **Downloads** | 301,093 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

Declares `? space-age >= 2.1.0` — optional, so it neither requires nor forbids Space Age. That
pattern holds for ten of the sixteen Bob's mods; see *Space Age is not ruled out*.

**Recommendation: keep.** Current on 2.1.

### `bobelectronics`

| | |
|---|---|
| **Title** | Bob's Electronics |
| **Does** | A full electronics production chain in place of the vanilla circuit tiers: boards, wires and components as separate intermediates, feeding the circuits the rest of the tech tree wants |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 276,103 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

**Recommendation: keep.** Current on 2.1.

### `bobenemies`

| | |
|---|---|
| **Title** | Bob's Enemies |
| **Does** | Adds harder biter and spitter variants past the vanilla top tier, and optionally the alien artifacts that Bob's other mods use as a science ingredient |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 282,532 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's, and the artifact setting is wired into `bobtech` and
`bobplates`, so it is not independently replaceable.

**Recommendation: keep.** Current on 2.1. This is the mod whose job `angelsexploration` would have
extended; see that drop's entry.

### `bobequipment`

| | |
|---|---|
| **Title** | Bob's Personal Equipment mod |
| **Does** | Extends what goes in a modular-armour grid: more shield, battery, solar, laser-defence and exoskeleton tiers, plus new equipment types the vanilla grid has no equivalent for |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 263,193 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

**Recommendation: keep.** Current on 2.1.

### `bobgreenhouse`

| | |
|---|---|
| **Title** | Bob's Greenhouse mod |
| **Does** | A building that grows wood from seeds and water, making wood a renewable production input instead of something only cut from the map |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 201,895 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It overlaps `angelsbioprocessing`, which also farms
trees; both are in this pack and the overlap is within-pack, described under *Overlaps* below rather
than with a row here.

**Recommendation: keep.** Current on 2.1.

### `bobinserters`

| | |
|---|---|
| **Title** | Bob's Adjustable Inserters |
| **Does** | Hotkeys and a GUI for moving an inserter's pickup and drop tiles off their defaults, including to non-adjacent tiles |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 406,215 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. It is the mod for this, and at 406,215 the most-downloaded of
the 29 members surveyed here; only the unnamed `boblibrary` is installed more. #5's sixteen were not
measured, so this is not a claim about the whole pack.

**This mod is listed in two packs** — here and in `Grado_ChangingBase`, which this pack depends on,
so one of the two lines does nothing. Under `docs/mod-catalogue.md` it stays entered in both files
until the duplicate is disposed of, and the disposal is #8's and #9's jointly. The argument is
written out in `docs/catalogue/Grado_ChangingBase.md` under *`bobinserters` sits in two packs* and is
not repeated here.

**Recommendation: keep — in `Grado_ChangingBase`, and remove this line.** This survey reaches the
same answer as the `Grado_ChangingBase` survey did on 2026-09-21, from the side that loses the line,
and adds one piece of evidence to it: the mod's only dependency is `base >= 2.1.0`, and
`boblogistics` — the Bob's mod most likely to need it — declares it as `? bobinserters >= 3.0.0`,
*optional*. Nothing in this pack requires it. Removing it here costs no player anything, because
every ABC install still resolves it through `Grado_ChangingBase`; removing it there would take it
away from everyone playing that pack without an overhaul.

### `boblogistics`

| | |
|---|---|
| **Title** | Bob's Logistics mod |
| **Does** | The broadest Bob's mod: two belt tiers past express with an optional overhaul that re-costs every belt recipe and adds a tier 0, higher inserter tiers, two chest and logistic-chest tiers, two train sets plus an armoured one, pump tiers 2 to 4, and robot and roboport tiers 2 to 4 |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 338,424 |
| **Owner** | `Bobingabout` |
| **Overlaps** | `UltimateBeltsSpaceAge` (`Grado_ChangingBase`) |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's, and the mod most other Bob's mods key their recipes
to.

The overlap is with `UltimateBeltsSpaceAge` in `Grado_ChangingBase`, which adds five belt tiers past
express with no compatibility handling, stacking onto this mod's own tiers. `Grado_ChangingBase` is
the lower pack and **the comparison is already written there**, in
`docs/catalogue/Grado_ChangingBase.md` under that mod's entry, found from the other side on
2026-09-21. Nothing is added here.

Two more were checked and are not overlaps. `underground-pipe-pack` in `Grado_ChangingBase` adds
underground pipe shapes and an underground pump; this mod adds pump *tiers* and no pipes, so they
compose. `bobinserters` is not a rival either — that one moves an inserter's pickup and drop tiles,
this one adds tiers of inserter, and this mod declares the other as optional.

**Recommendation: keep.** Current on 2.1. It is also the member with the most surface area against
the layer below: of the six cross-pack overlaps recorded across the project — four when this was
written, and six once #6 added two on 2026-09-22 — this is the only one on the Bob's side of a belt
comparison, and the belt question recurs. `miniloader-redux` against #5's
`deadlock-beltboxes-loaders` is a separate one in the same subsystem, and #6's `space-age` against
`UltimateBeltsSpaceAge` is a third, which makes belts the subsystem this project's overlaps keep
landing in rather than a coincidence of two.

### `bobmining`

| | |
|---|---|
| **Title** | Bob's Mining |
| **Does** | Higher tiers of mining drill and pumpjack, an area miner, and the mining-productivity equipment to go with them |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 296,822 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

**Recommendation: keep.** Current on 2.1.

### `bobmodules`

| | |
|---|---|
| **Title** | Bob's Modules |
| **Does** | Extends the module system well past tier 3 — more tiers of speed, efficiency and productivity, plus pollution-clean and raw-speed module types vanilla has no equivalent for |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 268,773 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

It declares `? DiscoScience` — the mod is in `Grado_NonChanging` — and `? quality`, so it already
knows about both the pack below it and the Space Age quality system.

**Recommendation: keep.** Current on 2.1.

### `bobores`

| | |
|---|---|
| **Title** | Bob's Ores |
| **Does** | Puts new ore resources on the map — the metals and minerals the rest of the Bob's chain smelts — as map-generated patches rather than as recipes |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 294,830 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's, and required by `bobplates`.

It is one of four mods in this pack with an opinion about what a map's resources look like; see
*Overlaps*.

**Recommendation: keep.** Current on 2.1.

### `bobplates`

| | |
|---|---|
| **Title** | Bob's Metals, Chemicals and Intermediates |
| **Does** | The ore-to-plate chain the rest of Bob's builds on: new metals, chemical processing, and the intermediates other Bob's mods take as inputs |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 290,708 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. This is load-bearing for the rest of the Bob's set; replacing it
would mean replacing the overhaul. It is the only Bob's mod the portal files under the **overhaul**
category rather than content or tweaks.

**Recommendation: keep.** Current on 2.1. This mod is the worked example in
`docs/mod-catalogue.md`, read on 2026-09-20 at 290,643 downloads; this entry supersedes that copy.

### `bobpower`

| | |
|---|---|
| **Title** | Bob's Power |
| **Does** | New power generation and distribution: steam-engine and solar tiers, larger boilers and heat exchangers, bigger accumulators, and higher-capacity poles and substations |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 306,288 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

**Recommendation: keep.** Current on 2.1.

### `bobrevamp`

| | |
|---|---|
| **Title** | Bob's Revamp mod |
| **Does** | Rewrites parts of the base game to fit the Bob's chain rather than adding to it: rocket fuel becomes hydrazine-based, every rocket recipe is reworked, sulfur and sulfuric acid get a new route, and the oil technologies are split so pumpjack, chemical plant and refinery unlock separately |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 248,638 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

This is the Bob's mod that changes base-game recipes most directly, so it is the one most likely to
argue with whatever either end-game adds on top. Nothing in it declares an incompatibility.

**Recommendation: keep.** Current on 2.1.

### `bobtech`

| | |
|---|---|
| **Title** | Bob's Tech |
| **Does** | Research expansion: a Lab MK2, a logistic science pack that the logistic technologies are re-costed to, and — when Bob's Enemies has alien artifacts enabled — an alien lab, alien science packs and a gold science pack made from the first four |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 264,843 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None as a replacement. It is the nearest thing in the pack to what
`Clowns-Science` did, which is why that drop's entry is argued partly against this one.

Two mods in the packs below were checked and do not overlap it. `UltimateResearchQueue2` in
`Grado_ChangingBase` is a queue interface, not tech content; `qol_research` in the same pack adds
player-bonus technologies, not science packs or labs. `DiscoScience` in `Grado_NonChanging` makes
labs flash colours and is declared optional here, so the author is already tracking it.

**Recommendation: keep.** Current on 2.1.

### `bobvehicleequipment`

| | |
|---|---|
| **Title** | Bob's Vehicle Equipment |
| **Does** | The equipment-grid contents for vehicles rather than armour — shields, energy, weapons and movement equipment sized for cars, tanks and the modded vehicles Bob's and Angel's add |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 214,308 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's.

**Recommendation: keep.** Current on 2.1. Its grids are what `angelsaddons-cab` and #5's
`spidertrontiers-community-updates` get filled with, so it is worth more to this pack than its
download count suggests.

### `bobwarfare`

| | |
|---|---|
| **Title** | Bob's Warfare |
| **Does** | Combat content across the board: turret tiers including laser and plasma, new ammunition types tied to Bob's materials, more walls and gates, and higher tiers of the personal weapons |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 304,079 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. Core Bob's. It is also the mod that `baron-turrets` — one of #5's
drops — would have sat beside, which is #5's to weigh.

**Recommendation: keep.** Current on 2.1.

### `botReplacer`

| | |
|---|---|
| **Title** | Robot Replacer |
| **Does** | Swaps a logistic network's robots for a different type without hand-collecting them: drop the new bots in a provider chest and it releases them as it pulls the old ones out into storage |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-07-04 |
| **Downloads** | 34,823 |
| **Owner** | `Peppe` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. Its own page states it "should work with all modded
bots and roboports", which is the property this pack needs and the reason it is here.

It is worth more in this pack than in a vanilla game, and that is the case for it: `boblogistics`
adds robot tiers 2 to 4, so an ABC player upgrades bots repeatedly across a run, which is the chore
this mod exists to remove. Its only dependency is `base >= 2.1.0` — the relationship is one of
purpose, not of declaration.

Its page carries a megabase warning about the replacer chest being recalculated; that is a
performance note from the author, not a compatibility claim, and it is unmeasured here.

**Recommendation: keep.** Current on 2.1.

### `deadlock-beltboxes-loaders`

| | |
|---|---|
| **Title** | Deadlock's Stacking Beltboxes & Compact Loaders |
| **Does** | The mechanism the whole stacking family is built on: 1x1 loaders, and beltboxes that compress five items into one stack for transport and unstack them at the far end |
| **Latest** | `2.6.0`, `factorio_version` **2.0**, 2025-01-06 |
| **Downloads** | 126,788 |
| **Owner** | `shanemadden` |
| **Overlaps** | `miniloader-redux` (`Grado_ChangingBase`) |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None as a replacement — it is the base mod the other Deadlock members
require, so replacing it means replacing the family. The family question itself is below.

The overlap is with `miniloader-redux` in `Grado_ChangingBase`, on the loader half of what this mod
does. That pack is the lower one and **the comparison is already written there**, in
`docs/catalogue/Grado_ChangingBase.md` under that mod's entry, reached from the other side on
2026-09-21. Nothing is added here. It declares `? space-age`, so it neither requires nor forbids
Space Age.

**Recommendation: keep.** It is the third-most-downloaded member of this half at 126,788, behind
`rso-mod` and `reskins-bobs`, and the foundation of the stacking feature. Its last release,
2025-01-06, makes it the second-stalest member
of the whole pack, which is a fact about the family's maintenance rather than about this mod's
correctness — see below.

### `extendedangels`

| | |
|---|---|
| **Title** | Extended Angels |
| **Does** | Adds recipes and extra building tiers to Angel's Refining, Petrochemical Processing and Bioprocessing, extending the ladders those mods stop short of |
| **Latest** | `0.7.0`, `factorio_version` **2.1**, 2026-08-17 |
| **Downloads** | 8,959 |
| **Owner** | `adamcirillo` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None found that extends the same three Angel's mods. The one adjacent
candidate, `angelsextended-remelting`, extends Angel's Smelting instead and is recorded under
`angels-smelting-extended`.

**The least-downloaded of the 29 members surveyed here at 8,959, and the one whose maintenance
story is best.**
Its page states it is "actively maintained by Kirazy" rather than by the owner of record, and Kirazy
is the author of #5's `reskins-angels` and `reskins-bobs` — so the same person maintains four of
this pack's members. It moved to 2.1 on 2026-08-17, three weeks after the Angel's core did, on a
steady release cadence through 2026. The download gap against the Angel's mods it extends measures
that it is an optional extra, not that it is neglected.

**Recommendation: keep.** Current on 2.1 and maintained. It sits next to `angels-smelting-extended`
in role and is the healthier of the two by every reading taken here, which is context for that
mod's `reconsider:` rather than an argument against this one.

### `pump`

| | |
|---|---|
| **Title** | P.U.M.P. |
| **Does** | A selection tool for fluid outposts: drag over an oil or acid field and it plans the pumpjacks, pipes and routing as a blueprint-style ghost layout instead of the player placing each one |
| **Latest** | `2.2.2`, `factorio_version` **2.1**, 2026-07-10 |
| **Downloads** | 100,118 |
| **Owner** | `Xcone` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched; it is current on 2.1 and nothing about it needs
replacing.

Checked against the pack below and not recorded as an overlap: `underground-pipe-pack` in
`Grado_ChangingBase` adds pipe shapes and an underground pump, which are *entities*, while this is a
planning tool that places whatever pipe entities exist. They compose rather than compete — and in an
Angel's game, where fluid outposts multiply, they compose usefully.

**Recommendation: keep.** Current on 2.1.

### `reskins-angels`

| | |
|---|---|
| **Title** | Artisanal Reskins: Angel's Mods |
| **Does** | Re-draws Angel's items, entities and technologies with tier colours and icon labelling, so which tier a building belongs to is readable at a glance instead of inferred from context |
| **Latest** | `2.4.0`, `factorio_version` **2.1**, 2026-07-20 |
| **Downloads** | 115,760 |
| **Owner** | `Kirazy` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It is the reskin series for the exact mods this pack
carries, by the maintainer of `extendedangels`.

It requires `reskins-library` and `reskins-assets-base`, neither named in the dependency list. Its
optional list covers **seven of the pack's eight Angel's mods** — all but `angelsinfiniteores`,
which it does not declare at all — plus `extendedangels`, **and two mods that are not in the pack**:
`? angelsexploration` and `? angelsindustries`, its two largest drops. So the reskin series already
carries support for content the pack no longer has, which costs nothing and is worth knowing if
either is ever added back, and it does not cover one mod the pack does have.

**Recommendation: keep.** Current on 2.1. All three Artisanal Reskins members, and all four of
their hidden packages, shipped on the same day, 2026-07-20 — the series is released as a set, which
is worth knowing because it means they go stale as a set too.

### `reskins-bobs`

| | |
|---|---|
| **Title** | Artisanal Reskins: Bob's Mods |
| **Does** | The same treatment for Bob's: tier colours and icon labelling across Bob's items, entities and technologies, with sprites redrawn to sit alongside vanilla art |
| **Latest** | `2.4.0`, `factorio_version` **2.1**, 2026-07-20 |
| **Downloads** | 130,520 |
| **Owner** | `Kirazy` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched, for the same reason.

The second-most-downloaded member of this half at 130,520, behind `rso-mod`. It requires
`reskins-library`,
`reskins-assets-base` and `reskins-assets-bobs`, none of them named in the list, and declares
`! bobmods_gfxtweak` — a hard incompatibility with an older Bob's graphics tweak that is in none of
the five packs.

**Recommendation: keep.** Current on 2.1.

### `reskins-compatibility`

| | |
|---|---|
| **Title** | Artisanal Reskins: Compatibility |
| **Does** | Extends the same art treatment to third-party mods that sit alongside Angel's and Bob's, so a pack mixing them does not end up with two visual languages |
| **Latest** | `2.4.0`, `factorio_version` **2.1**, 2026-07-20 |
| **Downloads** | 107,342 |
| **Owner** | `Kirazy` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched.

**This is the member that best measures how well the pack is put together.** Its thirty-one optional
dependencies read as a list of what an Angel's-and-Bob's pack tends to contain, and **ten of them
are in this chain**: `angels-smelting-extended`, `Clowns-Processing`, `deadlock-beltboxes-loaders`,
`DeadlockStackingForBobs`, `DeadlockStackingForVanilla`, `extendedangels`, `reskins-angels` and
`reskins-bobs` as named members, plus `angelsbioprocessinggraphics` and `angelssmeltinggraphics`,
which are two of the unnamed mandatory ones below.

Two more of its optionals are worth reading. It declares `? ScienceCostTweakerM` — the mod
`Clowns-Science`'s drop is `reconsider:`-ed against — so if #9 ever adopts that, the reskin coverage
for it already exists and costs nothing extra. And it declares `? DeadlockStackingForAngels`,
`? DeadlockCrating` and `? miniloader`, three mods this project dropped or replaced. Optional, so
nothing breaks; recorded because it shows the reskin author still tracking mods that did not make
the 2.x transition, which is the same list this survey had to re-derive.

**Recommendation: keep.** Current on 2.1.

### `rso-mod`

| | |
|---|---|
| **Title** | Resource Spawner Overhaul |
| **Does** | Replaces the base resource generator: ore patches become rarer, larger and further apart, so expansion is by train to distant outposts rather than by creeping outward |
| **Latest** | `7.1.4`, `factorio_version` **2.1**, 2026-09-16 |
| **Downloads** | 153,417 |
| **Owner** | `orzelek` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It is the resource-generation mod for this kind of pack
and declares `? bobenemies` and `? bobores` explicitly.

**The most-downloaded member of this half and the newest release in the entire pack**, five days
before this reading. It declares `! bitumen`, which is in none of the five packs.

It is the fourth mod in the resource cluster described under *Overlaps* — with `bobores`,
`angelsinfiniteores` and `Clowns-Extended-Minerals`, all part 1's — and the only one of the four
that replaces the generator rather than adding to what it produces. That makes it the one whose
settings decide what the other three's ore actually looks like on a map.

**Recommendation: keep.** Current, maintained, and the member with the strongest claim to being
load-bearing for how an ABC game opens.

### `signalstrings`

| | |
|---|---|
| **Title** | Signal Strings Library |
| **Does** | A library, not content: converts between Lua strings and virtual-signal strings for other mods to call. It adds nothing a player can see, build or research |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 4,176 |
| **Owner** | `justarandomgeek` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Not applicable — the question is not what could replace it but why it
is here at all.

**Nothing in any of the five packs depends on it.** Enumerated rather than assumed: the dependency
lists of **136 mods** were searched for any reference to `signalstrings`, mandatory or optional,
and there are none. Those 136 are the 114 that make up the chain — 45 `Grado_ABC` members, 25
`Grado_ChangingBase`, 29 `Grado_NonChanging` and the 15 hidden mandatory ones — plus the 22
further mods the two ABC surveys fetched as candidates, superseded originals and second-level
dependencies. The search was wider than the chain, not narrower. It is the only member of this
pack that is a pure library with no dependent, and libraries are normally pulled in by the mod that
needs them rather than listed by a pack.

Two readings, and the evidence does not choose between them. It may be a deliberate inclusion for a
player who writes combinator scripts — the mod is current on 2.1 and costs essentially nothing. Or
it may be a leftover: a mod that was once required by something the 1.1 pack carried and was never
removed when that something went. This survey cannot tell which, because the 1.1 dependency lists
are recorded but the reason for each line is not.

**Recommendation: reconsider:** whether `signalstrings` is wanted on its own merits. It is the only
in-pack entry in this half that does not end in `keep`, and the reason is not that anything is wrong
with the mod — it is that a pack listing a library nothing uses is either making a choice worth
stating or carrying a line nobody meant to keep, and `CLAUDE.md` is clear that a dependency which
vanishes silently cannot be revisited.

Removing it is save-safe and costs a **minor** bump, and that is worth showing the working on.
`docs/adr/0001-version-major-tracks-save-compatibility.md` glosses major as "a member mod of
`Grado_ChangingBase` or below added or removed", and on the gloss alone removing any `Grado_ABC`
member would be major. The ADR's actual criterion is "a dependency change an existing save cannot
survive", and this mod adds no entity, recipe or item for a save to hold. It is the one member of
the pack where the gloss and the criterion come apart, which is worth recording for whoever writes
the next version bump. Keeping it costs a download.

### `spidertrontiers-community-updates`

| | |
|---|---|
| **Title** | Spidertron Tiers (community updates) |
| **Does** | Adds thirteen spidertron variants specialised by role — firepower, an early-game tier, speed, inventory, and one built for revealing map — instead of the single vanilla spidertron |
| **Latest** | `0.3.1`, `factorio_version` **2.0**, 2024-11-16 |
| **Downloads** | 7,824 |
| **Owner** | `psznm` |
| **Supersedes** | `spidertrontiers` by `Zangeti`, last `0.2.18` on 2021-03-14, 15,338 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched beyond the original, which has no 2.x release and last
shipped in 2021.

**This is the stalest member of the pack.** Its last release was 2024-11-16, twenty-two months
before this reading, and no other member of the 45 has gone that long. It declares `! spidertrontiers`
and `! spidertrontiers-circulardependency`, both
hard incompatibilities and both correct — the first is the mod it replaces. It declares
`? bobvehicleequipment`, which is in the pack, so its equipment grids take Bob's equipment.

**Recommendation: keep**, and treat it as the member most likely to need replacing first. Nothing
else offers spidertron tiers on 2.x, so there is no action to take today; the entry exists so that
when something breaks, the pack's oldest unmaintained member is already identified rather than
discovered.

## Dropped during the port

Three of the pack's ten drops are #4's. The other seven — `DeadlockCrating`,
`DeadlockStackingForAngels`, `DeadlockStackingForMadclown`, `MilesBobsExpansion`,
`RealisticFusionPower`, `baron-turrets` and `beautiful_bridge_railway_bob_fix_updated_new` — are #5's
and are not assessed here.

These three are the substantial drops in the whole project, and *The three drops are one event* below
is the finding that ties them together. Read that before the individual verdicts.

### `angelsexploration`

| | |
|---|---|
| **Title** | Angel's Exploration (ALPHA) |
| **Does** | Angel's own enemy and exploration layer — new hostile creatures and the map content around them, built to consume the Angel's production chains rather than the base game's |
| **Latest** | `0.3.16`, `factorio_version` **1.1**, 2024-02-21 |
| **Downloads** | 53,399 |
| **Owner** | `Arch666Angel` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Searched the full 9,708-entry 2.x list by name, title and summary for
"angelsexploration", "angel's exploration" and "angels exploration": **zero results of any kind.**
Nothing forked it, nothing claims to replace it, and no successor exists under a different name.
Its own mandatory dependency `angelsindustries` is also 1.1-only, so even a hypothetical port would
be blocked behind that one.

**What is lost.** Less than the download count suggests, and the mod's own title is the reason: it
never left ALPHA in ten years, and its last release was 2024-02-21. The enemy content it added has a
partial substitute already in the pack — `bobenemies` supplies harder biters and spitters past the
vanilla tier, and `bobtech`'s alien-artifact science depends on it — so the pack is not left without
an enemy escalation. What goes is the Angel's-flavoured version of it and whatever exploration
content the alpha had reached, which nobody has recorded and which this survey cannot assess from
the portal.

**Recommendation: stay dropped.** Not a judgement about the mod: there is nothing to add back and
nothing that replaces it, and it could not load even if it were wanted. The reason originally
recorded — "no 2.0 release, no replacement found" — is confirmed exactly as written, which makes
this the one of the thirteen drops re-checked across three surveys — four, six and three — where
the original record held up unchanged. **Reopen this only if `angelsindustries` ports**, because
that is the gate.

### `angelsindustries`

| | |
|---|---|
| **Title** | Angel's Industries |
| **Does** | Three separable layers behind mod settings: a *components* layer that inserts a component crafting stage under most recipes, a *tech overhaul* that replaces the science-pack progression with Angel's own, and construction and logistics buildings for laying out a base |
| **Latest** | `0.4.21`, `factorio_version` **1.1**, 2024-02-21 |
| **Downloads** | 104,381 |
| **Owner** | `Arch666Angel` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Two searches, both run over the full 2.x list by name, title and
summary.

By name: one hit, **`angelsindustries-components-enhancement`** by `ptx0` — `2.0.0`,
`factorio_version` 2.0, 2024-11-20, 3,171 downloads. **It is not a replacement and cannot be one:**
it declares `angelsindustries` as a *mandatory* dependency, so it is an add-on to the dead mod and
is itself unresolvable on 2.x. Worth recording precisely because the name looks like a lead.

By feature: searching "tech overhaul", "technology overhaul", "tech tree overhaul" and "research
overhaul" returns one unrelated mod (`Artillery-Research-Overhaul`, artillery only). Searching
"component" returns nothing that inserts a component stage under a modded recipe tree. **Neither of
the two large layers has a successor on 2.x.**

**What is lost, and it is the largest single loss in the project.** Three things, and they are worth
separating because they cost different amounts:

1. **The tech overhaul.** The nearest thing the pack still has is `bobtech` — a Lab MK2, a logistic
   science pack and the alien-artifact packs — which is an *extension* of the vanilla progression,
   not a replacement for it. An ABC game now runs on the vanilla science-pack spine with Bob's
   additions. That is a different game from one running Angel's tech tree, and no setting recovers it.
2. **The components layer.** Gone with no substitute found. This is the layer that changed what
   every recipe in the game looked like, so its absence is the most visible of the three and the one
   a returning 1.1 player will notice first.
3. **The construction and logistics buildings.** The smallest loss. The pack's remaining coverage is
   scattered across `angelsaddons-storage`, `boblogistics` and the packs below.

**Three members declare it optionally and degrade rather than break**: `angels-smelting-extended`
and `Clowns-Processing` as `? angelsindustries`, and `Clowns-AngelBob-Nuclear` as
`(?) angelsindustries`. A fourth, `extendedangels`, claims optional support for it in its page text
without declaring the dependency. The dropped `Clowns-Science` declared it too, so two of the three
drops are entangled. So the drop is soft in the load-order sense and expensive in the content sense
— everything still resolves, and several mods quietly ship less than they would have.

**Recommendation: stay dropped — there is no other option today — but this is the one drop worth
watching.** Nothing can be added back, so the recommendation is forced. What is not forced is
whether `Grado_ABC` should be described to players as an Angel's-and-Bob's pack without Angel's tech
overhaul, and whether a future port would be added back on sight. Both are Truls's, and neither has
to be answered now.

### `Clowns-Science`

| | |
|---|---|
| **Title** | MadClown01's Science |
| **Does** | Alternative science-pack recipes for vanilla, Bob's and AngelBob games, plus Research Facilities that generate science packs from fluids and power, and an endgame Particle Accelerator that generates them from power alone |
| **Latest** | `1.1.7`, `factorio_version` **1.1**, 2023-11-12 |
| **Downloads** | 14,973 |
| **Owner** | `MadClown01` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Searched the 2.x list for "science pack", "science cost", "alternative
science" and "madclown" by name, title and summary. One candidate survives the filter:
**`ScienceCostTweakerM`**, *ScienceCostTweaker Mod (mexmer)* by `mexmer` — `2.1.0`, 2.1, 2026-07-26,
84,756 downloads. It "reworks the recipes for Science Packs, making them use a wider range of
materials" and "adds new labs that are required for the higher tier science packs", and it declares
optional support for `angelsbioprocessing`, `angelsrefining`, `angelssmelting`, `bobtech`,
`bobplates` and `bobgreenhouse` — five of them members of this pack. `Clowns-Science` itself
declared `(?) ScienceCostTweakerM`, so the two were built to coexist rather than substitute.

**It is a partial match, and the part it misses is the interesting one.** Reworked science recipes
and extra labs: covered, by a mod with five times the downloads and a release two months before this
reading. Science packs generated from fluids and power in a Research Facility, and from power alone
in a Particle Accelerator: **not covered by anything found.** That mechanic — production lines that
end in science without ending in an assembler — has no successor on 2.x.

Nothing else came close. The 2.x science field is large but is almost entirely Space-Age-facing,
vanilla-rebalance or cosmetic; `SeaBlockContinued-SCT` is the only other AngelBob-adjacent entry and
is a SeaBlock-specific science tweak.

**Recommendation: reconsider:** whether `ScienceCostTweakerM` is wanted in `Grado_ABC` as a partial
replacement. Three things make this a real question rather than a formality. It is a *different* mod
with a different purpose that happens to overlap, not a successor — adding it is a new membership
decision, which is Truls's. It changes the science-pack recipes, so under
`docs/adr/0001-version-major-tracks-save-compatibility.md` adding it later is a major bump for this
pack. And it is a tech-tree change layered on a pack that already lost its tech overhaul with
`angelsindustries`, so the two questions are really one question about what ABC's research
progression should be, and answering them separately risks answering them inconsistently.

### `DeadlockCrating`

| | |
|---|---|
| **Title** | Deadlock's Crating Machine |
| **Does** | The second half of the Deadlock throughput idea: packs items into crates for a larger compression ratio than beltbox stacking, with machines to pack and unpack |
| **Latest** | `1.7.0`, `factorio_version` **1.1**, 2020-12-13 |
| **Downloads** | 17,036 |
| **Owner** | `shanemadden` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** See *The Deadlock stacking family is one question* below; the search
for all three Deadlock drops was run once.

Its author is the author of `deadlock-beltboxes-loaders`, which **is** in the pack and current on
2.0. So the same person carried the beltboxes forward and left the crating machine on 1.1, where it
has sat since 2020-12-13 — the oldest last-release date among `Grado_ABC`'s ten drops, though not
across the project: `Grado_ChangingBase`'s `alien-biomes-hr-terrain` last shipped 2020-11-24 and
`Grado_NonChanging`'s `PickerVehicles` 2020-11-25.

**Recommendation: stay dropped.** Nothing replaces crates specifically, but the feature it adds is
a larger-ratio version of what `deadlock-beltboxes-loaders` already provides, and that mod is
present and working. This is the one Deadlock drop that costs a *degree* rather than a *kind* of
coverage.

### `DeadlockStackingForAngels`

| | |
|---|---|
| **Title** | Deadlock Stacking For Angels |
| **Does** | The Angel's bridge for Deadlock stacking: stacked variants of Angel's ores, ingots, plates and intermediates, so the Angel's production chain can use beltboxes the way the Bob's one can |
| **Latest** | `1.2.2`, `factorio_version` **1.1**, 2023-09-18 |
| **Downloads** | 10,209 |
| **Owner** | `billbo99` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** See the family question below.

**This is the drop that makes the feature half-present, and the pattern is the one this project
keeps meeting.** `billbo99` is also the author of `DeadlockStackingForBobs` and
`DeadlockStackingForVanilla`, both of which are in the pack on 2.0, released 2025-07-17 and
2025-10-18. The same author ported two of his three and not this one. He has not gone quiet; the
Angel's bridge specifically did not come.

**Recommendation: reconsider:** the whole Deadlock family as one question, not this mod alone. It
has no successor under its own name, and the only 2.x candidate covering the ground —
`deadlock-compat-AngelBobPlus` — would replace the stacking recipes of all five family members
rather than fill this one gap. The argument is below, because answering it per-mod is how a pack
ends up with three compatible halves of a feature and no policy.

### `DeadlockStackingForMadclown`

| | |
|---|---|
| **Title** | Deadlock Stacking For Madclown |
| **Does** | The same bridge for the Clowns mods: stacked variants of MadClown01's ores, minerals and processing intermediates |
| **Latest** | `0.0.9`, `factorio_version` **1.1**, 2024-01-13 |
| **Downloads** | 1,102 |
| **Owner** | `nihilistzsche` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** See the family question below.

Its author is neither `billbo99` nor `shanemadden` — a third person, whose mod depends optionally on
all five Clowns mods and on both of the other stacking bridges. At 1,102 downloads and version
`0.0.9` it never left early development, which is the weakest position of any mod in this family.

**Recommendation: reconsider:** as part of the family question. On its own the answer would be stay
dropped — 1,102 downloads, `0.0.9`, and a third-party bridge to a third-party bridge — but its
coverage is part of what a family-wide answer has to account for.

### `MilesBobsExpansion`

| | |
|---|---|
| **Title** | Miles' Bob's Expansion |
| **Does** | Adds machine tiers above Bob's own — a tier past the top assembler and chemical plant — plus smaller conveniences such as compact electric furnaces |
| **Latest** | `0.11.1`, `factorio_version` **1.1**, 2022-06-21 |
| **Downloads** | 1,583 |
| **Owner** | `TehFocus` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Searched the 2.x list by name and by the feature — higher machine
tiers on top of Bob's. Nothing found that extends Bob's tiers specifically. `bobassembly` already
provides assemblers 4, 5 and 6 and matching tiers of the other crafting machines, which is the
ladder this mod extended rather than created.

**Recommendation: stay dropped.** The smallest loss of the ten drops. It added a tier on top of a
ladder the pack still has in full, at 1,583 downloads, last released 2022-06-21 — before Factorio
2.0 was announced. Nothing about the pack's progression breaks without it; the top of the machine
ladder is simply Bob's top rather than one step past it.

### `RealisticFusionPower`

| | |
|---|---|
| **Title** | Realistic Fusion Power |
| **Does** | A fusion power chain as an alternative endgame to fission: deuterium and tritium extraction, reactors that breed their own fuel, and generation at a scale above nuclear |
| **Latest** | `1.8.18`, `factorio_version` **1.1**, 2024-10-25 |
| **Downloads** | 29,430 |
| **Owner** | `Romner_set` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** One candidate, and it is not available today. No 2.x mod was found
offering a fusion chain that integrates with Angel's or Bob's, searching the 2.x list by name and
by "fusion" in title and summary; the only thing in view is the sibling project below.

**The author said so himself.** The mod's portal summary ends "Unmaintained since 2024-10-25",
which is also the date of its last release. This is the only one
of the project's ten drops where the author has stated the status in the mod's own summary rather
than leaving it to be inferred from dates. It declared `? angelspetrochem`, `? angelssmelting`,
`? angelsindustries`, `? bobelectronics`, `? bobplates` and `? bobpower` — six hooks into this
pack's content, which is why its loss is felt here specifically.

**The sibling project, checked rather than assumed**, as the ticket asks.
`realistic-fusion-refreshed` exists to succeed this mod, and its state on **2026-09-21** is:

| | |
|---|---|
| **Published on the portal** | **No.** The API returns "Mod not found" for `realistic-fusion-refreshed` and `realistic-fusion-refreshed-core` |
| **Shape** | Three mods, not one — `realistic-fusion-refreshed`, `-core` and `-assets` |
| **Version** | `0.1.0` on all three |
| **Targets** | `factorio_version` 2.0, `base >= 2.0.77` |
| **State** | Its README says all four fusion reactions are playable and every prototype its ADR 0010 names exists, with balance provisional and nothing played beyond a test rig |

**Two things follow, and the second is the one that matters.** It is not published, so it cannot be
a dependency of anything yet. And — the part that cannot be read off a release date —
**it declares no Angel's or Bob's compatibility at all.** Its three manifests depend on `base` and
on each other, and on nothing else. The mod it succeeds carried six optional AB hooks; the
successor currently carries zero. Holding a slot for it is therefore premature for a reason beyond
publication: the integration that made the original worth having in *this* pack has not been built.

**Recommendation: stay dropped, and do not hold a slot** — which is what the ticket asks for, an
assessment rather than a commitment. Two conditions would change it, and they are separable: the
project publishing, and the project growing AB compatibility. The second is the one to watch,
because the first without it would give `Grado_ABC` a fusion mod that ignores the overhaul it sits
in. When it does land it will arrive as three mods, so adding it is a three-line change or a
one-line change with two more hidden members, which is the pattern described below.

### `baron-turrets`

| | |
|---|---|
| **Title** | Baron Turrets |
| **Does** | Three turrets designed to cover each other's weaknesses rather than tier over one another — a combined-arms defence instead of a stronger single emplacement |
| **Latest** | `1.1.9`, `factorio_version` **1.1**, 2023-08-10 |
| **Downloads** | 1,658 |
| **Owner** | `wasmoo` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Searched by name and by feature. Nothing on 2.x offers this turret
set. `bobwarfare`, which is in the pack, supplies turret tiers including laser and plasma, so the
pack is not left without turret progression — what it lacks is this mod's specifically
non-tiered design.

**It is blocked twice over.** Its mandatory dependency `baron-library` also has no 2.x release, last
shipped `1.1.26` on 2023-12-18. So even a port of the turrets would need the library ported first,
by the same author, who has shipped neither.

**Recommendation: stay dropped.** 1,658 downloads, no 2.x release, a dead mandatory library beneath
it, and a feature the pack covers differently through `bobwarfare`.

### `beautiful_bridge_railway_bob_fix_updated_new`

| | |
|---|---|
| **Title** | Beautiful Bridge Railway Bob Fix(New) |
| **Does** | A compatibility patch, not content: makes `beautiful_bridge_railway`'s bridges work with Bob's power and warfare entities |
| **Latest** | `1.0.8`, `factorio_version` **1.1**, 2020-12-28 |
| **Downloads** | 3,651 |
| **Owner** | `wnsgk0710` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None needed, and this is the one drop where that can be said without
searching. **The mod it patches is itself dropped.** `beautiful_bridge_railway` is one of
`Grado_ChangingBase`'s six drops, assessed by #3 on 2026-09-21 and recommended to stay dropped with
a two-mod functional replacement deliberately not taken; see
`docs/catalogue/Grado_ChangingBase.md`. A compatibility patch for an absent mod has nothing to
patch.

**Recommendation: stay dropped**, and note that this one is *consequent* rather than independent.
It is the only drop in the project whose disposal is decided entirely by another pack's decision:
if #8 ever reinstates `beautiful_bridge_railway`, this line comes back into question for
`Grado_ABC`, and if it does not, this mod can never return. Recorded so the dependency between the
two decisions is visible from this side.

## The three Angel's and Clowns drops are one event

All three of #4's drops are drops for the same reason, and it is not the reason recorded during the port.

`docs/porting-notes.md` lists them under "no 2.0 release, no replacement found", which reads as three
independent mods that died. (#5's seven drops are assessed above and two of them repeat this exact
pattern; see *The Deadlock stacking family is one question*.) The portal says something narrower.
**Both authors are active on 2.x and both ported everything except these.**

| Author | Ported to 2.x | Not ported |
|---|---|---|
| `Arch666Angel` | 16 mods — the 5 core, 3 add-ons, 4 graphics packs, 3 mobility graphics packs, `angelsaddons-bots` — all released 2026-07-11 to 2026-07-27 | `angelsindustries`, `angelsexploration` |
| `MadClown01` | 4 mods — `Clowns-Nuclear`, `Clowns-Processing`, `Clowns-Extended-Minerals`, `Clowns-AngelBob-Nuclear` — all released 2026-07-26 | `Clowns-Science` |

Read against the whole 2.x list, `Arch666Angel` has sixteen live mods and `MadClown01` has four.
Neither author has gone quiet, which is the failure mode `docs/mod-catalogue.md` records the
**Owner** field to catch, and it is the opposite of what happened to the Picker family. These three
are the mods their authors chose not to bring forward — the two Angel's ones are the beta and the
alpha, and `Clowns-Science` was already the least-downloaded of the five Clowns mods at 14,973. Its last
release date is not the tell — 2023-11-12 is the same day `Clowns-Nuclear` last shipped for 1.1, and
`Clowns-AngelBob-Nuclear`'s last 1.1 release was earlier still, on 2023-07-23. All five went quiet
together in 2023 and four of them came back.

**What this changes.** "No replacement found" stays true for all three. "No 2.0 release" stays true.
But the drops are not evidence that the AngelBob ecosystem is decaying, and they should not be cited
that way — the ecosystem moved to 2.1 in July 2026, nearly complete, and left its unfinished edges
behind. It also means a future port is a live possibility for `angelsindustries` in a way it is not
for an abandoned mod, which is why its entry says to watch it.

## Two family mods the pack has never had

Not drops, and not members — they appear in neither list, so nothing in the repo records that they
exist. Both are from the families this pack is built from and both are current on 2.x:

| Mod | Title | Latest | Downloads | Owner |
|---|---|---|---|---|
| `bobclasses` | Bob's Character classes | `3.0.1`, 2.1, 2026-07-26 | 112,905 | `Bobingabout` |
| `angelsaddons-bots` | Angel's Addons - Robot Logistics | `2.1.0`, 2.1, 2026-07-11 | 20,331 | `Arch666Angel` |

`bobclasses` adds selectable character classes with different bonuses; `angelsaddons-bots` adds slow
high-capacity bots with their own chests, roboports and zone expanders.

Enumerated rather than asserted: `Arch666Angel`, `Bobingabout` and `MadClown01` have **39 mods with
a 2.x release between them** — 16, 19 and 4 — and this pack carries **36** of them, as members or
as hidden mandatory dependencies. Three it does not: these two, and `Bobingabout`'s `clock`
(*Clock*, 60,708 downloads), which adds a clock to the interface and has nothing to do with the
Bob's suite. So these two are the only *suite* mods by the three authors that the pack lacks, and
`clock` is named here so the gap between 36 and 39 is accounted for rather than quietly rounded.

They are recorded because their absence was never a decision: the 1.1 pack did not have them, so the
port had no reason to look. **Adding a mod is pack membership and is Truls's**, and this survey does
not recommend either. Two facts bear on it if it is ever asked. `angelsaddons-bots` would be a
`Grado_ABC` member on any reading. `bobclasses` would not obviously be — like `bobinserters` it needs
no Bob's content, only `boblibrary`, so if it were ever wanted the layer question from
*`bobinserters` sits in two packs* applies to it too.

## The fifteen mandatory dependencies the list does not name

Installing `Grado_ABC` installs **fifteen mods that appear nowhere in its dependency list**, because
members require them and Factorio resolves mandatory dependencies transitively. #4 found nine and
#5 six more. All fifteen exist on 2.x and all fifteen are healthy, so nothing here is a problem to
fix — but a mod nobody names is a mod nobody re-checks.

The set was computed rather than spotted: the mandatory closure of all 45 members, minus everything
the two lower packs — `Grado_NonChanging` and `Grado_ChangingBase` — already pull in. That
subtraction matters. **`flib` is the clearest case** — it
is a mandatory dependency of `reskins-library` here, but it is *already* pulled into every install
by four `Grado_NonChanging` members, so it is not ABC's to claim. Four more are the lower packs':
`alien-biomes-graphics`, `kry_stdlib`, `stdlib2` and `+FluidWagonColorMask`. Counting those would
have made the number twenty and the finding weaker.

| Hidden member | Pulled in by | Latest | Downloads |
|---|---|---|---|
| `boblibrary` | every one of the 16 Bob's mods, mandatory | `3.0.0`, 2.1, 2026-06-29 | 460,562 |
| `Clowns-Nuclear` | `Clowns-AngelBob-Nuclear`, mandatory | `2.1.01`, 2.1, 2026-07-26 | 27,050 |
| `angelsrefininggraphics` | `angelsrefining`, mandatory (`~`) | `2.1.0`, 2.1, 2026-07-11 | 56,411 |
| `angelspetrochemgraphics` | `angelspetrochem`, mandatory (`~`) | `2.1.0`, 2.1, 2026-07-11 | 55,802 |
| `angelssmeltinggraphics` | `angelssmelting`, mandatory (`~`) | `2.1.0`, 2.1, 2026-07-11 | 54,943 |
| `angelsbioprocessinggraphics` | `angelsbioprocessing`, mandatory (`~`) | `2.1.0`, 2.1, 2026-07-11 | 41,542 |
| `angelsaddons-mobility-graphics-crawler` | `angelsaddons-mobility`, mandatory | `2.1.0`, 2.1, 2026-07-11 | 25,398 |
| `angelsaddons-mobility-graphics-petro` | `angelsaddons-mobility`, mandatory | `2.1.0`, 2.1, 2026-07-11 | 25,195 |
| `angelsaddons-mobility-graphics-smelting` | `angelsaddons-mobility`, mandatory | `2.1.0`, 2.1, 2026-07-11 | 25,110 |
| `reskins-library` | all three `reskins-*` mods, mandatory | `2.4.1`, 2.1, 2026-07-20 | 137,576 |
| `reskins-assets-base` | `reskins-angels`, `reskins-bobs`, `reskins-library` | `2.1.1`, 2.1, 2026-07-20 | 4,185 |
| `reskins-assets-bobs` | `reskins-bobs`, mandatory | `2.1.1`, 2.1, 2026-07-20 | 7,116 |
| `reskins-sprite-utils` | `reskins-library`, mandatory | `0.2.1`, 2.1, 2026-07-20 | 6,577 |
| `rusty-locale` | `DeadlockStackingForBobs`, `DeadlockStackingForVanilla` | `1.0.17`, 2.0, 2024-10-27 | 83,718 |
| `Warheads_Continued` | `True-Nukes_Continued`, mandatory | `0.0.21`, 2.0, 2025-12-29 | 2,830 |

`boblibrary` is the one that matters most and is the easiest to miss: at 460,562 downloads it is the
most-installed mod reached by this survey — ahead of `bobinserters`, the highest the list names,
at 406,215 — it is required by all sixteen Bob's mods, and it
requires `base >= 2.1.0` on its own account — so it alone would settle the `factorio_version`
question below even if no member did.

**Thirteen of the fifteen are art or library packages split out of a parent mod** — seven Angel's
graphics, four Artisanal Reskins packages, `boblibrary` and `rusty-locale` — and the `~` prefix on
four of them means only that they do not affect load order; they are mandatory all the same. The
two exceptions are content: `Clowns-Nuclear` and `Warheads_Continued`. **This is the
`alien-biomes-graphics` finding, eleven more times** counting only the packages split out of a
parent mod. That one was recorded on 2026-09-21 by the
`Grado_ChangingBase` survey as a single incident — graphics moved out of a mod into a separate
mandatory package, pinning a third mod nobody names into the chain. The Angel's set does it seven
times and the Artisanal Reskins series four more, one of which (`reskins-sprite-utils`) is a
dependency of a dependency and reachable only by walking two levels. Any survey reading a dependency
list should expect this, and should walk the closure rather than read one level.

**Two of the fifteen deserve naming individually.** `rusty-locale` is the only hidden member whose
own last release, 2024-10-27, is older than every named member of the pack — it is the stalest thing
in an ABC install and nothing in the repository mentions it. And `Warheads_Continued` is not a
graphics or locale package but *content*: it supplies the warhead definitions `True-Nukes_Continued`
is built on, so a player gets a second nuclear-content mod without either list naming it.

Whether the pack should name them explicitly is not this survey's to settle: it would change no
player's install and would make the list self-describing, and it is a dependency-list edit either
way, so it belongs to #9.

## The Deadlock stacking family is one question

The pack carries three of the five Deadlock mods the 1.1 pack had, and the two it lost are the two
that mattered most to an Angel's game. Treating that as three separate drops is how it stays
unresolved, so it is set out once.

| Mod | State | Author | Covers |
|---|---|---|---|
| `deadlock-beltboxes-loaders` | **in the pack**, `2.6.0`, 2.0, 2025-01-06 | `shanemadden` | the mechanism itself — beltboxes and loaders |
| `DeadlockStackingForVanilla` | **in the pack**, `2.0.3`, 2.0, 2025-10-18 | `billbo99` | base-game items |
| `DeadlockStackingForBobs` | **in the pack**, `2.0.2`, 2.0, 2025-07-17 | `billbo99` | Bob's items |
| `DeadlockStackingForAngels` | **dropped**, `1.2.2`, 1.1, 2023-09-18 | `billbo99` | Angel's items |
| `DeadlockStackingForMadclown` | **dropped**, `0.0.9`, 1.1, 2024-01-13 | `nihilistzsche` | Clowns items |
| `DeadlockCrating` | **dropped**, `1.7.0`, 1.1, 2020-12-13 | `shanemadden` | crates, a higher ratio than stacking |

**What a player actually gets is the shape of the problem.** The mechanism works, and base-game and
Bob's items stack. Angel's items — the ore-to-ingot-to-plate chain that *is* the Angel's
contribution to this pack, and the longest intermediate chain in it — do not. Neither do the Clowns
ores and processing products. So the feature is present exactly where the pack is least
distinctive and absent exactly where it is most: an ABC player belts uncompressed Angel's
intermediates past compressed vanilla ones.

**And the same authorship pattern as the core drops.** `billbo99` ported two of his three and left
the Angel's bridge; `shanemadden` ported the beltboxes and left the crating machine. Neither author
has gone quiet. This is the third time this project has found a partial port and read it as decay
the first time round.

**The one candidate on 2.x is a different shape, not a replacement.**
`deadlock-compat-AngelBobPlus`, *Deadlock integrations/compatibility for AB+* by `emp_zealoth` —
`0.1.3`, `factorio_version` 2.0, 2026-02-20, 391 downloads. It requires `boblogistics` and
`deadlock-beltboxes-loaders >= 2.6.0`, both in the pack, and declares optional support for every
Angel's and Bob's mod here. Its page says it "automatically creates stacking recipes based on a
heuristic", with no hardcoded item lists, so it is meant to cover whatever is installed — including
Angel's and Clowns content that no per-family bridge now serves.

**The cost is stated by its own author**: it "will stomp on any other stacking recipe mod as it just
deletes every stack and starts over". So it is not additive. Adopting it means the pack's stacking
recipes come from one heuristic mod at 391 downloads instead of two maintained per-family bridges at
13,178 and 18,166, and `DeadlockStackingForBobs` and `DeadlockStackingForVanilla` would be
displaced in substance even if left in the list. It also declares `boblogistics` mandatory, so it
could never sit in a pack below `Grado_ABC`.

**Three options, and none is this survey's to choose.**

1. **Leave it.** Stacking covers vanilla and Bob's; Angel's and Clowns go uncompressed. Costs
   nothing, and is the only option requiring no decision.
2. **Add `deadlock-compat-AngelBobPlus` and accept that it replaces the per-family recipes.** Gains
   Angel's and Clowns coverage from one mod; stakes the feature on a 391-download mod last released
   2026-02-20, and makes two current members redundant.
3. **Drop the stacking feature entirely** — all three members — on the grounds that a feature which
   covers half the production chain is worse than none, because it silently rewards the vanilla
   half.

Option 2 removes members of `Grado_ABC` in substance, and option 3 removes three of them outright:
both are **major** bumps under `docs/adr/0001-version-major-tracks-save-compatibility.md`. That is
pack membership, so it is **#9's**. Two of the three drops' entries above end in `reconsider:`
pointing here rather than proposing an answer; `DeadlockCrating` ends in `stay dropped`, because
its feature is a higher-ratio version of one the pack still has and its disposal does not turn on
this question.

## Six mods on one nuclear chain

Counted because no single entry shows it. The pack's nuclear content comes from six mods, spread
across both halves of the survey and two of them unnamed in the dependency list:

| Mod | Half | Named in the list | Adds |
|---|---|---|---|
| `Clowns-AngelBob-Nuclear` | #4 | yes | thorium cycles, waste processing, reactor fuels |
| `Clowns-Nuclear` | #4 | **no**, mandatory of the above | the Clowns nuclear base |
| `PlutoniumEnergy` | #5 | yes | plutonium breeding, reprocessing, ammunition |
| `RealisticReactorsReborn` | #5 | yes | reactor simulation — control rods, coolant, meltdowns |
| `True-Nukes_Continued` | #5 | yes | blast-modelled nuclear weapons |
| `Warheads_Continued` | #5 | **no**, mandatory of the above | the warhead definitions behind them |

Plus `True-Nukes-Graphics_Continued`, which is art for one of them.

**They are not in conflict, and the evidence is that their authors wired them together.**
`Clowns-Nuclear` declares `(?) RealisticReactorsReborn`; `True-Nukes_Continued` declares
`? PlutoniumEnergy`, `? Clowns-Nuclear` and `? Clowns-AngelBob-Nuclear`. Three of the six know
about each other by name. Nothing here is a defect.

**What is worth saying is where the risk sits, and it splits the six cleanly in half.** The Clowns
pair and `PlutoniumEnergy` are all on 2.1, all released in 2026, and all five-figure —
27,050, 20,403 and 79,842 downloads. The other three are all on 2.0, all last released before
2026-02, and all four-figure: `RealisticReactorsReborn` (3,437, 2025-08-01), `Warheads_Continued`
(2,830, 2025-12-29) and `True-Nukes_Continued` (2,777, 2026-01-17). So the reactor simulation and
the whole weapons branch rest on mods with a few thousand installs each, while the fuel-cycle
branch does not. That is not an argument for removing any of them, since nothing replaces them; it
is a statement about which three to suspect first.

## Overlaps

Cross-pack overlaps carry an **Overlaps** row in the entry above and are not repeated here. This
section is the within-pack ones, which the format leaves to prose because there is no lower pack to
put them in.

**The resource cluster: four mods decide what a map's ores look like.** `bobores` places new ore
patches, `angelsinfiniteores` gives patches an infinite tail, `Clowns-Extended-Minerals` adds rare
minerals on top of both, and #5's `rso-mod` replaces the resource generator outright. They are not
rivals — each one's authors built for the others, and `angelsinfiniteores` declares `? bobores` and
`(?) rso-mod` explicitly — but they are four mods writing to one outcome, so a surprise in map
generation has four candidates and the pack has no way to say which. Nothing to change; worth
knowing before the first load. `rso-mod` is now assessed above, and it is the one of the four that
replaces the generator rather than adding to its output — so it is the one whose settings decide
what the other three's ore looks like on a map.

**Wood: `bobgreenhouse` and `angelsbioprocessing`.** Both make wood renewable —
one with a greenhouse building, the other as part of the bio-processing chain. Both are in the pack,
both are core to their families, and the duplication is what an AB game has always had. Recorded so
it is not rediscovered as a defect.

**The two Angel's extensions: `angels-smelting-extended` and `extendedangels`.** They divide the
Angel's set between them — the first extends Smelting, the second extends Refining, Petrochem and
Bioprocessing — so they are adjacent rather than competing, and `extendedangels` does not declare the
other at all. The pair is worth naming anyway, because they are the only two third-party
production-chain mods in the core and they are in very different health: one is maintained by Kirazy
on a 2026 cadence, the other is a single 2.0 release after two dormant years. If the pack ever
carries one third-party Angel's extension instead of two, that is which.

**Nuclear reaches across the split.** `Clowns-AngelBob-Nuclear` and its hidden `Clowns-Nuclear` add
thorium cycles, waste processing and reactor fuels; #5 holds `PlutoniumEnergy`,
`RealisticReactorsReborn` and the two `True-Nukes` mods. That is six mods on one subsystem, spread
across both halves of this pack, and `Clowns-Nuclear` declares `(?) RealisticReactorsReborn`, so at
least one pair is integrated by its author. **Both halves are now surveyed** and the subsystem is
set out in *Six mods on one nuclear chain* above: the six are wired together by their own authors
and none is a
candidate for removal, but five of them are small and stale and only `PlutoniumEnergy` is not.

**Bulk storage, and the half of it that is this pack's own.** `angelsaddons-storage`'s warehouses,
silos and pressure tanks overlap the `WideChests` family, and `WideChestsBobs` — one of #5's — is a
member of *this* pack, so that part of the comparison cannot be deferred downward. The two
mechanisms differ in ways that matter before either is judged: a warehouse is one entity with one
inventory, one circuit connection and one blueprint footprint, while a merged chest is several
entities behaving as one, which is why the merging mods warn about memory and load time and the
warehouse does not, and why the merging family's cost scales with how many chest types are loaded
above it — which `WideChestsBobs` is precisely the mod that adds. An ABC player loads both. The
four-mod cross-pack side is **#30**'s; whether the **Overlaps** row may name a same-pack mod at all
is **#33**. This paragraph exists so the fifth mod is not lost between the two files.

**Belts, where this pack meets the one below.** Four cross-pack overlaps have been recorded across
the project so far and two of them are belt-adjacent, both against `Grado_ChangingBase`:
`boblogistics` against `UltimateBeltsSpaceAge`, and #5's `deadlock-beltboxes-loaders` against
`miniloader-redux`. Both comparisons are already written in
`docs/catalogue/Grado_ChangingBase.md`. `boblogistics` is this half's side of the first and has the
most surface area of any member against the layer below; a survey of either pack should look at
belts first.

## Space Age is not ruled out

The ticket's standing constraint, checked directly rather than carried over. **Nothing in any of the
45 members, or in the fifteen hidden dependencies, declares `! space-age` or any hard
incompatibility with it.** The pack therefore leaves `Grado_ABCS` open, which is what it has to do.
#4 established this for the 29 core mods and #5 for the 16 add-ons, and the add-ons add one positive
signal: `deadlock-beltboxes-loaders` declares `? space-age`, so the stacking mechanism already
adapts to it.

Six hard incompatibility declarations exist across the 45, over five mods, and **not one of them
is Space Age**:
`! angelsaddons-refiningthorium` (`Clowns-Extended-Minerals`), `! angelssmelting-extended-upgradet`
(`angels-smelting-extended`), `! bobmods_gfxtweak` (`reskins-bobs`), `! bitumen` (`rso-mod`) and
`! spidertrontiers` with `! spidertrontiers-circulardependency`
(`spidertrontiers-community-updates`) — six declarations over five mods, and every named target is
absent from all five packs. The `spidertrontiers` one is the mod its declarer replaced, so it is
working as intended.

The Bob's set is explicit about it: **ten of the sixteen Bob's mods declare `space-age` as an
optional dependency** — `bobassembly`, `bobenemies`, `bobgreenhouse`, `boblogistics`, `bobplates` and
`bobtech` as `? space-age >= 2.1.0`, and `bobelectronics`, `bobequipment`, `bobmodules` and
`bobwarfare` as `(?) space-age`. Optional means the mod adapts if Space Age is present and loads fine
if it is not, which is exactly the behaviour a shared core needs. `bobmodules` additionally declares
`? quality`. The port survey recorded Bob's as declaring `? space-age`; **that still holds, and the
count is ten**.

Angel's, the Clowns mods and the two third-party extensions are silent on Space Age — no declaration
either way. **Silent is not the same as compatible**, and it cannot be made the same from the portal:
whether an Angel's ore chain behaves sensibly alongside Space Age's planets is something only a load
will answer. What can be said is that nothing forbids it.

The two from the core are worth one more line each, because their targets differ in kind:
`angelsaddons-refiningthorium` has no 2.x release at all, so that clash cannot be triggered by
anything a player on 2.x can install, and `angelssmelting-extended-upgradet` is a migration helper
for its own declarer rather than a rival.

**One finding here belongs to #6, not to this survey.** Searching the 2.x list for the AngelBob
ecosystem turned up **`angelbob-spaceage-rebalance`**, *AngelBob Space Age Rebalance* by
`Troublesim` — `1.2.16`, `factorio_version` 2.1, released **2026-09-19**, two days before this
reading, 3,691 downloads. It is a full integration overhaul merging Angel's and Bob's with Space Age,
and it requires `space-age` plus most of this pack's Angel's and Bob's members as mandatory
dependencies. It would be a `Grado_ABCS` member, never a `Grado_ABC` one, and it is not free: it also
requires `Paracelsin`, `planet-muluna`, three `planetaris-*` mods and `PlanetsLib` as mandatory, so
adopting it means adopting a set of community planet mods with it. It declares
`! BobsAngelsSpaceAge`, a rival with 251 downloads. Issue **#31** carries this to #6; nothing about
it changes anything in `Grado_ABC`.

## The pack cannot load on the Factorio version it declares

`info.json` declares `"factorio_version": "2.0"` and `base >= 2.0.0`. **All 29 of the overhaul-core
members require `base >= 2.1`**, so a player on 2.0.x cannot satisfy this pack. One member would be
enough; there are twenty-nine.

**#5's sixteen add-ons do not change the conclusion, and they are counted here so nobody re-derives
them.** Four declare `base >= 2.1` themselves — `botReplacer`, `PlutoniumEnergy`, `pump` and `rso-mod`.
Of the other twelve, **two declare `base >= 2.0`** — `deadlock-beltboxes-loaders` and
`spidertrontiers-community-updates` — which is a real floor, just a lower one than the pack needs;
the remaining ten declare a bare `base` or no base dependency at all, so they impose no floor
rather than forbidding one. A `2.0` floor is satisfied by 2.1, so none of the twelve conflicts with
the answer below. Four of the twelve inherit 2.1
anyway: the three `reskins-*` mods reach it through `reskins-library` → `flib`, which requires
`base >= 2.1.0`, and `WideChestsBobs` requires `WideChests >= 6.0.0` from the pack below. So the
pack-wide count is
**twenty-six of the 45 declaring `base >= 2.1` directly**, and the rest neutral or inheriting.

Of the core twenty-nine, twenty-two say so in their own dependency list:

| Floor | Members |
|---|---|
| `base >= 2.1.0` / `>= 2.1` | `angelsaddons-cab`, `angelsaddons-mobility`, `angelsaddons-storage`, `angelsinfiniteores`, `angelspetrochem`, `angelsrefining`, and all 16 Bob's mods |

The other seven — `angelsbioprocessing`, `angelssmelting`, `extendedangels`,
`angels-smelting-extended` and the three `Clowns-*` mods — declare no `base` floor of their own and
inherit one: each requires `angelsrefining` (three of them at `>= 2.1.0` explicitly) or requires
something that does. `boblibrary`, the hidden mandatory dependency of all sixteen Bob's mods,
requires `base >= 2.1.0` as well, and so do all seven hidden graphics packs and `Clowns-Nuclear`.
There is no path through this pack that does not reach 2.1.

**This is the third survey in a row to reach the same answer the same way**, after
`Grado_NonChanging` and `Grado_ChangingBase` on 2026-09-21, and the pack is now measured in full
rather than in half. It does not raise the floor: the highest requirement found here is `>= 2.1.0`,
below `Grado_ChangingBase`'s `>= 2.1.8` from `WideChests`. But
`Grado_ABC` depends on `Grado_ChangingBase`, which depends on `Grado_NonChanging`, so it inherits
both — **the effective minimum for anyone installing this pack is `base >= 2.1.8`**, and none of that
comes from this pack's own members.

The mechanism is the members' `base` requirements, not the `factorio_version` field — the field
declares which game version the pack is *for*, and Factorio will not install a mod whose dependencies
cannot resolve regardless of what it says. Three of the five packs had been checked when this was
written and all three answered no, and `Grado_ABCX` and `Grado_ABCS` looked like one command each,
holding one member apiece — so this section called measurement **#15** nearly closed.

**#6 reached both branches on 2026-09-22 and only half of that held.** `Grado_ABCX` was one command
and raised the floor to `base >= 2.1.9`, above this pack's inherited `>= 2.1.8`. `Grado_ABCS` was not
a command at all: its one member is `space-age`, which is not a portal mod, so its `base` requirement
cannot be read by this method and needs the game (**#29**). **#15 is therefore complete for four
packs and not completable for the fifth**, which is a different shape from nearly closed. See
`docs/catalogue/Grado_ABCX.md` and `docs/catalogue/Grado_ABCS.md`. **The number to declare instead is
Truls's** and is **#16**; this section supplies the evidence for this pack, not the decision.

## What was not checked

Stated plainly so the gaps are not mistaken for clean results.

- **Nothing was loaded in Factorio.** No pack, no member mod, no combination. Every claim above is a
  portal reading or a reading of a mod's own page. This is the pack where that gap is widest,
  because 45 mods and 15 unnamed dependencies all modifying one recipe tree is exactly the
  situation a portal cannot speak to.
- **`angels-smelting-extended` was not tested against Angel's 2.1.** The concern in its entry —
  a 2.0-declared mod with unversioned dependencies, modifying recipes of mods that moved to 2.1 after
  its last release — is derived from version numbers and release dates alone. It may work perfectly.
  It is flagged because it is the cheapest thing to check first when the pack is loaded, not because
  a failure has been observed.
- **The three drops were assessed by search, not by playing without them.** What
  `angelsindustries`' components layer or `Clowns-Science`'s Particle Accelerator were worth to an
  actual game is a judgement no survey can make from the portal, and the "what is lost" paragraphs
  describe mechanics rather than measure their value.
- **`angelsexploration`'s content is described from its family documentation, not from the mod.** It
  has an empty portal summary and never left alpha; what it actually contained in `0.3.16` was not
  established, and the entry says less about it than about the other two for that reason.
- **Silence on Space Age was not resolved, and it covers most of the pack.** Nineteen of the 29
  declare nothing either way — all thirteen Angel's, Clowns and third-party members, plus six Bob's
  mods (`bobinserters`, `bobmining`, `bobores`, `bobpower`, `bobrevamp`, `bobvehicleequipment`). The
  difference between "compatible" and "nobody has tried" is exactly what `Grado_ABCS` will discover.
  See *Space Age is not ruled out*.
- **No member was checked against `SpaceModFeorasFork`.** `Grado_ABCX`'s one member is #6's, and this
  survey did not read the ABC side of that pairing either.
- **`ScienceCostTweakerM` was read from its portal page, not compared recipe by recipe against
  `Clowns-Science`.** "Covers the reworked recipes and the labs, does not cover the Research Facility
  or the Particle Accelerator" is a reading of two summaries, which is enough to frame the question
  and not enough to answer it.
- **The within-pack overlaps were identified, not quantified.** Four mods writing to map generation
  is a fact; what they do to each other is not, and the resource cluster in particular is the kind of
  thing that only shows up on a generated map.
- **`deadlock-compat-AngelBobPlus` was read, not tried.** The claim that it would cover Angel's and
  Clowns stacking comes from its own page saying it works by heuristic with no hardcoded item
  lists. Whether the recipes it generates for an Angel's chain are sensible is unknown, and at 391
  downloads few people can have checked. "Stomps on any other stacking recipe mod" is likewise the
  author's phrasing, not an observed interaction.
- **The Angel's stacking gap was not measured, only located.** That Angel's intermediates go
  uncompressed while vanilla ones stack follows from which bridges exist; how much it costs a real
  factory in belt throughput was not calculated and depends on a base nobody has built.
- **`realistic-fusion-refreshed` was read from its repository, not run.** Its three manifests and
  its README are the evidence for "not published, targets 2.0.77, no Angel's or Bob's
  compatibility". Whether it loads, and what it would do beside Angel's, is untested — and the
  README itself says the balance is provisional and nothing has been played beyond a test rig.
- **`signalstrings` has no traceable dependent, and that is the whole finding.** The search was
  exhaustive across 136 mods' dependency lists, so "nothing declares it" is measured. *Why* it is
  in the list is not recoverable from the portal, because dependency lists record what, never why —
  which is exactly the gap `CLAUDE.md`'s "record what was dropped and why" exists to prevent, seen
  from the other direction.
- **The staleness ranking is by release date alone.** "The six stalest members are all add-ons" is
  arithmetic on portal dates. A mod that needs no changes and a mod that has been abandoned look
  identical from here, and `signalstrings` — a small library that could legitimately be finished —
  is the standing reminder that the two are different.
