# Catalogue: `Grado_ABCS`

`Grado_ABC` plus the Space Age expansion. The pack holds **one member**, `space-age`, and it is the
only member of any of the five packs that is not a mod on the portal — it is part of the game, sold
as a DLC and installed with it. That makes this the one pack whose contents cannot be verified by
the method every other entry in this catalogue uses.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-22** and is reproduced from the fetched data rather than retyped.

The dependency list holds 3 entries: `base >= 2.0.0`, `Grado_ABC` — a pack, catalogued in
`docs/catalogue/Grado_ABC.md` — and `space-age`. **The pack is new**, so nothing was carried over,
replaced or dropped; `docs/porting-notes.md` records that.

Three findings:

- **`space-age` is not a portal mod, and the portal entry of that name is a reserved placeholder.**
  Querying it returns a deprecated 1.1 stub owned by `compilatron`, titled `[reserved]`, with 276
  downloads — the same shape as the reserved `base` entry. The dependency resolves against the
  installed expansion, not a download. See *What the portal actually returns*.
- **Nothing in the chain blocks this branch, and nothing in it requires the expansion either.**
  Checked across all 117 mods in the chain's closure — 98 distinct named members of the three lower
  packs and 19 hidden mandatory dependencies: no `! space-age` anywhere, and no mandatory
  `space-age` anywhere. **Seventeen declare it *optionally***, eleven of them `Grado_ABC` members.
  Silence is not compatibility, and this pack is where that gets tested.
- **This is where the one-mod-per-branch rule is under real pressure.** Adding `space-age` enables
  the expansion beside Angel's and Bob's; it does not make them work together. The two mods on 2.x
  that attempt that job would each be a second addition, and one of them brings ten more mods with
  it. See *Pressure on the one-mod-per-branch rule*.

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

**Ruled 2026-09-23 (#10): kept, as the pack's only member.** The pack is `Grado_ABC` beside Space
Age, not integrated with it (`CONTEXT.md`, *Promise*), so no bridge was added; reasons in
`docs/porting-notes.md`.

**Recommendation: keep.** It is what the pack is. The recommendation is forced and the entry is not
the interesting part of this file.

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
nowhere else this project currently has. **Issue #29 — load `Grado_ABCS` in Factorio once, end to
end — is not merely the last check on this pack; it is the first check on its only member.**

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

**Two mods on 2.x attempt the bridge, and they are mutually exclusive.** Both were read 2026-09-22.

| | `angelbob-spaceage-rebalance` | `BobsAngelsSpaceAge` |
|---|---|---|
| **Title** | AngelBob Space Age Rebalance | Bobs Angels Space Age Strategic |
| **Owner** | `Troublesim` | `mantrucker88` |
| **Latest** | `1.2.16`, `factorio_version` **2.1**, 2026-09-19 | `0.0.3`, `factorio_version` **2.0**, 2026-02-10 |
| **Downloads** | 3,706 | 251 |
| **Mandatory deps the chain does not already supply** | **ten**: `PlanetsLib`, `Paracelsin`, `Paracelsin-Graphics`, `planet-muluna`, `muluna-graphics`, `planetaris-dyes`, `planetaris-arig`, `planetaris-hyarion`, and `quality` and `elevated-rails`, which it names explicitly where this pack names only `space-age` | **none** |
| **Approach** | A full integration overhaul merging Angel's and Bob's with Space Age across a set of community planets | Distributes Bob's and Angel's ores across Vulcanus, Fulgora and Gleba to force interplanetary logistics |

`angelbob-spaceage-rebalance` declares `! BobsAngelsSpaceAge`, so the choice is genuinely between
them and not a question of adding both. It is already filed as issue **#31** with the full reading;
what this survey adds to that issue is the second candidate, which #31 does not have, and the
mandatory-dependency count that makes the cost concrete.

**How each one pushes on the rule, stated without resolving it:**

- **`angelbob-spaceage-rebalance` breaks the rule outright.** It is the more serious mod by every
  measure — current within three days of this reading, fifteen times the downloads, on 2.1 — and it
  is not a one-mod addition. Its ten mandatory extras, plus itself and `space-age`, would make
  `Grado_ABCS` a **twelve-member pack** against `Grado_ABCX`'s one. Seven of the ten are community
  planet content and its graphics, an eighth, `PlanetsLib`, is the library they share, and those are
  content decisions nobody has taken. The last two are `quality` and `elevated-rails`, which `space-age`
  turned out to pull in itself (read from the game on 2026-09-23), so the real figures are **eight**
  extras and a **ten-member pack**. It also requires
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
it `Grado_ABC` beside Space Age rather than merged with it, so a bridge is an addition, and additions
stay out. #31 stays open as the place to revisit that, best after #29 shows whether the unintegrated
pack is playable; taking a bridge would mean changing the promise first.
