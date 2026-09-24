# Catalogue: `Grado_ChangingBase`

The pack that may change saves and the factory, but must stay compatible with most overhauls —
`Grado_ABC` and both its branches load on top of it. Two questions run through every entry here that
did not exist in `Grado_NonChanging`: what a mod does to a save, and what it forbids the layer above
from doing. The second has its own section, *What constrains an overhaul on top*.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-21**, except those carrying a **Read on** of **2026-09-22**, which #8 took — the three
entries it added and the readings inside its rulings — and the notes marked *Superseded 2026-09-23
by #15*, which #15 took, and the notes dated 2026-09-24 (#43), which #43 took. Each is reproduced
from the fetched data rather than retyped; the **Read on** row is authoritative where it disagrees
with this sentence.

The dependency list holds 22 entries: `base >= 2.0.0`, `Grado_NonChanging` — a pack, catalogued in
`docs/catalogue/Grado_NonChanging.md` — and the **20 mods** below. The survey read 25; #8 took the
pack to 20 on 2026-09-22 and the section after this one is its ledger. **Fourteen mods are no longer
members**: the six lost in the port, reassessed at the end, and the eight under *Ruled out after the
port* - **five** #8 removed outright and **three** it replaced. `LogisticTrainNetwork` counts as
replaced, not removed: `cybersyn2` carries its `Supersedes` row.

**All 20 current members have a 2.x release.** None is stranded on 1.1. **Eleven of the twenty
require `base >= 2.1`**, which is the same finding the `Grado_NonChanging` survey reached and is fatal to
this pack's declared `factorio_version` for the same reason; see *The pack cannot load on the
Factorio version it declares* *(at a 2.1 target; on stable 2.0.77 the pack resolves - #43,
2026-09-24)*. #8 raised the floor again, to `base >= 2.1.12`, by adopting `cybersyn2`.

## Decisions, 2026-09-22 (#8)

Truls ruled on every recommendation, and on #11 and #23, which are this pack's membership and were
settled in the same pass. The survey text below is left as written; each affected entry carries its
ruling inline. **25 members to 20.**

| mod | ruling |
|---|---|
| `LogisticTrainNetwork` | **replaced** by `cybersyn2` — the train-logistics paradigm moves to Cybersyn 2 (#23) |
| `LTN_Combinator_Modernized` | **out** — with LTN |
| `LtnManager` | **out** — with LTN; CS2 has the manager built in |
| `LTN_Content_Reader_Updated` | **out** — with LTN, and **the feature is lost**: no CS2 content reader exists |
| `cybersyn2` | **in** — replacing the LTN cluster. No mod entered this pack that did not displace one, which is rule 1 holding |
| `UltimateBeltsSpaceAge` | **out** — fails the promise: belt tiers past express are `boblogistics`' ground |
| `StoneWaterWell-ActuallyUpdated` | **out** — fails the promise: free water is Angel's water-treatment chain's ground |
| `safefill` | **replaced** by `Waterfill_v17` — reachable at 2.1, where `safefill` is not |
| `ModuleInserterSimplified` | **replaced** by `ModuleInserterEx` — the 1.1 pack had the configurable one |
| `reverse-factory` | **mandatory**, by decision rather than by accident (#11) |
| `squeak-through-2` | **mandatory** (#11), and confirmed the right replacement for `Squeak Through` |
| `bobinserters` | **kept here**, and the duplicate line removed from `Grado_ABC/info.json` |
| `qol_research` | kept — tested against the promise and passes |
| `UltimateResearchQueue2` | kept — tested against the promise and passes |
| `PickerPipeTools`, `PickerVehicles` | stay dropped — `kry-picker-complete` declined for this pack too |
| everything else | kept or stays dropped as recommended |

**Three rules were set before the mods were ruled on, and they decided most of them.**

1. **Swaps in, additions out.** Replacing a member with a successor is porting; adding a mod the 1.1
   pack never had is a new feature nobody asked for. Same rule #7 applied one layer down. It is what
   declines `kry-picker-complete` here, and it defers every candidate addition to a ticket still to
   be filed for this pack, the counterpart of #41.
2. **The promise is the membership test, and it had never been run on this pack.** #7 wrote
   `Grado_ChangingBase`'s promise on 2026-09-22 — *may add content, but not content that competes
   with an overhaul for the same ground* — one day after this survey was read, and said in as many
   words that it had not been checked against the existing members. #8 ran it against the five
   flagged under *What constrains an overhaul on top*. Two failed.
3. **Unreachability breaks a tie; it does not decide on its own.** Six members declared
   `factorio_version: 2.0` and the portal does not serve them to a 2.1 game, which this pack's floor
   requires. #7's precedent is to leave such members in and track them (#43), and #8 followed it —
   except in entries the survey had already marked `reconsider:`, where it broke the tie.
   `safefill` and `UltimateBeltsSpaceAge` are the two it touched.

**A `2.0`-declaring member is unreachable, not merely stale** - *at a 2.1 target. Qualified
2026-09-23 (#9): every member has a 2.0 release with a `base` floor below 2.1, so on a 2.0 target
these are served; see #43 and #16.* Of the six, three leave the pack
outright - `LTN_Content_Reader_Updated`, `StoneWaterWell-ActuallyUpdated` and `UltimateBeltsSpaceAge` -
and one is fixed by the `Waterfill_v17` swap. **`Nanobots2` and `qol_research` remain unreachable
and stay in the pack**, which is #43's, not this ticket's. *#43 found on 2026-09-24 that the whole
chain resolves on stable 2.0.77, so both are served today and matter only at a 2.1 target; see
`docs/porting-notes.md`, Resolves on stable 2.0.77.*

Two questions were deferred rather than answered: candidate additions that were never in the 1.1
pack, which needs a ticket of its own, and `kry-picker-complete`'s members assessed one at a time
for whichever pack each fits, which is **#46**.

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
| **Read on** | 2026-09-21 |

**Alternatives considered.** None needed. **This entry carried an `Overlaps` row against
`blueprint-sandboxes` (`Grado_NonChanging`) until 2026-09-22, and no longer does, because that mod
is no longer in any pack.** #7 dropped it, settling the layer question this entry had recorded as
"#7's and #8's jointly".

**What that changes here is not nothing.** `blueprint-sandboxes` reached into this mod and
force-disabled its lab setting, and had done since 2023-11-06 — so until #7, a `Grado_ChangingBase`
player got the other mod's lab and never this one's. **With it gone, this mod's lab is reachable for
the first time in the chain**, here and in every pack above. The feature was always listed; it was
not always delivered. See `blueprint-sandboxes` under *Ruled out after the port* in
`docs/catalogue/Grado_NonChanging.md` for the comparison and the ruling.

**Recommendation: keep.** The lab is one paragraph of this mod; infinity chests, cheat mode and the
editor conveniences are untouched by the collision and are what most of its 140,067 downloads are
for. It carries explicit optional compatibility with `Krastorio2`, `aai-industry`,
`space-exploration`, `omnimatter_compression` and `DeadlockStackingForAngels` — the last an
Angel's-family mod, so the author is already tracking the kind of overhaul this pack sits under.

### `ModuleInserterEx`

| | |
|---|---|
| **Title** | Module Inserter Extended |
| **Does** | Mass insert and remove modules into machines with construction robots, configured per machine type rather than one module type at a time |
| **Latest** | `7.5.0`, `factorio_version` **2.1**, 2026-06-29 |
| **Downloads** | 47,588 |
| **Owner** | `Gorfiend7` |
| **Supersedes** | `ModuleInserterSimplified` in this pack, 2026-09-22 (#8); both continue `ModuleInserter` by `Choumiko`, last `5.2.5` on 2024-10-06 |
| **Read on** | 2026-09-22 |

**Alternatives considered.** The mod it replaces, and the survey did the comparison — see
`ModuleInserterSimplified` under *Ruled out after the port*. Both are current 2.1 continuations of
the same 1.1 mod and the choice between them is a preference, which is why the survey recorded it
rather than settling it.

**Recommendation: keep.** Added by #8 on 2026-09-22, replacing `ModuleInserterSimplified`. The 1.1 pack carried
`ModuleInserter`, the configurable one, and the port replaced it with the deliberately *less*
configurable of its two successors while the incumbent's own page named this one as "a straight
upgrade from Module Inserter". That was never a decision, and `Grado_ABC` puts Bob's modules on
Angel's machines, which is the situation per-machine-type configuration exists for. `pump`, a
`Grado_ABC` member, already declares `? ModuleInserterEx >= 7.0.2`.

**It declares `flib >= 0.17.0`** where `ModuleInserterSimplified` declared no library at all — and
**that costs the pack nothing**, because `flib` is already mandatory for three current members:
`EditorExtensions` and `WideChests` at `>= 0.17.0` and `UltimateResearchQueue2` at `>= 0.17.1`. The
swap adds no mod to the closure. It declares `base >= 2.1`, below the pack's floor, so it adds
nothing there either.

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

**Ruled 2026-09-22 (#8): kept — tested against the promise and passes.** A research queue adds no
content at all, so there is no ground for it to compete with an overhaul over. The three `!` lines
stay worth remembering, but they name rival research-queue mods rather than overhauls, and no pack
in the chain carries one.

### `Waterfill_v17`

| | |
|---|---|
| **Title** | Waterfill |
| **Does** | Places water like landfill, unlocked by its own technology, with settings to disable collision with items and to allow placement on any planet |
| **Latest** | `2.1.2`, `factorio_version` **2.1**, 2026-09-11 |
| **Downloads** | 303,064 |
| **Owner** | `untraceablesmurf` |
| **Supersedes** | `safefill` in this pack, 2026-09-22 (#8) — pack membership, not lineage; the two are unrelated mods |
| **Read on** | 2026-09-22 |

**Alternatives considered.** The 2.1 list searched by title and summary for waterfill and
water-placement mods. Four others do the same job: `RitnWaterfill` (`1.6.0`, 2.1, 2026-09-12, 91,882
downloads) — which declares `! Waterfill_v17`, so the two are mutually exclusive, and pulls
`RitnLib >= 0.10`; `waterfill-2` (`1.0.3`, 2.1, 2026-08-26, 3,395 downloads); `waterfill-balanced`,
a fork restricting placement to tiles beside existing water; and `Waterbomb`, which converts land to
water by explosion rather than by placement. This one is the largest by more than threefold over the
next, `RitnWaterfill`, and **not** the most recently released — `RitnWaterfill` shipped `1.6.0` one
day later, on 2026-09-12. What it does lead on is reach: it declares `base >= 2.1.0` and
`? space-age >= 2.1.0` and pulls no library, where `RitnWaterfill` needs `RitnLib`.

**Recommendation: keep.** Added by #8 on 2026-09-22, replacing `safefill`, which declares `factorio_version: 2.0` and is
therefore not served to a 2.1 game at all — see *The pack cannot load on the Factorio version it
declares*. This pack's floor is well above 2.0, so the member it replaces installs on nothing.
*(That is the 2.1 reading. On stable 2.0.77 `safefill` would have been served; #43, 2026-09-24.)*

**Two things this swap does not do, stated so they are not assumed.** It does not answer whether a
waterfill mod survives the overhaul layers: `safefill`'s author declined to claim compatibility with
anything but vanilla technologies and Nullius, and this mod is also technology-unlocked and its
author makes no claim either way — which is less evidence, not better evidence. The question
attaches to the feature rather than to the mod and is checkable the moment `Grado_ABC` is loaded.
And **feature parity is unverified**: `safefill` advertised six water types, blueprintability, and a
guarantee that structures, vehicles, resources, cliffs, trees and the player all survive placement.
This mod's page documents an item-collision setting and a change to how placement over trees works,
which is adjacent but not the same claim. The delta is a portal reading, not a test.

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

**Recommendation: keep.** It set the pack's Factorio floor at `base >= 2.1.8`, which was the
highest requirement of any member of any pack when this was written and **was overtaken twice on
2026-09-22** — first by `SpaceModFeorasFork`'s `>= 2.1.9` in `Grado_ABCX`, then by `cybersyn2`'s
`>= 2.1.12` in this pack, which #8 added. **It no longer sets this pack's floor either.** See *What constrains an overhaul on
top* for
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
mod settings)". Four of the pack's 25 members were this one family when the survey was
read, and both of the members that cost load time are switched on. **After #8 the pack has 20
members, so the family is now a fifth of it** — the four are unchanged; the denominator shrank.

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

**Ruled 2026-09-22 (#8): kept here, and the duplicate line removed from `Grado_ABC/info.json`** in
the same change. #8 made that edit rather than leaving it to #9, because "the duplication is gone"
is #8's own acceptance criterion and a ruling alone cannot meet it. #9 still decides everything else
about that pack.

### `cybersyn2`

| | |
|---|---|
| **Title** | Cybersyn 2 |
| **Does** | Routes trains from providers to requesters under central planning driven by cybernetic combinators and the circuit network, with per-cargo thresholds, per-wagon filters, automatic allow-lists built from the inserters and pumps beside the track, depot bypass, and the network manager built in |
| **Latest** | `0.4.0`, `factorio_version` **2.1**, 2026-09-09; 27 releases since 2026-04-07 |
| **Downloads** | 1,484 |
| **Owner** | `The_LORD_thy_GOD` |
| **Supersedes** | `LogisticTrainNetwork` and its three satellites in this pack, 2026-09-22 (#8) — pack membership, not lineage |
| **Read on** | 2026-09-22 |

**Alternatives considered.** The incumbent it replaces and the generation between them, at length,
on #23. LTN is not dying — both its cores shipped 19 releases in twelve months and it maintains a
2.0 and a 2.1 branch in parallel. Project Cybersyn CS1 (`cybersyn`, `2.1.2`, 2.1, 2026-06-26, 58,742
downloads) was the option #23 was written about and is not the one taken: its author's own page
calls its 2.1 support experimental, it has had no release in three months, and it is a dead end,
because CS2 states there is **no direct migration from CS1**. This mod is the official successor —
same Discord and the `project-cybersyn` GitHub org, despite a different portal owner — and the most
actively developed of the three.

**Recommendation: keep.** Added by #8 on 2026-09-22 — **and the alpha warning is the reason to read
this entry twice.** From its own portal page:

> **WARNING: This mod is currently in an ALPHA state.** It is playable, but there are known issues,
> bugs, missing features, and even the occasional crash. Future save-breaking changes, while
> unlikely, are possible. Only install this mod if you are one of our testers

Shipping this pack ships that to players. The decision was taken knowing it, on the grounds that
CS1 is a dead end and CS2 is the only one of the three train-logistics options with a future. The
choice is cheapest now and not later: nothing here is published and no 2.0 save exists, so removing
LTN costs nobody an invalid entity today and would cost every logistic train stop in a player's base
after a release.

**It raises the pack's Factorio floor to `base >= 2.1.12`, the highest in the project** — above
`Grado_ABCX`'s 2.1.9 — and `Grado_ABC`, `Grado_ABCX` and `Grado_ABCS` all inherit it. That is
evidence for #15; the declaration is #16's. **Superseded 2026-09-23 by #15:** no longer the project
high. The hidden `kry_stdlib` `2.2.21`, released that day, asks `base >= 2.1.20`; see *Effective
Factorio floor* in `docs/porting-notes.md`, which also says why that number rests on one release.

**It pulls `0-things >= 0.6.1`**, *Things* (`The_LORD_thy_GOD`, `0.6.3`, 2.1, 2026-09-20, 3,292
downloads, `base >= 2.1.12`), a mandatory library by the same author which this pack's list does not
name. Its own summary warns that "disabling Things while other mods are using it may break your
save". This is the `alien-biomes-graphics` shape — a third mod nobody names pinned into the chain —
and reconciling the closure is #39's, which is why the dependency list carries the mod and not the
library. **It is a genuine addition to that closure, not a new kind of problem**: `flib`
(`EditorExtensions`, `WideChests`, `UltimateResearchQueue2`), `stdlib2` (`Nanobots2`) and
`kry_stdlib` (`reverse-factory`) are already mandatory in this pack and named in no list either.

**What the swap costs, and it is not nothing.** Four members become one. `LtnManager`'s job is built
in here, and the combinator GUI is available separately as `cybersyn2-combinator` and was declined —
see the ruling under `LTN_Combinator_Modernized`. **`LTN_Content_Reader_Updated` has no successor at
all**: `Cybersyn-Content-Reader` requires `cybersyn >= 2.1.2`, which is CS1, so the content-reader
feature leaves the pack outright. That was the one axis on which #23 found Cybersyn beating LTN, and
CS2 is the branch that does not have it.

**Compatibility, checked on #23 and not re-derived.** `! OverloadedTrains`, which is in none of the
five packs. Cross-surface behaviour for Space Age was checked for CS1 on #23 and found plausible;
that reading does not transfer to CS2, which is a ground-up rewrite — see *What was not checked*.
`miniloader-redux` detection should work by mechanism, because Cybersyn's allow-list detection is by
prototype type and `miniloader-redux` is built from `loader-1x1` prototypes. Nothing has been loaded
in Factorio.

### `miniloader-redux`

| | |
|---|---|
| **Title** | Miniloader (Redux) |
| **Does** | One-tile loaders moving items between a belt and a container at full belt throughput without an inserter, in three modes: normal, a container-only speed mode, and a lane-filtered variant of it |
| **Latest** | `2.2.3`, `factorio_version` **2.1**, 2026-09-16 |
| **Downloads** | 22,505 |
| **Owner** | `hgschmie` |
| **Supersedes** | `miniloader` by `therax`, last `1.15.7` on 2023-09-11, 193,085 downloads |
| **Overlaps** | ~~`deadlock-beltboxes-loaders` (`Grado_ABC`)~~ - resolved 2026-09-23 (#9), that mod is in no pack |
| **Read on** | 2026-09-21 |

**Alternatives considered.** No other 2.x mod offers one-tile full-throughput loaders as its whole
job, searching name, title and summary. `berbcorp-loaders` and `quantum-belts` bundle loaders with
their own belt tiers rather than serving the game's.

#### Against `deadlock-beltboxes-loaders`

**Resolved 2026-09-23 by #9, which dropped the whole Deadlock family from `Grado_ABC`.** An ABC
player now has one 1x1 loader family, this one. The comparison below is kept as written.

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

**Alternatives considered.** None needed. `Grado_ABC` carried `signalstrings` by the same author
until #9 removed it on 2026-09-23,
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

**Ruled 2026-09-22 (#8): kept — tested against the promise and passes.** #8 ran the promise against
the five members flagged under *What constrains an overhaul on top*, and this is the one where the
two readings diverge. It adds technologies, and the tech tree is what an overhaul restructures; but
"competes for the same ground" means duplicating content the overhaul provides, the way this pack's
belt tiers duplicated `boblogistics`' belt tiers, and nothing in Angel's or Bob's grants player
quality-of-life bonuses. Sitting on a shared tech tree is not competing for a place on it. The
stricter reading would disqualify every member that adds a technology, which is most of what a
content mod is.

The flat-value mode is a real escape hatch but not one the pack can pull: setting another mod's
default needs settings-stage Lua, which these packs do not carry.

**It remains unreachable** — `factorio_version` **2.0**, against a 2.1 floor — and stays in the pack
under #8's third rule, which leaves such members alone outside entries already marked `reconsider:`.
That is #43's, not this ticket's. *#43, 2026-09-24: served on stable 2.0.77; unreachable only at a
2.1 target.*

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

**Ruled 2026-09-22 (#8, settling #11): mandatory, by decision.** The port flattened `? reverse-factory`
to a hard requirement without anyone choosing to; the ruling keeps the result and supplies the
reason. An optional dependency installs nothing — it only orders load if the player already has the
mod — so a pack whose members are optional hands the player less than its list implies. That is what
a mod does to declare soft compatibility, not what a pack does. These two were the only optional
entries across all three published 1.1 packs, which reads as an outlier rather than a policy.

The objection that this pack must stay overhaul-compatible and mandatory imposes was weighed and
does not bite here: this is the survey's own example of the ideal member, with thirty-one optional
dependencies naming Angel's, Bob's, Krastorio, SE, IR3, SeaBlock and Space Age.

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

**Ruled 2026-09-22 (#8, settling #11): mandatory, by decision, and the replacement stands.** The
optionality reasoning is under `reverse-factory` above and applies unchanged; this mod shrinks
collision boxes and nothing else, so it is no compatibility risk to impose.

**On whether `squeak-through-2` is the right replacement for `Squeak Through`, which was #11's
second question: yes.** Re-read 2026-09-22 — `_CodeGreen`, `0.2.0`, `factorio_version` **2.1**,
2026-06-23, **282,772 downloads**, and it declares `! Squeak Through`, an explicit incompatibility
with the mod it succeeds, which is how a designated successor announces itself. A search of the
whole 2.1 list by name, title and summary returns **one** other candidate, and it is not a rival:
`Exteros-QoL-System` (`Exteros`, `0.4.2`, 2.1, 2026-09-12, 3,923 downloads), a bundle whose summary
offers "Even Distribution, Squeak Through, Auto Deconstruct & more" as one mod. It is declined as an
addition under this ticket's first rule, which is a different statement from nothing existing. It declares no `base` floor,
so it adds nothing to the pack's.

The `kry-picker-complete` note above is now moot: #8 declined that bundle for this pack, as #7 did
for `Grado_NonChanging`.

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

**Ruled 2026-09-22 (#8): stays dropped.** The `kry-picker-complete` question this entry deferred to
is **declined for this pack**, on the same grounds #7 used for `Grado_NonChanging` — it is an
addition of a mod never in the 1.1 pack, and #8 ruled additions out of its own scope. The structural
objection #7 recorded stands too: a pack depending on a pack hands a third party control of several
members at once.

Taking the features individually was considered and does not work either. Underground highlighting
is already in the chain through `PipeVisualizer-Updated` (`Grado_NonChanging`). **`Orphan Finder`
declares `factorio_version` 2.0 and is unreachable** at this pack's floor, which removes the closest
single successor. `fluid-connection-indicators` is reachable at 2.1 but is a different feature —
connection verification, not orphan-finding. So restoring this mod would mean two mods for one, each
closer to an addition than a replacement.

**The pipe clamps are recorded as a genuine loss**, the only one in this pack's drops with no
successor found. That is a search result, not a proof: name, title and summary across the 2.x list,
which is what turned up `kry-picker-complete` where a name-only search had missed it.

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

**Ruled 2026-09-22 (#8): stays dropped**, as recommended.

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

**Ruled 2026-09-22 (#8): stays dropped**, with `PickerPipeTools` and for the same reason — the
`kry-picker-complete` route is declined for this pack. Driving controls are already covered by
`VehicleSnap` (`Grado_NonChanging`); the remaining three features would want `car-finder`, a
train-toggle mod and `Honk`, which is three additions to restore one dropped mod.

**Its members are not abandoned, though.** #8 opened a ticket to assess `kry-picker-complete`'s
mandatory and optional members one at a time, for whichever pack each fits, rather than as a bundle.

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

**Ruled 2026-09-22 (#8): stays dropped**, as recommended and as verified. This closes the open
decision `CLAUDE.md` carried for it, which had stood because the original drop rested on an
assumption about where the HR terrain went; the mechanism turned out to be different from the
assumption and the answer the same. See *`alien-biomes-hr-terrain`: the assumption, checked* below.

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

**Ruled 2026-09-22 (#8): stays dropped**, as recommended.

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
The 31-and-29 split in `docs/porting-notes.md` checks out against `0.0.2`, and **its 31 counts mods,
not dependency entries** — `0.0.2` declares 33 lines in all, of which `base >= 1.1.0` and
`Grado_NonChanging` are not mods, leaving 31 mods, 29 of them mandatory. That is the opposite
convention to the "27 entries" at the top of this file, which counts every line. Both numbers are
right and neither is comparable to the other without saying which is being counted, which is how the
brain page got a "31" it could not reconcile.

**That same ambiguity had already broken a tally one paragraph above the one being corrected**, which
the review of this ticket caught: the `Grado_ChangingBase` section's headline read "16 carried over,
8 replaced, 6 dropped" — a members-only 16 beside an all-entries 8, adding up to neither 31 nor 25.
Carried over is **17** on the basis that sentence uses. Both are fixed in the same commit, with the
old readings kept.

The correction matters beyond tidiness, because the demotion is half of issue #11: `reverse-factory`
did not merely stay optional across the port. It was mandatory in `0.0.1`, made optional in `0.0.2`,
and is mandatory again in the 2.0 pack.

**Ruled 2026-09-22 (#8): stays dropped**, as recommended — the feature was absorbed by the base game.

## Ruled out after the port

Eight mods that survived the 1.1 -> 2.0 port and were removed on 2026-09-22 by #8 — by a
decision, not by an upstream gap. Entry format: `docs/mod-catalogue.md`, *a mod ruled out after
the port*. Each keeps the recommendation the survey wrote, with the ruling appended below it, so
what was recommended and what was decided stay separable.

In former dependency-list order.

### `LTN_Combinator_Modernized`

| | |
|---|---|
| **Title** | LTN Combinator Modernized |
| **Does** | A combinator with a GUI for setting LTN's control signals on a train stop, instead of composing them by hand |
| **Latest** | `2.5.0`, `factorio_version` **2.1**, 2026-06-25 |
| **Downloads** | 104,467 |
| **Owner** | `kryojenik` |
| **Read on** | 2026-09-21 |
| **Status** | dropped 2026-09-22 (#8) |

**Alternatives considered.** None. It is the maintained LTN combinator, and `LtnManager` names it as
an optional dependency, so the LTN mods in this pack already expect each other.

**Recommendation: keep.** Current on 2.1 and tracking LTN's own major version — it requires
`LogisticTrainNetwork >= 3.0.0`, which the pack's LTN satisfies.

**Ruled 2026-09-22 (#8): out**, with LTN. A combinator GUI for a mod the pack no longer carries has
nothing to configure. `cybersyn2-combinator` (`Moral1ty`, `2.1.4`, 2.1, 2026-08-21, **646
downloads**, 6 releases) is the CS2 counterpart and was **declined** rather than swapped in: it is
the weakest link the move would add, and it drags `fcore >= 1.0.0` (`Moral1ty`, `1.0.1`, 2.1,
2026-08-22, **289 downloads**, 2 releases) into the chain with it. CS2's own credits thank a
contributor for the modular combinators, which reads as combinator tooling being built in. If it is
not enough, adding the mod later is a save-safe minor and `fcore` will have a track record by then.

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
| **Status** | dropped 2026-09-22 (#8) |

**Alternatives considered.** **[`ltn-train-info`](https://mods.factorio.com/mod/ltn-train-info) by
`hgschmie`** — `2.0.4`, `factorio_version` **2.1**, 2026-08-20, 2,577 downloads, by the author of
`miniloader-redux`. More current, but not the same mod: it emits *delivery* signals — what trains
are carrying where — while this one reports *network contents*, what the providers and requesters
hold. Not a replacement. Searching the 2.x list by title and summary for "LTN" returns no other
content reader.

**The mod that would fix this one is on the other side of issue #23.**
**[`Cybersyn-Content-Reader`](https://mods.factorio.com/mod/Cybersyn-Content-Reader) by `danbopes`**
— `1.1.2`, `factorio_version` **2.1**, 2026-08-01, 1,504 downloads — is a port of the same Optera
mod to Cybersyn, one game version ahead of this one and ten months newer. It requires
`cybersyn >= 2.1.2`, so it cannot be adopted on its own: the pack's weakest member cannot be
strengthened without taking the whole train-logistics paradigm with it. That is the sharpest single
argument in #23, and it is why this entry and that ticket have to be read together.

**Recommendation: keep**, and re-check it before release. This is the weakest member of the pack on
every axis at once: 1,190 downloads against the 46,939 of the mod it replaces, `factorio_version`
still **2.0**, last touched 2025-10-17, and built against `LogisticTrainNetwork >= 2.4.2` while LTN
is now `3.2.1`. The declared dependency has no upper bound so it will resolve, but "resolves" and
"works against LTN 3.x" are the two claims this project keeps having to separate. Nothing here is a
reason to drop it — there is nothing to drop it *for* — but it is the member most likely to be the
first thing that breaks when a pack is finally loaded.

**Ruled 2026-09-22 (#8): out**, with LTN, **and the feature goes with it.** There is no CS2 content
reader. `Cybersyn-Content-Reader` requires `cybersyn >= 2.1.2`, which is CS1, and #23 had named it
the one axis on which Cybersyn beat LTN outright — CS2 is the branch that does not have it. The
survey called this the pack's weakest member on every axis at once and it was also unreachable
(`factorio_version` **2.0** against a 2.1 floor), so nothing here argued for keeping it; but it
leaves as a loss, not as a tidy-up: `Cybersyn-Content-Reader` is CS1's, and a name, title and
summary sweep of the 2.x list returns no CS2 equivalent.

### `LogisticTrainNetwork`

| | |
|---|---|
| **Title** | LTN - Logistic Train Network |
| **Does** | Replaces fixed train schedules with logistic train stops: depots hold idle trains, and the network dispatches whichever train fits a provider-to-requester delivery |
| **Latest** | `3.2.1`, `factorio_version` **2.1**, 2026-09-10 |
| **Downloads** | 286,624 |
| **Owner** | `Optera` |
| **Read on** | 2026-09-21 |
| **Status** | replaced by `cybersyn2`, 2026-09-22 (#8) |

**Alternatives considered.** The other three LTN mods in this pack exist only to serve it, so
replacing it means replacing four members at once. The 2.x list carries several successors of the
genre — `yet_another_train_manager`, `RailLogisticsDispatcher`, `precise-train-logistics`, and
**Project Cybersyn**, which is the serious one.

**That comparison is now open as issue #23**, raised on 2026-09-21, and the evidence lives there
rather than being summarised twice. The short of it: the two cores are equally maintained, 19
releases each in the last twelve months, so this is a feature and timing question and not a rescue.
Cybersyn offers per-cargo thresholds, per-wagon filters, automatic allow-lists, depot bypass and
twice the station update rate; against that, its 2.1 support is a single release its own page calls
experimental, while LTN ships a 2.1 and a 2.0 branch side by side on the same day. Checked while
filing it: nothing else among the 100 members of the five packs depends on LTN, so the cluster moves
as one unit and nothing in Angel's, Bob's, MadClown, SpaceX or Space Age notices either way.

**Recommendation: keep — and the question is open as #23.** Released eleven days before this reading,
so actively maintained, and it is the better-supported of the two on the game version this pack
actually needs. That is a recommendation on the 2.1 evidence, not a closure: which train-logistics
paradigm a pack ships is pack membership, so #23 records it and #8 settles it. It is one of four
members at `base >= 2.1.7`, the second-highest floor in the pack.

**Ruled 2026-09-22 (#8): out, replaced by `cybersyn2`** — and by neither of the two answers #23 was
written to choose between. #23 offered staying on LTN, swapping to Project Cybersyn CS1, waiting for
CS2, or swapping the content reader alone; the ruling took CS2 itself, which #23 had listed only to
rule out on its author's alpha warning. The reasoning is that CS1 is a dead end — it has no
migration to its own successor — so adopting it would buy one unmigratable move now and another
later, while LTN, though healthily maintained, is the paradigm being left. Doing it before any
release costs nobody an invalid entity; doing it after costs every logistic train stop in a player's
base. The alpha warning was read and accepted, not overlooked: see the `cybersyn2` entry under *In
the pack*, which carries it in full along with the `base >= 2.1.12` floor and the `0-things` library
the move pins into the chain.

### `LtnManager`

| | |
|---|---|
| **Title** | LTN Manager |
| **Does** | A GUI over a running LTN network: deliveries in flight, stop inventories, depot contents and the network's alerts in one window |
| **Latest** | `0.6.0`, `factorio_version` **2.1**, 2026-08-16 |
| **Downloads** | 118,632 |
| **Owner** | `nihilistzsche` |
| **Read on** | 2026-09-21 |
| **Status** | dropped 2026-09-22 (#8) |

**Alternatives considered.**
**[`LtnManagerUpdated`](https://mods.factorio.com/mod/LtnManagerUpdated) by `FoMaK`** — `1.1.1`,
`factorio_version` **2.1**, 2026-07-12, 4,280 downloads. A second continuation of the same mod. The
incumbent is both more recent, by a month, and far more used, so the fork's name is the only thing
recommending it.

**Recommendation: keep.** Current on 2.1, and it declares `? LTN_Combinator_Modernized`, which is
also in this pack.

**Ruled 2026-09-22 (#8): out**, with LTN. Unlike the other three this one loses nothing: CS2 has the
network manager built in, which is why the four-mod LTN cluster becomes one mod rather than three.

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
| **Status** | replaced by `ModuleInserterEx`, 2026-09-22 (#8) |

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

**Ruled 2026-09-22 (#8): replaced by `ModuleInserterEx`**, which is the question this entry asked.
The 1.1 pack carried the configurable mod and the port swapped it for the deliberately less
configurable sibling without anyone deciding to; the ruling restores what was ported from. The
download asymmetry the entry flags is real — 164,383 against 47,569, both read 2026-09-21 — and was read as measuring the
vanilla audience rather than this chain's, where Bob's modules sit on Angel's machines.

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
| **Status** | dropped 2026-09-22 (#8) |

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

**Ruled 2026-09-22 (#8): out**, and it is the cleaner of the promise sweep's two failures — the one
that fails on the promise alone, where `UltimateBeltsSpaceAge` also failed on staleness,
reachability and the loader gap. `Grado_ChangingBase`
may add content but not content that competes with an overhaul for the same ground, and a well
producing free water anywhere on land does not merely touch Angel's water-treatment chain — it
removes the need for the chain that overhaul exists to build. Its only declared overhaul
compatibility is `pycoalprocessing`.

**No swap was taken, deliberately.** `WaterExtractor` (`1.1.0`, 2.1, 2026-07-10, 7,341 downloads) is
reachable where this mod is not and more current, and does the identical job — so it fails the
promise identically. The promise attaches to the feature, not to the mod carrying it.

**The cost is named rather than waved past:** a player running `Grado_ChangingBase` with no overhaul
above it loses free water and gains nothing. The promise trades that away on purpose, because all
three overhaul packs inherit this one.

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
| **Status** | dropped 2026-09-22 (#8) |

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

**Ruled 2026-09-22 (#8): out** — the belt-tier layer leaves this pack rather than changing hands.
Four findings pointed the same way and only the last is decisive. It was the stalest member
(2024-12-31); it was unreachable (`factorio_version` **2.0** against a 2.1 floor); its tiers are
unserved by the pack's own loader mod; and **it fails the promise**, because five tiers past express
is precisely the ground `boblogistics` occupies, and `Grado_ABC`, `Grado_ABCX` and `Grado_ABCS` all
inherit this pack.

**`more-belts` was considered as the carrier and declined.** `Keeper317`, `0.4.1`,
`factorio_version` **2.1**, 2026-08-05, 4,056 downloads — nineteen months more current, reachable,
and its configurable per-tier speeds would have let the top tier be tuned under `miniloader-redux`'s
240 items/sec degradation threshold. But it declares `base >= 2.0` and nothing else, exactly as this
mod does: **no compatibility handling for `boblogistics` either**, so the loader gap persists and the
promise failure is unchanged. Swapping would have fixed reachability and staleness and left the
actual objection standing. If belt tiers are wanted later they are an overhaul-layer question, and
`more-belts` is the better carrier for it.

**This moots #38**, which existed to write a `#### Against the Space Age belt tier` subsection under
this entry for `Grado_ABCS`.

### `safefill`

| | |
|---|---|
| **Title** | Safe Waterfill |
| **Does** | Places water like landfill, in six water types, replacing only empty land — structures, vehicles, resources, cliffs, trees and the player all survive it. Blueprintable |
| **Latest** | `2.0.1`, `factorio_version` **2.0**, 2026-04-05 |
| **Downloads** | 36,265 |
| **Owner** | `anachrony` |
| **Read on** | 2026-09-21 |
| **Status** | replaced by `Waterfill_v17`, 2026-09-22 (#8) |

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

**Ruled 2026-09-22 (#8): replaced by `Waterfill_v17`** — and the swap answers a different question
from the one this entry asked. What decided it was reachability, not overhaul compatibility: this
mod declares `factorio_version: 2.0` and the portal does not serve it to a 2.1 game, which is the
only kind of game this pack can install on, so the member the entry was hedging about installs on
nothing. Under #8's third rule, unreachability breaks a tie in an entry already marked
`reconsider:`, and this is one of the two it touched.

**The question this entry raised is still open**, because it attaches to the feature rather than to
the mod. `Waterfill_v17` is also technology-unlocked; its author simply makes no claim about
overhauls either way, which is less evidence than `anachrony`'s explicit boundary, not better
evidence. This remains the entry to bring to the first load of `Grado_ABC`, under its successor's
name. The unverified feature delta — six water types, blueprintability, the survival guarantee — is
recorded under `Waterfill_v17` in *In the pack*.

## `bobinserters` sits in two packs

It was listed in `Grado_ChangingBase` and in `Grado_ABC`, the only mod ever named as a member of
two of the five dependency lists. `Grado_ABC` depends on `Grado_ChangingBase`, so one of the two
lines did nothing. This survey recommended which; `docs/mod-catalogue.md` put the disposal with #8
and #9 jointly. **#8 settled it on 2026-09-22 and the ruling is at the foot of this section**; the
mod is now named as a member of exactly one list.

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

**Ruled 2026-09-22 (#8): kept in `Grado_ChangingBase`, and the line removed from
`Grado_ABC/info.json`**, as recommended and for the reasons above. The direction was not close; what
needed settling was who applies it, since the edit lands in a file #9 owns. #8 made it, because
*"the duplication is gone"* is #8's own acceptance criterion and a ruling cannot satisfy it. The
removal is save-safe: every `Grado_ABC` install still resolves `bobinserters` through this pack.
`bobinserters` is now named in exactly one of the five dependency lists.

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

The ticket asks which members limit what can be layered above. The survey found **five of the
twenty-five**, in descending order of how likely they are to matter. **#8 then used this table as
the promise sweep** — "constrains an overhaul" and the promise's "competes with an overhaul for the
same ground" are close to the same test, and the promise had never been run against this pack's
members. Two of the five failed and are gone; one was replaced; two passed. The table is left as the
survey wrote it with each row's outcome appended, because a sweep that overwrites what it swept
cannot be audited.

The other twenty constrained nothing in the sense used here — they add a GUI, a shortcut, a display,
or an entity that no overhaul has an opinion about — which is not the same as costing nothing, and
the paragraph after the table is about four of them that do.

| Mod | What it constrains | Evidence | Promise sweep, 2026-09-22 (#8) |
|---|---|---|---|
| `safefill` | Tech-tree overhauls | Its own page claims compatibility only with "the base game or any mods that retain standard vanilla technologies", plus Nullius. Angel's and Bob's are neither | **replaced** by `Waterfill_v17` — on reachability, not on this; the question survives under the successor's name |
| `UltimateBeltsSpaceAge` | Belt progression | Five tiers past express with no compatibility handling at all, stacking onto `boblogistics`' own tiers, and unserved by the pack's loader mod | **fails — out.** Belt tiers past express are `boblogistics`' ground |
| `UltimateResearchQueue2` | Any other research queue | Three hard `!` incompatibilities: `sonaxaton-research-queue`, `UltimateResearchQueue`, `awesome-rqm`. A load failure, not a balance question | **passes** — a research queue adds no content, and the `!` mods are rival queues, not overhauls |
| `qol_research` | Tech-tree overhauls, mildly | Adds technologies; optional compatibility covers `space-exploration`, `nullius` and `Krastorio2`, but neither Bob's nor Angel's. Its flat-value setting is the escape hatch | **passes** — nothing in Angel's or Bob's grants player QoL bonuses, so there is no contested slot |
| `StoneWaterWell-ActuallyUpdated` | Water economies | Free water anywhere on land, with `pycoalprocessing` its only overhaul compatibility. Angel's builds a water-treatment chain that assumes water has a cost | **fails — out.** It removes the need for the chain that overhaul exists to build |

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

**One member joined this list after the survey was written and is not in the table**, because the
table records what the survey found: `cybersyn2` constrains nothing an overhaul does, but it sets
the pack's Factorio floor at `base >= 2.1.12` and every pack above inherits it. A floor is not a
compatibility constraint in the sense used here; it is recorded under the section below.

## The pack cannot load on the Factorio version it declares

*#43, 2026-09-24: this section reads each member's latest release, which is the 2.1 case. On stable
2.0.77 the pack resolves: each member's newest 2.0 release installs, and they satisfy each other.
The declared `base >= 2.0.0` is still not honoured - on that reading the floor is `>= 2.0.74`. See
`docs/porting-notes.md`, Resolves on stable 2.0.77.*

`info.json` declares `"factorio_version": "2.0"` and `base >= 2.0.0`. Most members require
`base >= 2.1`, so a player on 2.0.x cannot satisfy this pack. **#8's membership changes raised the
floor twice over**, to a number no pack in the project had reached:

| Floor | Members |
|---|---|
| `base >= 2.1.12` | `cybersyn2` — **added 2026-09-22 (#8)**, and the highest floor in the project until #15 found `kry_stdlib` `2.2.21` at `>= 2.1.20` (2026-09-23) |
| `base >= 2.1.8` | `WideChests` |
| `base >= 2.1.7` | `alien-biomes`, `miniloader-redux`, `textplates` |
| `base >= 2.1.0` / `>= 2.1` | `AdditionalPasteSettings`, `EditorExtensions`, `ModuleInserterEx`, `UltimateResearchQueue2`, `Waterfill_v17`, `bobinserters` |

Two more arrive indirectly: `WideChestsLogistic` requires `WideChests >= 6.3.0`, which is the release
that requires 2.1.8, and `alien-biomes`' mandatory `alien-biomes-graphics` requires 2.1.7 on its own
account. `cybersyn2` brings a third, `0-things`, which also requires 2.1.12.

**The survey's table read `>= 2.1.8` and named three LTN mods that are no longer members** -
`LogisticTrainNetwork` at `>= 2.1.7` and `LTN_Combinator_Modernized` and `LtnManager` at `>= 2.1`.
The fourth,
`LTN_Content_Reader_Updated`, was never in it, because a mod declaring `factorio_version: 2.0`
declares no 2.1 requirement to record - which is the other half of the same problem. It is
replaced above rather than annotated, because a floor table is a calculation over the current list
and an outdated one is simply wrong. The survey's finding — that the pack cannot load on the version
it declares — is unchanged and now larger.

**This is the same answer `Grado_NonChanging` reached on 2026-09-21, reached the same way**, and it
raises the floor rather than confirming it: that pack's highest requirement was `>= 2.1.7`, this one
now needs `>= 2.1.12`. Since `Grado_ChangingBase` depends on `Grado_NonChanging`, it inherits that
pack's floor too, so the effective minimum for anyone installing this pack is the higher of the two.

The mechanism is the members' own `base` requirements, not the `factorio_version` field — the field
declares which game version the pack is *for*, and Factorio will not install a mod whose
dependencies cannot resolve regardless of what it says. Two of the five packs had been checked when
this was written and both answered no. **All five have now been reached, on 2026-09-22**, and the
answer is no for four of them: `Grado_ABC` inherits this pack's floor, `Grado_ABCX` needs
`>= 2.1.9` on its own account, and `Grado_ABCS` cannot be measured from the portal at all because
its only member is not a portal mod. That measurement is **#15**, and **#8 changed its inputs on
2026-09-22**: `Grado_ABCX`'s own 2.1.9 is no longer the project high, because `Grado_ABC`,
`Grado_ABCX` and `Grado_ABCS` all now inherit `>= 2.1.12` through this pack. **Superseded
2026-09-23 by #15:** every pack now inherits `>= 2.1.20` on a latest-release reading, from the hidden
`kry_stdlib` `2.2.21`; see *Effective Factorio floor* in `docs/porting-notes.md`.
**The number to declare instead is Truls's to set** and is **#16**; this section supplies the
evidence for this pack, not the decision.

## What was not checked

Stated plainly so the gaps are not mistaken for clean results.

- **Nothing was loaded in Factorio.** No pack, no member mod, no combination. Every claim above is a
  portal or documentation reading. The 240-vs-270 items/sec arithmetic under
  `UltimateBeltsSpaceAge` was the clearest case: it followed from two mod pages and was never
  observed. That mod is now out, so the arithmetic is moot rather than resolved.
- **The overhaul-compatibility flags are readings of what authors claim**, not tests. `safefill`'s
  boundary was a sentence on its page; it may have worked fine under Angel's. The point of flagging
  it is that nobody has to guess in-game which member to suspect first. **#8's promise sweep ran on
  exactly these readings and nothing stronger**, which is worth saying plainly: two members were
  removed on what their authors claim and what Angel's and Bob's are known to do, not on a load.
- **`WideChestsAllTypes` and `WideChestsUnlimited` were not measured.** "Increases loading time" is
  quoted from the mods, and the size of the increase under Angel's and Bob's chest types is
  unmeasured and is the kind of thing only a load will tell.
- **Three of the six drops were not searched exhaustively by feature.** `PickerTweaks`' smaller tree
  collision, decoration removal and smoke removal were reasoned about rather than searched, because
  they are display preferences with no capability behind them.
- **The pipe clamps of `PickerPipeTools` have no successor found**, and unlike the other Picker
  features that is a genuine gap rather than an unfinished search.
- ~~**Whether `LTN_Content_Reader_Updated` works against LTN `3.2.1` is unknown.**~~ Moot: both are
  out as of 2026-09-22 (#8).
- ~~**Two mods were not re-examined for their `?`-to-mandatory change.**~~ Closed 2026-09-22 (#8,
  settling #11): both stay mandatory by decision, and `squeak-through-2` was confirmed the right
  replacement for `Squeak Through`.

Three gaps are new as of 2026-09-22 and belong to #8 rather than to the survey:

- **`cybersyn2` is author-declared alpha and nothing has been loaded.** "Known issues, bugs, missing
  features, and even the occasional crash" is the author's own description of the mod this pack now
  depends on for train logistics. No part of it has been observed running.
- **`Waterfill_v17`'s feature parity with `safefill` is unverified.** Six water types,
  blueprintability and the survival guarantee are claims made by the mod being replaced; the
  replacement's page documents an item-collision setting and tree handling. Nobody has compared them
  in game.
- **CS2's cross-surface behaviour for Space Age was not checked at all.** #23 checked CS1's and
  found it plausible; that reading does not transfer to a mod rewritten from the ground up, and it
  matters for `Grado_ABCS`.
