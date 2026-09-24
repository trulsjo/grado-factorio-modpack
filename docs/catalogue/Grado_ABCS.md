# Catalogue: `Grado_ABCS`

`Grado_ABC` plus the Space Age expansion. The pack holds **one member**, `space-age`, and it is the
only member of any of the five packs that is not a mod on the portal — it is part of the game, sold
as a DLC and installed with it. That makes this the one pack whose contents cannot be verified by
the method every other entry in this catalogue uses.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-22** and is reproduced from the fetched data rather than retyped, except the one
re-read on 2026-09-23 (#10), which carries its own date, and *Candidates, not members*, read
2026-09-24 (#31).

The dependency list holds 3 entries: `base >= 2.0.0`, `Grado_ABC` — a pack, catalogued in
`docs/catalogue/Grado_ABC.md` — and `space-age`. **The pack is new**, so nothing was carried over,
replaced or dropped; `docs/porting-notes.md` records that. *The `base` line is `base >= 2.0.74`
since 2026-09-24 (#58).*

Three findings:

- **`space-age` is not a portal mod, and the portal entry of that name is a reserved placeholder.**
  Querying it returns a deprecated 1.1 stub owned by `compilatron`, titled `[reserved]`, with 276
  downloads — the same shape as the reserved `base` entry. The dependency resolves against the
  installed expansion, not a download. See *What the portal actually returns*.
- **Nothing in the chain blocks this branch, and nothing in it requires the expansion either.**
  Checked across all 117 mods in the chain's closure — 98 distinct named members of the three lower
  packs and 19 hidden mandatory dependencies: no `! space-age` anywhere, and no mandatory
  `space-age` anywhere. **Seventeen declare it *optionally***, eleven of them `Grado_ABC` members.
  Silence is not compatibility, and this pack is where that gets tested. *Superseded 2026-09-22 by
  #7 and #8 and 2026-09-23 by #9, which changed the three lower lists to 87 named members.
  Re-read 2026-09-24 (#61) for those 87, latest release each: still no `! space-age` and no
  mandatory `space-age`; sixteen declare it optionally, ten of them `Grado_ABC` members. The
  hidden members were not re-read.*
- **This is where the one-mod-per-branch rule is under real pressure.** Adding `space-age` enables
  the expansion beside Angel's and Bob's; it does not make them work together. The two mods on 2.x
  that attempt that job would each be a second addition, and one of them brings eight more mods with
  it. See *Pressure on the one-mod-per-branch rule*. *Eight it names, eighteen once theirs are
  counted: resolved 2026-09-24 (#31), under* Candidates, not members.

## In the pack

### `space-age`

| | |
|---|---|
| **Title** | `[reserved]` on the portal; **Factorio: Space Age** as sold |
| **Does** | The official expansion: the rocket becomes interplanetary travel, adding four planets with their own resources, recipes and threats, space platforms built and flown between them, and a new tier of belts, along with quality and elevated rails as separate shipped mods |
| **Latest** | Not published as a portal release. The portal entry's only release is `1.1.0`, `factorio_version` **1.1**, 2023-08-25 — a placeholder, not the expansion |
| **Downloads** | 276, which is the placeholder's count and says nothing about the expansion |
| **Owner** | `compilatron` |
| **Overlaps** | `SpaceModFeorasFork` (`Grado_ABCX`); ~~`UltimateBeltsSpaceAge` (`Grado_ChangingBase`)~~ - resolved 2026-09-22 (#8), that mod is in no pack |
| **Read on** | 2026-09-22 |

**Alternatives considered.** None is possible. `space-age` is the official expansion; no mod
replaces it, and nothing on the portal claims to. The search that matters for this pack is not for a
replacement but for the integration layer between the expansion and the overhaul beneath it, and
that search is under *Pressure on the one-mod-per-branch rule* below rather than here, because what
it found is not a substitute for this member — it is a candidate second member.

**Recommendation: keep.** It is what the pack is. The recommendation is forced and the entry is not
the interesting part of this file.

**Ruled 2026-09-23 (#10): kept, as the pack's only member.** The pack is `Grado_ABC` beside Space
Age, not integrated with it (`CONTEXT.md`, *Promise*), so no bridge was added; the reasons are under
*Pressure on the one-mod-per-branch rule* below.

**Every row above is degraded evidence and should be read as such.** The **Latest**, **Downloads**
and **Owner** rows describe the placeholder, not the expansion; **Does** is a description of the
product rather than a reading of an `info_json`. No other entry in this catalogue has that problem.

#### What the portal actually returns

`https://mods.factorio.com/api/mods/space-age/full`, read 2026-09-22:

| Field | Value |
|---|---|
| `title` | `[reserved]` |
| `summary` | `[reserved]` |
| `owner` | `compilatron` |
| `category` | `internal` |
| `deprecated` | `true` |
| `created_at` | 2023-08-25 |
| `downloads_count` | 276 |
| `source_url` | `https://factorio.com/blog/post/fff-373` |
| releases | one: `1.1.0`, `factorio_version` 1.1, dependencies `["base >= 1.1.0"]` |

It is a name reservation, made on the day of the FFF that its `source_url` points at, so that nobody
else could take `space-age` before the expansion shipped. `base` is reserved the same way by the same
owner, and `quality` too; `elevated-rails` is reserved by `Quezler` rather than by the same account,
which is a curiosity rather than a fact this pack depends on.

**What follows for the catalogue.** `CLAUDE.md`'s evidence rules are built on the portal API, and
for this one member they return nothing usable. Three things the other 100-odd entries state as read
cannot be stated here at all: the expansion's own dependency list, its `factorio_version`, and its
`base` floor. They are readable from `data/space-age/info.json` in an installed game and from
nowhere else this project currently has. *(Partly read 2026-09-23, #10: the installed game's
`2.0.77` build is read below. A 2.1 build is not.)* **Issue #29 — load `Grado_ABCS` in Factorio
once, end to end — is not merely the last check on this pack; it is the first check on its only
member.**

One consequence is worth naming rather than leaving implicit. Space Age ships as three mods, not
one: `space-age`, `quality` and `elevated-rails` are distinct names, which the portal's three
separate reservations confirm and which `angelbob-spaceage-rebalance` demonstrates by declaring all
three as mandatory dependencies. Whether `space-age` alone pulls the other two in cannot be answered
from the portal.

**It can from the game, and it does.** `data/space-age/info.json` in the installed game, version
`2.0.77`, read 2026-09-23, declares `base >= 2.0.0`, `elevated-rails >= 2.0.0` and
`quality >= 2.0.0`, with `factorio_version` `2.0`. So the other two are hidden mandatory dependencies
of this member, the same shape as the ones `docs/catalogue/Grado_ABC.md` found, and #10 ruled not to
name them in the pack's list. This is a reading of 2.0.77; a 2.1 build was not available to read.

#### Against `SpaceModFeorasFork`

The comparison is written in `docs/catalogue/Grado_ABCX.md`, under *Against `space-age`*. The two
packs sit on the same layer with no lower one between them, so under `docs/mod-catalogue.md` the one
survey covering both writes it once and points at it from the other side; #6 reached the fork first.

The short of it: both are the end-game after the rocket, they overlap completely rather than
partially, and the overlap is the branch point rather than a duplication anyone should resolve.

#### ~~Against `UltimateBeltsSpaceAge`~~ — resolved 2026-09-22 (#8)

**`Grado_ChangingBase` no longer carries `UltimateBeltsSpaceAge`, so this overlap does not exist.**
#8 removed the belt-tier layer from that pack on 2026-09-22, and the three-way pile-up this
subsection was written to describe is part of why: five tiers past express, stacking onto
`boblogistics`' own tiers with no compatibility handling on any side, is content competing with an
overhaul for the same ground, which `Grado_ChangingBase`'s promise forbids.

**What survives on this branch is a tier adjacency rather than a recorded overlap**: Space Age adds
one tier past express and `boblogistics` adds its own, and `miniloader-redux` serves both — its own
page says "three tiers in the base game ("Vanilla", Fast and Express) and four when playing Space
Age (adds Turbo mode)", and it declares optional support for `boblogistics`. Nothing is duplicated
in the sense *Two kinds of duplication* uses, so no **Overlaps** row is added and the live tally
stays at three. The tier that could not be served was the one that left.

**Issue #38 is moot** and was closed with the reason. It existed to write this subsection under the
`UltimateBeltsSpaceAge` entry in `docs/catalogue/Grado_ChangingBase.md`, and that entry is now under
*Ruled out after the port*.

## Dropped during the port

**None, and the section cannot have entries.** `Grado_ABCS` did not exist in 1.1, so there is no 1.1
list for anything to be dropped from; `docs/porting-notes.md` records the pack as new. This is a
different claim from `Grado_ABCX`'s empty section, which is a 1.1 pack that dropped nothing.

## Candidates, not members

The two mods that attempt the bridge *Pressure on the one-mod-per-branch rule* describes, assessed
by #31. **Neither is a member, and nothing here changes that**: #10 ruled on 2026-09-23 that the
pack is `Grado_ABC` *beside* Space Age, and #31 is where that is revisited. Every reading in this
section was taken on **2026-09-24**. A closure is what `resolve-modpack.ps1` picks on line `2.0`,
build `2.0.77`, for a copy of the chain with the one candidate added to this pack's list.

### `angelbob-spaceage-rebalance`

| | |
|---|---|
| **Title** | AngelBob Space Age Rebalance |
| **Does** | Merges Angel's and Bob's progression with Space Age: Nauvis stays Angel's and Bob's, and each planet - the expansion's four, plus Muluna, Paracelsin, Arig, Hyarion and optionally Maraxsis - becomes a specialised industrial layer on top of it |
| **Latest** | `1.2.17`, `factorio_version` **2.1**, 2026-09-22. The 2.0 line is kept in parallel: `1.1.42`, `factorio_version` **2.0**, the same day, which is what a 2.0.77 game installs |
| **Downloads** | 3,746 |
| **Owner** | `Troublesim` |
| **Status** | candidate, not a member (#31) |
| **Read on** | 2026-09-24 |

72 releases since 2026-05-19, 54 on the 2.0 line and 18 on 2.1. No source repository is linked,
so everything below is from its `info_json` and its description, not its code.

**What it requires from `Grado_ABC`: nothing the chain lacks.** On `1.1.42` that is
`angelsbioprocessing`, `angelspetrochem`, `angelsrefining`, `angelssmelting` and their four
graphics packages, `bobassembly`, `boblibrary`, `boblogistics`, `bobmodules`, `bobplates`,
`bobpower`, `bobrevamp`, `bobtech` and `flib`, all at minimums the chain's picks meet. It also
names `space-age`, `quality` and `elevated-rails` at `>= 2.0.76`, which the installed game
supplies.

**What it requires from outside the chain: eighteen mods, not the eight recorded above.** The
eight it names pull in ten more of their own. Nine of those ten are ones it lists itself as
*optional*, so its own dependency list understates what a player installs:

| Mod | Pulled in by | Picked on 2.0.77 | Latest | Downloads | Owner |
|---|---|---|---|---|---|
| `PlanetsLib` | this mod, `Paracelsin`, `planet-muluna`, `planetaris-arig`, `planetaris-hyarion` | `1.18.0`, 2026-05-31 | `1.26.7`, 2.1, 2026-09-21 | 118,747 | `thesixthroc` |
| `Paracelsin` | this mod | `1.7.7`, 2026-06-05 | `1.10.3`, 2.1, 2026-09-22 | 42,399 | `AndreusAxolotl` |
| `Paracelsin-Graphics` | this mod, `Paracelsin` | `1.7.7`, 2026-06-05 | `1.10.0`, 2.1, 2026-08-18 | 42,453 | `AndreusAxolotl` |
| `planet-muluna` | this mod | `2.2.107`, 2026-08-13 | `2.7.27`, 2.1, 2026-09-23 | 60,666 | `MeteorSwarm` |
| `muluna-graphics` | this mod, `planet-muluna` | `1.1.6`, 2026-06-23 | `1.1.17`, 2.1, 2026-08-24 | 58,701 | `MeteorSwarm` |
| `planetaris-dyes` | this mod | `1.0.5`, 2026-06-24 | `1.0.6`, 2.1, 2026-07-15 | 19,969 | `Syen_ce` |
| `planetaris-arig` | this mod | `1.1.46`, 2026-08-16 | `1.1.46`, 2.0, 2026-08-16 | 30,253 | `Syen_ce` |
| `planetaris-hyarion` | this mod | `1.3.22`, 2026-09-16 | `1.3.23`, 2.1, 2026-09-16 | 25,887 | `Syen_ce` |
| `Accumulator-V2` | `Paracelsin` | `1.0.7`, 2026-04-30 | `1.0.8`, 2.1, 2026-06-23 | 52,082 | `Sacredanarchy` |
| `SolarMatrix` | `Paracelsin` | `1.0.8`, 2026-05-26 | `1.0.9`, 2.1, 2026-06-23 | 51,382 | `Sacredanarchy` |
| `elevated-pipes` | `Paracelsin` | `1.4.7`, 2026-01-08 | `1.5.0`, 2.1, 2026-07-13 | 60,477 | `Redotix99` |
| `enhanced-shadows` | `planet-muluna` | `1.0.5`, 2026-06-02 | `1.0.6`, 2.1, 2026-06-23 | 60,346 | `MeteorSwarm` |
| `muluna-utility-constants` | `planet-muluna` | `1.0.2`, 2026-06-02 | `1.0.2`, 2.0, 2026-06-02 | 57,433 | `MeteorSwarm` |
| `space-exploration-graphics` | `planet-muluna` | `0.7.5`, 2025-09-22 | `0.7.7`, 2.1, 2026-08-07 | 545,591 | `Earendel` |
| `space-exploration-graphics-4` | `planet-muluna` | `0.7.2`, 2025-09-22 | `0.7.3`, 2.1, 2026-06-28 | 535,244 | `Earendel` |
| `tile-upgrade-planner-muluna` | `planet-muluna` | `1.0.6`, 2025-12-08 | `1.0.9`, 2.1, 2026-08-12 | 60,166 | `MeteorSwarm` |
| `condensing-agricultural-tower` | `planetaris-arig` | `1.1.1`, 2026-02-24 | `1.1.2`, 2.1, 2026-07-15 | 31,552 | `Syen_ce` |
| `lamp-post` | `planetaris-hyarion` | `1.0.5`, 2026-09-05 | `1.0.6`, 2.1, 2026-09-05 | 22,399 | `Syen_ce` |

The first eight are the ones this mod names; the last ten arrive through them. `muluna-utility-constants` is the one
of the ten it does not list at all. None of the eighteen was assessed as a mod - each would need an
entry of its own if the pack took them, and several of the ten are buildings or content in their
own right, by their titles. **With it, this pack's closure is 122 mods against 103 without**, and
the pack's effective floor rises from `base >= 2.0.74` (`miniloader-redux`) to **`>= 2.0.76`**,
set by this mod itself. The resolve found every member and no constraint violated.

**Does `Grado_ABC` need any change to accommodate it? No.** With it added, no pick anywhere in the
lower closure moved version, no constraint between the picks was violated, and every requirement it
places on the ABC side is already met. **25 of its 52 optional dependencies are already in the
chain's closure**, and the resolve checked each range. Twenty are named members: `alien-biomes`,
`angelsaddons-cab`, `angelsaddons-mobility`, `angelsaddons-storage`, `angelsinfiniteores`,
`bobenemies`, `bobequipment`, `bobgreenhouse`, `bobinserters`, `bobmining`, `bobores`,
`bobvehicleequipment`, `bobwarfare`, `DiscoScience`, `FNEI`, `helmod`, `RateCalculator`,
`reskins-angels`, `reskins-bobs` and `Todo-List`. Five are hidden: the three
`angelsaddons-mobility-graphics-*` packages, `alien-biomes-graphics` and `reskins-library`. What it would
change is this pack, not the one below.

**What was not measured.** The 2.1 line: `1.2.17` names the same eight at higher minimums
(`Paracelsin >= 1.9.2`, `PlanetsLib >= 1.21.3` among them), but the chain does not resolve on a
2.1 target yet, so its 2.1 closure is unread. Whether it loads beside the chain is #29's kind of
question, and it has not been asked. `rso-mod`, an ABC member that controls ore placement, was not
checked against a mod that redistributes ores across planets.

**Alternatives considered.** `BobsAngelsSpaceAge`, below, which this mod declares incompatible
(`! BobsAngelsSpaceAge >= 0.0.3`), and doing nothing, which #10 chose. No third bridge was found;
#6's search and #4's before it are the ones behind that claim, not a new one.

**Recommendation: reconsider:** whether this pack should carry a bridge at all, once #29 shows
whether the unintegrated pack plays - and only together with the promise, which a bridge fails.
#10's ruling stands until then. If the bridge is ever wanted, this is
the stronger mod by every measure taken: current on both lines within two days of this reading, 72
releases, nearly fifteen times the other's downloads. Its cost is eighteen third-party mods, most of them
planets and planet content. How it pushes on the one-mod-per-branch rule depends on what the rule
counts. Named the way #10 named `quality` and `elevated-rails` - hidden mandatory members stay
unnamed - the pack would list two members. Counted by what a player installs, it adds nineteen.
Which reading the rule means is Truls's.

### `BobsAngelsSpaceAge`

| | |
|---|---|
| **Title** | Bobs Angels Space Age Strategic |
| **Does** | Adds Angel's six ores - saphirite, stiratite, rubyte, jivolite, bobmonium, crotinnium - to the map generation of Vulcanus, Fulgora and Gleba, split so that no one planet has all of them. By its own description, Nauvis keeps enough to reach a rocket and a first platform |
| **Latest** | `0.0.3`, `factorio_version` **2.0**, 2026-02-10 |
| **Downloads** | 253 |
| **Owner** | `mantrucker88` |
| **Status** | candidate, not a member (#31) |
| **Read on** | 2026-09-24 |

Two releases, `0.0.2` and `0.0.3`, both on 2026-02-10, the day the mod was created. The summary and
description are in German; the **Does** row is a translation of the description. There is no
source link and no homepage.

**What it requires: nothing the chain lacks.** Its whole list is `base >= 2.0.0`, `space-age`,
`angelsrefining` and `bobplates`, and the last two are `Grado_ABC` members. With it added, this
pack's closure is 104 mods against 103 - itself - and the floor stays `base >= 2.0.74`. No
constraint was violated. Its description asks for "Bob's Ores / Plates", but only `bobplates` is
declared.

**Does `Grado_ABC` need any change to accommodate it? No,** on the same resolve. It touches map
generation, so the ABC members that also do - `rso-mod` and `angelsinfiniteores` - are where a
conflict would show, and nothing here checks that. Only a load would.

**What was not measured.** Whether it works: no source to read, no load, and a mod seven months
without a release written against a 2.0 that has since moved. It declares no 2.1 release, so it
would strand this pack at a 2.1 target the way #16's watch list describes.

**Alternatives considered.** `angelbob-spaceage-rebalance`, above, which excludes it, and doing
nothing.

**Recommendation: reconsider:** this mod as the bridge, only if a bridge is wanted and the heavier
mod's eighteen extras are not. It is the one bridge that keeps the rule by any count: one member,
no extras. Doing nothing keeps it too.
Against it: 253 downloads, `0.0.x`, two releases on one day and none since, no source, 2.0 only,
and a narrower job - it moves ores between planets rather than merging the two progressions. The
`!` is the other mod's declaration, not this one's; this mod declares nothing about it.

## Pressure on the one-mod-per-branch rule

`CLAUDE.md` says anything both branches need lives in `Grado_ABC` and each branch adds exactly one
thing. #6 was asked to report pressure on that rule, not resolve it. **This is where it is under
pressure, and the pressure is real.**

**The gap.** Adding `space-age` makes the expansion load beside Angel's and Bob's. It does not make
them one game. Issue #4 established the load-order half of this on 2026-09-21 — nothing in
`Grado_ABC`'s members or their hidden dependencies declares `! space-age`, and ten of the Bob's mods
declare it optionally — and this survey extends that check to the whole chain with the same result.
It also refines the count: **seventeen of the 117 declare `space-age` optionally, and eleven of the
seventeen are `Grado_ABC` members, not ten.** *(All three figures predate #9, which on 2026-09-23
removed `deadlock-beltboxes-loaders` and three other members and added one: after it the
`space-age`-optional counts are sixteen and ten, and the 117 is not re-derived.)* The eleventh is
`deadlock-beltboxes-loaders`, which is not a Bob's mod and so fell outside the frame #4 counted in; the remaining six are
`Grado_ChangingBase`'s `EditorExtensions`, `StoneWaterWell-ActuallyUpdated`, `alien-biomes`,
`reverse-factory` and `underground-pipe-pack`, and `Grado_NonChanging`'s `FactorySearch`. *(Read
2026-09-22, before #8 changed that pack the same day: `StoneWaterWell-ActuallyUpdated` is no longer
a member, and the incoming `cybersyn2` and `Waterfill_v17` were not in the frame. The count is left
as measured; re-deriving it needs a ticket nobody has filed.)* But an
overhaul that replaces the ore-to-plate chain and an expansion that adds four planets with
their own ores are not integrated by resolving; they are integrated by somebody writing the bridge.
`Grado_ABCX` has no equivalent gap, because the fork declares direct Bob's integration and is
designed to sit on Nauvis.

**Two mods on 2.x attempt the bridge, and they are mutually exclusive.** Both were read 2026-09-22;
`angelbob-spaceage-rebalance` was re-read at `1.2.17` on 2026-09-23 with its mandatory list
unchanged.

| | `angelbob-spaceage-rebalance` | `BobsAngelsSpaceAge` |
|---|---|---|
| **Title** | AngelBob Space Age Rebalance | Bobs Angels Space Age Strategic |
| **Owner** | `Troublesim` | `mantrucker88` |
| **Latest** | `1.2.16`, `factorio_version` **2.1**, 2026-09-19; re-read at `1.2.17` on 2026-09-23, mandatory list unchanged | `0.0.3`, `factorio_version` **2.0**, 2026-02-10 |
| **Downloads** | 3,706 | 251 |
| **Mandatory deps the chain does not already supply** | **eight**: `PlanetsLib`, `Paracelsin`, `Paracelsin-Graphics`, `planet-muluna`, `muluna-graphics`, `planetaris-dyes`, `planetaris-arig`, `planetaris-hyarion`. *Ten until 2026-09-23 (#10), counting `quality` and `elevated-rails`, which `space-age` turned out to pull in itself* | **none** |
| **Approach** | A full integration overhaul merging Angel's and Bob's with Space Age across a set of community planets | Distributes Bob's and Angel's ores across Vulcanus, Fulgora and Gleba to force interplanetary logistics |

`angelbob-spaceage-rebalance` declares `! BobsAngelsSpaceAge`, so the choice is genuinely between
them and not a question of adding both. It is already filed as issue **#31** with the full reading;
what this survey adds to that issue is the second candidate, which #31 does not have, and the
mandatory-dependency count that makes the cost concrete.

**Superseded 2026-09-24 by #31: the count was the mods it names, not the mods it brings.** The eight
pull in ten more of their own, so on the 2.0 line it adds eighteen mods besides itself, and the
closure grows from 103 to 122. Each is read, with the mod that pulls it in, under *Candidates, not
members*, which also holds both mods' own entries. The table and bullets here are left as #6 read
them.

**How each one pushes on the rule, stated without resolving it:**

- **`angelbob-spaceage-rebalance` breaks the rule outright.** It is the more serious mod by every
  measure — current within three days of this reading, fifteen times the downloads, on 2.1 — and it
  is not a one-mod addition. Its eight mandatory extras, plus itself and `space-age`, would make
  `Grado_ABCS` a **ten-member pack** against `Grado_ABCX`'s one. Seven of the eight are community
  planet content and its graphics, the eighth, `PlanetsLib`, is the library they share, and those are
  content decisions nobody has taken. *(Ten extras and twelve members until 2026-09-23 (#10), when
  the game showed that `space-age` pulls in `quality` and `elevated-rails` itself.)* It also requires
  `angelsbioprocessing`, `angelspetrochem`,
  `angelsrefining`, `angelssmelting` and seven Bob's mods at specific minimum versions, all of which
  `Grado_ABC` already carries, so the ABC side costs nothing extra.
- **`BobsAngelsSpaceAge` fits the rule and is much weaker evidence.** Its whole mandatory list is
  `base >= 2.0.0`, `space-age`, `angelsrefining` and `bobplates`, the last two already ABC members,
  so it would be a genuine second-and-final addition. Against that: 251 downloads, seven months since
  its last release, still on `factorio_version` 2.0, a version number that starts with `0.0`, and a
  summary written in German. It does a narrower job — redistributing ores across three planets, not
  merging the two progressions.
- **Doing nothing is also an option and is not obviously wrong.** `Grado_ABCS` as it stands is a
  playable claim — Angel's and Bob's on Nauvis, the expansion's planets beside them, unintegrated —
  and whether that is the pack Truls wants is exactly the kind of question `CLAUDE.md` reserves.

**Nothing here is decided.** Which of the three, and whether the one-mod-per-branch rule bends or
holds, is pack membership, which is Truls's under `CLAUDE.md` and belongs to issues #10 and #31.
What this survey settles is that the rule cannot be assumed to hold on this branch merely because it
holds on the other.

**Decided 2026-09-23 (#10): doing nothing.** The rule holds on this branch. The pack's promise makes
it `Grado_ABC` beside Space Age rather than merged with it, and a mod whose job is to merge them
fails that promise, whichever of the two it is. #31 stays open as the place to revisit that, best
after #29 shows whether the unintegrated pack is playable; taking a bridge would mean changing the
promise first.
