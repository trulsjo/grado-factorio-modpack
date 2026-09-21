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
This survey is #4 and covers **29 of the 45 members and 3 of the 10 drops**; #5 covers the rest.
Which is which is *The split between #4 and #5* below, and it is the first section because two
tickets writing one file is the only way a mod falls through.

Three findings hold across everything #4 touched:

- **All 29 members have a 2.x release, and 28 of them are on 2.1.** Nothing in the overhaul core is
  stranded on 1.1. The single exception is `angels-smelting-extended`, which declares 2.0.
- **All 29 require `base >= 2.1` — 22 of them say so themselves** and the other seven inherit it
  through a mandatory dependency. This is fatal to the pack's declared `factorio_version` for the
  third time in three surveys; see *The pack cannot load on the Factorio version it declares*.
- **Nine mandatory dependencies are not named in the dependency list**, and every one of them is a
  real mod that a player installing this pack will get. See *The nine mandatory dependencies the
  list does not name*. This is the `alien-biomes-graphics` shape again, at nine times the size.

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

The drops split the same way: **#4 takes `angelsexploration`, `angelsindustries` and
`Clowns-Science`** — its ticket names all three — and #5 takes the other seven.

Entries below are in dependency-list order with #5's slots left out, not renumbered. #5 inserts into
the same order.

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

Its mandatory `Clowns-Nuclear` is not in the dependency list; see *The nine mandatory dependencies
the list does not name*. That mod declares `(?) RealisticReactorsReborn`, which #5 catalogues, so
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
`angelsaddons-mobility-graphics-crawler`, `-petro` and `-smelting`. See *The nine mandatory
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
the layer below: of the four cross-pack overlaps recorded across the project so far, this is the
only one on the Bob's side of a belt comparison, and the belt question recurs — `miniloader-redux`
against #5's `deadlock-beltboxes-loaders` is a separate one in the same subsystem.

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

## The three drops are one event

All three are drops for the same reason, and it is not the reason recorded during the port.

`docs/porting-notes.md` lists them under "no 2.0 release, no replacement found", which reads as three
independent mods that died. The portal says something narrower. **Both authors are active on 2.x and
both ported everything except these.**

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

## The nine mandatory dependencies the list does not name

Installing `Grado_ABC` installs **nine mods that appear nowhere in its dependency list**, because
members require them and Factorio resolves mandatory dependencies transitively. All nine exist on
2.1 and all nine are healthy, so nothing here is a problem to fix — but a mod nobody names is a mod
nobody re-checks.

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

`boblibrary` is the one that matters most and is the easiest to miss: at 460,562 downloads it is the
most-installed mod reached by this survey — ahead of `bobinserters`, the highest the list names,
at 406,215 — it is required by all sixteen Bob's mods, and it
requires `base >= 2.1.0` on its own account — so it alone would settle the `factorio_version`
question below even if no member did.

**Seven of the nine are graphics packs**, and the `~` prefix on four of them means only that they do
not affect load order; they are mandatory all the same. **This is the `alien-biomes-graphics` finding
again.** That one was found on 2026-09-21 by the `Grado_ChangingBase` survey — graphics moved out of
a mod into a separate mandatory package, pinning a third mod nobody names into the chain. The Angel's
set did the same thing seven times. It is now a pattern rather than an incident, and any survey
reading a dependency list should expect it.

Whether the pack should name them explicitly is not this survey's to settle: it would change no
player's install and would make the list self-describing, and it is a dependency-list edit either
way, so it belongs to #9.

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
knowing before the first load. `rso-mod`'s own assessment is #5's.

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
least one pair is integrated by its author. **The whole-subsystem question belongs to #5**, which
holds four of the six; this half's two are assessed above and neither is a candidate for removal.

**Bulk storage, and the half of it that is this pack's own.** `angelsaddons-storage`'s warehouses,
silos and pressure tanks overlap the `WideChests` family, and `WideChestsBobs` — one of #5's — is a
member of *this* pack, so that part of the comparison cannot be deferred downward. The two
mechanisms differ in ways that matter before either is judged: a warehouse is one entity with one
inventory, one circuit connection and one blueprint footprint, while a merged chest is several
entities behaving as one, which is why the merging mods warn about memory and load time and the
warehouse does not. An ABC player loads both, plus `WideChestsBobs`. The four-mod cross-pack side is
#30's; this paragraph exists so the fifth mod is not lost between the two files.

**Belts, where this pack meets the one below.** Four cross-pack overlaps have been recorded across
the project so far and two of them are belt-adjacent, both against `Grado_ChangingBase`:
`boblogistics` against `UltimateBeltsSpaceAge`, and #5's `deadlock-beltboxes-loaders` against
`miniloader-redux`. Both comparisons are already written in
`docs/catalogue/Grado_ChangingBase.md`. `boblogistics` is this half's side of the first and has the
most surface area of any member against the layer below; a survey of either pack should look at
belts first.

## Space Age is not ruled out

The ticket's standing constraint, checked directly rather than carried over. **Nothing in these 29
mods, or in the nine hidden dependencies, declares `! space-age` or any hard incompatibility with
it.** The pack therefore leaves `Grado_ABCS` open, which is what it has to do.

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

Two hard incompatibilities exist in the 29 and neither touches Space Age:
`Clowns-Extended-Minerals` declares `! angelsaddons-refiningthorium`, which has no 2.x release at
all, and `angels-smelting-extended` declares `! angelssmelting-extended-upgradet`, which is a
migration helper for itself. Neither is in any of the five packs.

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

`info.json` declares `"factorio_version": "2.0"` and `base >= 2.0.0`. **All 29 of the members
surveyed here require `base >= 2.1`**, so a player on 2.0.x cannot satisfy this pack.

Twenty-two say so in their own dependency list:

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
`Grado_NonChanging` and `Grado_ChangingBase` on 2026-09-21. It does not raise the floor: the highest
requirement found here is `>= 2.1.0`, below `Grado_ChangingBase`'s `>= 2.1.8` from `WideChests`. But
`Grado_ABC` depends on `Grado_ChangingBase`, which depends on `Grado_NonChanging`, so it inherits
both — **the effective minimum for anyone installing this pack is `base >= 2.1.8`**, and none of that
comes from this pack's own members.

The mechanism is the members' `base` requirements, not the `factorio_version` field — the field
declares which game version the pack is *for*, and Factorio will not install a mod whose dependencies
cannot resolve regardless of what it says. Three of the five packs have now been checked and all
three answer no. `Grado_ABCX` and `Grado_ABCS` are one command each and hold one member apiece, so
measurement **#15** is nearly closed. **The number to declare instead is Truls's** and is **#16**;
this section supplies the evidence for this pack, not the decision.

## What was not checked

Stated plainly so the gaps are not mistaken for clean results.

- **Nothing was loaded in Factorio.** No pack, no member mod, no combination. Every claim above is a
  portal reading or a reading of a mod's own page. This is the pack where that gap is widest,
  because 29 mods that all modify the same recipe tree is exactly the situation a portal cannot
  speak to.
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
