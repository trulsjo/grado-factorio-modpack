# Catalogue: `Grado_ABCS`

`Grado_ABC` plus the Space Age expansion. The pack holds **one member**, `space-age`, and it is the
only member of any of the five packs that is not a mod on the portal — it is part of the game, sold
as a DLC and installed with it. That makes this the one pack whose contents cannot be verified by
the method every other entry in this catalogue uses. *Measured 2026-10-04 (#118), by the other
method: the pack loaded on Factorio 2.0.77 with Space Age, 104 mods validated beside `space-age`,
`quality` and `elevated-rails`, all `2.0.77`. A load, not a play session. See
`docs/loads/Grado_ABCS-2026-10-04.md`.*

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-22** and is reproduced from the fetched data rather than retyped, except the one
re-read on 2026-09-23 (#10), which carries its own date, *Candidates, not members*, read
2026-09-24 (#31), and the notes dated 2026-09-24 (#58) and (#61), which those two took, and the notes dated
2026-10-01 (#44, #83), which #83 took over the union of both portal listings as read that day, and
the entries for `angels_space_age_galore` and `industrial-worlds` and the notes dated 2026-10-01
(#91), which #91 took, and the notes dated 2026-10-04 (#118), which #118 took from the pack's
recorded load, and the section dated 2026-10-04 (#128), which #128 took from data dumps, and the
sections dated 2026-10-05 (#132), (#133) and (#134), which those three took from data dumps,
#133 from `rso-mod`'s staged source as well and #134 from the staged source of the Bob's and
Angel's members.

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
  Silence is not compatibility, and this pack is where that gets tested. *Tested as a load
  2026-10-04 (#118): the chain loads beside Space Age with no error from the game, which is still not
  compatibility in play.* *Superseded 2026-09-22 by
  #7 and #8 and 2026-09-23 by #9, which changed the three lower lists to 87 named members.
  Re-read 2026-09-24 (#61) for those 87, latest release each: still no `! space-age` and no
  mandatory `space-age`; sixteen declare it optionally, ten of them `Grado_ABC` members. The
  hidden members were not re-read.*
- **This is where the one-mod-per-branch rule is under real pressure.** Adding `space-age` enables
  the expansion beside Angel's and Bob's; it does not make them work together. The two mods on 2.x
  that attempt that job, both assessed by #31, would each be a second addition, and one of them,
  `angelbob-spaceage-rebalance`, brings eight more mods with it. *Two more, served at 2.1 only and
  not assessed, were found 2026-10-01 (#83).* See *Pressure on the one-mod-per-branch rule*.
  *Eight it names, eighteen once theirs are
  counted: resolved 2026-09-24 (#31), under* Candidates, not members. *The two found by #83 were
  assessed 2026-10-01 (#91), so the finding covers four bridges: `angels_space_age_galore` brings
  four more mods and cannot be installed beside `Grado_ABC` at all, and `industrial-worlds`
  brings two.*

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
member.** *Measured 2026-10-04 (#118): that first check is made, as a load. The installed
`space-age` `2.0.77` loaded beside the whole chain with no error from the game; members' own log
complaints are in the record. Its dependency list, line and floor are still the 2026-09-23 reading
below, and the game has now confirmed the `quality` and `elevated-rails` lines. The 2.1 build is still unread, and the play session is still #29's.*

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

**Measured in the game 2026-10-04 (#118): required, and a disabled one is refused, not switched
on.** With
`space-age` enabled and the other two written as disabled, Factorio 2.0.77 refuses: "Missing
required dependency elevated-rails >= 2.0.0" and "Missing required dependency quality >= 2.0.0".
The recorded load had all three enabled, because the load harness follows `space-age`'s
dependencies when it writes the mod list. So "pulls the other two in" is true of the requirement
and of the harness, and not of the game enabling a disabled mod. Left out of the mod list rather
than disabled, the game does enable them: #59's start saw that on 2026-09-24, and it was not re-run.
The message and the three observations are in `docs/loads/Grado_ABCS-2026-10-04.md`.

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

The four mods that attempt the bridge *Pressure on the one-mod-per-branch rule* describes. #31
assessed the first two; #91 assessed the two #83 found in the 2.1 listing alone on 2026-10-01.
**None is a member, and nothing here changes that**: #10 ruled on 2026-09-23 that the pack is
`Grado_ABC` *beside* Space Age, and #31 is where that is revisited.

The first two entries were read on **2026-09-24**, and there a closure is what
`resolve-modpack.ps1` picks on line `2.0`, build `2.0.77`, for a copy of the chain with the one
candidate added to this pack's list. The last two were read on **2026-10-01**, and that method
cannot be used for them: neither has a release declaring 2.0, so the resolver has nothing to pick
on line `2.0`. Their closures were walked by hand instead, over each mod's latest release: every
dependency without a prefix or with `~`, recursively, with `base`, `space-age`, `quality` and
`elevated-rails` taken as game mods. *The chain* in those two entries is the same walk over the 87
portal mods the four lists name - `space-age` aside, the members of the three lower packs - which
reaches 20 mods no list names, 107 in all. That is a
latest-release reading, so it is not the same set as #31's 2.0.77 closure.

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
#6's search and #4's before it are the ones behind that claim, not a new one. *Two more were found
2026-10-01 (#83) in the 2.1 listing alone and are assessed below (#91). `industrial-worlds`
declares `! angelbob-spaceage-rebalance`; this mod declares nothing about either.*

**Recommendation: reconsider:** whether this pack should carry a bridge at all, once #29 shows
whether the unintegrated pack plays - and only together with the promise, which a bridge fails.
#10's ruling stands until then. If the bridge is ever wanted, this is
the stronger mod by every measure taken: current on both lines within two days of this reading, 72
releases, nearly fifteen times the other's downloads. Its cost is eighteen third-party mods, most of them
planets and planet content. How it pushes on the one-mod-per-branch rule depends on what the rule
counts. Named the way #10 named `quality` and `elevated-rails` - hidden mandatory members stay
unnamed - the pack would list two members, `space-age` and this mod, with the eighteen unnamed.
Counted by what a player installs, it adds nineteen.
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
nothing. *Since 2026-10-01 (#91), also `angels_space_age_galore` and `industrial-worlds`, below;
the second excludes this mod too (`! BobsAngelsSpaceAge`).*

**Recommendation: reconsider:** this mod as the bridge, only if a bridge is wanted and the heavier
mod's eighteen extras are not. It is the one bridge that keeps the rule by any count: one member,
no extras. Doing nothing keeps it too.
Against it: 253 downloads, `0.0.x`, two releases on one day and none since, no source, 2.0 only,
and a narrower job - it moves ores between planets rather than merging the two progressions. The
`!` is the other mod's declaration, not this one's; this mod declares nothing about it.

### `angels_space_age_galore`

| | |
|---|---|
| **Title** | Angel's+Space Age Galore |
| **Does** | A light overhaul, by its summary, that integrates Angel's four core mods with Space Age, designed without Bob's mods |
| **Latest** | `0.9.0`, `factorio_version` **2.1**, 2026-09-30, its only release. Nothing declares 2.0, so a 2.0.77 game is not served it |
| **Downloads** | 9 |
| **Owner** | `JTnadrooi` |
| **Status** | candidate, not a member (#91) |
| **Read on** | 2026-10-01 |

It is built on the author's modified Angel's Special Vanilla from `angels_galore` and requires
three of the author's other Galore mods and the author's library. Its description says it leaves
out Angel's eight extra metals. Created 2026-09-30, the day of its one release. A source repository is linked,
`https://github.com/JTnadrooi/Project-Galore`, and was not read, so everything below is from the
`info_json` of each mod and this mod's description.

**What it requires from the chain.** It names three dependencies: `base >= 2.0`,
`space_age_galore` and `angels_galore`. Through `angels_galore` it requires `angelsbioprocessing`,
`angelspetrochem`, `angelsrefining` and `angelssmelting`, all four named `Grado_ABC` members, with
no version floor, and through them their four graphics packages, which are hidden members. Through
`space_age_galore` it requires `space-age`, which the game supplies.

**What it requires from outside the chain: four mods besides itself,** all by the same owner and all
from the same repository:

| Mod | Pulled in by | Latest | Releases declaring 2.0 | Downloads | Owner |
|---|---|---|---|---|---|
| `angels_galore` | this mod | `1.3.1`, 2.1, 2026-09-30 | 8 of 18, the last `1.1.4`, 2026-06-14 | 431 | `JTnadrooi` |
| `space_age_galore` | this mod | `1.6.11`, 2.1, 2026-09-26 | 44 of 52, the last `1.6.3`, 2026-06-14 | 6,890 | `JTnadrooi` |
| `vanilla_galore_continued` | `angels_galore`, `space_age_galore` | `1.4.8`, 2.1, 2026-09-15 | 44 of 50, the last `1.4.2`, 2026-06-14 | 7,631 | `JTnadrooi` |
| `galore_lib` | `vanilla_galore_continued` | `2.5.2`, 2.1, 2026-09-27 | 22 of 31, the last `2.2.0`, 2026-06-14 | 9,420 | `JTnadrooi` |

So the closure is thirteen mods besides the game's: these five, and eight already in the chain.
The mod itself declares no optional dependencies. `angels_galore` declares eleven, and eight of them
are named members of the chain: `reskins-angels`, `angelsaddons-mobility`, `angelsaddons-storage`,
`angelsaddons-cab`, `angelsinfiniteores`, `bobmodules`, `boblogistics` and `DiscoScience`.

**`!` conflicts: six, all against named `Grado_ABC` members, and they decide it.** `angels_galore`
`1.3.1` declares `! bobores`, `! bobassembly`, `! bobelectronics`, `! bobtech`, `! bobrevamp` and
`! extendedangels`, with no version ranges, and all six are in `Grado_ABC/info.json`. It is not a
latest-release accident: all 18 releases of `angels_galore` declare `! bobores`, and every release
from `1.1.0` (2026-05-19) on declares all six. This mod requires `angels_galore` at no minimum, so
no release of either can be installed beside `Grado_ABC`. No mod in the chain declares `!` against
any of the five. The description gives the reason in its own words: "ASAGAL's lack of Bob's mods
has allowed me to make it very stable and compatible with other mods."

**Reachability.** Not served on the declared 2.0 line: its one release declares 2.1. The four it
pulls in each have 2.0 releases, but the mod that needs them does not. On a 2.1 line it would be
served and would still be blocked by the six `!`s.

**Against the promise: it fails twice.** Its job is the merge the promise rules out - "near-perfect
integration into Space Age", by its description. And it is Angel's without Bob's, so even a promise
that allowed a merge would not admit a bridge that excludes half of `Grado_ABC`.

**Does `Grado_ABC` need any change to accommodate it? It would need six members removed** - five
Bob's mods and `extendedangels` - from the pack both branches share, which is `Grado_ABC`'s
membership, settled by #9, and not a question this pack can raise.

**What was not measured.** No load, no read of the source, and nothing about how it plays. Its
description says Aquilo content "has not yet been completely implemented".

**Alternatives considered.** The other three bridges in this section, and doing nothing.
`angels_galore`, which its page names as the version without Space Age, is not a bridge.

**Recommendation: do not add.** It cannot be installed beside `Grado_ABC` on any release, because
the mod it requires declares `!` against six of `Grado_ABC`'s members, and its job is the merge the
promise rules out. Neither reason depends on the declared line or on #29.

### `industrial-worlds`

| | |
|---|---|
| **Title** | Industrial Worlds |
| **Does** | Moves Angel's and Bob's, and Pyanodons, off Nauvis onto planets of their own inside a Space Age game, each with its own resources, recipes, machines, science packs, labs and research |
| **Latest** | `0.0.10`, `factorio_version` **2.1**, 2026-10-01. All seven releases declare 2.1, so a 2.0.77 game is not served it |
| **Downloads** | 46 |
| **Owner** | `Szentigrade` |
| **Status** | candidate, not a member (#91) |
| **Read on** | 2026-10-01 |

Angel's and Bob's go to a planet it calls Angelus. Nauvis keeps the vanilla and Space Age
progression, and the mod restores prototypes there that the overhauls would otherwise rewrite.
Seven releases, from `0.0.4` on 2026-08-29 to `0.0.10` on 2026-10-01, three of them in the last
two days of that span. No source repository is linked, and the homepage is a Discord invite. The
description is written for `0.0.5` ("Version **0.0.5** expands the framework..."), so it lags the
release read here by five.

**Its mandatory list changed shape on the day it was read.** Through `0.0.9` (2026-09-30), the
Angel's and Bob's mods it supports were mandatory, and from `0.0.5` so were nine Pyanodons mods and
`pyspaceage`. `0.0.10` made every one of them optional. The closure below is `0.0.10`'s; a reading
one day earlier would have pulled in the Pyanodons suite, and that closure was not walked.

**What it requires from the chain: nothing.** Its whole mandatory list is `base >= 2.1.20`,
`space-age >= 2.1.20`, `forgeworks-core >= 0.3.1` and `0-industrial-worlds-compat >= 0.0.5`.

**What it requires from outside the chain: two mods besides itself,** both by the same owner:

| Mod | Pulled in by | Latest | Releases declaring 2.0 | Downloads | Owner |
|---|---|---|---|---|---|
| `forgeworks-core` | this mod | `0.3.2`, 2.1, 2026-09-23 | 4 of 7, the last `0.2.8`, 2026-06-28 | 6,661 | `Szentigrade` |
| `0-industrial-worlds-compat` | this mod | `0.0.5`, 2.1, 2026-09-01 | none of 1 | 45 | `Szentigrade` |

Neither requires anything but `base` (`>= 2.1.20` and `>= 2.1.0`), so the closure is three mods.
`forgeworks-core` describes itself as a library with "no gameplay content".
`0-industrial-worlds-compat` has no description; its summary calls it an "early prototype-stage
bootstrap" that "sanitizes cross-overhaul data:extend calls" and normalizes recipe and equipment
shapes.

**25 of its 39 optional dependencies are already in the chain.** Twenty-four are named members:
`angelsrefining`, `angelspetrochem`, `angelssmelting`, `angelsbioprocessing`, `angelsinfiniteores`,
`angelsaddons-storage`, `angelsaddons-mobility`, `angelsaddons-cab`, `bobores`, `bobplates`,
`bobelectronics`, `boblogistics`, `bobassembly`, `bobmodules`, `bobmining`, `bobwarfare`,
`bobenemies`, `bobequipment`, `bobvehicleequipment`, `bobinserters`, `bobpower`, `bobtech`,
`bobrevamp` and `bobgreenhouse`. One is hidden: `boblibrary`. Each latest release meets the range it
declares (`>= 2.1.0` for Angel's, `>= 3.0.0` for Bob's). The fourteen outside the chain are
`angelsaddons-bots`, `bobclasses`, nine Pyanodons mods and `pyspaceage`, `Paracelsin` and
`corrundum`. It names none of `Grado_ABC`'s MadClown members - `Clowns-AngelBob-Nuclear`,
`Clowns-Extended-Minerals` and `Clowns-Processing` - and its description does not mention MadClown.

**`!` conflicts: seven, none with the chain.** `! cargo-bays-and-unloaders`,
`! omniab-space-age-compat`, `! angelbob-spaceage-rebalance`, `! BobsAngelsSpaceAge`,
`! 0-auf-extend-guard`, `! AdminUnknownFixes` and `! PyCoalTBaA`. None of the seven is in the chain,
and no mod in the chain declares `!` against any of its three. Two are the other two candidates
above, so taking it would rule out both of #31's.

**Reachability.** Not served on the declared 2.0 line: no release declares 2.0, and the latest
requires `base >= 2.1.20` and `space-age >= 2.1.20`, against the `2.0.77` build installed and read
on 2026-09-23. On a 2.1 line, `base >= 2.1.20` equals the project high `CLAUDE.md` records for a 2.1
target (`kry_stdlib` `2.2.21`), so it would not raise that floor.

**Against the promise: one of the two of the four that do not merge, by their own accounts - but it
moves the overhaul.** Its stated goal is to "install multiple large overhaul ecosystems without turning
Nauvis into an uncontrolled mixture of all of them", and "the goal is not to flatten the overhaul
packs into vanilla Space Age". That is separation, and on its face it is nearer "the planets and the
overhaul run side by side" than the unintegrated pack, where Angel's and Bob's rewrite Nauvis
itself. Against that: it gets there by rewriting the overhaul. Angel's and Bob's geology is
suppressed on Nauvis, their science recipes are rebuilt where needed, dedicated `iw-ab-*`
prototypes stand in where the ecosystems would collide, and research milestones become
surface-aware. Angel's and Bob's stop being the game a player starts in and become a planet they
travel to. A mod whose job is that is a bridge in the sense this section uses, built on isolation
rather than merging. Whether *beside* admits it is a reading of the promise, and the promise is
Truls's.

**Does `Grado_ABC` need any change to accommodate it? None on dependency metadata:** it requires
nothing from the chain and declares no `!` against it. What would decide it is not in the metadata.
Its description warns that a mod which "heavily modifies" map generation, science recipes or
technologies "may" need "additional compatibility work", and `Grado_ABC` carries such mods:
`rso-mod`, which controls ore placement, and the three MadClown members, which it does not name.

**What was not measured.** No load and no source to read. Whether it supports Angel's and Bob's
without Pyanodons: `0.0.10` made both optional, but the description, written for `0.0.5`, is
"designed around running the supported Angel/Bob and Pyanodons suites **at the same time**" and
does not say either alone is supported. How it treats MadClown and `rso-mod` is unread.

**Alternatives considered.** The other three bridges in this section, two of which it excludes, and
doing nothing.

**Recommendation: reconsider:** whether `Grado_ABCS`'s promise reads "side by side" as "on separate
worlds", since this is the only one of the four bridges built that way - and only once the pack has
a 2.1 line to carry it and the mod has a history longer than a month. Against it as read: 46
downloads, `0.0.x`, seven releases in 33 days, a mandatory list that changed shape the day it was
read, a description five releases behind, no source, and no word on MadClown. For the rule it is
light: named the way #10 named `quality` and `elevated-rails`, the pack would list two members,
`space-age` and this mod, with its two libraries unnamed; counted by what a player installs, it
adds three.

## Where the overhaul and Space Age touch (2026-10-04, #128)

A measurement of prototypes. It does not say whether the pack is playable, and it recommends
nothing about a bridge mod: those are #29's and #31's.

A load cannot see one mod replacing another's prototype, so this was read from data dumps. All on
Factorio **2.0.77**, on 2026-10-04, through the shared harness's `Invoke-HarnessDump`, with
`space-age`, `quality` and `elevated-rails` at `2.0.77` and the members at the releases in
`docs/loads/Grado_ABC-2026-10-04.md`.

### How the comparison was made

Four dumps, each named by its prototype list checksum:

| Dump | Mods | Checksum |
|---|---|---|
| base | none | `911970612` |
| Space Age alone | `space-age`, `quality`, `elevated-rails`, no other mod | `3295867752` |
| `Grado_ABC` | the staged pack, base only | `2195323740`, its recorded load's |
| `Grado_ABCS` | the staged pack with the three | `2316474952`, its recorded load's |

Every recipe, technology and item in the Space Age dump was compared with the prototype of the
same name in the `Grado_ABCS` dump, on these fields:

- **Recipe:** ingredients and results (name, amount, probability, temperature), category, time,
  `enabled`, `hidden`, surface conditions, `allow_productivity`, main product.
- **Technology:** prerequisites, science packs, count, time, research trigger, effects, `hidden`,
  `enabled`.
- **Item** (every prototype type that has a stack size): type, stack size, weight, fuel value and
  category, what it places, spoiling, default import location, `hidden`, flags, launch products,
  burnt result, subgroup.

Icons, order strings and names shown to the player are not compared. The base dump says whether a
prototype is vanilla, and whether Space Age alone or the overhaul alone changes it from base.
"The overhaul" here is everything the pack loads, the two lower packs' members included.

### Counts

| | Recipes | Technologies | Items |
|---|---|---|---|
| In the Space Age dump | 659 | 275 | 340 |
| Same in `Grado_ABCS` | 360 | 127 | 190 |
| **Differ in `Grado_ABCS`** | **299** | **148** | **150** |
| vanilla, and both rewrite it | 42 | 27 | 4 |
| vanilla, and only the overhaul rewrites it | 100 | 102 | 130 |
| vanilla, Space Age rewrites it and its change is gone | 5 | 0 | 0 |
| Space Age's own, changed | 36 | 19 | 16 |
| recycling recipes, which `quality` generates from the others | 116 | | |

No recipe, technology or item of the Space Age dump is missing from `Grado_ABCS`.

### Names both define

**29 prototype names are defined by Space Age and, base only, by the overhaul too.** In
`Grado_ABCS` one definition replaces the other without a log line.

| Type | Names |
|---|---|
| item (9) | `turbo-transport-belt`, `turbo-underground-belt`, `turbo-splitter`, `battery-mk3-equipment`, `carbon`, `tungsten-ore`, `tungsten-plate`, `tungsten-carbide`, `lithium-plate` |
| recipe (8) | the same nine less `tungsten-ore` |
| entity (4) | `turbo-transport-belt`, `turbo-underground-belt`, `turbo-splitter`, and the equipment `battery-mk3-equipment` |
| corpse (3) | the three turbo belt remnants |
| recipe category (2) | `electronics`, `electronics-with-fluid` |
| technology (1) | `battery-mk3-equipment` |
| fluid (1) | `ammonia` |
| particle (1) | `tungsten-ore-particle` |

### Which member defines each shared name (2026-10-05, #134)

#128 recorded which form the dump holds and not which mod made it. This is the member behind each
of the 29, read on 2026-10-05 from the staged source and checked against the same three dumps
(Space Age alone `3295867752`, base-only `Grado_ABC` `2195323740`, `Grado_ABCS` `2316474952`,
Factorio 2.0.77). Releases: `boblogistics` `2.1.1`, `bobequipment` `2.1.0`, `bobplates` `2.1.1`,
`bobores` `2.1.2`, `bobrevamp` `2.1.1`, `bobassembly` `2.1.0`, `boblibrary` `2.1.0`,
`reskins-bobs` `2.3.8`, `angelspetrochem` `2.0.3`, `angelssmelting` `2.0.5`. Nothing was patched,
and no staged mod was changed.

**Every one of the 29 is a name Bob's mods use or one made from it, and for 23 of them the source
or a changelog shows Bob's sharing it with Space Age on purpose.** Bob's `2.1.0` releases of
2026-06-01 say so in their changelogs, quoted below. The other six are the particle, which
follows Bob's tungsten ore and whose line was not traced, the two recipe categories, where
nothing speaks to it, and the three remnants, which a reskin makes.

"Holds" says which definition the `Grado_ABCS` dump has: **the overhaul's** when the prototype
is the same as in the base-only dump, field for field, **Space Age's** when it is the same as in
Space Age alone, and **mixed** when it is neither, with what differs. "Stage" is the member's own
stage: `data` is `data.lua`.

| Name | Member, file and stage | Holds | Deliberate? |
|---|---|---|---|
| items `turbo-transport-belt`, `turbo-underground-belt`, `turbo-splitter` | `boblogistics`, `prototypes/item/belt.lua` from line 71, `data`. Defined without a check, so it replaces Space Age's | the overhaul's | yes, by the rename below |
| entities of the same three names | `boblogistics`, `prototypes/entity/belt.lua` from line 291, `data` | mixed: Bob's entity, with a heating energy and Space Age's frozen graphics that `boblogistics` adds itself | yes: lines 760 to 781, under `feature_flags["freezing"]` and `if mods["space-age"]` |
| recipes of the same three names | `boblogistics`, `prototypes/recipe/belt-recipe.lua`, `data` | mixed: Bob's recipe in the category `pressing`. Which line sets the category was not traced | yes, by the rename below |
| corpses `turbo-transport-belt-remnants`, `turbo-underground-belt-remnants`, `turbo-splitter-remnants` | `reskins-bobs`, `prototypes/entity/logistics/belt-entities.lua`, `data`, through `reskins-library`, which copies a base remnant and names it `<entity>-remnants` | the overhaul's | no check for Space Age. Line 12 picks the name `turbo` by `boblibrary`'s version, so it follows Bob's rename |
| item, recipe, equipment and technology `battery-mk3-equipment` | `bobequipment`, `prototypes/item/equipment.lua` 128, `recipe/equipment.lua` 70, `equipment/equipment.lua` 214 and `technology/equipment.lua` 148, `data`. No check | the overhaul's, all four | yes, by its changelog |
| item `carbon` | `bobplates`, `prototypes/item/resource.lua` 4, `data`. No check; lines 247 to 250 give it Space Age's icon `if mods["space-age"]` | the overhaul's: hidden, because Angel's replaces it | yes |
| recipe `carbon` | `bobplates`, `prototypes/recipe/resource-recipe.lua`, `data`. Lines 1 to 12, `if mods["space-age"]`: Space Age's recipe is renamed `bob-carbon-from-acid`. Line 14 on: Bob's own `carbon` | mixed: Bob's recipe, differing from base only in `allow_productivity` | yes |
| item `tungsten-ore` | `bobores`, `prototypes/tungsten-ore.lua`, made by `boblibrary`'s ore function from `data.lua` line 71 | mixed: Angel's icon, name and subgroup on Space Age's item | yes: see under the table |
| particle `tungsten-ore-particle` | base only, `boblibrary`'s `create_particle` (`ore-functions.lua` 413) | **Space Age's** | not traced: which line skips Bob's particle |
| item `tungsten-plate` | `bobplates`, `prototypes/item/plates.lua` 168: `if not data.raw.item["tungsten-plate"]`, so Space Age's is kept | mixed: Space Age's item with the overhaul's icon, name, order and subgroup | yes, by the check |
| recipe `tungsten-plate` | `bobplates`, `prototypes/recipe/plates-recipe.lua`, `data`. Line 189, `if not mods["space-age"]`: its own. Otherwise line 225: Space Age's recipe, with `bob-powdered-tungsten` for `tungsten-ore` | mixed: Space Age's recipe with that ingredient, and hidden | yes |
| item `tungsten-carbide` | `bobplates`, `prototypes/item/alloys.lua` 105: the same check; lines 121 to 125 move Space Age's item to Bob's subgroup | mixed, as `tungsten-plate` | yes |
| recipe `tungsten-carbide` | `bobplates`, `prototypes/recipe/alloy-recipe.lua`, `data`. Line 124, `if not mods["space-age"]`: its own. Otherwise line 145: Space Age's, with the same ingredient swap | mixed: rewritten by Angel's, and hidden | yes |
| item `lithium-plate` | `bobplates`, `prototypes/item/plates.lua` 149: the same check | mixed: Space Age's item with the overhaul's icon, order and subgroup | yes |
| recipe `lithium-plate` | `bobplates`, `prototypes/recipe/plates-recipe.lua` 189 to 223: its own only `if not mods["space-age"]` | mixed: Space Age's recipe in Angel's category | yes |
| fluid `ammonia` | `bobrevamp`, `prototypes/rocket-fuel.lua` 1 to 12, `data`, when Bob's hydrogen, oxygen and nitrogen exist. No check | the overhaul's: hidden, because Angel's replaces it | yes, by its changelog |
| recipe categories `electronics`, `electronics-with-fluid` | `bobassembly`, `prototypes/assembly-electronics.lua` 30 to 39, `data`, behind its setting `bobmods-assembly-electronicmachines` | both: a category is only a name, so the two definitions are the same | **not shown**: no check and no changelog line |

The `tungsten-ore` row in full: `bobores` keeps the name, gives the resource no autoplace of its
own when Space Age is loaded (`prototypes/tungsten-ore.lua` line 32, `if not mods["space-age"]`),
and puts Space Age's ore items in its subgroup (`data-updates.lua` lines 143 to 147).

The changelog lines, each from the release of 2026-06-01:

- `boblogistics` `2.1.0`: "Improved Turbo belt Space Age compatibility. Renamed Bob's Turbo
  belt/splitter/underground, removing the "bob-" prefix #569".
- `bobequipment` `2.1.0`: "Prevented duplicate Personal battery MK3 with Space Age mod #572".
- `bobplates` `2.1.0`: "Combined Bob's Carbon and Space Age's Carbon #570", "Combined Bob's
  Lithium and Space Age's Lithium" and "Combined Bob's Tungsten and Space Age's Tungsten", the
  last under "Tungsten fixes (Space Age) #579", with "Updated Tungsten carbide and Tungsten plate
  recipes to use Powdered tungsten instead of Tungsten ore".
- `bobores` `2.1.0`: "Combined Bob's Tungsten and Space Age's Tungsten #579".
- `bobrevamp` `2.1.0`: "Combined Bob's Ammonia and Space Age's Ammonia #573".

**Why the dump holds what it does.** Three mechanisms, and none is load order alone:

- **Bob's writes over Space Age on purpose**, in its `data` stage. That is the turbo belts,
  `battery-mk3-equipment`, the `carbon` item and `ammonia`. `boblogistics`, `bobequipment` and
  `bobplates` declare `space-age` as an optional dependency, which loads them after it.
  `bobrevamp` and `bobores` do not name it in their `info.json`, and the dump has `bobrevamp`'s
  `ammonia` all the same.
- **Bob's steps aside on purpose** and edits Space Age's prototype in place. That is the tungsten
  and lithium items and recipes. `boblogistics` also folds Space Age's technology
  `turbo-transport-belt` into `logistics-4` and hides it (`data-final-fixes.lua` lines 49 to 62),
  which is why #128 found it hidden and unlocking nothing.
- **Angel's then treats the shared name as Bob's, with no check for Space Age.** It does base
  only what it does here, and Space Age's recipes are caught by it because they use the names:
  - `angelspetrochem` replaces the item `carbon` with `angels-solid-carbon` everywhere
    (`prototypes/override/bobplates.lua` line 279) and hides the recipe `carbon`
    (`prototypes/global-override/bobplates.lua`, the list from line 162). That is why eight of
    Space Age's recipes take or give `angels-solid-carbon`.
  - `angelspetrochem` hides the recipe `ammonia` and converts the fluid to `angels-gas-ammonia`
    (`prototypes/global-override/bobrevamp.lua` lines 27 and 28). That is the seven recipes #128
    lists under `ammonia`.
  - `angelssmelting` disables the recipe `tungsten-plate` and makes the item from its own chain
    (`prototypes/override/smelting-override-tungsten.lua` lines 64 to 67), and moves
    `tungsten-carbide` to `angels-sintering-4` and `angels-tungsten-smelting-1` (lines 117 to
    129). Both recipes are hidden in the base-only dump too.
  - `angelspetrochem` moves the recipe `lithium-plate` to `angels-petrochem-electrolyser`
    (`prototypes/global-override/bobplates.lua` lines 228 to 231), and `angelssmelting` gives it
    a subgroup (`prototypes/override/smelting-override-lithium.lua` line 13).

One change #128 listed comes from the second mechanism and is not Angel's: Space Age's `lithium`
recipe loses `lithium-brine` and gains 5 `bob-lithium-chloride` in `bobplates`
(`prototypes/recipe/plates-recipe.lua` lines 227 and 228). The dump has `angels-solid-lithium` in
that place. Which line turns one into the other was not traced.

Not traced, beside the three named above: the stage in which each Angel's override is applied,
beyond that they are queued in its `data-updates.lua` and `data-final-fixes.lua`; and the Bob's
and Angel's releases on the 2.1 line.

### A Space Age recipe the overhaul changed: 36

- **The eight shared names.** `battery-mk3-equipment` has the overhaul's recipe (2
  `battery-mk2-equipment`, 10 `bob-battery-2`; Space Age asks 5 and 10 `supercapacitor`). The
  three turbo belts have Bob's ingredients (`bob-titanium-plate`, bearings and gear wheels, no
  `tungsten-plate` or `lubricant`), the category `pressing` in place of `metallurgy`, and no
  surface condition, where Space Age requires a pressure of 4000. `logistics-4` unlocks them.
  `carbon`, `tungsten-carbide` and `tungsten-plate` are hidden and no technology unlocks them.
  `lithium-plate` keeps Space Age's ingredient and time and moves to the category
  `angels-petrochem-electrolyser`.
- **`carbon` replaced by `angels-solid-carbon`, eight:** `carbon-fiber`, `space-science-pack`,
  `thruster-fuel`, `advanced-thruster-fuel`, `coal-synthesis` as an ingredient;
  `carbonic-asteroid-crushing`, `advanced-carbonic-asteroid-crushing`, `burnt-spoilage` as the
  result. The item `carbon` is hidden, and no recipe makes or takes it.
- **`ammonia` replaced by `angels-gas-ammonia`, seven:** `lithium`, `fluoroketone`,
  `fusion-power-cell`, `ice-platform`, `solid-fuel-from-ammonia`, `ammonia-rocket-fuel`, and
  `ammoniacal-solution-separation` as its result. `lithium` also takes 5 `angels-solid-lithium`
  where Space Age takes 50 `lithium-brine`.
- **Vanilla oil fractions, three:** `simple-coal-liquefaction` gives `angels-liquid-naphtha` for
  `heavy-oil`, `electrolyte` takes it, and `superconductor` takes `angels-liquid-fuel-oil` for
  `light-oil`. The fluids `ammonia`, `heavy-oil` and `light-oil` are hidden.
- **`steel-plate` replaced by `bob-titanium-plate`, two:** `space-platform-foundation` and
  `space-platform-starter-pack`.
- **The three quality modules** have Bob's module recipes (`bob-module-case`,
  `bob-quality-processor` and the like).
- **Category only, five:** `lightning-rod` is in `crafting`, not `electronics`. The four
  fluoroketone barrel recipes are in `angels-barreling-pump`.

### A vanilla recipe both rewrite: 42

`speed-module`, `-2`, `-3`, `productivity-module`, `-2`, `-3`, `efficiency-module`, `-2`, `-3`,
`heavy-oil-cracking`, `light-oil-cracking`, `sulfuric-acid`, `plastic-bar`, `sulfur`,
`personal-roboport-mk2-equipment`, `artillery-turret`, `electronic-circuit`, `transport-belt`,
`copper-cable`, `splitter`, `underground-belt`, `fast-underground-belt`, `fast-splitter`,
`fast-transport-belt`, `solar-panel`, `destroyer-capsule`, `atomic-bomb`, `artillery-shell`,
`express-transport-belt`, `spidertron`, `artillery-wagon`, `power-armor-mk2`,
`express-underground-belt`, `express-splitter`, `advanced-circuit`, `processing-unit`,
`accumulator`, `beacon`, `explosives`, `battery`, `rocket-fuel`, `rocket-part`.

In eleven the result is the overhaul's base-only recipe, so Space Age's change is not there:
`personal-roboport-mk2-equipment`, `electronic-circuit`, `solar-panel`, `destroyer-capsule`,
`atomic-bomb`, `spidertron`, `advanced-circuit`, `processing-unit`, `accumulator`, `beacon` and
`rocket-fuel`. The other 31 are neither mod's own recipe. Two examples: `transport-belt` has
Bob's ingredients in Space Age's category `pressing`; `rocket-part` takes 1 `processing-unit`, 1
`low-density-structure` and 1 `rocket-fuel`, which is Space Age's cost, and 10
`bob-titanium-pipe` and 10 `bob-heat-shield-tile` beside them.

The five whose Space Age change is gone though the overhaul alone leaves them as base:
`small-electric-pole`, `medium-electric-pole`, `big-electric-pole`, `substation` and
`discharge-defense-equipment`. Space Age moves them to the category `electronics`; in
`Grado_ABCS` they are in `crafting`. `electronics` is one of the names both define.

### Science packs, rockets and planets

**The five packs Space Age adds are untouched:** `metallurgic-science-pack`,
`agricultural-science-pack`, `electromagnetic-science-pack`, `cryogenic-science-pack` and
`promethium-science-pack` have the same recipe and the same technology as in Space Age alone.
**`space-science-pack`'s recipe changed in one ingredient:** `angels-solid-carbon` for `carbon`.
Its technology is the same.

One step up from the packs, read from the dump and not played. *Walked all the way down
2026-10-05 (#132): see* Whether each Space Age science pack can be made.

- `metallurgic-science-pack` takes `tungsten-carbide` and `tungsten-plate`. Space Age's recipes
  for both are hidden. Angel's makes them: `angels-plate-tungsten-carbide`,
  `angels-plate-tungsten` and `angels-roll-tungsten-converting`, behind
  `angels-tungsten-carbide-smelting-1` and `angels-tungsten-smelting-1`.
- `electromagnetic-science-pack` takes `accumulator`, which has the overhaul's recipe (10
  `battery`, 2 `electronic-circuit`, 2 `iron-plate`), and `electrolyte`, which takes
  `angels-liquid-naphtha`.
- `cryogenic-science-pack` takes `lithium-plate`, made in Angel's electrolyser category from
  `lithium`, which no longer takes `lithium-brine`.
- `agricultural-science-pack` and `promethium-science-pack`: every recipe for their ingredients is
  the same as in Space Age alone.

**Rocket and planet technologies.** Prerequisites or cost changed in three:

- `rocket-silo`: `bob-titanium-processing` and `bob-heat-shield` added to its prerequisites.
- `rocket-fuel`: `angels-advanced-oil-processing`, `angels-nitrogen-processing-3` and `-4` in
  place of `advanced-oil-processing`, and `production-science-pack` and `utility-science-pack`
  added to its cost.
- `rocketry`: `angels-rocket-booster-1` added to its prerequisites.

`rocket-silo` is one of the 27 both rewrite. `rocket-fuel` and `rocketry` are among the 102 only
the overhaul rewrites, which are not listed one by one here.

Three more gained recipe unlocks from `RealisticFusionPowerPort` and nothing else:
`space-platform-thruster`, `planet-discovery-aquilo` and `advanced-asteroid-processing`.
**The four `planet-discovery-*` technologies keep Space Age's prerequisites and cost**, and
`space-platform`, `space-science-pack`, `asteroid-reprocessing` and `captivity` are unchanged.

The recipes on that path that changed are all listed above: `rocket-part`, `rocket-fuel`,
`space-platform-foundation`, `space-platform-starter-pack`, `thruster-fuel` and
`advanced-thruster-fuel`.

### Technologies

**Space Age's own, 19 changed:**

- `turbo-transport-belt` is hidden and disabled and unlocks nothing.
- `battery-mk3-equipment` is the overhaul's: it costs `production-science-pack` and none of
  `utility-science-pack`, `space-science-pack` and `electromagnetic-science-pack`, which Space
  Age asks for.
- `tungsten-carbide` no longer unlocks `carbon` or `tungsten-carbide` and unlocks
  `bob-carbon-from-acid`. `tungsten-steel` no longer unlocks `tungsten-plate`.
  `lithium-processing` also unlocks `bob-lithium-chloride` and `bob-lithium-perchlorate`.
- `elevated-rail` asks for `bob-advanced-logistic-science-pack` in place of
  `production-science-pack`, and for `railway`.
- `quality-module` costs 50 units, not 500; `quality-module-2` and `-3` have Bob's module
  prerequisites and counts.
- Ten gained `*-rfp-ddw` recipe unlocks from `RealisticFusionPowerPort` and nothing else: the
  three above, `rocket-turret`, `foundry`, `biochamber`, `bioflux-processing`, `overgrowth-soil`,
  `fish-breeding` and `holmium-processing`.

**Vanilla, both rewrite, 27:** `physical-projectile-damage-6` and `-7`, `laser-weapons-damage-5`
to `-7`, `follower-robot-count-5`, `atomic-bomb`, `automation-3`, `cliff-explosives`,
`power-armor-mk2`, `rocket-silo`, `logistic-system`, `worker-robots-speed-6`,
`energy-shield-mk2-equipment`, `battery-mk2-equipment`, `personal-roboport-mk2-equipment`,
`fluid-handling`, `coal-liquefaction`, `speed-module-2` and `-3`, `productivity-module-2` and
`-3`, `efficiency-module-2` and `-3`, `kovarex-enrichment-process`, `artillery`, `spidertron`.
Three end as the overhaul's base-only form: `automation-3`, `battery-mk2-equipment` and
`fluid-handling`, so Space Age's fluoroketone barrels are unlocked by `bob-fluid-barrel-processing`.
`coal-liquefaction` is hidden and `kovarex-enrichment-process` is disabled, and the recipes
of those names are hidden.

Going the other way, two of the overhaul's technologies cost a Space Age pack in `Grado_ABCS`:
`bob-battery-3` (`cryogenic-science-pack`) and `miniloader-redux`'s `hps__ml-turbo-miniloader`
(`space-science-pack` and `metallurgic-science-pack`).

### Items

**Space Age's own, 16 changed.** All nine shared item names are among them. Five of the nine have
the overhaul's form: the three turbo belts, `battery-mk3-equipment` and `carbon`, which is hidden.
The other eleven of the 16 differ in subgroup only: the four remaining shared names,
`tungsten-ore`, `tungsten-plate`, `tungsten-carbide` and `lithium-plate`, and `calcite`,
`holmium-ore`, the two fluoroketone barrels and the three quality modules. **Vanilla, both
rewrite, 4:** `raw-fish`, `cliff-explosives`, `stone-brick` and `landfill`.

### Not covered

- **Play.** Nothing here was crafted, researched or launched.
- **The 100 recipes, 102 technologies and 130 items only the overhaul rewrites.** That is
  `Grado_ABC` being itself, and the same as base only.
- **The 116 recycling recipes**, which follow from the recipes they recycle. `Grado_ABCS` has
  3,664 recycling recipes against 311 in Space Age alone.
- **Entities, resources and map generation.** One thing was seen in passing: the resource
  prototypes `iron-ore`, `copper-ore` and `uranium-ore` are in the Space Age dump and not in
  `Grado_ABCS`. What the planets then place was not looked at. *Looked at 2026-10-05 (#133): see*
  What each planet places. *The overhaul's ores are on Nauvis only, the other four planets list
  what they list in Space Age alone, and `rso-mod` takes over placing all of it but `scrap`.*
- **Which mod made each change.** The dumps show the result. Where a mod is named above, its
  prototype names say so. *Traced 2026-10-05 (#134) for the 29 shared names: see* Which member
  defines each shared name. *The other changes are still untraced.*
- **A 2.1 build of any of it.**

## What each planet places (2026-10-05, #133)

A reading of prototypes and of one member's source. No map was generated: what a planet looks like
is #29's play session.

The overhaul replaces the vanilla ores, and Space Age's planets are generated from settings that
name resources. This is what those settings hold. Read on 2026-10-05 from two data dumps on
Factorio **2.0.77**, made through the shared harness's `Invoke-HarnessDump`: Space Age alone
(prototype list checksum `3295867752`) and the staged `Grado_ABCS` (`2316474952`, the recorded
load's), with `space-age`, `quality` and `elevated-rails` at `2.0.77` and the members at the
releases in `docs/loads/Grado_ABC-2026-10-04.md`. `rso-mod` is `7.0.26`.

### How it was read

For each planet, `map_gen_settings` was compared between the two dumps: the autoplace controls,
the entities, tiles and decoratives it lists, the cliff, the territory units and the property
expressions. Every name in the pack's settings was then looked up in the pack's dump. A resource is
an entity in a planet's list whose prototype type is `resource`.

**The dumps alone do not answer the question, because of `rso-mod`.** Its `data-final-fixes.lua`
sets the probability and richness of every resource's autoplace to `0` (lines 39 to 46), and
overwrites every `entity:<name>:probability` and `:richness` property expression of every planet
with `0` (lines 48 to 65). It skips `scrap` by name. In the pack's dump, 45 of the 47 resource
prototypes have a probability of `0`. The other two are `scrap`, which keeps Space Age's
expression, and `angels-sea-pump-resource`, which has no autoplace. So as the prototypes read, the
map generator places no resource anywhere but Fulgora, and `rso-mod` places them from its control
script instead, from a table per planet (`resourceconfigs/mainconfig.lua`, `vanilla.lua`,
`bobores.lua`, `angelsores.lua`, `clownsores.lua`). The third column below is that table, **read
from the source and not run**. It is the same mechanism base only, where it is `Grado_ABC`'s.

### Nauvis

| | Space Age alone | `Grado_ABCS`, the planet's list | `rso-mod`'s table, as read |
|---|---|---|---|
| Resources | 6: `coal`, `copper-ore`, `iron-ore`, `stone`, `uranium-ore`, `crude-oil` | 39: `angels-ore1` to `6`, `angels-fissure`, `angels-natural-gas`, `clowns-ore1` to `9`, `clowns-resource1` and `2`, `coal`, `crude-oil`, and 18 `infinite-` twins of the ores and of `coal` | the Angel's and Clowns ores, `angels-fissure`, `angels-natural-gas`, `coal`, `crude-oil`, and **`stone` and `tungsten-ore`** |
| Autoplace controls | 12 | 47: the four of `copper-ore`, `iron-ore`, `stone` and `uranium-ore` are gone and 39 are added | |
| Other entities | `fish`, `big-rock`, `big-sand-rock`, `huge-rock` | `fish`, three Angel's fish, 31 rocks of `alien-biomes`, Angel's three gardens, three trees and the puffer nest | |

The planet's settings are the same as in the base-only `Grado_ABC` dump (`2195323740`), key for
key. So on Nauvis Space Age changes nothing in the prototypes. `crude-oil` gives
`angels-liquid-multi-phase-oil`, and the `infinite-` ores need a fluid to mine.

Three things in `rso-mod`'s Nauvis table, all read from the source:

- **It still names `iron-ore`, `copper-ore` and `uranium-ore`**, which are not resources in the
  pack. Lines 583 to 585 of `mainconfig.lua` mean to remove the first two and `stone` when Angel's
  is loaded, but they clear `config["copper-ore"]` where the entries are under `config.nauvis`. The
  mod checks each name against the game, logs `Resource not available` and skips it. That is the
  line the load records carry, and it is the answer to their "why".
- **`stone` is a resource in this pack and not in `Grado_ABC`**: Space Age's, kept for Gleba. So
  the entry that is skipped base only is valid here, and the table would place stone patches on
  Nauvis. It agrees with the recorded loads: `Resource not available: stone` is in `Grado_ABC`'s
  log and not in this pack's.
- **`tungsten-ore` on Nauvis.** `bobores.lua` adds it when a resource of that name exists with an
  autoplace (lines 120 and 121). Base only there is none, as Angel's leaves no Bob's ore on the map.
  Here there is one, Space Age's, in the mining category `hard-solid`. So the table would place
  Space Age's tungsten ore on Nauvis.

The `infinite-` resources are in the planet's list and in none of `rso-mod`'s tables (searched for
`infinite-` in `resourceconfigs/`: one hit, in the table for another mod). What places them, if
anything, was not found. That is the same base only.

### Vulcanus, Gleba, Fulgora and Aquilo

| Planet | Space Age alone | `Grado_ABCS`, the planet's list | `rso-mod`'s table, as read |
|---|---|---|---|
| Vulcanus | `calcite`, `coal`, `tungsten-ore`, `sulfuric-acid-geyser` | the same four | the same four |
| Gleba | `stone` | `stone` | `stone` |
| Fulgora | `scrap` | `scrap` | none: no table for Fulgora, and `scrap` is skipped by name, so the map generator still places it |
| Aquilo | `crude-oil`, `fluorine-vent`, `lithium-brine` | the same three | the same three |

On all four the controls, the entity list, the tiles, the cliff and the territory units are the
same in both dumps. Two things differ:

- **The property expressions `rso-mod` zeroed**: eight on Vulcanus (probability and richness of
  its four resources), two on Gleba (`stone`) and two on Aquilo (`crude-oil`). Fulgora has none.
- **Gleba's decorative list** has 73 names where Space Age alone has 79. The six left out are
  `green-bush-mini`, `green-carpet-grass`, `green-croton`, `green-hairy-grass`, `green-pita` and
  `green-pita-mini`. All six prototypes are still in the dump, and Gleba's property expressions
  still name them. Which member removes them from the list was not traced.

What a resource gives changed in one: `crude-oil` gives `angels-liquid-multi-phase-oil`, on Aquilo
as on Nauvis. The other seven give what they give in Space Age alone.

### Does anything name something that does not exist?

**In the prototypes, no.** Every entity, tile, decorative, autoplace control, cliff and territory
unit named in the five planets' settings is in the pack's dump, and so is every name in a property
expression. Every item or fluid a listed entity gives when mined is there too.

**In `rso-mod`'s table, three**: `iron-ore`, `copper-ore` and `uranium-ore` on Nauvis, as above.
It logs them and goes on.

### Which planets can supply the overhaul's ores

**Nauvis only, as the prototypes and the table read.** No Angel's or Clowns resource is in the
list of Vulcanus, Gleba, Fulgora or Aquilo, and `rso-mod`'s tables for Vulcanus, Gleba and Aquilo
hold Space Age's resources and nothing else.

What the other planets do place are things the overhaul's recipes take, under names the two share
or that both use:

- **Vulcanus:** `tungsten-ore`, which is also the name of Bob's ore item; `coal`; and from its
  rocks `stone`, `iron-ore`, `copper-ore` and `sulfur`. Its lichen trees give `carbon`, which is
  hidden in the pack and which no recipe takes.
- **Gleba:** `stone`, and `iron-ore` and `copper-ore` from the stromatolites.
- **Fulgora:** `scrap`, and `stone` and `holmium-ore` from its rocks. Its ocean is `heavy-oil`,
  which is hidden in the pack and which no recipe takes.
- **Aquilo:** crude oil as `angels-liquid-multi-phase-oil`, the feed of Angel's oil refining.
  `lithium-brine` is still placed, and no recipe that can be unlocked takes it.

Whether those are enough to build on each planet is the next section's.

### Not covered

- **A generated map.** Nothing here was seen in the game. In particular, whether `rso-mod` places
  `stone` and `tungsten-ore` on Nauvis is read from its source.
- **Amounts.** Richness, patch size and frequency were not compared.
- **Asteroids and space routes.** Each planet's asteroid list is the same in both dumps; the
  routes between them were not read.
- **Enemy bases**, which `rso-mod` also takes over unless `bobenemies` is loaded, as it is here.
- **A 2.1 build of any of it.**

## Whether each Space Age science pack can be made (2026-10-05, #132)

A walk of the recipe graph. It reports what the prototypes allow. It does not say the pack is
playable, and it recommends nothing about a bridge mod: those are #29's and #31's.

#128 looked one step above the six science packs and stopped. This goes all the way down, from the
same dumps as the section above: Space Age alone (`3295867752`) and the staged `Grado_ABCS`
(`2316474952`), and the base-only `Grado_ABC` (`2195323740`) to tell what is the overhaul's. All
Factorio **2.0.77**, read 2026-10-05, the members at the releases in
`docs/loads/Grado_ABC-2026-10-04.md`.

### How the walk was made

A script reads one dump and repeats three rules until nothing new is added.

- **What a surface supplies.** Whatever an entity in a planet's settings gives when mined:
  resources, rocks, trees, fish, ruins and icebergs. The fluid of a planet's tiles. The plants.
  The four asteroid chunks. What an enemy nest drops. The fluid of a pump that has one of its own,
  which is how Angel's seafloor pump works. `steam` where there is `water`, since a boiler is not
  a recipe. What an item spoils or burns into.
- **A recipe counts** when it is not hidden, every ingredient can be had, a machine of its
  category can be built, and it is enabled from the start or a technology that unlocks it can be
  researched. The recycler's generated recipes are hidden, so by this rule they do not count.
- **A technology can be researched** when it is not hidden or disabled, all its prerequisites can
  be, and either its trigger can be met or its science packs can be made and one lab that can be
  built takes them all.

That is a little stricter than #132 asked for, which was a recipe that is not hidden and a
technology that is not hidden. The stricter rule is what found the one dead end below.

**It does not know where anything is.** An item made on one planet counts on every other. The
recipe's surface condition and the machine's are recorded beside each step instead, and
*From its own materials* below asks the question of place a second way.

**Checked against Space Age alone first**, where the answer is known: the script researches all
275 technologies, makes all six packs, and uses 330 of the 340 recipes that are not hidden. The
other ten are the `parameter-` placeholders.

For the walks, a step is followed down through every recipe that counts until it ends in
something a surface supplies, or **joins the overhaul**: reaches an item or fluid that the
base-only `Grado_ABC` dump also has. Below a join the chain is `Grado_ABC`'s own, and it is not
listed here. The script still follows it to the ground, which is where "can be made" comes from.

### Result

**All six packs can be made, as the prototypes read.** All six technologies can be researched,
with the same trigger and prerequisites as in Space Age alone, and the labs `lab`, `biolab` and
`bob-lab-2` take all six packs.

Of Space Age's own prototypes in `Grado_ABCS`:

| | In Space Age alone | In `Grado_ABCS` |
|---|---|---|
| Recipes that are not hidden | 340 | 317 still count; 23 are hidden |
| of those, can be made | 330 | 306: all but the ten placeholders and `captive-biter-spawner` |
| Technologies | 275 | 268 can be researched; 6 are hidden or disabled; 1 cannot be reached |

The 23 hidden recipes are vanilla's oil, plastic, sulfur, lubricant, steel and uranium recipes
and their barrels, which the overhaul replaces, and three of Space Age's own: `carbon`,
`tungsten-carbide` and `tungsten-plate`, as #128 found. Nothing a science pack needs is lost with
them. The six technologies are `oil-processing`, `advanced-oil-processing`, `coal-liquefaction`,
`sulfur-processing`, `kovarex-enrichment-process` and `turbo-transport-belt`.

### Dead ends

**One, and no science pack needs it.**

- **The technology `captive-biter-spawner` cannot be researched.** Its prerequisites are Space
  Age's: `cryogenic-science-pack`, `biter-egg-handling` and `kovarex-enrichment-process`. The
  last is disabled in the pack, as it is in the base-only dump. So the recipe
  `captive-biter-spawner`, which only that technology unlocks, cannot be unlocked. Under #132's
  own rule it would count, since its technology is not hidden. What is lost is building a captive
  nest from parts. `biter-egg` is still made in a nest captured with `capture-robot-rocket`,
  which `captivity` unlocks, so `promethium-science-pack` is not affected. Which member disables
  `kovarex-enrichment-process` was not traced, and whether the game offers a technology whose
  prerequisite is disabled was not tried.

**Three things a planet supplies that nothing takes**, which are not dead ends in a walk but are
dead material:

- `heavy-oil`, Fulgora's ocean. No recipe in the pack takes it, hidden ones included. Space Age
  alone has six that do.
- `lithium-brine`, Aquilo's resource. One recipe takes it, `bob-lithium-chloride`, and it is
  hidden. `lithium` no longer does.
- `carbon`, from Vulcanus's lichen trees. No recipe takes it.

`ammonia`, `light-oil`, `petroleum-gas` and the barrels of the three vanilla oil fractions can be
made in Space Age alone and not here. All are hidden, and Angel's fluids stand in for them.

### The walks

In each table, **differs** marks a step that is not as in Space Age alone, and the place is given
where a recipe or its machine allows only one.

#### `space-science-pack`

| Step | Made by | Machine and place | Against Space Age alone |
|---|---|---|---|
| `space-science-pack` | 2 `iron-plate`, 1 `angels-solid-carbon`, 1 `ice` | `crafting`. **A space platform only** (gravity 0) | **differs**: `angels-solid-carbon` for `carbon` |
| `ice` | `oxide-asteroid-crushing`, `advanced-oxide-asteroid-crushing` | `crushing`: the crusher, **a platform only** | same |
| `angels-solid-carbon` | `carbonic-asteroid-crushing`, `advanced-carbonic-asteroid-crushing` | the crusher | **differs**: Space Age gives `carbon`. Joins the overhaul: 9 recipes make it |
| `iron-plate` | joins the overhaul: 4 recipes | | **differs**, see below |

Ends in the three asteroid chunks. On a platform `metallic-asteroid-crushing` still gives
`iron-ore`. What differs is the next step: the furnace recipe `iron-plate` takes 3
`angels-ore1-crushed` and not `iron-ore`. The recipes that turn `iron-ore` into plate are
`molten-iron` and `casting-iron` in the foundry, unchanged, and Angel's own smelting chain.

#### `metallurgic-science-pack`

| Step | Made by | Machine and place | Against Space Age alone |
|---|---|---|---|
| `metallurgic-science-pack` | 3 `tungsten-carbide`, 2 `tungsten-plate`, 200 `molten-copper` | `metallurgy`: the foundry. **Vulcanus only** (pressure 4000) | same |
| `molten-copper` | `molten-copper-from-lava` (500 `lava`, 1 `calcite`) or `molten-copper` (50 `copper-ore`, 1 `calcite`) | the foundry | same |
| `tungsten-carbide` | `angels-plate-tungsten-carbide`: 12 `angels-powder-tungsten-carbide` | `angels-sintering`, no surface condition | **differs**: Space Age's recipe is hidden. Joins the overhaul |
| `tungsten-plate` | `angels-plate-tungsten` or `angels-roll-tungsten-converting` | `angels-sintering-4`, `advanced-crafting` | **differs**: Space Age's recipe is hidden. Joins the overhaul |

Ends in `lava`, Vulcanus's tiles, and `calcite`, its resource. `copper-ore` joins the overhaul and
is also what Vulcanus's rocks give.

The two tungsten steps are where this pack changed most. In Space Age alone the first tungsten
carbide is made in an assembling machine from `tungsten-ore`, `carbon` and `sulfuric-acid`, by a
recipe that mining a rock on Vulcanus unlocks. Here the only recipe is Angel's, behind
`angels-tungsten-carbide-smelting-1`, which costs automation, logistic, chemical and production
science. Its prerequisite is `angels-tungsten-smelting-1`, which has six of its own. The foundry's own recipe is unchanged: 50
`tungsten-carbide` among its parts, made on Vulcanus only, and its technology is still triggered
by crafting `tungsten-carbide`. Vulcanus's `tungsten-ore` does feed Angel's chain: three recipes
take it, `angels-processed-tungsten`, `angels-solid-tungsten-oxide` and
`angels-catalyst-metal-yellow`.

#### `agricultural-science-pack`

| Step | Made by | Machine and place | Against Space Age alone |
|---|---|---|---|
| `agricultural-science-pack` | 1 `bioflux`, 1 `pentapod-egg` | `organic`: the biochamber. **Gleba only** (pressure 2000) | same |
| `bioflux` | 15 `yumako-mash`, 12 `jelly` | the biochamber | same |
| `pentapod-egg` | 1 `pentapod-egg`, 30 `nutrients`, 60 `water` | the biochamber. **Gleba only** | same |
| `yumako-mash`, `jelly` | `yumako-processing`, `jellynut-processing` | by hand, an assembling machine or the biochamber | same |
| `nutrients` | from `spoilage`, `yumako-mash`, `bioflux`, `raw-fish` or `biter-egg` | the biochamber, three of the five also an assembling machine | same |

Ends in `yumako` and `jellynut`, Gleba's plants, the first `pentapod-egg` from a nest, and
`water`. **Nothing differs.** Of the 14 recipes in this walk 13 are as in Space Age alone, and
the fourteenth is `pentapod-egg-rfp-ddw`, a copy `RealisticFusionPowerPort` adds that takes its
own water.

#### `electromagnetic-science-pack`

| Step | Made by | Machine and place | Against Space Age alone |
|---|---|---|---|
| `electromagnetic-science-pack` | 1 `supercapacitor`, 1 `accumulator`, 25 `electrolyte`, 25 `holmium-solution` | `electromagnetics`: the electromagnetic plant. **Fulgora only** (magnetic field 99) | same |
| `supercapacitor` | 2 `holmium-plate`, 2 `superconductor`, 4 `electronic-circuit`, 1 `battery`, 10 `electrolyte` | the electromagnetic plant | same |
| `electrolyte` | 1 `stone`, 10 `angels-liquid-naphtha`, 10 `holmium-solution` | the electromagnetic plant | **differs**: `angels-liquid-naphtha` for `heavy-oil` |
| `superconductor` | 1 `holmium-plate`, 1 `copper-plate`, 1 `plastic-bar`, 5 `angels-liquid-fuel-oil` | the electromagnetic plant | **differs**: `angels-liquid-fuel-oil` for `light-oil` |
| `holmium-solution` | 2 `holmium-ore`, 1 `stone`, 10 `water` | `chemistry` | same |
| `holmium-plate` | 20 `holmium-solution` | an assembling machine or the foundry | same |
| `holmium-ore` | `scrap-recycling` | the recycler or by hand | same |

Ends in `scrap`, Fulgora's resource. It joins the overhaul in ten places: `accumulator`,
`electronic-circuit`, `battery`, `copper-plate`, `plastic-bar`, `stone`, `water`,
`rfp-depleted-water`, and the two fluids that differ. `angels-liquid-naphtha` has 11 recipes and
`angels-liquid-fuel-oil` 8. None of them takes `heavy-oil`, so Fulgora's ocean feeds neither.

#### `cryogenic-science-pack`

| Step | Made by | Machine and place | Against Space Age alone |
|---|---|---|---|
| `cryogenic-science-pack` | 3 `ice`, 1 `lithium-plate`, 6 `fluoroketone-cold` | `cryogenics`: the cryogenic plant. **Aquilo only** (pressure 300) | same |
| `ice` | `ammoniacal-solution-separation`, or the icebergs | a chemical plant or the cryogenic plant | **differs** in its other result: `angels-gas-ammonia` for `ammonia` |
| `fluoroketone-cold` | `fluoroketone-cooling`: 10 `fluoroketone-hot` | the cryogenic plant | same |
| `fluoroketone-hot` | `fluoroketone`: 50 `fluorine`, 50 `angels-gas-ammonia`, 1 `solid-fuel`, 1 `lithium` | the cryogenic plant | **differs**: `angels-gas-ammonia` for `ammonia` |
| `lithium-plate` | 1 `lithium` | `angels-petrochem-electrolyser` | **differs**: Angel's electrolyser in place of a furnace. One of the names both define |
| `lithium` | 1 `holmium-plate`, 50 `angels-gas-ammonia`, 5 `angels-solid-lithium`, or the icebergs | a chemical plant or the cryogenic plant | **differs**: 5 `angels-solid-lithium` for 50 `lithium-brine` |
| `angels-solid-lithium` | joins the overhaul: 4 recipes, all sorting `clowns-ore2` | Angel's ore sorting | not in Space Age |

Ends in `ammoniacal-solution`, Aquilo's ocean, `fluorine`, its vent, and the icebergs. The
change that matters is `lithium`: its recipe no longer takes Aquilo's brine and takes
`angels-solid-lithium`, which comes only from an ore `rso-mod` places on Nauvis. The icebergs
still give `lithium` itself when mined. The four barrel recipes for the two fluoroketones are in
`angels-barreling-pump`, behind `bob-fluid-barrel-processing`, as #128 found.

#### `promethium-science-pack`

| Step | Made by | Machine and place | Against Space Age alone |
|---|---|---|---|
| `promethium-science-pack` | 25 `promethium-asteroid-chunk`, 1 `quantum-processor`, 10 `biter-egg` | the cryogenic plant. **A space platform only** (gravity 0) | same |
| `quantum-processor` | 1 `tungsten-carbide`, 1 `processing-unit`, 1 `superconductor`, 1 `carbon-fiber`, 2 `lithium-plate`, 10 `fluoroketone-cold` | the electromagnetic plant. **Aquilo or a platform** (pressure at most 600) | same |
| `biter-egg` | `biter-egg`, no ingredients | `captive-spawner-process`: a captive nest, **Nauvis only** | same |
| `carbon-fiber` | 10 `yumako-mash`, 1 `angels-solid-carbon` | the biochamber | **differs**: `angels-solid-carbon` for `carbon` |

The other four ingredients of `quantum-processor` are steps of the walks above:
`tungsten-carbide`, `superconductor`, `lithium-plate` and `fluoroketone-cold`. `processing-unit`
joins the overhaul, with Bob's recipe beside `scrap-recycling`.

### From its own materials

The walk above lets any item travel. This asks the opposite: what can one surface make from what
it supplies itself, with nothing brought in? Every machine is taken as being there and every
technology as researched, so it is a question about materials only. Here the recycler's recipes
do count, hidden as they are, because Fulgora is built on them.

Space Age alone, by this measure, makes each planet's pack on its own planet, and
`space-science-pack` on a platform. `promethium-science-pack` needs parts from the planets in
both.

| Surface | Made from its own materials, Space Age alone | Of those, not in `Grado_ABCS` | With `wood` brought in |
|---|---|---|---|
| Nauvis | 211 items and fluids | 7 | |
| Vulcanus | 202 | 98 | 12 |
| Gleba | 206 | 7 | |
| Fulgora | 188 | 101 | 19 |
| Aquilo | 20 | 4 | |
| A space platform | 169 | 87 | 12 |

**The pack's own pack is still made from its planet's materials on Vulcanus, Gleba, Aquilo and a
platform. On Fulgora it is not.**

- **Wood is the gap.** Bob's `electronic-circuit` takes a `bob-wooden-board`, which takes `wood`.
  Nauvis and Gleba have trees. Vulcanus, Fulgora, Aquilo and a platform supply none, so on those
  nothing with an electronic circuit in it can be made from local material: assembling machines,
  the starter science pack and the accumulator among the 98, 101 and 87.
- **Fulgora also lacks an oil.** With wood brought in, 19 are still missing, and
  `electromagnetic-science-pack` is one of them, with `supercapacitor` and `superconductor`.
  Space Age builds them on the ocean's `heavy-oil`. Here they need `angels-liquid-naphtha` and
  `angels-liquid-fuel-oil`, which Fulgora cannot start. With crude oil brought in as well, 11 are
  left.
- **What is left everywhere** is the vanilla oil fractions and their barrels, which the pack
  makes nowhere, and the beacon and the modules above the first tier, which have Bob's recipes.
  `carbon` and `ammonia` are among the 7 and the 4 for the same reason as the fractions.

Wood, naphtha and fuel oil can all be made on Nauvis, and Angel's has a barrel for both fluids.
Whether shipping them is a nuisance or a wall is play, and it is the bridge question's evidence,
not its answer.

### Not covered

- **Play.** Nothing was crafted, researched, shipped or launched.
- **Amounts and rates**, and whether a chain is practical. The overhaul can make ores from stone
  and water, which is why a surface with little on it still counts hundreds of items.
- **Below the joins.** `Grado_ABC`'s own chains were followed by the script and are not listed.
- **The overhaul's own technologies.** 55 of the pack's 1,204 technologies that are not hidden or
  disabled did not come out as researchable. One is `captive-biter-spawner`. Of the other 54, 52
  are the same in the base-only dump, and two, `bob-quality-module-4` and `-5`, exist only with
  Space Age. None was chased: they may be the script not knowing a source, and base only they
  are #27's.
- **Weights and rocket capacity**, so whether a given item can be lifted.
- **A 2.1 build of any of it.**

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
unchanged. *Checked 2026-10-01 (#44, #83): that reading used the `version=2.0` listing only. Over
the union of both listings, two more attempts are in the 2.1 listing alone, and neither has been
assessed: `angels_space_age_galore` (`JTnadrooi`, `0.9.0`, 2.1, first released 2026-09-30, 9
downloads) and `industrial-worlds` (`Szentigrade`, `0.0.10`, 2.1, 2026-10-01, 46 downloads), which
declares `! angelbob-spaceage-rebalance` and `! BobsAngelsSpaceAge`. So "two" is four at 2.1. Both
are #31's; see the #83 note under the AngelBob finding in* `docs/catalogue/Grado_ABC.md`. *Both
were assessed 2026-10-01 (#91); see* Four bridges, not two *below.*

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

**Four bridges, not two: assessed 2026-10-01 (#91).** The two #83 found in the 2.1 listing alone
have entries under *Candidates, not members*, next to #31's two. Side by side, with each row from
the entry it summarises and dated there:

| | `angelbob-spaceage-rebalance` | `BobsAngelsSpaceAge` | `angels_space_age_galore` | `industrial-worlds` |
|---|---|---|---|---|
| **Read on** | 2026-09-24 (#31) | 2026-09-24 (#31) | 2026-10-01 (#91) | 2026-10-01 (#91) |
| **Served on the declared 2.0 line** | yes, `1.1.42` | yes, `0.0.3` | no, 2.1 only | no, 2.1 only |
| **Mods it brings from outside the chain** | eighteen, on line `2.0` | none | four | two |
| **`!` against chain members** | none | none | six, through `angels_galore` | none |
| **Excludes** | `BobsAngelsSpaceAge` | - | - | `angelbob-spaceage-rebalance`, `BobsAngelsSpaceAge` |
| **Approach** | merges Angel's and Bob's with Space Age across a set of community planets | adds Angel's ores to three Space Age planets | merges Angel's, without Bob's, with Space Age | moves Angel's and Bob's off Nauvis onto a planet of their own |
| **Recommendation** | reconsider | reconsider | do not add | reconsider |

How the two new ones push on the rule, stated without resolving it:

- **`angels_space_age_galore` does not reach the rule.** It cannot be installed beside `Grado_ABC`:
  `angels_galore`, which it requires, declares `!` against `bobores`, `bobassembly`,
  `bobelectronics`, `bobtech`, `bobrevamp` and `extendedangels`, all `Grado_ABC` members. Its four
  extras are the author's own Galore mods and library.
- **`industrial-worlds` bends the rule less than the heavier #31 candidate and tests the promise
  more.** Two libraries come with it, unnamed, so the pack would list two members - `space-age` and
  `industrial-worlds` - and a player installs three more mods than now. Its job, like
  `BobsAngelsSpaceAge`'s, is separation rather than merging, and it separates further, keeping the
  whole overhaul on a world of its own. #10 read any bridge as failing the promise; this one tests
  that reading hardest. It is also 2.1 only, `0.0.x`, and has 46 downloads.

So the options #31 holds are four bridges or none, and one of the four is out on the metadata
alone. **Nothing here is decided either**; #10's ruling below stands, and which option, if any, is
Truls's.

**How each one pushes on the rule, stated without resolving it:**

- **`angelbob-spaceage-rebalance` breaks the rule outright.** It is the more serious mod by every
  measure — current within three days of this reading, fifteen times the downloads, on 2.1 — and it
  is not a one-mod addition. Its eight mandatory extras, plus itself and `space-age`, would make
  `Grado_ABCS` a **ten-member pack** against `Grado_ABCX`'s one. Seven of the eight are community
  planet content and its graphics, the eighth, `PlanetsLib`, is the library they share, and those are
  content decisions nobody has taken. *(Ten extras and twelve members until 2026-09-23 (#10), when
  the game showed that `space-age` pulls in `quality` and `elevated-rails` itself.)* *(Qualified
  2026-10-04 (#118): it requires them; a disabled one is refused, not enabled. See* What the portal
  actually returns*.)* It also requires
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
promise first. *"The two" were #31's bridges. #91 assessed two more on 2026-10-01; the ruling was
made before they were found, and `industrial-worlds`, which separates rather than merges, is the
one it may not cover. See* Pressure on the one-mod-per-branch rule.
