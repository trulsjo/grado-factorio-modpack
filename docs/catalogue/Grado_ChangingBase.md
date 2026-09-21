# Catalogue: `Grado_ChangingBase`

The pack that may change saves and the factory, but must stay compatible with most overhauls —
`Grado_ABC` and both its branches load on top of it. Two questions run through every entry here that
did not exist in `Grado_NonChanging`: what a mod does to a save, and what it forbids the layer above
from doing. The second has its own section, *What constrains an overhaul on top*.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-21** and is reproduced from the fetched data rather than retyped.

The dependency list holds 27 entries: `base >= 2.0.0`, `Grado_NonChanging` — a pack, catalogued in
`docs/catalogue/Grado_NonChanging.md` — and the **25 mods** below. Six more were dropped during the
port and are reassessed at the end.

**All 25 current members have a 2.x release.** None is stranded on 1.1. **Eleven require
`base >= 2.1`**, which is the same finding the `Grado_NonChanging` survey reached and is fatal to
this pack's declared `factorio_version` for the same reason; see *The pack cannot load on the
Factorio version it declares*.

## In the pack

In dependency-list order.

### `AdditionalPasteSettings`

| | |
|---|---|
| **Title** | Additional Paste Settings (Fixed) |
| **Does** | Extends shift-right-click/shift-left-click copy-paste: merges logistic requests instead of replacing them, applies a fixed request multiplier, makes the 30-second request window configurable, and pastes an assembler's recipe onto an inserter as a circuit condition |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 33,496 |
| **Owner** | `billbo99` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched; the mod is current on 2.1 and nothing about it needs
replacing. It is adjacent to `CopyPasteModules` in `Grado_NonChanging`, but the two compose rather
than compete — that one adds modules to the payload of a paste, this one adds paste targets and
settings. Checked and not recorded as an overlap.

It declares `!attach-notes`, a hard incompatibility. `attach-notes` is in none of the five packs, so
the only cost falls on a player who adds it themselves.

**Recommendation: keep.** Current on 2.1, and it changes only how a copy-paste behaves — the factory
effect is whatever the player then pastes.

### `EditorExtensions`

| | |
|---|---|
| **Title** | Editor Extensions |
| **Does** | Map-editor tooling: infinity chests and pipes, cheat-mode shortcuts, a testing scenario, and a separate editor lab for designing blueprints away from the factory |
| **Latest** | `2.6.1`, `factorio_version` **2.1**, 2026-06-26 |
| **Downloads** | 140,067 |
| **Owner** | `raiguard` |
| **Overlaps** | `blueprint-sandboxes` (`Grado_NonChanging`) |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None needed for the mod as a whole. One of its features has a rival:
`blueprint-sandboxes` in `Grado_NonChanging` reaches in and force-disables this mod's lab setting,
so the two labs never coexist and the lab a ChangingBase player gets is always the other mod's. The
comparison lives in the lower pack's entry — see `blueprint-sandboxes` in
`docs/catalogue/Grado_NonChanging.md` — and which layer the sandbox feature belongs in is #7's and
#8's jointly.

**Recommendation: keep.** The lab is one paragraph of this mod; infinity chests, cheat mode and the
editor conveniences are untouched by the collision and are what most of its 140,067 downloads are
for. It carries explicit optional compatibility with `Krastorio2`, `aai-industry`,
`space-exploration`, `omnimatter_compression` and `DeadlockStackingForAngels` — the last an
Angel's-family mod, so the author is already tracking the kind of overhaul this pack sits under.

### `LTN_Combinator_Modernized`

| | |
|---|---|
| **Title** | LTN Combinator Modernized |
| **Does** | A combinator with a GUI for setting LTN's control signals on a train stop, instead of composing them by hand |
| **Latest** | `2.5.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 104,467 |
| **Owner** | `kryojenik` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. It is the maintained LTN combinator, and `LtnManager` names it as
an optional dependency, so the LTN mods in this pack already expect each other.

**Recommendation: keep.** Current on 2.1 and tracking LTN's own major version — it requires
`LogisticTrainNetwork >= 3.0.0`, which the pack's LTN satisfies.

### `LTN_Content_Reader_Updated`

| | |
|---|---|
| **Title** | LTN Content Reader Update |
| **Does** | A combinator that reports an LTN network's provider and requester contents to the circuit network, filtered by network ID, with a GUI colouring surplus green and deficit red |
| **Latest** | `1.0.5`, `factorio_version` **2.0**, 2025-10-17 |
| **Downloads** | 1,190 |
| **Owner** | `vinnizp` |
| **Supersedes** | `LTN_Content_Reader` by `Optera`, last `1.0.3` on 2022-11-18, 46,939 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** **[`ltn-train-info`](https://mods.factorio.com/mod/ltn-train-info) by
`hgschmie`** — `2.0.4`, `factorio_version` **2.1**, 2026-08-20, 2,577 downloads, by the author of
`miniloader-redux`. More current, but not the same mod: it emits *delivery* signals — what trains
are carrying where — while this one reports *network contents*, what the providers and requesters
hold. Not a replacement. Searching the 2.x list by title and summary for "LTN" returns no other
content reader.

**Recommendation: keep**, and re-check it before release. This is the weakest member of the pack on
every axis at once: 1,190 downloads against the 46,939 of the mod it replaces, `factorio_version`
still **2.0**, last touched 2025-10-17, and built against `LogisticTrainNetwork >= 2.4.2` while LTN
is now `3.2.1`. The declared dependency has no upper bound so it will resolve, but "resolves" and
"works against LTN 3.x" are the two claims this project keeps having to separate. Nothing here is a
reason to drop it — there is nothing to drop it *for* — but it is the member most likely to be the
first thing that breaks when a pack is finally loaded.

### `LogisticTrainNetwork`

| | |
|---|---|
| **Title** | LTN - Logistic Train Network |
| **Does** | Replaces fixed train schedules with logistic train stops: depots hold idle trains, and the network dispatches whichever train fits a provider-to-requester delivery |
| **Latest** | `3.2.1`, `factorio_version` **2.1**, 2026-09-10 |
| **Downloads** | 286,624 |
| **Owner** | `Optera` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None sought. The other three LTN mods in this pack exist only to serve
it, so replacing it means replacing four members at once. The 2.x list does carry successors of the
genre — `yet_another_train_manager`, `RailLogisticsDispatcher`, and Cybersyn by way of
`LtnToCybersynMigration` — but swapping the train-logistics paradigm is a pack-design decision, not
a maintenance one, and nothing about LTN's state prompts it.

**Recommendation: keep.** Released eleven days before this reading, so actively maintained. It is one
of four members at `base >= 2.1.7`, the second-highest floor in the pack.

### `LtnManager`

| | |
|---|---|
| **Title** | LTN Manager |
| **Does** | A GUI over a running LTN network: deliveries in flight, stop inventories, depot contents and the network's alerts in one window |
| **Latest** | `0.6.0`, `factorio_version` **2.1**, 2026-08-16 |
| **Downloads** | 118,632 |
| **Owner** | `nihilistzsche` |
| **Read on** | 2026-09-21 |

**Alternatives considered.**
**[`LtnManagerUpdated`](https://mods.factorio.com/mod/LtnManagerUpdated) by `FoMaK`** — `1.1.1`,
`factorio_version` **2.1**, 2026-07-12, 4,280 downloads. A second continuation of the same mod. The
incumbent is both more recent, by a month, and far more used, so the fork's name is the only thing
recommending it.

**Recommendation: keep.** Current on 2.1, and it declares `? LTN_Combinator_Modernized`, which is
also in this pack.

### `ModuleInserterSimplified`

| | |
|---|---|
| **Title** | Module Inserter Simplified |
| **Does** | Requests one module type into every machine in a dragged selection, to be fitted by construction bots, with no per-machine configuration |
| **Latest** | `2.2.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 164,383 |
| **Owner** | `Xorimuth` |
| **Supersedes** | `ModuleInserter` by `Choumiko`, last `5.2.5` on 2024-10-06, 143,036 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.**
**[`ModuleInserterEx`](https://mods.factorio.com/mod/ModuleInserterEx), *Module Inserter Extended*,
by `Gorfiend7`** — `7.5.0`, `factorio_version` **2.1**, 2026-06-29, 47,569 downloads, four days
newer than the incumbent. Both are current; both are 2.x continuations of the same 1.1 mod. Which is
which is stated on the incumbent's own portal page:

> Use Module Inserter Extended if you want to create detailed configurations per machine type (it is
> a straight upgrade from Module Inserter). Use Module Inserter Simplified if you want to easily
> create module requests, one type at a time, without any complex configuration GUI.

**Recommendation: reconsider:** whether this pack wants `ModuleInserterEx` instead. The 1.1 pack
carried `ModuleInserter`, the configurable one, and the port replaced it with the deliberately
*less* configurable of its two successors — while the mod's own page names the other as the straight
upgrade. Nobody recorded choosing that. It matters more here than it would in a vanilla pack:
`Grado_ABC` layers Bob's modules and Angel's machines on top, which is the situation per-machine-type
configuration exists for. Simplified has 3.5 times the downloads, which is a real argument and not a
tiebreaker — this is a preference, and the point of the entry is that the preference has not been
expressed. `pump`, a `Grado_ABC` member, declares `? ModuleInserterEx >= 7.0.2`, so the other mod is
already half-present in the chain as an optional.

### `Nanobots2`

| | |
|---|---|
| **Title** | Nanobots: Early Bots 2.0 |
| **Does** | A gun that revives nearby blueprint ghosts out of the player's own inventory long before construction robots are researched, and repurposes personal construction bots to clear items off the ground |
| **Latest** | `3.3.2`, `factorio_version` **2.0**, 2025-03-12 |
| **Downloads** | 44,712 |
| **Owner** | `Regi_Mahler` |
| **Supersedes** | `Nanobots` by `Nexela`, last `3.2.19` on 2022-04-16, 189,166 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Searching the 2.x list by title and summary for early-construction mods
returns `early_construction`, `spiderbots`, `disposable-construction-robots` and `blueprint-shotgun`
— several of which name Nanobots as the thing they are an alternative *to*. None is a drop-in; they
replace the mechanic rather than continue it. This mod is the direct 2.0 continuation and says so:
"Fixed and reuploaded for 2.0. Thank you Nexela."

**Recommendation: keep.** Another `Nexela` mod rescued by someone else, the same pattern the Picker
family shows — see *The raiguard pattern* in `docs/catalogue/Grado_NonChanging.md` for the other
half of the authorship story. Last touched 2025-03-12, which is quiet rather than abandoned, and it
is the only successor that preserves the mechanic.

### `StoneWaterWell-ActuallyUpdated`

| | |
|---|---|
| **Title** | Stone Water Well |
| **Does** | A placeable well producing water anywhere on land, removing the need to pipe from a lake |
| **Latest** | `2.0.10`, `factorio_version` **2.0**, 2025-05-28 |
| **Downloads** | 8,363 |
| **Owner** | `TheDogOfChaos` |
| **Supersedes** | `WaterWell` by `binbinhfr`, last `1.1.2` on 2020-11-29, 69,845 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** **[`WaterExtractor`](https://mods.factorio.com/mod/WaterExtractor) by
`VanillaRainbow92`** — `1.1.0`, `factorio_version` **2.1**, 2026-07-10, 7,341 downloads. Comparable
size, more than a year more current, same job. Also found: `StoneWaterWell-NoRestrict` (`2.0.2`,
2.0, 2025-06-18, 1,264 downloads), a placement-restriction-free variant of this same mod, and
`GroundWater` (`0.1.4`, 2.0, 2025-08-26, 561 downloads).

**Recommendation: keep**, with the **Supersedes** row read as pack membership rather than lineage.
This is a fork of a fork of `StoneWaterWell`, a different original from the `WaterWell` it replaced
here; the port swapped one water-well mod for another rather than following a continuation.
`WaterExtractor` is the better-maintained option if this one goes quiet, and it is worth a look
before release rather than after. Flagged under *What constrains an overhaul on top* — free water
anywhere is a balance change, and Angel's builds a water-treatment chain on the assumption that
water has a cost.

### `UltimateBeltsSpaceAge`

| | |
|---|---|
| **Title** | Ultimate Belts Space Age |
| **Does** | Five belt tiers past express, with matching splitters and undergrounds; the fastest is stated as six express belts |
| **Latest** | `1.3.0`, `factorio_version` **2.0**, 2024-12-31 |
| **Downloads** | 11,301 |
| **Owner** | `Jabor047` |
| **Supersedes** | `UltimateBelts` by `Tyarns`, last `1.1.1` on 2022-05-09, 54,161 downloads |
| **Overlaps** | `boblogistics` (`Grado_ABC`) |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Three mods continue `UltimateBelts` into 2.x and all three stopped
within a week of each other: this one (`1.3.0`, 2024-12-31), **`NovasUltimateBelts`** (`2.0.0`,
2024-12-26, 1,098 downloads) and **`UltimateBeltsSpaceAgeFork`** (`1.2.0`, 2024-12-26, 678
downloads). The incumbent is the largest and the newest of the three, so the port chose correctly
among them. The live alternative is outside the family:
**[`more-belts`](https://mods.factorio.com/mod/more-belts) by `Keeper317`** — `0.4.1`,
`factorio_version` **2.1**, 2026-08-05, 4,056 downloads, "5 additional tiers of belts, splitters and
undergrounds. Custom belt speed for all 8 tiers in items/second." Same shape, nineteen months more
current, and configurable speeds would let the tiers be fitted to whatever the overhaul beneath them
does. `AdvancedBeltsSA` and `beyond-belts` add three tiers past Turbo rather than five and both
advertise loader support.

#### Against `boblogistics`

`Grado_ABC` carries **`boblogistics`** (`3.0.1`, `factorio_version` **2.1**, 2026-07-26, 338,424
downloads), which adds its own belt tiers past express. Both mods stack tiers onto the same
progression, and no mod mediates between them: `UltimateBeltsSpaceAge` declares `base >= 2.0` and
nothing else — no optional dependency on Bob's, no compatibility handling of any kind — while
`boblogistics` declares optionals for `bobplates`, `bobinserters`, `space-age`, `valves`, `Krastorio2`
and `aai-loaders`, and none for this. Neither side is arranging the other's tiers.

**It also costs the loaders.** The 1.1 `miniloader` declared `? UltimateBelts >= 0.16.4`, so the 1.1
pack had loaders for the Ultimate tiers. `miniloader-redux`, the 2.0 replacement, does not: its page
lists exactly the base-game tiers — "three tiers in the base game ("Vanilla", Fast and Express) and
four when playing Space Age (adds Turbo mode)" — plus optional support for `boblogistics`,
`Krastorio2`, `TurboBelt`, `matts-logistics` and `space-exploration`. Ultimate Belts is not on that
list. The gap may be worse than missing tiers: `miniloader-redux`'s normal mode "degrades with belts
above 240 items/sec", and this mod's fastest tier is "equivalent to 6 express belts" — 270 items/sec
at the base game's 45 for express. That is arithmetic off two portal pages and one base-game number,
not a measurement; nothing has been loaded in Factorio. It is checkable the moment something is.

**Recommendation: reconsider:** whether the belt-tier layer belongs in this pack at all, and if it
does, whether `more-belts` should carry it. Three findings point the same way and none of them is
that this mod is bad: it is the stalest member of the pack, twenty-one months since its last release
and two and a half months quieter than the next one, `Nanobots2`; it is the only member whose tiers
the pack's own loader mod cannot serve; and it is the clearest case of a `Grado_ChangingBase` member
constraining the overhaul above it. Against that, it is the direct continuation of a 1.1 member and
the most-used of its three siblings. Which pack a belt tier belongs in is pack membership, so this
is recorded, not settled.

### `UltimateResearchQueue2`

| | |
|---|---|
| **Title** | Ultimate Research Queue for 2.x |
| **Does** | A research queue with ETAs that pulls in prerequisites automatically and keeps infinite technologies running |
| **Latest** | `2.1.3`, `factorio_version` **2.1**, 2026-08-16 |
| **Downloads** | 12,217 |
| **Owner** | `brenny` |
| **Supersedes** | `UltimateResearchQueue` by `raiguard`, last `1.1.0` on 2024-05-10, 45,956 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None needed — the mod it replaces retitled itself *"Ultimate Research
Queue (1.1 ONLY)"* and states "This mod will not be updated to Factorio 2.0", which is as clear a
handover as the portal offers. The alternatives it rules out are named in its own dependency list:
it declares `! sonaxaton-research-queue`, `! UltimateResearchQueue` and `! awesome-rqm`, so the
genre's other entries are hard incompatibilities rather than options.

**Recommendation: keep.** Current on 2.1. Those three `!` lines are the thing to remember: any
overhaul or personal mod pulling in a rival research queue will fail to load against this pack.

### `WideChests`

| | |
|---|---|
| **Title** | Merging Chests |
| **Does** | Merges a rectangle of adjacent chests into one entity with one combined inventory, so a chest bank behaves as a single container |
| **Latest** | `6.3.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 142,199 |
| **Owner** | `Atria` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. It is current, and the pack carries three of its own
add-ons, so replacing it means replacing four members.

**Recommendation: keep.** It sets the pack's Factorio floor at `base >= 2.1.8`, the highest
requirement of any member of any pack surveyed so far. See *What constrains an overhaul on top* for
what the family costs in load time once Angel's and Bob's chest types are in the game.

### `WideChestsAllTypes`

| | |
|---|---|
| **Title** | Merging Chests All Types |
| **Does** | A toggle for `WideChests`: with it installed, every basic chest type can merge, not only the ones the base mod covers |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 22,252 |
| **Owner** | `Atria` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None possible — it is a switch for one specific mod and has no meaning
without it.

**Recommendation: keep**, with its cost stated rather than assumed. Its own summary says it
"Increases memory usage and loading time". The base mod declares it optional
(`? WideChestsAllTypes`) and this mod declares no dependencies at all, so nothing enforces the
pairing; the pack's dependency list is what does.

### `WideChestsLogistic`

| | |
|---|---|
| **Title** | Merging Chests Logistic |
| **Does** | Logistic variants of the merged chests — requester, provider, buffer — so a merged bank can sit on the logistic network |
| **Latest** | `3.2.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 20,201 |
| **Owner** | `Atria` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None possible; same family.

**Recommendation: keep.** The only member of the family with a hard dependency on the base mod
(`WideChests >= 6.3.0`), so it is what pins the family's versions together.

### `WideChestsUnlimited`

| | |
|---|---|
| **Title** | Merging Chests Unlimited |
| **Does** | A toggle for `WideChests` that removes the width, height and area limits on a merge |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 25,494 |
| **Owner** | `Atria` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None possible; same family.

**Recommendation: keep**, with the same caveat as `WideChestsAllTypes`, which this one's summary
puts more strongly: it "can increase memory usage and loading time significantly (depending on your
mod settings)". Four of the pack's 25 members are this one family, and both of the members that cost
load time are switched on.

### `alien-biomes`

| | |
|---|---|
| **Title** | Alien Biomes |
| **Does** | Replaces terrain generation with a temperature-and-moisture climate model: snow, volcanic, crater, many dirt, sand and grass variants, new trees and decoratives, and wadeable shallow water at coastlines |
| **Latest** | `0.8.0`, `factorio_version` **2.1**, 2026-06-24 |
| **Downloads** | 707,679 |
| **Owner** | `Earendel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. It is the most-downloaded member of any of the five packs and has
no peer at what it does.

**Recommendation: keep.** Current on 2.1, `base >= 2.1.7`. Two things about it carry forward. It now
requires **`alien-biomes-graphics >= 0.8.0`**, a separate mod created on 2024-10-17 that holds the
textures — which is where the `alien-biomes-hr-terrain` question below lands. And its own page
states: "**When used with Space Age, only the Nauvis surface will be affected**", so its reach in
`Grado_ABCS` is narrower than in `Grado_ABCX` without either being broken.

### `bobinserters`

| | |
|---|---|
| **Title** | Bob's Adjustable Inserters |
| **Does** | Hotkeys and a GUI for moving an inserter's pickup and drop tiles off their defaults, including to non-adjacent tiles |
| **Latest** | `3.0.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 406,215 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None. It is the mod for this, with 406,215 downloads and a release
under three months before this reading.

**Recommendation: keep — in this pack, and remove the duplicate listing from `Grado_ABC`.** It is
the only mod named in two of the five dependency lists; the reasoning is in *`bobinserters` sits in
two packs* below, and the disposal is #8's and #9's jointly, not this survey's.

### `miniloader-redux`

| | |
|---|---|
| **Title** | Miniloader (Redux) |
| **Does** | One-tile loaders moving items between a belt and a container at full belt throughput without an inserter, in three modes: normal, a container-only speed mode, and a lane-filtered variant of it |
| **Latest** | `2.2.3`, `factorio_version` **2.1**, 2026-09-16 |
| **Downloads** | 22,505 |
| **Owner** | `hgschmie` |
| **Supersedes** | `miniloader` by `therax`, last `1.15.7` on 2023-09-11, 193,085 downloads |
| **Overlaps** | `deadlock-beltboxes-loaders` (`Grado_ABC`) |
| **Read on** | 2026-09-21 |

**Alternatives considered.** No other 2.x mod offers one-tile full-throughput loaders as its whole
job, searching name, title and summary. `berbcorp-loaders` and `quantum-belts` bundle loaders with
their own belt tiers rather than serving the game's.

#### Against `deadlock-beltboxes-loaders`

`Grado_ABC` carries **`deadlock-beltboxes-loaders`** (`2.6.0`, `factorio_version` **2.0**,
2025-01-06, 126,788 downloads), which also "Adds minimalist 1x1 loaders" alongside its stacking
beltboxes. An ABC player therefore has two 1x1 loader families in one save. This is less alarming
than the belt-tier overlap: Deadlock's loaders exist to serve its beltboxes, the beltboxes are why
that mod is in ABC at all, and duplicated loader entities cost menu clutter rather than a broken
progression. Recorded because two mods claiming the same entity shape is what the format's overlap
rule is for, and because if either is ever dropped this is the entry that says what the other
already covers.

**Recommendation: keep.** Released five days before this reading — the most recently updated member
of the pack. The download gap against the mod it replaces measures how long each has existed and how
many players are still on 1.1, not quality. Its tier coverage is the live problem, and that belongs
to `UltimateBeltsSpaceAge` above rather than here.

### `nixie-tubes`

| | |
|---|---|
| **Title** | Nixie Tubes |
| **Does** | Display entities for circuit values: numeric tubes that chain side by side into multi-digit readouts, and alpha tubes that render letter and symbol virtual signals as text |
| **Latest** | `2.1.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 100,237 |
| **Owner** | `justarandomgeek` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None needed. `Grado_ABC` carries `signalstrings` by the same author,
whose name makes it look like a rival display mod; it is not — its summary describes "a library for
converting between lua strings and virtual signal strings", so it is infrastructure, not a readout.
Checked and not recorded as an overlap.

**Recommendation: keep.** Current on 2.1 and declares only `base`, so it constrains nothing above
it.

### `qol_research`

| | |
|---|---|
| **Title** | Quality of Life research |
| **Does** | Adds bonuses — inventory size, movement speed, hand-crafting speed, reach, mining speed — each of which can be delivered as a research line or set to a flat value in the settings |
| **Latest** | `3.4.2`, `factorio_version` **2.0**, 2025-05-04 |
| **Downloads** | 220,228 |
| **Owner** | `Aidiakapi` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched; nothing about its state prompts a replacement.

**Recommendation: keep.** Last touched 2025-05-04, which is quiet, but it declares `base >= 2.0.0`
and its optional compatibility covers `space-exploration`, `nullius` and `Krastorio2` — three
overhauls, but not Bob's or Angel's. Flagged under *What constrains an overhaul on top*: adding
technologies is the mechanism most likely to interact with an overhauled tech tree, and the
settings offer a flat-value mode that sidesteps the tech tree entirely if it does.

### `reverse-factory`

| | |
|---|---|
| **Title** | Reverse Factory |
| **Does** | A machine that un-crafts nearly any item back into its ingredients, generating the reverse recipes for modded items as well as vanilla ones |
| **Latest** | `9.2.5`, `factorio_version` **2.1**, 2026-07-28 |
| **Downloads** | 70,487 |
| **Owner** | `Kryzeth` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None sought. Its thirty-one optional dependencies are the argument:
it names `angelspetrochem`, `bobassembly`, `bobelectronics`, `BobExtended`, `Krastorio2`,
`space-exploration`, `IndustrialRevolution3`, `SeaBlock`, `pypostprocessing` and `space-age` among
others — a mod written to survive exactly the overhauls this chain layers on top.

**Recommendation: keep.** Current on 2.1, and by the author of `kry-picker-complete`, the mod the
Picker question turns on. Two notes that are not about its health. It was `? reverse-factory`,
*optional*, in the 1.1 pack and is mandatory here — a change nobody decided, and issue #11's. And
Space Age ships a recycler doing a narrower version of the same job, so `Grado_ABCS` players have
both; the mod declares `? space-age`, so its author is aware, and an **Overlaps** row against a paid
DLC rather than a portal mod would not mean anything.

### `safefill`

| | |
|---|---|
| **Title** | Safe Waterfill |
| **Does** | Places water like landfill, in six water types, replacing only empty land — structures, vehicles, resources, cliffs, trees and the player all survive it. Blueprintable |
| **Latest** | `2.0.1`, `factorio_version` **2.0**, 2026-04-05 |
| **Downloads** | 36,265 |
| **Owner** | `anachrony` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched by name. The reason to look is in the recommendation, and
it is not about this mod's maintenance.

**Recommendation: reconsider:** whether it survives the overhaul layers, because its own page says
where it stops:

> This mod is currently compatible with the base game or any mods that retain standard vanilla
> technologies. It is also compatible with the Nullius overhaul.

`Grado_ABC` layers Angel's and Bob's, which do not retain the standard vanilla technologies — that
is most of what an overhaul *is*. The author states the boundary and names the one overhaul they
have crossed it for, and it is not one of ours. This does not mean the mod breaks; it means its
author declines to claim it works there, and the waterfill recipe is unlocked by a technology, which
is precisely the part being hedged. It is the clearest case in the pack of a member whose stated
compatibility stops short of the layer above it, and it is checkable the moment `Grado_ABC` is
loaded. Until then it is the entry to bring to that first load.

### `squeak-through-2`

| | |
|---|---|
| **Title** | Squeak Through 2 |
| **Does** | Shrinks entity collision boxes so the player can walk between adjacent pipes, solar panels, chests and drills instead of around them |
| **Latest** | `0.2.0`, `factorio_version` **2.1**, 2026-06-23 |
| **Downloads** | 282,576 |
| **Owner** | `_CodeGreen` |
| **Supersedes** | `Squeak Through` by `Supercheese`, last `1.8.2` on 2021-02-22, 479,676 downloads |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None needed; it is the successor and says so — "A highly configurable
and more compatible version of Squeak Through, written from scratch" — and it declares
`! Squeak Through`, so the two cannot coexist and the handover is enforced rather than implied.

**Recommendation: keep.** Current on 2.1, by the author of `water-poles`, which appears under
`beautiful_bridge_railway` below. Two notes. It was `? Squeak Through`, *optional*, in the 1.1 pack
and is mandatory here — issue #11's, the same change as `reverse-factory`. And `kry-picker-complete`
declares `? squeak-through-2`, so if the Picker question is answered by adopting that pack, this
member is already satisfied rather than duplicated.

### `textplates`

| | |
|---|---|
| **Title** | Text Plates |
| **Does** | Placeable metal letters, numbers and symbols — iron and copper, large and small — for labelling the factory floor |
| **Latest** | `0.8.0`, `factorio_version` **2.1**, 2026-06-24 |
| **Downloads** | 341,703 |
| **Owner** | `Earendel` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched. Current on 2.1 and nothing needs replacing.

**Recommendation: keep.** `base >= 2.1.7`. It adds craftable entities, which is the literal sense in
which it is factory-affecting and belongs here rather than in `Grado_NonChanging`, but it constrains
nothing.

### `underground-pipe-pack`

| | |
|---|---|
| **Title** | Advanced Fluid Handling |
| **Does** | I, L, T and cross-shaped underground pipe junctions, pipes-to-ground whose underground output rotates independently of the surface port, and an underground pump. Valves were removed for engine reasons and the page points at `Configurable Valves` instead |
| **Latest** | `2.0.7`, `factorio_version` **2.1**, 2026-07-13 |
| **Downloads** | 51,931 |
| **Owner** | `staplergun` |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None searched for the mod itself. Its author, `staplergun`, also wrote
`PickerPipeTools`, which this pack dropped — see below, where this mod is part of the answer.

**Recommendation: keep.** Current on 2.1, and it declares optional compatibility with
`boblogistics`, `space-exploration`, `space-age` and `Dectorio`, so it is aware of the layer above
it. `PickerPipeTools` declared `(?) underground-pipe-pack` in 1.1, so these two were already an
intended pairing.

## Dropped during the port

Six mods were in the 1.1 `Grado_ChangingBase` (release `0.0.2`, 2024-10-08) and are not in the 2.0
pack. The port recorded all six as "no 2.0 release, no replacement found", from a search by name
only. Re-checked here by name, title and summary.

**Not one of them should be added back as itself, and not one of the six is a case of nothing
existing** — the port's "no replacement found" turns out to be false for all six once titles and
summaries are searched instead of names. The only genuine gap the six leave is a single *feature*,
`PickerPipeTools`' pipe clamps, and that mod is one of the two with a named successor for everything
else it did. Four
end in `stay dropped`: `PickerTweaks` because it is the wrong kind of mod for this pack,
`alien-biomes-hr-terrain` and `crafting_combinator` because what they did is now delivered by
something already present, and `beautiful_bridge_railway` because its successors cover the function
but not the point. Two end in `reconsider:` — `PickerPipeTools` and `PickerVehicles` — and both name
the same replacement, `kry-picker-complete`. Assessing it against *this* pack is what the two entries
below do; adopting it into `Grado_ChangingBase` is **#8**, the decide-and-apply ticket for this
pack's membership, and not this survey's to take.

### `PickerPipeTools`

| | |
|---|---|
| **Title** | Picker Pipe Tools |
| **Does** | Fluid-plumbing tools: an orphan finder for unconnected undergrounds, a pipe cleaner, an underground-pipe highlighter, and pipe clamps that stop adjacent pipes connecting |
| **Latest** | `1.1.4`, `factorio_version` **1.1**, 2022-06-05 |
| **Downloads** | 6,845 |
| **Owner** | `staplergun` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Feature by feature, and most of them are already in the chain:

- **Underground highlighting** — `PipeVisualizer-Updated`, already a member of `Grado_NonChanging`.
- **Orphan finder** — **[`Orphan Finder`](https://mods.factorio.com/mod/Orphan%20Finder) by
  `GotLag`** — `1.2.2`, `factorio_version` **2.0**, 2025-01-25, 25,770 downloads, "Adds a hotkey to
  highlight unconnected undergound pipes/belts near the player", which is the same feature for belts
  as well as pipes.
- **Connection verification** —
  **[`fluid-connection-indicators`](https://mods.factorio.com/mod/fluid-connection-indicators),
  *Connection Indicators*, by `Soul-Burn`** — `0.2.9`, `factorio_version` **2.1**, 2026-07-01, 3,172
  downloads, covering inserters and miners too.
- **Pipe clamps** — nothing found under that name or description. The nearest thing in the chain is
  `underground-pipe-pack`, a current member, whose independently-rotatable underground outputs solve
  some of what clamps were laid for.

Both of the named replacements are inside `kry-picker-complete`: `fluid-connection-indicators` as a
mandatory member, `Orphan Finder` as an optional.

**Recommendation: reconsider:** as part of the `kry-picker-complete` question, not on its own. This
is the second pack to reach that modpack, and from a different direction — `Grado_NonChanging` got
there through `PickerAtheneum`, whose worked example is in `docs/mod-catalogue.md` and whose entry is
in `docs/catalogue/Grado_NonChanging.md`. Answering it once for the chain is cheaper and more
coherent than adopting it pack by pack.

**No single ticket owns that, which is worth saying rather than routing around.** Adoption is pack
membership, so it splits: `Grado_NonChanging`'s share is **#7** and this pack's is **#8**. Both are
open. A modpack that would be pulled in by the lower pack and inherited by the higher one wants one
answer, so whichever is taken first should decide for both. Only the pipe clamps have no successor
at all.

### `PickerTweaks`

| | |
|---|---|
| **Title** | Picker Tweaks |
| **Does** | A bundle of independently-toggleable data tweaks to base values: squeeze-through collision boxes, smaller tree collision, decorations off, smoke off, vehicle equipment grids, a better flashlight, inserter pickup/drop indicators, and assorted small fixes |
| **Latest** | `2.2.7`, `factorio_version` **1.1**, 2022-06-04 |
| **Downloads** | 5,396 |
| **Owner** | `Nexela` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** It is a bundle, so it has no single successor — but read against its own
feature list, the chain already carries most of it:

- **Squeak Through** — `squeak-through-2`, a current member of this pack.
- **Lights** — `AfraidOfTheDark` and `Brighter-Lamps`, both `Grado_NonChanging` members.
- **Inserter indicators** — `bobinserters`, a current member of this pack.
- **Vehicle grids** — **[`kry-vehicle-grids`](https://mods.factorio.com/mod/kry-vehicle-grids),
  *Vehicle Equipment Grids*, by `Kryzeth`** — `2.3.1`, `factorio_version` **2.1**, 2026-07-27, 8,164
  downloads, an optional member of `kry-picker-complete`, and a more careful version of the feature
  than the original's generic grids: it declines to put exoskeleton legs in trains.
- **Smaller tree collision, decorations off, smokeless** — not searched for individually. They are
  display and clutter preferences rather than capabilities, and `alien-biomes`, a current member,
  already governs decoratives and trees through its own settings.

**Recommendation: stay dropped.** This is the one of the six that is genuinely better off gone, and
not because nothing replaced it. It is a mod whose whole job is *"adjusting base values of items"* —
in a pack whose promise is compatibility with overhauls that adjust base values of items for a
living. Angel's and Bob's redefine the entities this reaches into. Its separately-useful features
are already covered by four mods that are in the chain on their own terms and can be reasoned about
one at a time, which is the better arrangement regardless of the port.

### `PickerVehicles`

| | |
|---|---|
| **Title** | Picker Vehicles |
| **Does** | Vehicle conveniences: a hotkey raising an alert at the last car the player was in, a hotkey toggling a train between manual and automatic, automatic manual mode for trains with one station or fewer, custom train horns, and altered driving controls |
| **Latest** | `1.1.3`, `factorio_version` **1.1**, 2020-11-25 |
| **Downloads** | 4,004 |
| **Owner** | `Nexela` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** Another bundle, and again the features survive separately:

- **Find my car** — **[`car-finder`](https://mods.factorio.com/mod/car-finder) by `jeff.s`** —
  `2.1.0`, `factorio_version` **2.1**, 2026-06-23, 46,952 downloads. An optional member of
  `kry-picker-complete`.
- **Train manual/automatic toggle** — `Shortcuts-ick`, a *mandatory* member of
  `kry-picker-complete`, lists "Vehicle settings and train manual mode" among its shortcuts.
  Standalone alternatives exist too: `train-toggle`, `auto_manual_mode`, `EvesQoL`.
- **Train horns** — **[`Honk`](https://mods.factorio.com/mod/Honk) by `GotLag`** — `5.2.1`,
  `factorio_version` **2.1**, 2026-06-30, 120,655 downloads. Also an optional member of
  `kry-picker-complete`.
- **Driving controls** — `VehicleSnap`, already a `Grado_NonChanging` member, covers the part of
  this that players usually mean.

**Recommendation: reconsider:** with `PickerPipeTools`, as part of the same `kry-picker-complete`
question. Three of its four features are `kry-picker-complete` members or optionals and the fourth
is already in the chain, which makes this the cleanest illustration of why the modpack is worth
deciding about once rather than assembling by hand.

### `alien-biomes-hr-terrain`

| | |
|---|---|
| **Title** | Alien Biomes High-Res Terrain |
| **Does** | The high-resolution terrain textures for `alien-biomes`, shipped separately so players on limited video memory could omit them |
| **Latest** | `0.6.1`, `factorio_version` **1.1**, 2020-11-24 |
| **Downloads** | 208,684 |
| **Owner** | `Earendel` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** None needed — the replacement is mandatory and automatic. See
*`alien-biomes-hr-terrain`: the assumption, checked* below for the evidence.

**Recommendation: stay dropped.** Verified rather than assumed, which is what this ticket was for.
The author's own page for it now reads "Not required for Factorio 2.0 games", and the textures ship
in `alien-biomes-graphics`, a hard dependency of the `alien-biomes` already in this pack. Listing it
would pin a 1.1 mod into a 2.0 pack for no gain.

### `beautiful_bridge_railway`

| | |
|---|---|
| **Title** | Beautiful Bridge Railway |
| **Does** | Decorative bridge rails in wood, iron and stone brick that can be laid across water, and makes big electric poles and rail signals placeable on water so a crossing can be signalled and powered |
| **Latest** | `1.1.1`, `factorio_version` **1.1**, 2020-12-01 |
| **Downloads** | 51,569 |
| **Owner** | `kapaer` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** No single 2.x mod does all of it, but two together cover the function
and neither is a fork:

- **[`SchallOverseasRailway`](https://mods.factorio.com/mod/SchallOverseasRailway) by `Schallfalke`**
  — `2.0.0`, `factorio_version` **2.0**, 2024-11-17, 10,666 downloads. "A tiny mod allowing rails
  (with rail signals) to be placed over water tiles." The rails and the signals, without the
  decorative bridge graphics.
- **[`water-poles`](https://mods.factorio.com/mod/water-poles) by `_CodeGreen`** — `0.0.7`,
  `factorio_version` **2.1**, 2026-06-23, 16,783 downloads. "Allows big electric poles to be placed
  on water." The other half, by the author of this pack's `squeak-through-2`.

What neither provides is the bridge *look*, which is what the mod's own title leads with. Searching
the 2.x list for rails over water returns nothing that draws a bridge.

**Recommendation: stay dropped**, and record why the successors were not taken rather than leaving
the line blank. The two mods above are a functional replacement, not an equivalent: the original was
a decorative mod whose water-crossing was the side effect, and splitting it into two utility mods
delivers the crossing and drops the reason someone installed it. Adding a member to
`Grado_ChangingBase` is a save-breaking change under
`docs/adr/0001-version-major-tracks-save-compatibility.md`, so this is not a cheap "might as well".
If the crossing is wanted, the pair is what to add and this entry is the evidence; that is pack
membership and Truls's. **Related and not this ticket's:** `Grado_ABC` dropped
`beautiful_bridge_railway_bob_fix_updated_new`, the Bob's-compatibility companion to this mod, so
the same question reaches #4 and #5 from the other side. Whatever is decided here should be decided
there.

### `crafting_combinator`

| | |
|---|---|
| **Title** | Crafting Combinator |
| **Does** | Combinators that set a crafting machine's recipe from a circuit signal, read the recipe a machine is running, and emit a recipe's ingredients or products as signals |
| **Latest** | `0.16.3`, `factorio_version` **1.1**, 2021-12-11 |
| **Downloads** | 21,568 |
| **Owner** | `rusty_mari` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-21 |

**Alternatives considered.** **The base game**, which is why the search for a mod came up empty. The
Factorio wiki's *Circuit network* page states, for 2.0:

> All crafting machines can enable on a condition and set their recipe based on a signal.

and, for the reading half:

> **2.0.7**: Assembling machines, chemical plants, oil refineries and centrifuges can now send the
> ingredient list of their recipes to the circuit network.

That is this mod's two headline features, in the base game, with a version stamp on the second.
Searching the 2.x list by title and summary returns `recipe_combinator` and `Recipe_Combinator_2_0`,
which look out recipe data as a lookup rather than driving a machine, and `lo-recipe-combinator`,
which is a 1×1 assembler used as one. None is a continuation, and none needs to be.

**Recommendation: stay dropped.** The only one of the six absorbed by the game itself rather than by
another mod. Worth remembering as a pattern: the 1.1→2.0 break moved features into the base game as
well as breaking mods, so "no 2.0 release and no replacement" can mean the mod succeeded rather than
died.

**Counting note, and a correction to `docs/porting-notes.md`.** That file says release `0.0.2`
"swapped `reverse-factory` for `crafting_combinator`". The two published 1.1 releases, read from the
portal on 2026-09-21, say something narrower: `0.0.1` (2024-09-29) carried `reverse-factory` as a
mandatory member and had no `crafting_combinator` and no `Squeak Through`; `0.0.2` (2024-10-08)
**added** `crafting_combinator` and `? Squeak Through` and **demoted** `reverse-factory` to
`? reverse-factory`. Nothing was swapped out — the pack grew by two and one member became optional.
The 31-and-29 arithmetic in `docs/porting-notes.md` is unaffected and checks out against `0.0.2`;
only the word "swapped" was wrong, and the file is corrected in the same commit as this entry. **Its
31 counts mods, not dependency entries** — `0.0.2` declares 33 lines in all, of which `base >= 1.1.0`
and `Grado_NonChanging` are not mods, leaving 31 mods, 29 of them mandatory. That is the opposite
convention to the "27 entries" at the top of this file, which counts every line. Both numbers are
right and neither is comparable to the other without saying which is being counted, which is how the
brain page got a "31" it could not reconcile.

The correction matters beyond tidiness, because the demotion is half of issue #11: `reverse-factory`
did not merely stay optional across the port. It was mandatory in `0.0.1`, made optional in `0.0.2`,
and is mandatory again in the 2.0 pack.

## `bobinserters` sits in two packs

It is listed in `Grado_ChangingBase` and in `Grado_ABC`, the only mod named in two of the five
dependency lists. `Grado_ABC` depends on `Grado_ChangingBase`, so one of the two lines does nothing.
This survey recommends which; `docs/mod-catalogue.md` puts the disposal with #8 and #9 jointly, and
nothing below settles it.

**Recommendation: keep it in `Grado_ChangingBase` and drop the line from `Grado_ABC`.** Four
reasons, in the order they matter:

1. **The mod does not need Bob's.** Its only dependency is `base >= 2.1.0` — no `boblibrary`, no
   `bobplates`, nothing. The name is authorship, not a requirement. Read the other way round,
   `boblogistics` declares `? bobinserters >= 3.0.0`, *optional*: even inside `Grado_ABC` nothing
   requires it. The intuition that says "it is a Bob's mod, so it belongs with the Bob's mods" is
   the thing to distrust here, and it is the only argument for the other answer.
2. **Only one of the two removals is free.** Removing the `Grado_ABC` line changes nothing for any
   player, because every ABC install still resolves the mod through `Grado_ChangingBase`. Removing
   the `Grado_ChangingBase` line takes the mod away from everyone who plays `Grado_ChangingBase`
   without an overhaul on top — a real loss of a feature, and under
   `docs/adr/0001-version-major-tracks-save-compatibility.md` a **major** bump, because a member of
   `Grado_ChangingBase` would be leaving. The ABC removal is save-safe and costs a minor bump at
   most.
3. **It is what this pack is for.** Adjustable pickup and drop tiles are a quality-of-life change
   that writes per-entity state into the save, which is exactly the line between
   `Grado_NonChanging` and `Grado_ChangingBase`, and it constrains no overhaul above it.
4. **406,215 downloads and a release on 2026-06-29.** Neither layer has a maintenance reason to
   prefer the other; this only matters in that no part of the recommendation rests on the mod being
   at risk.

The one thing that would overturn this is a decision that `Grado_ChangingBase` should ship no
inserter changes at all, which is a question about that pack's scope rather than about this mod.

## `alien-biomes-hr-terrain`: the assumption, checked

`CLAUDE.md` and `docs/porting-notes.md` both recorded the same open question: the mod was dropped
**assuming** 2.0 `alien-biomes` absorbed the high-resolution terrain, and nobody had checked.

**Checked on 2026-09-21. The drop was right and the reason was slightly wrong.**

Three readings, all from the portal API:

1. **The author says so on the dropped mod's own page.** Its summary now reads: "The high-resolution
   textures for Alien Biomes. **Not required for Factorio 2.0 games.**" The mod's last release is
   `0.6.1` on 2020-11-24, four years before Factorio 2.0 — so that sentence was edited onto a dormant
   page after the fact, deliberately, to tell people to stop installing it.
2. **The textures moved, they were not absorbed.** `alien-biomes` `0.8.0` declares
   **`alien-biomes-graphics >= 0.8.0`** as a *mandatory* dependency. That mod — `Earendel`, `0.8.0`,
   `factorio_version` **2.1**, 2026-06-24, 339,385 downloads — is described simply as "The graphics
   for Alien Biomes" and points at the parent mod for its description.
3. **It was created for the 2.0 port.** `alien-biomes-graphics` was created on **2024-10-17** and
   its first release, `0.7.0`, was published **2024-10-18** declaring `factorio_version` 2.0 —
   Factorio 2.0 shipped on 2024-10-21. `alien-biomes`' changelog records the other side of the
   split: "Now requires Alien Biomes Graphics 0.7.1".

**So the correction worth keeping is the mechanism.** The assumption was that `alien-biomes` grew to
contain the terrain. What actually happened is that `Earendel` split *all* the graphics out into a
new mandatory companion at the 2.0 port and retired the separate high-res download. The outcome for
this pack is the same and better than assumed — a `Grado_ChangingBase` player gets the
high-resolution terrain automatically, because a mandatory dependency is resolved whether or not the
pack names it — but the two stories predict different things. "Absorbed into `alien-biomes`" would
mean nothing more to watch. What is actually true is that there is a *third* mod in the chain, not
named in any of our five dependency lists, whose version is pinned by `alien-biomes` and which can
go stale or be renamed on its own.

Nothing to change in any `info.json`: naming `alien-biomes-graphics` explicitly would duplicate a
constraint `alien-biomes` already enforces, and pinning it ourselves could only ever conflict with
what `alien-biomes` asks for.

This closes one of the four open decisions in `CLAUDE.md`. `docs/porting-notes.md` is updated with
the answer in the same commit.

## What constrains an overhaul on top

The ticket asks which members limit what can be layered above. **Five of the twenty-five do**, in
descending order of how likely they are to matter. The other twenty constrain nothing in the sense
used here — they add a GUI, a shortcut, a display, or an entity that no overhaul has an opinion
about — which is not the same as costing nothing, and the paragraph after the table is about four of
them that do.

| Mod | What it constrains | Evidence |
|---|---|---|
| `safefill` | Tech-tree overhauls | Its own page claims compatibility only with "the base game or any mods that retain standard vanilla technologies", plus Nullius. Angel's and Bob's are neither |
| `UltimateBeltsSpaceAge` | Belt progression | Five tiers past express with no compatibility handling at all, stacking onto `boblogistics`' own tiers, and unserved by the pack's loader mod |
| `UltimateResearchQueue2` | Any other research queue | Three hard `!` incompatibilities: `sonaxaton-research-queue`, `UltimateResearchQueue`, `awesome-rqm`. A load failure, not a balance question |
| `qol_research` | Tech-tree overhauls, mildly | Adds technologies; optional compatibility covers `space-exploration`, `nullius` and `Krastorio2`, but neither Bob's nor Angel's. Its flat-value setting is the escape hatch |
| `StoneWaterWell-ActuallyUpdated` | Water economies | Free water anywhere on land, with `pycoalprocessing` its only overhaul compatibility. Angel's builds a water-treatment chain that assumes water has a cost |

Four more are not a compatibility constraint but a cost, and the cost scales with the overhaul rather
than with this pack: the `WideChests` family. `WideChestsAllTypes` merges *all* basic chest types and says
it "Increases memory usage and loading time"; `WideChestsUnlimited` removes the size limits and says
it "can increase memory usage and loading time significantly". Both are in the pack, and the number
of chest types they iterate is set by whatever is layered above — `Grado_ABC` adds Bob's and
Angel's chests and carries `WideChestsBobs`, a fifth mod in the same family, on top. This is the
member whose cost is smallest in `Grado_ChangingBase` alone and largest in `Grado_ABCS`, which is
the opposite of every other entry above, and it is measurable the first time a pack is loaded.

`reverse-factory` deserves a line for not being on the list. Un-crafting every item in the game is
the most invasive thing in the pack on paper, and it is the member with the best overhaul story:
thirty-one optional dependencies naming Angel's, Bob's, Krastorio, SE, IR3, SeaBlock and Space Age. It is
the shape of what a `Grado_ChangingBase` member should look like.

## The pack cannot load on the Factorio version it declares

`info.json` declares `"factorio_version": "2.0"` and `base >= 2.0.0`. **Eleven of the twenty-five
members require `base >= 2.1`**, so a player on 2.0.x cannot satisfy this pack:

| Floor | Members |
|---|---|
| `base >= 2.1.8` | `WideChests` |
| `base >= 2.1.7` | `LogisticTrainNetwork`, `alien-biomes`, `miniloader-redux`, `textplates` |
| `base >= 2.1.0` / `>= 2.1` | `AdditionalPasteSettings`, `EditorExtensions`, `LTN_Combinator_Modernized`, `LtnManager`, `UltimateResearchQueue2`, `bobinserters` |

`WideChestsLogistic` adds a twelfth indirectly: it requires `WideChests >= 6.3.0`, which is the
release that requires 2.1.8. And `alien-biomes`' mandatory `alien-biomes-graphics` requires 2.1.7 on
its own account.

**This is the same answer `Grado_NonChanging` reached on 2026-09-21, reached the same way**, and it
raises the floor rather than confirming it: that pack's highest requirement was `>= 2.1.7`, this one
needs `>= 2.1.8`. Since `Grado_ChangingBase` depends on `Grado_NonChanging`, it inherits that pack's
floor too, so the effective minimum for anyone installing this pack is the higher of the two.

The mechanism is the members' own `base` requirements, not the `factorio_version` field — the field
declares which game version the pack is *for*, and Factorio will not install a mod whose
dependencies cannot resolve regardless of what it says. Two of the five packs have now been checked
and both answer no. The remaining three are one command each, and that measurement is **#15**.
**The number to declare instead is Truls's to set** and is **#16**; this section supplies the
evidence for this pack, not the decision.

## What was not checked

Stated plainly so the gaps are not mistaken for clean results.

- **Nothing was loaded in Factorio.** No pack, no member mod, no combination. Every claim above is a
  portal or documentation reading. The 240-vs-270 items/sec arithmetic under
  `UltimateBeltsSpaceAge` is the clearest case: it follows from two mod pages and has never been
  observed.
- **The overhaul-compatibility flags are readings of what authors claim**, not tests. `safefill`'s
  boundary is a sentence on its page; it may work fine under Angel's. The point of flagging it is
  that nobody has to guess in-game which member to suspect first.
- **`WideChestsAllTypes` and `WideChestsUnlimited` were not measured.** "Increases loading time" is
  quoted from the mods, and the size of the increase under Angel's and Bob's chest types is
  unmeasured and is the kind of thing only a load will tell.
- **Three of the six drops were not searched exhaustively by feature.** `PickerTweaks`' smaller tree
  collision, decoration removal and smoke removal were reasoned about rather than searched, because
  they are display preferences with no capability behind them.
- **The pipe clamps of `PickerPipeTools` have no successor found**, and unlike the other Picker
  features that is a genuine gap rather than an unfinished search.
- **Whether `LTN_Content_Reader_Updated` works against LTN `3.2.1` is unknown.** It resolves; that
  is all that has been established, and it is the member most likely to be the first failure.
- **Two mods were not re-examined for their `?`-to-mandatory change**, only noted:
  `reverse-factory` and `squeak-through-2` were optional in the 1.1 pack and are mandatory here.
  That is issue #11's.
