# Catalogue: `Grado_ABCS`

`Grado_ABC` plus the Space Age expansion. The pack holds **one member**, `space-age`, and it is the
only member of any of the five packs that is not a mod on the portal — it is part of the game, sold
as a DLC and installed with it. That makes this the one pack whose contents cannot be verified by
the method every other entry in this catalogue uses. *Measured 2026-10-04 (#118), by the other
method: the pack loaded on Factorio 2.0.77 with Space Age, 104 mods validated beside `space-age`,
`quality` and `elevated-rails`, all `2.0.77`. A load, not a play session. See
`docs/loads/Grado_ABCS-2026-10-04.md`.*

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-22** and is reproduced from the fetched data rather than retyped, except where a later
date is given inline. *Until 2026-10-07 (#172) this paragraph listed each later note; each carries
its own date.*

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
  2026-10-04 (#118): the chain loads beside Space Age with no error from the game, which is still
  not compatibility in play.* *Superseded 2026-09-22 by #7 and #8 and 2026-09-23 by #9, which
  changed the three lower lists to 87 named members. Re-read 2026-09-24 (#61) for those 87, latest
  release each: still no `! space-age` and no mandatory `space-age`; sixteen declare it optionally,
  ten of them `Grado_ABC` members. The hidden members were not re-read.*
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
Age, not integrated with it (`GLOSSARY.md`, *Promise*), so no bridge was added; the reasons are
under *Pressure on the one-mod-per-branch rule* below.

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
else could take `space-age` before the expansion shipped. `base` is reserved the same way by the
same owner, and `quality` too; `elevated-rails` is reserved by `Quezler` rather than by the same
account, which is a curiosity rather than a fact this pack depends on.

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
below, and the game has now confirmed the `quality` and `elevated-rails` lines. The 2.1 build is
still unread, and the play session is still #29's.*

One consequence is worth naming rather than leaving implicit. Space Age ships as three mods, not
one: `space-age`, `quality` and `elevated-rails` are distinct names, which the portal's three
separate reservations confirm and which `angelbob-spaceage-rebalance` demonstrates by declaring all
three as mandatory dependencies. Whether `space-age` alone pulls the other two in cannot be answered
from the portal.

**It can from the game, and it does.** `data/space-age/info.json` in the installed game, version
`2.0.77`, read 2026-09-23, declares `base >= 2.0.0`, `elevated-rails >= 2.0.0` and
`quality >= 2.0.0`, with `factorio_version` `2.0`. So the other two are hidden mandatory
dependencies of this member, the same shape as the ones `docs/catalogue/Grado_ABC.md` found, and #10
ruled not to name them in the pack's list. This is a reading of 2.0.77; a 2.1 build was not
available to read.

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

#### Names it shares (2026-10-20, #331)

*Traced 2026-10-20 (#331):* named in *Names members both define*, below: a member's definition
replaces its own for 21 names, and its own replaces `bobores`' for 3; for 3 recipes its definition
stands with a patch from Angel's queue merged in. `quality`, which it requires and which has no
entry, is named there too, for 4 recipes.

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

*Closed 2026-10-20 (#31), in its `docs/decisions.md` entry.* The promise now fails a mod that
merges or relocates and passes a *coexistence fix* (`GLOSSARY.md`), and the one-mod-per-branch rule
counts what a player installs. On that reading, and by their authors' own descriptions, all four
fail: `angelbob-spaceage-rebalance` and `angels_space_age_galore` merge, and `BobsAngelsSpaceAge`
and `industrial-worlds` relocate. So the open questions their recommendations leave to Truls are
answered, and the recommendations stand as written. The four were re-read 2026-10-20 and no
assessment moved: `angelbob-spaceage-rebalance` is at `1.2.18` (2.1) and `1.1.43` (2.0), both
2026-10-15, with the same eight mandatory mods and 4,066 downloads; `BobsAngelsSpaceAge` still
`0.0.3`, 263 downloads; `angels_space_age_galore` `1.0.2`, 2.1 only, 56 downloads;
`industrial-worlds` `0.0.12`, 2026-10-17, 2.1 only, 76 downloads. The same day's sweep found mods
#4's, #6's and #83's searches missed, coexistence fixes among them; #335 assesses them.

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

The first eight are the ones this mod names; the last ten arrive through them.
`muluna-utility-constants` is the one of the ten it does not list at all. None of the eighteen was
assessed as a mod - each would need an entry of its own if the pack took them, and several of the
ten are buildings or content in their own right, by their titles. **With it, this pack's closure is
122 mods against 103 without**, and the pack's effective floor rises from `base >= 2.0.74`
(`miniloader-redux`) to **`>= 2.0.76`**, set by this mod itself. The resolve found every member and
no constraint violated.

**Does `Grado_ABC` need any change to accommodate it? No.** With it added, no pick anywhere in the
lower closure moved version, no constraint between the picks was violated, and every requirement it
places on the ABC side is already met. **25 of its 52 optional dependencies are already in the
chain's closure**, and the resolve checked each range. Twenty are named members: `alien-biomes`,
`angelsaddons-cab`, `angelsaddons-mobility`, `angelsaddons-storage`, `angelsinfiniteores`,
`bobenemies`, `bobequipment`, `bobgreenhouse`, `bobinserters`, `bobmining`, `bobores`,
`bobvehicleequipment`, `bobwarfare`, `DiscoScience`, `FNEI`, `helmod`, `RateCalculator`,
`reskins-angels`, `reskins-bobs` and `Todo-List`. Five are hidden: the three
`angelsaddons-mobility-graphics-*` packages, `alien-biomes-graphics` and `reskins-library`. What it
would change is this pack, not the one below.

**What was not measured.** The 2.1 line: `1.2.17` names the same eight at higher minimums
(`Paracelsin >= 1.9.2`, `PlanetsLib >= 1.21.3` among them), but the chain does not resolve on a
2.1 target yet, so its 2.1 closure is unread. Whether it loads beside the chain is #29's kind of
question, and it has not been asked. `rso-mod`, an ABC member that controls ore placement, was not
checked against a mod that redistributes ores across planets.

**Alternatives considered.** `BobsAngelsSpaceAge`, below, which this mod declares incompatible
(`! BobsAngelsSpaceAge >= 0.0.3`), and doing nothing, which #10 chose. No third bridge was found;
#6's search and #4's before it are the ones behind that claim, not a new one. *Two more were found
2026-10-01 (#83) in the 2.1 listing alone and are assessed below (#91). `industrial-worlds`
declares `! angelbob-spaceage-rebalance`; this mod declares nothing about either.* *Found
2026-10-20 (#31): a third existed when this was written. A sweep of names, titles and summaries
over both listings found `TIMSABA`, a merge by its own summary, on 2.0 since 2026-05-15. These
searches did not report it; how they missed it is not recorded. #335 assesses it, with the
coexistence fixes the sweep also found, and corrects this claim where else it stands.*

**Recommendation: reconsider:** whether this pack should carry a bridge at all, once #29 shows
whether the unintegrated pack plays - and only together with the promise, which a bridge fails.
#10's ruling stands until then. If the bridge is ever wanted, this is
the stronger mod by every measure taken: current on both lines within two days of this reading, 72
releases, nearly fifteen times the other's downloads. Its cost is eighteen third-party mods, most of
them planets and planet content. How it pushes on the one-mod-per-branch rule depends on what the
rule counts. Named the way #10 named `quality` and `elevated-rails` - hidden mandatory members stay
unnamed - the pack would list two members, `space-age` and this mod, with the eighteen unnamed.
Counted by what a player installs, it adds nineteen. Which reading the rule means is Truls's.

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
out Angel's eight extra metals. Created 2026-09-30, the day of its one release. A source repository
is linked, `https://github.com/JTnadrooi/Project-Galore`, and was not read, so everything below is from the `info_json` of each mod and this
mod's description.

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
target (`kry_stdlib` `2.2.21`), so it would not raise that floor. *Noted 2026-10-06 (#158): the
record of that high is* Effective Factorio floor *in `docs/porting-notes.md`, measured 2026-09-23.
`CLAUDE.md` only repeats it.*

**Against the promise: one of the two of the four that do not merge, by their own accounts - but it
moves the overhaul.** Its stated goal is to "install multiple large overhaul ecosystems without
turning Nauvis into an uncontrolled mixture of all of them", and "the goal is not to flatten the
overhaul packs into vanilla Space Age". That is separation, and on its face it is nearer "the
planets and the overhaul run side by side" than the unintegrated pack, where Angel's and Bob's
rewrite Nauvis itself. Against that: it gets there by rewriting the overhaul. Angel's and Bob's
geology is suppressed on Nauvis, their science recipes are rebuilt where needed, dedicated `iw-ab-*`
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
`Grado_ABCS` one definition replaces the other without a log line. *Traced 2026-10-05 (#134):
for about half of them it is not one or the other but a mix. See* Which member defines each
shared name.

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

*Traced 2026-10-20 (#331):* a trace of the data stage finds 26 of the 29 and the `resource`
`tungsten-ore`, and both differences are explained in *Names members both define (2026-10-20,
#331)*, below.

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
nothing speaks to it, and the three remnants, which a reskin makes. *Traced 2026-10-15 (#141),
read from source: no line skips Bob's particle. `bobores` `2.1.2` makes it in `data`, from its
`data.lua` lines 70 to 72, through `boblibrary` `2.1.0`'s `generate_data_stage`
(`ore-functions.lua` lines 547 to 551), which creates `<ore>-particle` for every ore that names
none, with no check for Space Age. Space Age `2.0.77` defines a particle of the same name and type
in its own `data` (`prototypes/particles.lua` line 656). That Space Age's replaces Bob's is
inferred from the 2.0.77 load order, which runs shorter dependency chains first and then sorts by
name (the API docs' data-lifecycle page), applied to the `info.json` files of both chains: both
are two deep, and `bobores` sorts before `space-age`. No changelog line or comment speaks to the
particle.*

"Holds" says which definition the `Grado_ABCS` dump has: **the overhaul's** when the prototype
is the same as in the base-only dump, field for field, **Space Age's** when it is the same as in
Space Age alone, and **mixed** when it is neither, with what differs. "Stage" is the member's own
stage: `data` is `data.lua`.

*Since 2026-10-12 (#139) the 29 names and the "Holds" column are `dump-shared-names.ps1` in
`vendor/grado-factorio-tools/scripts`, given the four dumps: base `911970612`, Space Age alone,
base-only `Grado_ABC` and
`Grado_ABCS`. Run that day it prints 29 names and, for what the pack holds, 12 the overhaul's,
one Space Age's, two that are the same in both and 14 mixed, which is what the table below has,
row for row. It lists a name under its prototype type, so the four the table under* Names both
define *calls entities are a `transport-belt`, an `underground-belt`, a `splitter` and a
`battery-equipment`. The member, the file and the "Deliberate?" column are read from source and
no script makes them.*

| Name | Member, file and stage | Holds | Deliberate? |
|---|---|---|---|
| items `turbo-transport-belt`, `turbo-underground-belt`, `turbo-splitter` | `boblogistics`, `prototypes/item/belt.lua` from line 71, `data`. Defined without a check, so it replaces Space Age's | the overhaul's | yes, by the rename below |
| entities of the same three names | `boblogistics`, `prototypes/entity/belt.lua` from line 291, `data` | mixed: Bob's entity, with a heating energy and Space Age's frozen graphics that `boblogistics` adds itself | yes: lines 760 to 781, under `feature_flags["freezing"]` and `if mods["space-age"]` |
| recipes of the same three names | `boblogistics`, `prototypes/recipe/belt-recipe.lua`, `data` | mixed: Bob's recipe in the category `pressing`. Which line sets the category was not traced. *Traced 2026-10-15 (#141), read from source in `boblogistics` `2.1.1`: lines 348 to 351, under `if mods["space-age"]`, in `data`. No changelog line names `pressing`* | yes, by the rename below |
| corpses `turbo-transport-belt-remnants`, `turbo-underground-belt-remnants`, `turbo-splitter-remnants` | `reskins-bobs`, `prototypes/entity/logistics/belt-entities.lua`, `data`, through `reskins-library`, which copies a base remnant and names it `<entity>-remnants` | the overhaul's | no check for Space Age. Line 12 picks the name `turbo` by `boblibrary`'s version, so it follows Bob's rename |
| item, recipe, equipment and technology `battery-mk3-equipment` | `bobequipment`, `prototypes/item/equipment.lua` 128, `recipe/equipment.lua` 70, `equipment/equipment.lua` 214 and `technology/equipment.lua` 148, `data`. No check | the overhaul's, all four | yes, by its changelog |
| item `carbon` | `bobplates`, `prototypes/item/resource.lua` 4, `data`. No check; lines 247 to 250 give it Space Age's icon `if mods["space-age"]` | the overhaul's: hidden, because Angel's replaces it | yes |
| recipe `carbon` | `bobplates`, `prototypes/recipe/resource-recipe.lua`, `data`. Lines 1 to 12, `if mods["space-age"]`: Space Age's recipe is renamed `bob-carbon-from-acid`. Line 14 on: Bob's own `carbon` | mixed: Bob's recipe, differing from base only in `allow_productivity` | yes |
| item `tungsten-ore` | `bobores`, `prototypes/tungsten-ore.lua`, made by `boblibrary`'s ore function from `data.lua` line 71 | mixed: Angel's icon, name and subgroup on Space Age's item | yes: see under the table |
| particle `tungsten-ore-particle` | base only, `boblibrary`'s `create_particle` (`ore-functions.lua` 413) | **Space Age's** | not traced: which line skips Bob's particle. *Traced 2026-10-15 (#141): see the paragraph above the table* |
| item `tungsten-plate` | `bobplates`, `prototypes/item/plates.lua` 168: `if not data.raw.item["tungsten-plate"]`, so Space Age's is kept | mixed: Space Age's item with the overhaul's icon, name, order and subgroup | yes, by the check |
| recipe `tungsten-plate` | `bobplates`, `prototypes/recipe/plates-recipe.lua`, `data`. Line 189, `if not mods["space-age"]`: its own. Otherwise line 225: Space Age's recipe, with `bob-powdered-tungsten` for `tungsten-ore` | mixed: Space Age's recipe with that ingredient, and hidden | yes |
| item `tungsten-carbide` | `bobplates`, `prototypes/item/alloys.lua` 105: the same check; lines 121 to 125 move Space Age's item to Bob's subgroup | mixed, as `tungsten-plate` | yes |
| recipe `tungsten-carbide` | `bobplates`, `prototypes/recipe/alloy-recipe.lua`, `data`. Line 124, `if not mods["space-age"]`: its own. Otherwise line 145: Space Age's, with the same ingredient swap | mixed: rewritten by Angel's, and hidden | yes |
| item `lithium-plate` | `bobplates`, `prototypes/item/plates.lua` 149: the same check | mixed: Space Age's item with the overhaul's icon, order and subgroup | yes |
| recipe `lithium-plate` | `bobplates`, `prototypes/recipe/plates-recipe.lua` 189 to 223: its own only `if not mods["space-age"]` | mixed: Space Age's recipe in Angel's category | yes |
| fluid `ammonia` | `bobrevamp`, `prototypes/rocket-fuel.lua` 1 to 12, `data`, when Bob's hydrogen, oxygen and nitrogen exist. No check | the overhaul's: hidden, because Angel's replaces it | yes, by its changelog |
| recipe categories `electronics`, `electronics-with-fluid` | `bobassembly`, `prototypes/assembly-electronics.lua` 30 to 39, `data`, behind its setting `bobmods-assembly-electronicmachines` | both: a category is only a name, so the two definitions are the same | **not shown**: no check in the file and no changelog line. The mod does declare `? space-age` |

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
  `bobplates` declare `space-age` as an optional dependency, which loads them after it, and so
  does `bobassembly`. `bobrevamp` and `bobores` do not name it in their `info.json`, and the dump
  has `bobrevamp`'s `ammonia` all the same.
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

*Found 2026-10-15 (#141): one of the 29 is held by load order alone, as inferred.
`tungsten-ore-particle` is Space Age's because Space Age's definition replaces Bob's; see the note
above the table.*

One change #128 listed comes from the second mechanism and is not Angel's: Space Age's `lithium`
recipe loses `lithium-brine` and gains 5 `bob-lithium-chloride` in `bobplates`
(`prototypes/recipe/plates-recipe.lua` lines 227 and 228). The dump has `angels-solid-lithium` in
that place. Which line turns one into the other was not traced. *Traced 2026-10-15 (#141), read
from source: `angelsrefining` `2.0.4`, `prototypes/override/refining-override-water-treatment.lua`
line 234, `OV.global_replace_item("bob-lithium-chloride", "angels-solid-lithium")`, inside
`if mods["bobplates"]` (line 226) and with no check for Space Age. It queues the swap, and
`OV.execute()` at its `data-updates.lua` line 53 applies it to every recipe, so in `data-updates`:
the third mechanism above. The changelog line nearest it is `0.12.2`'s "Hide Bob's salt, brine,
and lithium chloride (769)", and no line of a 2.0 release names lithium or Space Age.*

Not traced, beside the three named above: the stage in which each Angel's override is applied,
beyond that they are queued in its `data-updates.lua` and `data-final-fixes.lua`; and the Bob's
and Angel's releases on the 2.1 line. *The three were traced 2026-10-15 (#141), in the notes on
the particle above the table, on the turbo belts' recipe row and on `lithium` above.*

### Names members both define (2026-10-20, #331)

**493 prototype names are defined by two or more mods of `Grado_ABCS`, Space Age's among them.**
*Measured* by a traced run of the data stage on Factorio 2.0.77 on 2026-10-20, with `space-age`
named and the members at the releases of `Grado_ABC`'s run. A further 574 base-game names are
defined again by a mod, counted and not listed (`GLOSSARY.md`, *Shared name*), and 352 are defined
twice by one mod. Every name is in `docs/traces/Grado_ABCS-2026-10-20.md`. 463 of them are
`Grado_ABC`'s, in `docs/catalogue/Grado_ABC.md`, *Names members both define (2026-10-20, #331)*,
which also says what *mix* and *replaced* mean here and what the trace cannot see.

**34 rows are this pack's own:** 30 names `Grado_ABC` does not have, and 4 recipes, `carbon`,
`lithium-plate`, `tungsten-carbide` and `tungsten-plate`, that Space Age defines first here, where
in `Grado_ABC` `bobplates` does. They are below, one row per sequence of mods. No pair in them
raises a ticket. Three pairs fail the test in `Grado_ABC`'s section, and each was read:

- `space-age` > `reskins-bobs`, the three turbo belt corpses. *Read from source*
  (`reskins-library` `2.3.3`, `prototypes/functions/functions.lua`, lines 150 to 157):
  `reskins.lib.create_remnant` copies the vanilla belt's remnants under the turbo name, and
  `reskins-bobs` `2.3.8` then gives them Bob's belt graphics. A corpse's graphics are not a loss
  #331's ruling tickets.
- `quality` > `angelspetrochem`, `rocket-fuel-recycling`. *Read from source*: `angelspetrochem`
  `2.0.3`'s `prototypes/override/recycling.lua` lists the item `rocket-fuel` for self-recycling
  (line 61), and so makes its recycling recipe again through `quality`'s function for it.
- `bobores` > `space-age`, the item and resource `tungsten-ore` and its particle, where the
  expansion stands. Here the earlier mod is the one that knows: `bobores` `2.1.2` keeps the name
  beside Space Age and drops its own placement when Space Age is loaded, and its particle follows
  from the ore, both *Read from source* in #134's rows, above.

**Against #134's 29 names.** The trace has 27 names that `space-age` defines and a member defines
too: 26 of #134's 29, and one it did not list. Both differences are explained:

- **Not in the trace:** the items `tungsten-plate`, `tungsten-carbide` and `lithium-plate`.
  *Read from source*, `bobplates` `2.1.1`: it defines each only `if not data.raw.item[...]`
  (`prototypes/item/plates.lua`, lines 149 and 168; `prototypes/item/alloys.lua`, line 105), and
  beside Space Age it changes Space Age's item in place instead, which is not a definition. #134
  compared dumps, which see the change.
- **In the trace, not in #134's table:** the `resource` `tungsten-ore`, defined by `bobores`
  through `boblibrary` and then by `space-age`, whose definition stands. #128's comparison had no
  row for resources, and #134's `tungsten-ore` row already describes this one.

The trace reads definitions, and #134 found about half of the 29 to be a mix by what later stages
change in place. Its *replaced* rows below do not contradict that: they say the earlier definition
is gone, not what the game ends with.

| Defined fresh by, in order | Result | Names | Types | Which | Grade |
|---|---|---|---|---|---|
| `bobmodules` | mix: `bobmodules`'s definition, patched by Angel's queue | 3 | recipe 3 | `bob-quality-processor`, `bob-quality-processor-2`, `bob-quality-processor-3` | Inferred |
| `quality` | mix: `quality`'s definition, patched by Angel's queue | 3 | recipe 3 | `quality-module`, `quality-module-2`, `quality-module-3` | Inferred |
| `space-age` | mix: `space-age`'s definition, patched by Angel's queue | 3 | recipe 3 | `lithium-plate`, `tungsten-carbide`, `tungsten-plate` | Inferred |
| `space-age` > `boblogistics` | replaced: `space-age`'s gone | 9 | item 3, recipe 3, splitter 1, transport-belt 1, underground-belt 1 | `turbo-splitter`, `turbo-transport-belt`, `turbo-underground-belt` | Inferred |
| `space-age` > `bobequipment` | replaced: `space-age`'s gone | 4 | battery-equipment 1, item 1, recipe 1, technology 1 | `battery-mk3-equipment` | Inferred |
| `bobores` > `space-age` | replaced: `bobores`'s gone | 3 | item 1, optimized-particle 1, resource 1 | `tungsten-ore`, `tungsten-ore-particle` | Inferred |
| `space-age` > `reskins-bobs` | replaced: `space-age`'s gone; a copy of the vanilla belt's remnants | 3 | corpse 3 | `turbo-splitter-remnants`, `turbo-transport-belt-remnants`, `turbo-underground-belt-remnants` | Read from source |
| `space-age` > `bobassembly` | replaced: `space-age`'s gone | 2 | recipe-category 2 | `electronics`, `electronics-with-fluid` | Inferred |
| `space-age` > `bobplates` | replaced: `space-age`'s gone; 1 then patched by Angel's queue | 2 | item 1, recipe 1 | `carbon` | Inferred |
| `quality` > `angelspetrochem` | replaced: `angelspetrochem` makes it again for the item `rocket-fuel`, through `quality`'s own function | 1 | recipe 1 | `rocket-fuel-recycling` | Read from source |
| `space-age` > `bobrevamp` | replaced: `space-age`'s gone | 1 | fluid 1 | `ammonia` | Inferred |

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
  what they list in Space Age alone, and `rso-mod`, as its source reads, takes over placing all of
  it but `scrap`.* *Counted on a generated map 2026-10-12 (#140): see*
  Counted on a generated map. *That `rso-mod` placed it is inferred.*
- **Which mod made each change.** The dumps show the result. Where a mod is named above, its
  prototype names say so. *Traced 2026-10-05 (#134) for the 29 shared names: see* Which member
  defines each shared name. *The other changes are still untraced.* *Five more traced 2026-10-15
  (#141), each in a note where it is named: the turbo belts' recipe category, `lithium`'s
  ingredient, `tungsten-ore-particle`, Gleba's six decoratives and the disabled
  `kovarex-enrichment-process`.*
- **A 2.1 build of any of it.**

## What each planet places (2026-10-05, #133)

A reading of prototypes and of one member's source. No map was generated: what a planet looks like
is #29's play session. *A map was generated 2026-10-12 (#140), with no play: see*
Counted on a generated map.

The overhaul replaces the vanilla ores, and Space Age's planets are generated from settings that
name resources. This is what those settings hold. Read on 2026-10-05 from two data dumps on
Factorio **2.0.77**, made through the shared harness's `Invoke-HarnessDump`: Space Age alone
(prototype list checksum `3295867752`) and the staged `Grado_ABCS` (`2316474952`, the recorded
load's), with `space-age`, `quality` and `elevated-rails` at `2.0.77` and the members at the
releases in `docs/loads/Grado_ABC-2026-10-04.md`. `rso-mod` is `7.0.26`. *Added 2026-10-07 (#175)
from this file's header, which until then said #133 took this section "from `rso-mod`'s staged
source as well".*

### How it was read

For each planet, `map_gen_settings` was compared between the two dumps: the autoplace controls,
the entities, tiles and decoratives it lists, the cliff, the territory units and the property
expressions. Every name in the pack's settings was then looked up in the pack's dump. A resource is
an entity in a planet's list whose prototype type is `resource`.

*Since 2026-10-12 (#139) this comparison is `dump-planets.ps1` in
`vendor/grado-factorio-tools/scripts`, given the pack's dump
and `-Against` the dump of Space Age alone. Run that day on `2316474952` and `3295867752`, it
prints what the first two columns of the two tables below hold: the resources of each planet, 6
and 39 on Nauvis, and 12 autoplace controls against 47 there with the four named gone. It prints
the property expressions that differ, eight, two and two, and Gleba's 73 decoratives against 79 with
the six names. It finds no name the dump lacks, and 45 of the 47 resource prototypes at a
probability of `0`. The third column is read from `rso-mod`'s source and no script makes it.
The comparison with the base-only dump was not made again.*

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
*Run 2026-10-12 (#140): see* Counted on a generated map. *What the third column names was
counted on its planet, but for the three names that are not resources and for `clowns-ore1` and
`clowns-resource1`, of which this pack's square has none. The `infinite-` resources are there
beside them. That `rso-mod` is what placed them is still inferred.*

### Nauvis

| | Space Age alone | `Grado_ABCS`, the planet's list | `rso-mod`'s table, as read |
|---|---|---|---|
| Resources | 6: `coal`, `copper-ore`, `iron-ore`, `stone`, `uranium-ore`, `crude-oil` | 39: `angels-ore1` to `6`, `angels-fissure`, `angels-natural-gas`, `clowns-ore1` to `9`, `clowns-resource1` and `2`, `coal`, `crude-oil`, and 18 `infinite-` twins: of the 15 ores, the two Clowns resources and `coal` | the Angel's and Clowns ores, `angels-fissure`, `angels-natural-gas`, `coal`, `crude-oil`, and **`stone` and `tungsten-ore`** |
| Autoplace controls | 12 | 47: the four of `copper-ore`, `iron-ore`, `stone` and `uranium-ore` are gone and 39 are added. Not the 39 resources: `coal` and `crude-oil` were there, and `cold` and `hot` are among the new | |
| Other entities | `fish`, `big-rock`, `big-sand-rock`, `huge-rock` | `fish`, three Angel's fish, 31 rocks of `alien-biomes`, Angel's three gardens, three trees and the puffer nest | |

The planet's settings are the same as in the base-only `Grado_ABC` dump (`2195323740`), key for
key. So on Nauvis Space Age changes nothing in the prototypes. `crude-oil` gives
`angels-liquid-multi-phase-oil`, and the `infinite-` ores need a fluid to mine.

Three things in `rso-mod`'s Nauvis table, all read from the source:

- **It still names `iron-ore`, `copper-ore` and `uranium-ore`**, which are not resources in the
  pack. Lines 583 to 585 of `mainconfig.lua` mean to remove the first two and `stone` when Angel's
  is loaded, but they clear `config["copper-ore"]` where the entries are under `config.nauvis`. The
  mod checks each name against the game, logs `Resource not available` and skips it. As the
  source reads, that is where the line in the load records comes from, and it would answer their
  "why". The names in the log are the ones the table keeps. It was not run with the lines
  changed. *Run 2026-10-12 (#140), with the lines as they are: the three names are logged and
  no entity of those names is in the count.*
- **`stone` is a resource in this pack and not in `Grado_ABC`**: Space Age's, kept for Gleba. So
  the entry that is skipped base only is valid here, and the table would place stone patches on
  Nauvis. It agrees with the recorded loads: `Resource not available: stone` is in `Grado_ABC`'s
  log and not in this pack's. *Counted 2026-10-12 (#140): 1,255 `stone` entities on Nauvis in
  this pack and none in `Grado_ABC`.*
- **`tungsten-ore` on Nauvis.** `bobores.lua` adds it when a resource of that name exists with an
  autoplace (lines 120 and 121). Base only there is none, as Angel's leaves no Bob's ore on the map.
  Here there is one, Space Age's, in the mining category `hard-solid`. So the table would place
  Space Age's tungsten ore on Nauvis. *Counted 2026-10-12 (#140): 847 `tungsten-ore` entities on
  Nauvis in this pack and none in `Grado_ABC`.* *Ruled 2026-10-16 (#146), for this bullet and
  the two above: under `rso-mod` in the `Grado_ABC` catalogue.*

The `infinite-` resources are in the planet's list and in none of `rso-mod`'s tables (searched for
`infinite-` in `resourceconfigs/`: one hit, in the table for another mod). What places them, if
anything, was not found. That is the same base only. *Found 2026-10-12 (#140): they are placed,
in both packs, 2,875 entities here and 3,265 in `Grado_ABC`, and `rso-mod`'s control script has
the lines for it, read from its source. The search above looked in `resourceconfigs/` only. See*
Counted on a generated map.

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
  still name them. Which member removes them from the list was not traced. *Traced 2026-10-15
  (#141), read from source: `alien-biomes` `0.7.4`, `prototypes/decorative/vegetation.lua` lines
  49 to 53, in `data` (required from its `data.lua` line 29). For each of the ten plants its
  `vegetation-base.lua` lists, it removes `green-<plant>` from the decorative list of any planet
  that has it, with no check for Space Age or for the planet, and six of the ten are on Gleba's.
  The line that would have cleared the prototypes' autoplace is commented out (line 48), under a
  comment that Space Age fails to load with it. The mod's description says "When used with Space
  Age, only Nauvis will be affected", and its changelog for `0.7.0` the same: this loop does
  otherwise.* *2026-10-16 (#284): `0.8.0`'s file is `0.7.4`'s, byte for byte, so it has the
  same loop at the same lines, read from source. Whether Space Age's 2.1 build still lists the
  six on Gleba was not read. Reported to the author; where and how is under `alien-biomes` in
  the `Grado_ChangingBase` catalogue.*

What a resource gives changed in one: `crude-oil` gives `angels-liquid-multi-phase-oil`, on Aquilo
as on Nauvis. The other eight give what they give in Space Age alone.

### Does anything name something that does not exist?

**In the prototypes, no.** Every entity, tile, decorative, autoplace control, cliff and territory
unit named in the five planets' settings is in the pack's dump, and so is every name in a property
expression. Every item or fluid a listed entity gives when mined is there too.

**In `rso-mod`'s table, three**: `iron-ore`, `copper-ore` and `uranium-ore` on Nauvis, as above.
It logs them and goes on. *Run 2026-10-12 (#140): logged in the run, and no entity of the three
names was counted.*

### Which planets can supply the overhaul's ores

**Nauvis only, as the prototypes and the table read.** No Angel's or Clowns resource is in the
list of Vulcanus, Gleba, Fulgora or Aquilo, and `rso-mod`'s tables for Vulcanus, Gleba and Aquilo
hold Space Age's resources and nothing else. *Counted 2026-10-12 (#140): no `angels-` or
`clowns-` name in the generated square of any of the four. Vulcanus has `infinite-coal`, which is
the
overhaul's twin of a resource Vulcanus lists.*

What the other planets do place are things the overhaul's recipes take, under names the two share
or that both use:

- **Vulcanus:** `tungsten-ore`, which is also the name of Bob's ore item; `coal`; and from its
  rocks `stone`, `iron-ore`, `copper-ore` and `sulfur`. Its lichen trees give `carbon`, which is
  hidden in the pack and which no recipe takes.
- **Gleba:** `stone`, and `iron-ore` and `copper-ore` from the stromatolites.
- **Fulgora:** `scrap`, and `stone` and `holmium-ore` from its rocks. Its ocean is `heavy-oil`,
  which is hidden in the pack and which no recipe takes.
- **Aquilo:** crude oil as `angels-liquid-multi-phase-oil`, the feed of Angel's oil refining.
  `lithium-brine` is still placed, and the one recipe that takes it is hidden.

Whether those are enough to build on each planet is the next section's.

### Counted on a generated map (2026-10-12, #140)

Measured on Factorio **2.0.77**. A map of each pack was created with no player in it, a fixed
square of each planet was generated, and the resource entities in it were counted by name. It
counts what is placed. Whether the amounts make a start that can be played is #27's and #29's.

**How the count was made.** The staged `Grado_ABC`, base only, and the staged `Grado_ABCS` with
`space-age`, `quality` and `elevated-rails` at `2.0.77`. Both steps of each run print the recorded
loads' prototype list checksum, `2195323740` and `2316474952`, so the sets are those loads', with
the members at the releases in `docs/loads/Grado_ABC-2026-10-04.md` and
`rso-mod` at `7.0.26`. Each was run through the shared harness (`load-harness-lib.ps1` in
`vendor/grado-factorio-tools/scripts`) with one throwaway mod beside it, `grado-count` `0.0.1`,
which is not in this repository and not on the portal. Every mod setting was at its default.

- `--create` with `--map-gen-seed 140140`, then `--benchmark` on that save for 700 ticks.
- At tick 30 the throwaway mod creates the surface of every planet that has none, asks for the
  chunks within 24 of the origin's chunk and forces them: 49 by 49 chunks, 2,401, which is 1,568
  by 1,568 tiles around the origin.
- At tick 120 and again at tick 600 it counts every entity of the type `resource` in that square.
  On every surface all 2,401 chunks were generated, and the two counts are the same.
- The staged sets were the same before and after, by file count and bytes: 18,616 files in
  `Grado_ABC` and 18,617 in `Grado_ABCS`.

**Nauvis, both packs.** The seed of the surface is `140140` in both.

| Resource on Nauvis | `Grado_ABC` | `Grado_ABCS` |
|---|---|---|
| `angels-fissure` | 9 | 9 |
| `angels-natural-gas` | 12 | 9 |
| `angels-ore1` | 2,823 | 2,209 |
| `angels-ore2` | 943 | 849 |
| `angels-ore3` | 1,810 | 2,320 |
| `angels-ore4` | 1,752 | 1,310 |
| `angels-ore5` | 2,599 | 1,243 |
| `angels-ore6` | 752 | 1,350 |
| `clowns-ore1` | 202 | 0 |
| `clowns-ore2` | 790 | 1,526 |
| `clowns-ore3` | 920 | 157 |
| `clowns-ore4` | 270 | 348 |
| `clowns-ore5` | 591 | 1,312 |
| `clowns-ore6` | 370 | 398 |
| `clowns-ore7` | 470 | 270 |
| `clowns-ore8` | 0 | 591 |
| `clowns-ore9` | 360 | 370 |
| `clowns-resource1` | 1,497 | 0 |
| `clowns-resource2` | 881 | 470 |
| `coal` | 3,507 | 2,728 |
| `crude-oil` | 9 | 20 |
| `infinite-angels-ore1` | 453 | 407 |
| `infinite-angels-ore2` | 190 | 181 |
| `infinite-angels-ore3` | 282 | 415 |
| `infinite-angels-ore4` | 277 | 242 |
| `infinite-angels-ore5` | 386 | 135 |
| `infinite-angels-ore6` | 58 | 172 |
| `infinite-clowns-ore1` | 47 | 0 |
| `infinite-clowns-ore2` | 137 | 243 |
| `infinite-clowns-ore3` | 149 | 29 |
| `infinite-clowns-ore4` | 29 | 85 |
| `infinite-clowns-ore5` | 118 | 239 |
| `infinite-clowns-ore6` | 67 | 47 |
| `infinite-clowns-ore7` | 48 | 29 |
| `infinite-clowns-ore8` | 0 | 118 |
| `infinite-clowns-ore9` | 38 | 67 |
| `infinite-clowns-resource1` | 291 | 0 |
| `infinite-clowns-resource2` | 161 | 48 |
| `infinite-coal` | 534 | 418 |
| `stone` | 0 | 1,255 |
| `tungsten-ore` | 0 | 847 |
| **All** | **23,832** in 37 names | **22,466** in 37 names |

What #133 read and did not find comes to:

- **`stone` is placed on Nauvis in `Grado_ABCS`, 1,255 entities, and not in `Grado_ABC`.** As
  #133 read from `rso-mod`'s source. Base only there is no resource of that name to place.
- **`tungsten-ore` is placed on Nauvis in `Grado_ABCS`, 847 entities, and not in `Grado_ABC`**,
  where there is no resource of that name either. Also as #133 read.
- **The `infinite-` resources are placed, in both packs**: 3,265 entities under 17 names in
  `Grado_ABC` and 2,875 under 16 in `Grado_ABCS`. #133 found nothing that places them because it
  searched `resourceconfigs/` and not the control script. Read from the source on 2026-10-12,
  `rso-mod` `7.0.26`, `control.lua` lines 659 to 697: where it spawns an ore and a resource named
  `infinite-` and the ore's name exists, it spawns that in the ore's place when the spot's
  strength is over the setting `rso-infinite-ore-threshold`. That the count's `infinite-`
  entities come from those lines is inferred from the two together; no run was made with the
  lines changed.

**Nothing was placed under the names `rso-mod` logs as not available.** No `iron-ore`,
`copper-ore` or `uranium-ore` in either pack, and no `stone` in `Grado_ABC`. The count is of
resource entities, and none of those is a resource prototype in the pack that logs it, so this
shows only that the skip left nothing behind under those names. Both runs logged the lines the
recorded loads have: three names twice in `Grado_ABCS`, four names twice in `Grado_ABC`.

Six names that are resources in both dumps are in one pack's square and not the other's:
`clowns-ore8` and its `infinite-` twin
in `Grado_ABCS` alone, `clowns-ore1`, `clowns-resource1` and their twins in `Grado_ABC` alone.
This is one seed and one square, so a name with no entity
here is not a name the pack does not place.

**The other four planets, `Grado_ABCS`.** All four were created and generated by the script,
with no play:

| Planet | Seed of the surface | Chunks generated | Resources counted |
|---|---|---|---|
| Vulcanus | `1249952931` | 2,401 of 2,401 | `calcite` 1,602, `coal` 2,592, `infinite-coal` 367, `sulfuric-acid-geyser` 73, `tungsten-ore` 10,158 |
| Gleba | `3215223111` | 2,401 of 2,401 | `stone` 1,598 |
| Fulgora | `2967719150` | 2,401 of 2,401 | `scrap` 7,490 |
| Aquilo | `3111940012` | 2,401 of 2,401 | `crude-oil` 33, `fluorine-vent` 45, `lithium-brine` 25 |

Each planet has the resources of its list and of `rso-mod`'s table, and Vulcanus has one more:
`infinite-coal`, which is in neither. No `angels-` or `clowns-` name was
counted off Nauvis.

**What a count does not say** is which mod placed an entity. Of the 47 resource prototypes in
the dump, 45 have a probability of `0`, `scrap` has its own and one has no autoplace. So that
`rso-mod` placed everything here but Fulgora's `scrap` is inferred from that and from its
source. It was not measured: no run was made without
`rso-mod`. *2026-10-17 (#307): runs without `rso-mod` were made for the Bob's, Angel's and
MadClown's members, not for the pack. They are in `rso-mod`'s entry in the `Grado_ABC`
catalogue.*

### Not covered

- **A generated map.** Nothing here was seen in the game. In particular, whether `rso-mod` places
  `stone` and `tungsten-ore` on Nauvis is read from its source. *Generated and counted 2026-10-12
  (#140): see* Counted on a generated map. *Both are placed on Nauvis in `Grado_ABCS`.*
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

**Where the script is looser than the game**, so that a "can be made" here is an upper bound:

- A trigger that asks for mining an entity or capturing a nest, or that a script sets, is taken
  as met. Only the triggers that ask for an item, a fluid, a built entity or a platform are
  checked.
- A resource counts as supplied without asking what can mine it. Space Age's `tungsten-ore`
  needs a drill of the category `hard-solid`, and the `infinite-` ores need a fluid.
- What an enemy drops counts whatever planet the enemy is on, and so does what an item gives
  when launched in a rocket.
- A machine counts as buildable when its item can be made, without its own surface condition.
  That condition is recorded in the walks instead.
- A captive nest, which is not built from an item, is taken as there once
  `capture-robot-rocket` can be made.

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

*Since 2026-10-12 (#139) the walk is `dump-walk.ps1` in `vendor/grado-factorio-tools/scripts`. The
script that made this
section lived in a session's scratch directory and is gone, so that one is written again from
the rules above; its header has them, with where it had to choose. Run that day, Factorio
2.0.77, on the dumps `3295867752` and `2316474952`:*

- *Its self-test gives the known answer for Space Age alone: 275 technologies, the six packs and
  330 of 340 recipes. It then removes each of its eight source rules in turn. With six of them
  removed the answer changes. With the pump's fluid or the steam removed it does not, so a dump
  of Space Age alone does not show those two rules, and the self-test says so.*
- *Run on the pack with `-Against` the dump of Space Age alone, it prints the table under*
  Result *as it stands: 340, 317 and 23; 330 and 306; 268, 6 and 1. It names the same six
  technologies and the same one dead end, the labs `lab`, `biolab` and `bob-lab-2`, and 55 of
  1,204 technologies not reached. It reports all twelve packs the labs take and not the six
  alone; all twelve can be made.*
- *The table under* From its own materials *it does not print figure for figure: see the note
  there. The tables under* The walks *were written by hand from the first script's output, and
  no script prints them.*

*"Is gone" is of 2026-10-12 and #139. The files are gone and their text is not (2026-10-13,
#248): see the note under* From its own materials.

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
and their barrels, which the overhaul replaces, and three under names Space Age uses: `carbon`,
`tungsten-carbide` and `tungsten-plate`, as #128 found. The hidden `carbon` is Bob's recipe;
Space Age's own is there as `bob-carbon-from-acid` (#134). Nothing a science pack needs is lost with
them. The six technologies are `oil-processing`, `advanced-oil-processing`, `coal-liquefaction`,
`sulfur-processing`, `kovarex-enrichment-process` and `turbo-transport-belt`.

### Dead ends

**One among Space Age's own technologies and recipes, and no science pack needs it.** The
overhaul's own technologies were not chased; see *Not covered*.

- **The technology `captive-biter-spawner` cannot be researched.** Its prerequisites are Space
  Age's: `cryogenic-science-pack`, `biter-egg-handling` and `kovarex-enrichment-process`. The
  last is disabled in the pack, as it is in the base-only dump. So the recipe
  `captive-biter-spawner`, which only that technology unlocks, cannot be unlocked. Under #132's
  own rule it would count, since its technology is not hidden. What is lost is building a captive
  nest from parts. `biter-egg` is still made in a nest captured with `capture-robot-rocket`,
  which `captivity` unlocks, so `promethium-science-pack` is not affected. Which member disables
  `kovarex-enrichment-process` was not traced, and whether the game offers a technology whose
  prerequisite is disabled was not tried. *Traced 2026-10-15 (#141), read from source in
  `Clowns-AngelBob-Nuclear` `2.0.13`: its `prototypes/technology-overrides.lua` line 31,
  `data.raw.technology["kovarex-enrichment-process"].enabled = false`, required from its
  `data-updates.lua` line 1, so in `data-updates`. The line has no condition, and no Lua in
  `Clowns-AngelBob-Nuclear`, `Clowns-Nuclear` `2.0.08` or `Clowns-Processing` `2.0.14` names
  Space Age, so it does not check for it. No other line in the staged Lua that names the
  technology sets its `enabled` or `hidden`, by a search for the name: `angelspetrochem` `2.0.3`
  hides the recipe of that name (`prototypes/override/angelspetrochem-nuclear.lua` line 105) and
  not the technology. The comment above line 31 reads "remove kovarex and remove it from
  bobingabout prereq", and the mod's description calls its enrichment chain "a far more intricate
  replacement to the Koravex Enrichment Process". From line 32 to line 73 the same file moves
  technologies that need Kovarex onto another prerequisite or off it, and `captive-biter-spawner`
  is not among them: its prerequisites are Space Age `2.0.77`'s
  (`space-age/prototypes/technology.lua` line 1916).*
  *Ruled 2026-10-15 by Truls (#147): the pack leaves it as it is, and #282 reports it to the
  maintainer of `Clowns-AngelBob-Nuclear`. The fault is that member's: by the trace above, read
  from source, it moves other technologies off Kovarex and leaves Space Age's out. So Lua in the
  pack to move `captive-biter-spawner` off Kovarex would do one member's own job, a* Patch *in*
  `GLOSSARY.md`*, and the pack carries none. The play session (#29) notes whether building a
  captive spawner is missed. Whether the game offers the technology is still not tried: it would
  bear only on pack Lua.*
  *Probed 2026-10-15 (#285), on 2.0.77 with Space Age, for #282's report and #29; the ruling
  stands. **`LuaForce::add_research` refuses both `captive-biter-spawner` and
  `kovarex-enrichment-process` in the pack.** A throwaway probe mod, run through the load
  harness in `vendor/grado-factorio-tools` beside the set staged on 2026-10-08 (with
  `Clowns-AngelBob-Nuclear` `2.0.13`), worked in `on_init` on the player force. First it marked
  researched the enabled technologies in Kovarex's own prerequisite chains, which held no
  disabled one, and called `add_research` on Kovarex: **`false`**. Then it did the same for
  `captive-biter-spawner`'s chains, stopping at a disabled technology; the one it stopped at was
  Kovarex. **`add_research` returned `false`** and the research queue stayed empty. Writing
  `research_queue` with either technology left it empty too, which the 2.0.77 API documents for
  "one whose prerequisites are not fulfilled". At runtime `captive-biter-spawner` is enabled, not
  `visible_when_disabled` and not researched; Kovarex is disabled, not `visible_when_disabled`
  and not researched. On Space Age alone, both are enabled, neither is `visible_when_disabled`
  and neither is researched at the start; there both calls returned `true` and each technology
  in turn became the current research. `MOX-nuclear-power` in the pack and
  `advanced-combinators` on Space Age alone, each with an enabled, unresearched prerequisite, were
  refused too. Inferred, not measured: that Kovarex's being disabled is why it is refused (its
  `research_trigger` was not read), and so that no route gets the spawner researched in play, from
  the two refusals and from `LuaTechnology::enabled`, "Can this technology be researched?".
  2.0.77's `LuaForce` has no attribute saying whether the research queue is enabled, so that was
  not read. What the research screen shows is not seen: a headless run has no GUI.*
  *Measured 2026-10-15 (#287), on 2.0.77 with Space Age: **`add_research` refuses Kovarex while
  it is disabled and accepts it once only its `enabled` is set to `true`.** That narrows the first
  half of #285's "Inferred, not measured" to the step from this difference to a cause. The data
  dump of this pack beside Space Age (prototype list checksum `2316474952`)
  gives `kovarex-enrichment-process` no `research_trigger`: it has a `unit` (600 × 30 s;
  automation, logistic, chemical and space science), `enabled: false`, and the four prerequisites
  #285's probe saw. A second throwaway probe, through the same harness beside the same staged set,
  ran three calls in `on_init` on the player force, each from an empty research queue. First,
  with Kovarex's prerequisite chains researched (no disabled technology among them), `add_research`
  on Kovarex while disabled returned `false` and left the queue empty. Second, with Kovarex's
  `enabled` set to `true` and nothing else changed, the same call returned `true` and Kovarex
  became the current research. Third, with Kovarex then marked researched and
  `captive-biter-spawner`'s other prerequisite chains researched (no disabled technology among
  them), `add_research` on the spawner returned `true` and it became the current research.
  Still inferred, from the first call's refusal and the missing `research_trigger`: that no route
  gets the spawner researched in play while Kovarex is disabled. What the research
  screen shows is still not seen. #147's ruling stands.*
  *Regraded 2026-10-15 (#292), by the rule of that day that a tested cause is* Measured *(in
  `GLOSSARY.md`): **disabling Kovarex is why `add_research` refuses it, measured**, limited to
  that call on the player force, in the set staged 2026-10-08, on 2.0.77 with Space Age. #287's
  record meets each condition. One thing changed, Kovarex's runtime `enabled`, from `false` to
  `true`. Of the state the probe recorded for both technologies, `enabled` and `researched`, it is
  the only one that differs between the first call's state after and the second's before. Both
  calls ran in one load, each from an empty research queue and with no prerequisite of Kovarex
  unresearched, and between them the probe's source writes only `enabled` and an empty research
  queue, which was already empty. The result changed from `false` to `true`. Still inferred: that
  no route gets the spawner researched in play while Kovarex is disabled.*

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
science. Its prerequisite is `angels-tungsten-smelting-1`, which has six of its own. The foundry's
own recipe is unchanged: 50 `tungsten-carbide` among its parts, made on Vulcanus only, and its
technology is still triggered by crafting `tungsten-carbide`. Vulcanus's `tungsten-ore` does feed
Angel's chain: three recipes take it, `angels-processed-tungsten`, `angels-solid-tungsten-oxide` and
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
`water`. **Nothing differs.** The script followed 14 recipes for this pack, the ten in the table
and four more that make `spoilage`, `biter-egg` and the egg again. 13 are as in Space Age alone, and
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
`angels-solid-lithium`, which comes only from `clowns-ore2`, an ore of Nauvis. The icebergs
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

*This table is not reproduced (2026-10-13, #248): neither `dump-walk.ps1` nor any rule #242
tried gives its first column. The record is the table of 2026-10-13, in the note of #251
below. Under this one, a sentence in italics dated 2026-10-13 gives the record's figure
beside the one cited.*

*"Is not reproduced" is of #248. Later the same day (#253) the scripts that made the table
printed it again, every figure: see the note of #253 below. The record
is as it was.*

| Surface | Made from its own materials, Space Age alone | Of those, not in `Grado_ABCS` | With `wood` brought in |
|---|---|---|---|
| Nauvis | 211 items and fluids | 7 | |
| Vulcanus | 202 | 98 | 12 |
| Gleba | 206 | 7 | |
| Fulgora | 188 | 101 | 19 |
| Aquilo | 20 | 4 | |
| A space platform | 169 | 87 | 12 |

**In `Grado_ABCS` each surface's own science pack is still made from that surface's materials on
Vulcanus, Gleba, Aquilo and a platform. On Fulgora it is not.**

- **Wood is the gap.** Bob's `electronic-circuit` takes a `bob-wooden-board`, which takes `wood`.
  Nauvis and Gleba have trees. Vulcanus, Fulgora, Aquilo and a platform supply none, so on those
  nothing with an electronic circuit in it can be made from local material: assembling machines,
  the starter science pack and the accumulator among the 98, 101 and 87.
  *The record has 101, 107 and 89 (2026-10-13, #248).*
- **Fulgora also lacks an oil.** With wood brought in, 19 are still missing, and
  `electromagnetic-science-pack` is one of them, with `supercapacitor` and `superconductor`.
  Space Age builds them on the ocean's `heavy-oil`. Here `superconductor` needs
  `angels-liquid-fuel-oil`, which Fulgora cannot start: every recipe for it takes crude oil, a
  nutrient pulp or a vegetable oil. `angels-liquid-naphtha`, which `electrolyte` needs, can be
  made there, from coal that `coal-synthesis` makes. With crude oil brought in as well, 11 are
  left.
  *The record has 22 where this has 19. Where this has 11 it has 14, with
  `angels-liquid-multi-phase-oil`, the pack's crude oil, brought in beside wood (2026-10-13,
  #248).*
- **What is left after that** is the vanilla oil fractions and their barrels, which the pack
  makes nowhere, and the beacon and the modules above the first tier, which have Bob's recipes.
  `carbon` and `ammonia` are among the 7 and the 4 for the same reason as the fractions.
  *The record has 7 on Nauvis, 8 on Gleba and 5 on Aquilo. `carbon` is in each of those three
  lists and `ammonia` in Aquilo's (2026-10-13, #248).*

Wood and fuel oil can both be made on Nauvis, and Angel's has a barrel for the fluid.
Whether shipping them is a nuisance or a wall is play, and it is the bridge question's evidence,
not its answer.

*Made again 2026-10-12 (#139) by `dump-walk.ps1` with `-BroughtIn wood`, on the same two dumps.
**The counts are not the table's, and the findings are the same.***
*Counted another way since 2026-10-13 (#251): the table in the note of #251 below.*

| Surface | Made from its own materials, Space Age alone | Of those, not in `Grado_ABCS` | With `wood` brought in |
|---|---|---|---|
| Nauvis | 210 items and fluids | 7 | 7 |
| Vulcanus | 207 | 102 | 15 |
| Gleba | 209 | 8 | 8 |
| Fulgora | 207 | 108 | 23 |
| Aquilo | 23 | 5 | 5 |
| A space platform | 175 | 89 | 14 |

*Why the counts differ is not known. The first script is gone, and the prose above does not say
which entities it took as being on a planet, where a pump with a fluid of its own may stand, or
whether it counted what is mined. The new script's header says what it does with each. What both
tables show:*

- *Each surface's own science pack is made from its own materials on Vulcanus, Gleba, Aquilo and
  a platform, in Space Age alone and in the pack. On Fulgora it is made in Space Age alone and
  not in the pack.*
- *Wood is the gap on Vulcanus, Fulgora and a platform: 102, 108 and 89 fall to 15, 23 and 14
  with wood brought in.*
- *With wood, Fulgora still lacks `electromagnetic-science-pack`, `supercapacitor` and
  `superconductor`. With `angels-liquid-multi-phase-oil`, the pack's crude oil, brought in as
  well, 15 are left where the paragraph above has 11, and those three are no longer among them.*

*"The first script is gone" is of 2026-10-12 and #139. The files are gone and their text is
not (2026-10-13, #248): see the note of #248 below.*

*Looked for 2026-10-12 (#242), and not found: **no rule tried gives the first table's six
figures**, 211, 202, 206, 188, 20 and 169. Measured on Factorio 2.0.77, on the dump of Space Age
alone, `3295867752`, where the first column differs with no overhaul in it, with
`dump-walk.ps1` at the tools commit `41b5488`. A script outside both repositories, kept as a
comment on #242, ran that script's walk of own materials with one of its rules changed at a time.
Each row but the last three is the count the script makes, of what a counted recipe gives, under
that rule:*

| Rule changed | Nauvis | Vulcanus | Gleba | Fulgora | Aquilo | A platform | Off by, summed |
|---|---|---|---|---|---|---|---|
| The first table, #132 | 211 | 202 | 206 | 188 | 20 | 169 | |
| None: the script's own rules | 210 | 207 | 209 | 207 | 23 | 175 | 37 |
| A tree is not put on a planet by its autoplace control | 204 | 207 | 204 | 207 | 23 | 175 | 42 |
| A plant is not | 210 | 207 | 106 | 207 | 23 | 175 | 134 |
| A nest is not | 210 | 207 | 206 | 207 | 23 | 175 | 34 |
| A nest's drops count on every surface | 211 | 208 | 209 | 208 | 24 | 176 | 40 |
| A plant's harvest counts on every surface | 224 | 224 | 209 | 224 | 33 | 192 | 110 |
| No steam where there is water | 210 | 207 | 209 | 207 | 23 | 175 | 37 |
| Nothing from what an item spoils or burns into | 209 | 207 | 209 | 207 | 23 | 175 | 38 |
| A recipe's surface conditions are not read | 214 | 211 | 214 | 210 | 24 | 176 | 53 |
| A hidden recycling recipe does not count | 203 | 202 | 202 | 73 | 21 | 173 | 132 |
| A recipe must be enabled or unlocked by a technology | 210 | 207 | 209 | 207 | 23 | 175 | 37 |
| Counted with what is supplied and what follows from it | 211 | 208 | 210 | 209 | 28 | 176 | 46 |
| Counted less what is supplied | 201 | 198 | 198 | 199 | 20 | 171 | 35 |
| Counted with what follows from the supply, less the supply | 202 | 198 | 199 | 200 | 21 | 172 | 36 |

*Where a pump with a fluid of its own may stand was not varied: the dump of Space Age alone has
no such pump. Nor was what a planet's settings list. The last three rows change what is counted and
not the walk.*

*Six of those rules were then tried in every combination, with four ways of counting: 256 in
all. The six are the tree, the nest by its control, the nest's drops on every surface, what an
item spoils or burns into, the surface conditions and the recycling recipes. The other four
were left out: the two for plants, each being over a hundred off alone, and steam and the
technology rule, which moved no figure alone. **None of the 256 gives the six figures.**
The two closest are 27 off, summed over the six surfaces: surface conditions not read, counted
less what is supplied, with or without what follows from the supply. They give 205, 202, 203,
202, 21, 172 and 206, 202, 204, 203, 22, 172.*

*What the search does show:*

- *Five of the six figures are each given by some combination, and no combination gives more
  than two of them together. Vulcanus's 202 is given by 32 of the 256, Aquilo's 20 by 24,
  Nauvis's 211 by 14, a platform's 169 by 8 and Gleba's 206 by 6.*
- ***Fulgora's 188 is given by none.** In the 256, with the hidden recycling recipes counted
  Fulgora comes to between 199 and 214, and without them to between 58 and 79. Inferred from
  that: the first script differed on Fulgora in something the 256 do not hold.*
- *A recycling recipe gives back what a surface already supplies, an ore for one, so the script
  counts as made a thing
  that is only mined. Counted less what is supplied, Aquilo is the first table's 20.*
  *"Counts as made" is of 2026-10-12 and the script at `41b5488`. At `ad3bcce` (2026-10-13,
  #251) it does not: see the note below.*

*So the difference is still not explained. The three findings under the first table do not rest
on it: the note above has them holding on the script's own rules. `dump-walk.ps1` is not
changed.* *"Is not changed" is of 2026-10-12 and #242. It was changed after, in the tools
repository: see the note below.*

*Counted again 2026-10-13 (#251), with `dump-walk.ps1` at the tools commit `ad3bcce`, where
the pin moved from `41b5488`. Truls ruled 2026-10-12, on grado-factorio-tools#126, what the walk
of own materials counts, and grado-factorio-tools#127 changed the script to it. Measured on
Factorio 2.0.77, on the same two dumps, `2316474952` (`Grado_ABCS`) and `3295867752` (Space Age
alone), from the repository root:*

```
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/dump-walk.ps1 <Grado_ABCS dump> -Against <Space Age dump> -BroughtIn wood
```

*Beside each figure is the second table's, of 2026-10-12 at `41b5488`:*

| Surface | Made from its own materials, Space Age alone | 2026-10-12 | Of those, not in `Grado_ABCS` | 2026-10-12 | With `wood` brought in | 2026-10-12 |
|---|---|---|---|---|---|---|
| Nauvis | 202 items and fluids | 210 | 7 | 7 | 7 | 7 |
| Vulcanus | 198 | 207 | 101 | 102 | 14 | 15 |
| Gleba | 199 | 209 | 8 | 8 | 8 | 8 |
| Fulgora | 200 | 207 | 107 | 108 | 22 | 23 |
| Aquilo | 21 | 23 | 5 | 5 | 5 | 5 |
| A space platform | 172 | 175 | 89 | 89 | 14 | 14 |

*What is counted now, in the words of the script's header: "every item and fluid the surface can
then have, less what it supplies. A thing the surface supplies is not counted as made, whichever
recipe gives it back". Steam where there is water is counted, "and so is what an item had there
spoils into, burns into or gives when launched, whether or not a recipe gives it". A thing is
"not in" the pack "when this dump's surface cannot have it at all, supplied or made". The
second table counted what a counted recipe gives, which took in a supplied thing wherever some
recipe gave it back and left out steam where the walk adds it with no recipe, both by
grado-factorio-tools#126; that is why the figures changed. The first column is the row "Counted with
what follows from the supply, less the supply" of the table of rules above, which is the count
the script now makes.*

*Two names leave the lists the script prints under its tables, which begin "Not to be had on"
where they began "Not made on": `carbon` on Vulcanus and `heavy-oil` on Fulgora, by a run of
the script as it stood at `41b5488` 2026-10-13, on the same dumps. The other four lists hold
the same names. The first table is still not reproduced.*

*The three findings under the second table, read against the new lists:*

- *The first holds. The script's table of science packs has each surface's own pack made from
  its own materials on Vulcanus, Gleba, Aquilo and a platform, in Space Age alone and in the
  pack, and `electromagnetic-science-pack` on Fulgora in Space Age alone and not in the pack.*
- *The second holds, with other figures: 101, 107 and 89 fall to 14, 22 and 14 with wood
  brought in.*
- *The third holds, with another figure. With wood, `electromagnetic-science-pack`,
  `supercapacitor` and `superconductor` are among Fulgora's 22. With
  `-BroughtIn wood,angels-liquid-multi-phase-oil`, 14 are left on Fulgora where that note has 15
  and the findings under the first table 11, those three are not among them, and the other
  five surfaces' counts do not move. The one name fewer is `heavy-oil`.*

*Decided 2026-10-13 (#248), by Truls: **the table above, of 2026-10-13, is the record, and the
difference from the first table is not closed as looked for and not found.** The first and the
second table stay as history, each with its date, and the first is not reproduced. Why, and
what #253 does and where it ends: `docs/decisions.md`.*

*Where the first script's text is, measured 2026-10-13: the transcript of the session of
2026-10-05 holds the calls that wrote `fx.py`, `walk.py`, `gen132.py` and `local132.py`, and
they are comments on #248, extracted and not run. `why.py`, which the call that made
`solved.pkl` imports, was not extracted. Two calls of 09:11 UTC import `local132` without
naming its file; the pre-PR review of this note found them, and they are a third comment
there. Read and not run, they print the first table's second and third columns.*

*Measured that day before a figure of the record was put beside a sentence under the first
table: the command of the note of #251, at the tools commit `ad3bcce`, pwsh 7.6.6, on the same
two dumps, printed the eighteen figures of the table of 2026-10-13, and with
`-BroughtIn wood,angels-liquid-multi-phase-oil` 14 for Fulgora.*

*Read from source, in `local132.py` as first written and not run: it counts what the surface
supplies together with what it makes from it. The ruling on grado-factorio-tools#126 has a
supplied thing as not made, so the first table is not the record whatever #253 finds.*

*Run 2026-10-13 (#253): **the first table is reproduced, and its difference from the record
is three rules.** "Why the counts differ is not known" (#139), "the difference is still not
explained" (#242), "the first table is still not reproduced" (#251) and "the first is not
reproduced" (#248), in the notes above, are each of their day. No figure of the record is
changed, and `dump-walk.ps1` is not.*

*Measured that day with Python 3.13.14, on the Factorio 2.0.77 dumps `3295867752`,
`2316474952` and the base-only `Grado_ABC`'s `2195323740`, copied from the dump cache. The
scripts of 2026-10-05 were rebuilt by running again, in the transcript's order, the calls
that are comments on #248, with `why.py`, which was found in the same transcript. Rebuilt,
they print 211, 202, 206, 188, 20 and 169 for Space Age alone. For "Of those, not in
`Grado_ABCS`" they print 7, 98, 7, 101, 4 and 87, with `wood` brought in 12, 19 and 12, and
the 11 of the paragraph under the table. The commands, what they printed and the scripts are
comments on #253.*

*Read from the two sources, the first script as last patched and `dump-walk.ps1` at the tools
commit `ad3bcce`, ten rules were found to differ; the table of them is in #253's first
comment. Measured on the dump of Space Age alone, with the first script's walk given each of
`dump-walk.ps1`'s rules in turn: seven of the ten move no figure, alone or with the other
nine, and these three together give the record's row.*

- ***What is counted.** The first script counted what a surface supplies with what it makes.
  The record leaves the supply out.*
- ***Steam.** The first script gave steam where water is supplied. `dump-walk.ps1` gives it
  wherever there is water, also water a recipe makes.*
- ***The machine.** In the first script a recipe counts on a surface only where a machine of
  its category may stand, by that machine's surface conditions. `dump-walk.ps1` asks for no
  machine there.*

| Surface | First table | What is counted | Steam | The machine | The record |
|---|---|---|---|---|---|
| Nauvis | 211 | -9 | 0 | 0 | 202 |
| Vulcanus | 202 | -10 | 0 | +6 | 198 |
| Gleba | 206 | -11 | 0 | +4 | 199 |
| Fulgora | 188 | -9 | +1 | +20 | 200 |
| Aquilo | 20 | -7 | +1 | +7 | 21 |
| A space platform | 169 | -4 | +1 | +6 | 172 |

*Each middle column is that rule changed alone, and the three add up on every surface.*

*The other two columns, measured on the two dumps with probes the pre-PR reviewer wrote,
run again by the session that wrote this note: with the three rules the first script's walk
gives 7, 101, 8, 107, 5 and 89 not in the pack, and 7, 14, 8, 22, 5 and 14 with `wood`
brought in, which are the record's. Of the three, the machine rule alone moves the second
column: left out, it gives the first table's 7, 98, 7, 101, 4 and 87.*

***Fulgora's 188 is the machine rule.** #242 varied no rule of that kind, and none of its
256 gave 188. Off Nauvis the rule refuses the category `captive-spawner-process`, whose one
machine is `captive-biter-spawner`, and the one recipe of that category gives `biter-egg`.
Twenty names are lost to the rule on Fulgora, `coal`, `carbon`, `explosives` and
`military-science-pack` among them. Measured with the reviewer's probe: with that one
category refused and no other, Fulgora is 188 and the same twenty are lost. A platform's six
are five from that category and `rocket-part`, whose category `rocket-building` is refused
there, its machine being the `rocket-silo`.*

*The names, measured by the reviewer's probe, which reads `dump-walk.ps1`'s own list: on
each of the six surfaces of the dump of Space Age alone, what that script counts and what the
first script's walk holds with the ten rules changed are the same names, none in one and not
the other.*

*Not shown by this:*

- *The seven rules on `Grado_ABCS`, past the second column. With each of the seven left out
  that column is the record's. The third column and the pack's own counts were not tried so,
  and the pack has pumps with a fluid of their own, which the dump of Space Age alone has
  not.*
- *A rule beyond the ten. They are those found by reading, and a difference that moves no
  figure on these dumps does not show in equal counts. The pre-PR review found three more by
  reading: the chunks are taken by prototype name and not by what they give when mined, the
  planets are five by name, and the surface properties' defaults are read from the pack's
  dump for both walks. Measured by its probes, none of the three differs on these two dumps.*

*Seen, and Truls's to rule: read from source, `dump-walk.ps1`'s walk of own materials reads
no machine's surface conditions. Measured on the dump of Space Age alone: the recipe
`biter-egg` takes no ingredient and has no surface condition of its own, its one machine may
stand only where the pressure is 1000, and `dump-walk.ps1` counts `biter-egg` as made on all
six surfaces, a platform among them, and `rocket-part` on a platform. So the record counts
them, and what follows from them, on surfaces where the machine's own surface conditions do
not hold.*

***Counted again 2026-10-14 (#257)**, with `dump-walk.ps1` at the tools commit `8a4f66f`,
where the pin moved from `ad3bcce` (#277 moved it there, for the resolver, and it holds both).
Truls ruled 2026-10-13, on grado-factorio-tools#132, that the walk of own materials reads a
machine's surface conditions, and grado-factorio-tools#134 applied it, merged as `15c0c9f` and
`a844a7d`. Measured on Factorio 2.0.77, pwsh 7.6.6, on the same two dumps, `2316474952`
(`Grado_ABCS`) and `3295867752` (Space Age alone), from the repository root:*

```
pwsh -NoProfile -File vendor/grado-factorio-tools/scripts/dump-walk.ps1 <Grado_ABCS dump> -Against <Space Age dump> -BroughtIn wood
```

*This table is the record since 2026-10-14 (`docs/decisions.md`). Beside each figure is the
table of 2026-10-13's, at `ad3bcce`, which was the record until then:*

| Surface | Made from its own materials, Space Age alone | 2026-10-13 | Of those, not in `Grado_ABCS` | 2026-10-13 | With `wood` brought in | 2026-10-13 |
|---|---|---|---|---|---|---|
| Nauvis | 202 items and fluids | 202 | 7 | 7 | 7 | 7 |
| Vulcanus | 192 | 198 | 98 | 101 | 12 | 14 |
| Gleba | 195 | 199 | 7 | 8 | 7 | 8 |
| Fulgora | 180 | 200 | 101 | 107 | 19 | 22 |
| Aquilo | 14 | 21 | 4 | 5 | 4 | 5 |
| A space platform | 166 | 172 | 87 | 89 | 12 | 14 |

*They changed because the walk now reads a machine's surface conditions, as ruled; nothing
else in `dump-walk.ps1` changed between the two commits but its header and its self-test,
which gained a case for it (`git diff ad3bcce 8a4f66f`, read in the tools repository). The
figures are the ones the body of #257 printed from the tools pull request's branch on
2026-10-13, figure for figure. In the script's table of science packs, Fulgora's column for
Space Age alone loses `military-science-pack`, and no other cell changes. The pack's own count,
by the same script given the `Grado_ABCS` dump alone, is 2,100, 1,180, 1,892, 1,190, 1,206 and
1,191 for the six surfaces in the table's order, where it was 2,100, 1,183, 1,896, 1,193, 1,209
and 1,195 at `ad3bcce` (#257's body).*

*With `-BroughtIn wood,angels-liquid-multi-phase-oil`, the same day and pin, Fulgora is 11 and
the other five surfaces do not move. The table of 2026-10-13 has 14 there.*

*"Every machine is taken as being there", in the opening paragraph of this section, was
written 2026-10-05 for #132. It held of `dump-walk.ps1` up to the tools commit `ad3bcce`, and
not of the first script, which asked for the machine, by the note of #253. Since 2026-10-14,
with the pin at `8a4f66f` (#277), the walk asks this of a machine, in the words of the script's
header (*FROM ITS OWN MATERIALS*): a recipe counts when "its surface conditions hold on that
surface, and so do those of some machine of its category or of one of its additional
categories, where any machine crafts them (ruled on #132). A machine is any prototype with
crafting categories." That #132 is the tools repository's. What it still does not ask, from the
same header (*WHERE THAT IS LOOSER THAN THE GAME*): "Whether a machine can be built from the
surface's materials is not asked, only whether it may stand there. So a machine that is hidden,
or that no item places, speaks for its category like any other." A recipe whose category no
prototype crafts counts, and so does a recipe crafted by hand on a platform, since a character
has no surface conditions. The header claims an upper bound "as far as machines go", and not of
the whole count: what a surface supplies is not held to it.*
*"The record" in a note dated 2026-10-13 is the table of that day, in the note of #251.*

*The note of #253, read against the new script.* *Of its three rules, **both walks now ask
for the machine**: `dump-walk.ps1`, like the first script, reads the surface conditions of the
machines of a recipe's category, read from both sources. **What is counted and steam still
differ.** The first table plus the note's columns "What is counted" and "Steam" is 202, 192,
195, 180, 14 and 166 on the six surfaces, the figures above. The second column is now the first
table's, 7, 98, 7, 101, 4 and 87, which the note of #253 measured as the one the machine rule
alone moves, and the third has the first table's 12, 19 and 12 on the three surfaces where that
table gives one. Not shown: whether the two machine rules are the same rule beyond these dumps.
By its header, `dump-walk.ps1` also takes a recipe's additional categories, and counts a recipe
whose category no prototype crafts; that is read from source and was not compared with the first
script's.*

*`biter-egg` off Nauvis: its one machine, `captive-biter-spawner`, may stand only where the
pressure is 1000, and the walk no longer counts `biter-egg` on any surface but Nauvis. Measured
the same day by the script's `-SelfTest`, whose last case asks it: on each of the two dumps it
printed "biter-egg is counted from its own materials on [nauvis] -- ok". On the dump of
`Grado_ABCS` the self-test as a whole fails, as it is written for Space Age alone, and that line
does not depend on the rest, both read from the self-test's source at `8a4f66f`. This does not
answer #147.*

*The findings under the first table, read against the new lists:*

- *The first holds. In the script's table of science packs, each surface's own pack is made
  from its own materials on Vulcanus, Gleba, Aquilo and a platform, in Space Age alone and in the
  pack, and `electromagnetic-science-pack` on Fulgora in Space Age alone and not in the pack.*
- *The second holds, and its figures are again the paragraph's own: 98, 101 and 87 fall to 12,
  19 and 12 with wood brought in. The sentence in italics under it, "The record has 101, 107
  and 89", is of 2026-10-13.*
- *The third holds, and its figures are again the paragraph's: Fulgora's 19 with wood hold
  `electromagnetic-science-pack`, `supercapacitor` and `superconductor`, and 11 are left with
  crude oil brought in as well, none of the three among them.*
- *The fourth holds: `carbon` is among Nauvis's 7 and Gleba's 7 and `ammonia` among Aquilo's 4.
  Aquilo's list does not have `carbon`, which the table of 2026-10-13's has.*

### Not covered

- **Play.** Nothing was crafted, researched, shipped or launched.
- **Amounts and rates**, and whether a chain is practical. The overhaul can make ores from stone
  and water, which is why a surface with little on it still counts hundreds of items.
- **Below the joins.** `Grado_ABC`'s own chains were followed by the script and are not listed.
- **The overhaul's own technologies.** 55 of the pack's 1,204 technologies that are not hidden or
  disabled did not come out as researchable. One is `captive-biter-spawner`. Of the other 54, 52
  are the same in the base-only dump, and two, `bob-quality-module-4` and `-5`, exist only with
  Space Age. None was chased: they may be the script not knowing a source, and base only they
  are #27's. *Chased 2026-10-18 (#144). Counted again that day at the tools commit `0125895`,
  on these two dumps, which a fresh resolve gave again: 55 of 1,204, and 52 base only, so no
  figure here changed. All 54 wait on `bob-zinc-processing`, which, read from source,
  `angelssmelting` `2.0.5` disables and `extendedangels` `0.6.9` names as a prerequisite: a
  dead end in the prototypes, not a source the walk lacks. The record is in
  `docs/catalogue/Grado_ABC.md`, under* Technologies the walk cannot reach.
- **Weights and rocket capacity**, so whether a given item can be lifted.
- **A 2.1 build of any of it.**

## Pressure on the one-mod-per-branch rule

`CLAUDE.md` says anything both branches need lives in `Grado_ABC` and each branch adds exactly one
thing. #6 was asked to report pressure on that rule, not resolve it. **This is where it is under
pressure, and the pressure is real.** *`CLAUDE.md` reworded the rule on 2026-10-20 (#31): see its
entry in `docs/decisions.md`.*

**The gap.** Adding `space-age` makes the expansion load beside Angel's and Bob's. It does not make
them one game. Issue #4 established the load-order half of this on 2026-09-21 — nothing in
`Grado_ABC`'s members or their hidden dependencies declares `! space-age`, and ten of the Bob's mods
declare it optionally — and this survey extends that check to the whole chain with the same result.
It also refines the count: **seventeen of the 117 declare `space-age` optionally, and eleven of the
seventeen are `Grado_ABC` members, not ten.** *(All three figures predate #9, which on 2026-09-23
removed `deadlock-beltboxes-loaders` and three other members and added one: after it the
`space-age`-optional counts are sixteen and ten, and the 117 is not re-derived.)* The eleventh is
`deadlock-beltboxes-loaders`, which is not a Bob's mod and so fell outside the frame #4 counted in;
the remaining six are `Grado_ChangingBase`'s `EditorExtensions`, `StoneWaterWell-ActuallyUpdated`,
`alien-biomes`, `reverse-factory` and `underground-pipe-pack`, and `Grado_NonChanging`'s
`FactorySearch`. *(Read 2026-09-22, before #8 changed that pack the same day:
`StoneWaterWell-ActuallyUpdated` is no longer a member, and the incoming `cybersyn2` and
`Waterfill_v17` were not in the frame. The count is left as measured; re-deriving it needs a ticket
nobody has filed.)* But an overhaul that replaces the ore-to-plate chain and an expansion that adds
four planets with their own ores are not integrated by resolving; they are integrated by somebody
writing the bridge. `Grado_ABCX` has no equivalent gap, because the fork declares direct Bob's
integration and is designed to sit on Nauvis.

**Two mods on 2.x attempt the bridge, and they are mutually exclusive.** Both were read 2026-09-22;
`angelbob-spaceage-rebalance` was re-read at `1.2.17` on 2026-09-23 with its mandatory list
unchanged. *Checked 2026-10-01 (#44, #83): that reading used the `version=2.0` listing only. Over
the union of both listings, two more attempts are in the 2.1 listing alone, and neither has been
assessed: `angels_space_age_galore` (`JTnadrooi`, `0.9.0`, 2.1, first released 2026-09-30, 9
downloads) and `industrial-worlds` (`Szentigrade`, `0.0.10`, 2.1, 2026-10-01, 46 downloads), which
declares `! angelbob-spaceage-rebalance` and `! BobsAngelsSpaceAge`. So "two" is four at 2.1. Both
are #31's; see the #83 note under the AngelBob finding in* `docs/catalogue/Grado_ABC.md`. *Both
were assessed 2026-10-01 (#91); see* Four bridges, not two *below.* *Added 2026-10-07 (#175) from
this file's header, which until then named the ticket of the re-read above: "the one re-read on
2026-09-23 (#10)".*

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
  planet content and its graphics, the eighth, `PlanetsLib`, is the library they share, and those
  are content decisions nobody has taken. *(Ten extras and twelve members until 2026-09-23 (#10),
  when the game showed that `space-age` pulls in `quality` and `elevated-rails` itself.)*
  *(Qualified 2026-10-04 (#118): it requires them; a disabled one is refused, not enabled. See* What
  the portal actually returns.*)* It also requires `angelsbioprocessing`, `angelspetrochem`,
  `angelsrefining`, `angelssmelting` and seven Bob's mods at specific minimum versions, all of which
  `Grado_ABC` already carries, so the ABC side costs nothing extra.
- **`BobsAngelsSpaceAge` fits the rule and is much weaker evidence.** Its whole mandatory list is
  `base >= 2.0.0`, `space-age`, `angelsrefining` and `bobplates`, the last two already ABC members,
  so it would be a genuine second-and-final addition. Against that: 251 downloads, seven months
  since its last release, still on `factorio_version` 2.0, a version number that starts with `0.0`,
  and a summary written in German. It does a narrower job — redistributing ores across three
  planets, not merging the two progressions.
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
one it may not cover. See* Pressure on the one-mod-per-branch rule. *Revisited 2026-10-20 (#31)
without #29: the promise fails relocation too, so `industrial-worlds` is covered, and a
coexistence fix passes it. See* Candidates, not members *and the #31 entry of
`docs/decisions.md`.*
