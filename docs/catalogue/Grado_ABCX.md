# Catalogue: `Grado_ABCX`

`Grado_ABC` plus Space Extension — the SpaceX end-game, reached through `SpaceModFeorasFork`. The
pack holds **one member**, and that member is the reason the project has five packs rather than
four: its `! space-age` line is what makes this branch and `Grado_ABCS` mutually exclusive, and
therefore what forced the shared overhaul out into `Grado_ABC`.

Format and evidence rules: `docs/mod-catalogue.md`. Every portal reading below was taken on
**2026-09-22** and is reproduced from the fetched data rather than retyped, except the notes marked
*Superseded 2026-09-23 by #15*, which #15 took, and the notes dated 2026-09-24 (#43), which #43
took, and the notes dated 2026-09-24 (#58) and (#61), which those two took, and the notes dated
2026-10-01 (#39) and (#44), which those two took, and the note dated 2026-10-04 (#117), which #117
took from the pack's recorded load, and the section dated 2026-10-04 (#124), which #124 took from
data dumps and the staged source.

The dependency list holds 4 entries: `base >= 2.0.0`, `Grado_ABC` — a pack, catalogued in
`docs/catalogue/Grado_ABC.md` — `SpaceModFeorasFork`, and the `! space-age` line the pack declares
itself. **One mod, and nothing was dropped during the port**; the 1.1 `Grado_ABCX` held 56 mods and
the other 55 are accounted for under `Grado_ABC` — 45 of them as members, 10 as its drops — which
`docs/porting-notes.md` records. *The `base` line is `base >= 2.0.74` since 2026-09-24 (#58).*
*Superseded 2026-09-22 by #8 and 2026-09-23 by #9: 40 of the 55 are `Grado_ABC` members now,
`bobinserters` is `Grado_ChangingBase`'s, four are under* Ruled out after the port *there, and
`RealisticFusionPowerPort`, replacing one of the 10 drops, is ABC's 41st member.*

Four findings, and the first is the one #6 was asked to check:

- **`! space-age` is still declared, and it is not a leftover.** `SpaceModFeorasFork` `1.3.4`, the
  current release, declares it. So does every 2.x release the fork has ever made — it appeared in
  `1.3.0` on 2024-10-28, the fork's first 2.0 release, and has held across five releases and the
  twenty-three months since. **The five-pack split stands on current evidence.** See *The
  incompatibility, re-verified*.
- **The pack requires `base >= 2.1.9`** — the fork's own floor, which was **the highest in the
  project** when this was read, above the `2.1.8` `WideChests` sets for `Grado_ChangingBase`.
  **Overtaken later the same day by #8**: `cybersyn2`, added to `Grado_ChangingBase`, requires
  `base >= 2.1.12`, so this pack's effective minimum is that and the fork's 2.1.9 is no longer what
  decides it. **Superseded 2026-09-23 by #15:** the effective minimum is `base >= 2.1.20` on a
  latest-release reading, set by the hidden `kry_stdlib` `2.2.21`; see *Effective Factorio floor*
  in `docs/porting-notes.md`. That answers issue #15 for this pack, and it makes the pack's
  declared `factorio_version` `2.0` wrong for the fourth time in four
  surveys. See *The pack cannot load on the Factorio version it declares*. *(At a 2.1 target. On
  stable 2.0.77 the pack resolves; #43, 2026-09-24.)*
- **The fork is maintained, but thinly and by hand-off.** Last release 2026-07-10, two and a half
  months before this reading; its last three releases credit three different contributors — `pla`,
  `progger` and `Sectoid` — and none of them is the portal owner.
- **The fork's only Angel's-side integration is with a mod `Grado_ABC` dropped.** It declares
  `? angelsindustries` and no other `angels*` dependency at all. `angelsindustries` is 1.1-only and
  is the largest single loss in the project. See *What dropping `angelsindustries` cost this branch*.

## In the pack

### `SpaceModFeorasFork`

| | |
|---|---|
| **Title** | Space Extension Mod (Feoras Fork) |
| **Does** | Replaces "launch a rocket and win" with an end-game production tree: a few hundred rocket launches of new components, FTL research, and a final stage that builds a space-craft capable of carrying the player home |
| **Latest** | `1.3.4`, `factorio_version` **2.1**, 2026-07-10 |
| **Downloads** | 6,330 |
| **Owner** | `Feoras` |
| **Supersedes** | `SpaceMod`, *Space Extension Mod (SpaceX)* by `LordKTor`, last `1.1.3` on 2024-07-15, 105,773 downloads, `factorio_version` 1.1 |
| **Overlaps** | `space-age` (`Grado_ABCS`) |
| **Read on** | 2026-09-22 |

**Alternatives considered.** None exists. Searching the full 2.x list — 9,710 entries — for "space
extension", "spacex", "space-x" and "multiple launches" across name, title and summary returns this
mod and nothing else. `SpaceModFeorasFork` is the only Space Extension on 2.x; there is no second
fork, no rewrite, and no unrelated mod covering the same ground. The one near-miss the search
returned, `ERPC-K2-integration`, is a Krastorio 2 bridge for Expanded Rocket Payloads and does not
do this job. *Checked 2026-10-01 (#44): that list was the `version=2.0` listing only, which misses
mods released for 2.1 alone. The same four terms over the union of both listings as read that day,
10,845 mods, return the same two.*

**Recommendation: keep.** It is the only way to reach this branch's end-game, it is current within
two and a half months, and the incompatibility the whole project is built around is intact. The
download gap against `SpaceMod` — 6,330 against 105,773 — measures how long each has existed and
how many players were on 1.1, not quality; the original has 36 releases going back years and cannot
accumulate downloads from 2.x players because it does not run for them.

**Ruled 2026-09-23 (#10): kept, as the pack's only member**, for the reasons in the recommendation,
and the pack's own `! space-age` line kept beside the fork's. The pack's promise is in `CONTEXT.md`.
The line stays even though the fork declares the same thing, because the exclusion is a decision
about the packs, so the pack states it rather than borrowing the fork's. The cost is that it would
mask the fork ever dropping its `!`, the event that reopens the five-pack structure, so re-reading
the fork's dependency list - *The incompatibility, re-verified* below - is the only tripwire for
that.

It declares `factorio_version` **2.1** while the pack declares 2.0, and it requires `base >= 2.1.9`.
Both are recorded under the open question rather than settled here.

#### The incompatibility, re-verified

This is the check #6 exists for, and the answer is unchanged: **`SpaceModFeorasFork` still declares
`! space-age`.**

**Observed in the game 2026-10-04 (#117).** Until then the exclusion was a reading of dependency
lists. A staged `Grado_ABCX` run on Factorio 2.0.77 with `space-age`, `quality` and
`elevated-rails` enabled was refused before any mod loaded, and the game cited both declarations:
`Grado_ABCX` "Incompatible with space-age" and `SpaceModFeorasFork` "Incompatible with space-age".
Base only, the same stage loaded clean, 105 mods. The release a 2.0.77 game resolves is the fork's
`1.3.3`, not the `1.3.4` the table below ends on; `1.3.3` declares the line too. The message in
full is in `docs/loads/Grado_ABCX-2026-10-04.md`.

Read from `https://mods.factorio.com/api/mods/SpaceModFeorasFork/full` on 2026-09-22. Release
`1.3.4`'s `info_json` dependency list carries three hard incompatibilities — `! SpaceMod`,
`! space-exploration` and `! space-age` — alongside `base >= 2.1.9` and 22 optional entries.

It is not a stale line carried forward by accident, and the release history says so:

| Release | Date | `factorio_version` | `! space-age` |
|---|---|---|---|
| `1.2.12` and every release before it | to 2024-10-15 | 1.1 | no — Space Age did not exist |
| `1.3.0` | 2024-10-28 | 2.0 | **yes** |
| `1.3.1` | 2025-04-03 | 2.0 | **yes** |
| `1.3.2` | 2025-06-13 | 2.0 | **yes** |
| `1.3.3` | 2025-11-10 | 2.0 | **yes** |
| `1.3.4` | 2026-07-10 | 2.1 | **yes** |

The line was added in the first release after Space Age shipped and has been re-affirmed in every
release since. `! SpaceMod` and `! space-exploration` predate it by nineteen months, so the fork has
always declared what it will not sit beside; Space Age simply joined that list.

**The author frames it as pending, and it has been pending for a long time.** The changelog entry
for `1.3.0` reads "Mod is now compatible with Factorio 2.0! (without space age for now)", and
`1.3.4`, twenty months later, reads "Mod is now compatible with Factorio 2.1! (without space age
for now)" — the same parenthesis, verbatim, across two major-version ports. So "for now" is the
author's own word and should not be read as a plan with a date. **If it ever changes, the case for
`Grado_ABC` as a separate shared core changes with it**, because the two end-games could then be one
pack; that is the loud thing this entry exists to say, and today it is not happening.

#### Against `space-age`

`Grado_ABCX` and `Grado_ABCS` sit on the same layer with no lower pack between them, so under
`docs/mod-catalogue.md` one survey writes the comparison once. It is here, and
`docs/catalogue/Grado_ABCS.md` points at it.

They overlap completely rather than partially: **both are the end-game after the rocket**, and a
player installs one pack to get one of them. `SpaceModFeorasFork` keeps the game on Nauvis and makes
the rocket the input to a much longer production tree — hundreds of launches, new components, FTL
research, and a ship to leave in. `space-age` makes the rocket the beginning of travel and moves the
game to four more planets with their own resources and recipes.

**The overlap is not a duplication to resolve — it is the branch point itself.** Nothing here
recommends one over the other; that is what `Grado_ABCX` and `Grado_ABCS` are for, and which of them
a player installs is the player's choice, not a membership decision. What the comparison settles is
narrower: the two cannot be merged, cannot be made optional within one pack, and cannot both sit
above `Grado_ABC` in a single dependency list, because the fork's `! space-age` forbids it at load
time rather than merely making it unwise.

The asymmetry worth recording is in what each one costs to verify. `SpaceModFeorasFork` is a portal
mod whose every claim above was read from the portal API. `space-age` is not on the portal in any
usable sense, so its entry in `docs/catalogue/Grado_ABCS.md` cannot be evidenced the same way — which
means the two branches of this project are not equally checkable, and the ABCS side needs the game.

#### What dropping `angelsindustries` cost this branch

The fork declares eight optional dependencies on the overhaul beneath it. Seven are Bob's —
`boblibrary`, `bobplates`, `bobmodules`, `bobelectronics`, `boblogistics`, `bobtech`, `bobequipment`
— and all seven are satisfied by a `Grado_ABCX` install, so the Bob's side of the integration is
fully met. Six of the seven are named `Grado_ABC` members; `boblibrary` is not in any dependency
list, and arrives as a hidden mandatory dependency of all sixteen Bob's mods
(`docs/catalogue/Grado_ABC.md`). **The eighth is `? angelsindustries`, and it is the only `angels*`
entry in the entire list.**

`angelsindustries` is 1.1-only — last release `0.4.21` on 2024-02-21, read 2026-09-22 — and
`Grado_ABC` dropped it with no successor found. The fork's changelog shows the integration was
deliberate and recent: `1.2.11` (2024-07-15) "Fixed compatibility issue with Bob's Technology mod and
Technology Overhaul setting from Angel's Industries mod" and `1.2.12` (2024-10-15) "Added rudimentary
compatibility for angels tech overhaul mode" — the tech overhaul being what `angelsindustries`
provides.

So on this branch, Angel's and SpaceX now meet with no declared integration between them at all.
`docs/catalogue/Grado_ABC.md` records three members and one page-text claim that degrade with the
same drop; **the fork is a fifth, and the first outside `Grado_ABC`.** It is the same soft failure —
an optional dependency simply goes unmet and the mod ships less than it would have — and it is
evidence for issue #9 rather than a question this pack can answer.

#### What the fork's Bob's integration applies and skips (2026-10-04, #124)

A measurement. Nothing was patched, and whether to report it upstream is Truls's.

In the pack's recorded load the fork asks `boblibrary` for two technologies that do not exist, and
its other Bob's changes log nothing (`docs/loads/Grado_ABCX-2026-10-04.md`, *Conflicts*). Every
change was walked on 2026-10-04 against two data dumps on Factorio 2.0.77, made through the shared
harness's `Invoke-HarnessDump`: the staged `Grado_ABCX` (prototype list checksum `1533854567`, the
recorded load's) and the fork alone on base, which shows each recipe and technology before Bob's.
Releases: `SpaceModFeorasFork` `1.3.3`, `boblibrary` `2.1.0`, `bobequipment` `2.1.0`.

The integration is two files, `prototypes/recipe-bobs.lua` and `prototypes/technology-bobs.lua`,
run from the fork's `data-final-fixes.lua` when the setting `SpaceX-no-bob` is off and seven Bob's
mods are loaded: `boblibrary`, `bobplates`, `bobmodules`, `bobelectronics`, `boblogistics`,
`bobtech` and `bobequipment`. All seven are in `Grado_ABC`. Every setting was at its default, which
decides the branches: classic mode off, FTL ramp-up on, Bob's god modules off, and
`bobmods-logistics-disableroboports` off.

**83 library calls ran: 80 applied, 2 were skipped with a log line, 1 was skipped silently.** An
outcome is "applied" when the dump has the new name and not the old one.

Ingredients, 46 replacements, each keeping the amount:

| Recipe | Replaced by | Outcome |
|---|---|---|
| `assembly-robot` | `bob-speed-module-5`, `bob-efficiency-module-5`, `bob-construction-robot-4` | 3 applied |
| `space-thruster` | `bob-speed-module-5`, `bob-titanium-pipe`, `bob-advanced-processing-unit` | 3 applied |
| `life-support` | `bob-productivity-module-5`, `bob-titanium-pipe`, `bob-advanced-processing-unit` | 3 applied |
| `command` | the three tier-5 modules, `bob-advanced-processing-unit` | 4 applied |
| `astrometrics` | `bob-speed-module-5`, `bob-advanced-processing-unit`, `bob-lab-2` | 3 applied |
| `ftl-drive` | the three tier-5 modules, `bob-advanced-processing-unit` | 4 applied |
| `drydock-assembly` | `bob-solar-panel-large-3`, `bob-advanced-processing-unit`, `bob-roboport-4` | 3 applied |
| `fusion-reactor` | `bob-fission-reactor-equipment-4` | 1 applied |
| `hull-component` | `bob-titanium-plate` | 1 applied |
| `protection-field` | `bob-energy-shield-mk6-equipment` | 1 applied |
| `fuel-cell` | `bob-titanium-plate`, `bob-advanced-processing-unit` | 2 applied |
| `habitation` | `bob-titanium-plate`, `bob-advanced-processing-unit` | 2 applied |
| `space-fuel-tank`, `space-water-tank`, `space-oxygen-tank` | `bob-storage-tank-4`, `bob-pump-4`, `bob-titanium-pipe` in each | 9 applied |
| `space-ai-robot` | `bob-fission-reactor-equipment-4`, `bob-exoskeleton-equipment-3` | 2 applied |
| `space-ai-robot` | `battery-mk2-equipment` by `bob-battery-mk6-equipment` (line 121) | **skipped silently**: the recipe still takes 50 `battery-mk2-equipment` |
| `space-ai-robot-frame` | `bob-personal-roboport-mk4-equipment`, `bob-personal-laser-defense-equipment-6`, `bob-construction-robot-4`, `bob-logistic-robot-4` | 4 applied |

Technologies, 19 prerequisite changes, 17 science-pack additions and 1 recipe unlock:

| Technology | Change | Outcome |
|---|---|---|
| 17 technologies | `bob-advanced-logistic-science-pack` added to the cost | 17 applied |
| `ftl-theory-D1`, `ftl-theory-D2` | prerequisite `ftl-theory-C` replaced by `ftl-theory-D` | 2 applied |
| `space-assembly` | `bob-robots-3` and `bob-speed-module-5` added, `efficiency-module-3` replaced by `bob-efficiency-module-5` | 3 applied |
| `ftl-propulsion`, `life-support-systems`, `spaceship-command` | `bob-productivity-module-5` added | 3 applied |
| `drydock-assembly` | `bob-advanced-processing-unit` added (line 158) | **skipped, logged**: no such technology |
| `astrometrics` | `bob-advanced-research` added | 1 applied |
| `space-construction` | `bob-robo-modular-4` added, `solar-energy` replaced by `bob-solar-energy-3` | 2 applied |
| `protection-fields` | `energy-shield-mk2-equipment` replaced by `bob-energy-shield-equipment-6`; unlocks `protection-field-goopless` | 2 applied |
| `fusion-reactor` | `fission-reactor-equipment` replaced by `bob-fission-reactor-equipment-4` | 1 applied |
| `laser-cannon` | `laser-turret` replaced by `bob-personal-laser-defense-equipment-6` | 1 applied |
| `space-fluid-tanks` | `bob-fluid-handling-4` added | 1 applied |
| `space-ai-robots` | `bob-robots-4` added, `exoskeleton-equipment` replaced by `bob-exoskeleton-equipment-3` | 2 applied |
| `space-ai-robots` | `battery-mk2-equipment` replaced by `bob-battery-equipment-6` (line 172) | **skipped, logged**: no such technology |

The 17 are `space-assembly`, `space-construction`, `space-casings`, `protection-fields`,
`fusion-reactor`, `space-thrusters`, `fuel-cells`, `habitation`, `life-support-systems`,
`spaceship-command`, `laser-cannon`, `astrometrics`, `ftl-propulsion`, `exploration-satellite`,
`space-ai-robots`, `space-fluid-tanks` and `space-cartography`.

Four things the two files write directly, without the library, are all in the dump: the recipe
`protection-field-goopless`, the technology `ftl-theory-D` (90,000 units, after `ftl-theory-C`),
`laser-cannon`'s ingredients (50 `arithmetic-combinator`, 50 `decider-combinator`, 100
`bob-personal-laser-defense-equipment-6`), and the research counts of ten FTL and late
technologies, which come out at the numbers the fork has without Bob's.

**The two logged failures, and the silent one.**

- **`drydock-assembly`.** In the fork it is an item and a recipe, the dry dock part the launch
  asks for, and never a technology. Its recipe is unlocked by the technology `space-construction`.
  Line 158 meant to put Bob's `bob-advanced-processing-unit` research in front of it and named the
  recipe where a technology was needed. In the dump the recipe does take 200
  `bob-advanced-processing-unit`, and that technology is already an ancestor of
  `space-construction` through its other prerequisites.
- **`bob-battery-equipment-6`.** The fork expects a sixth tier of Bob's personal battery.
  `bobequipment` `2.1.0` stops at five: the technologies are `bob-battery-equipment-4` and `-5`,
  and the items `bob-battery-mk4-equipment` and `bob-battery-mk5-equipment`. Its energy shields
  and laser defences do reach tier 6, which is why the neighbouring lines apply. So
  `space-ai-robots` keeps the vanilla `battery-mk2-equipment` as a prerequisite.
- **`bob-battery-mk6-equipment`** is the same gap seen from the recipe file, line 121. It logs
  nothing because `boblibrary`'s `replace_ingredient` returns without a word when the new item has
  no type. `space-ai-robot` keeps 50 `battery-mk2-equipment`.

So on the declared line the SpaceX tree is tied into Bob's at every point the fork tries, bar the
AI robot's battery, which stays at the vanilla tier in both its recipe and its research.

**`1.3.4` still asks for both names.** The fork's `1.3.4` (`factorio_version` 2.1, 2026-07-10) was
fetched on 2026-10-04 with its SHA-1 checked, and read, not loaded. Its `data-final-fixes.lua`,
`recipe-bobs.lua` and `technology-bobs.lua` are the same as `1.3.3`'s line for line, so lines 158
and 172 ask for `drydock-assembly` and `bob-battery-equipment-6`, and line 121 for
`bob-battery-mk6-equipment`. What Bob's offers on the 2.1 line was not read.

#### The pack cannot load on the Factorio version it declares

*#43, 2026-09-24: this section reads each member's latest release, which is the 2.1 case. On stable
2.0.77 the pack resolves: each member's newest 2.0 release installs, and they satisfy each other.
The declared `base >= 2.0.0` is still not honoured - on that reading the floor is `>= 2.0.74`. See
`docs/porting-notes.md`, Resolves on stable 2.0.77. Honoured since 2026-09-24 (#58), when the
declaration was raised to `base >= 2.0.74`.*

`Grado_ABCX/info.json` declares `factorio_version` `2.0` and `base >= 2.0.0`. Its one member requires
`base >= 2.1.9`.

**That was the highest floor found anywhere in the project when it was measured.** Measured across every member of all
three packs in the chain and their full mandatory closure — **98 distinct named members and 19
hidden mandatory dependencies, 117 mods**, latest 2.x release each, read 2026-09-22 — the highest
`base >=` any of them declares is `2.1.8`, from `WideChests` `6.3.0`. The fork raises it by one patch
version. So the effective minimum for a `Grado_ABCX` install was **`base >= 2.1.9`**, and a player
on 2.0.x cannot satisfy the pack. **Read again after #8 settled `Grado_ChangingBase` later on
2026-09-22: the minimum is `base >= 2.1.12`**, from `cybersyn2` and the `0-things` library it pulls,
both of which this pack inherits. The count above is left as measured; the conclusion the section
draws is unchanged and the number it draws it from is higher. **Superseded 2026-09-23 by #15:** the
minimum is now `base >= 2.1.20` on a latest-release reading, set by the hidden `kry_stdlib` `2.2.21`,
released that day. See *Effective Factorio floor* in `docs/porting-notes.md`, which also says why
that number rests on one release.

Two things about that count, because both are easy to get wrong and this survey got both wrong first
time round. **98 is distinct mods, not declarations**: the three lists hold 99 entries and
`bobinserters` is named in two of them, which `docs/mod-catalogue.md` records as the only such
collision. *#8 removed the second line on 2026-09-22, and #7 to #9 have since taken the three
lists to 87 entries for 87 distinct named members, with no collision left.* And **the closure is
transitive and includes `~`-prefixed dependencies**, which are
mandatory — they only decline to constrain load order. Walking one level, or reading `~` as
optional, gives 14 and misses the four Angel's graphics packages and `reskins-sprite-utils`.

**19 is the chain's closure and is not the same number as `docs/catalogue/Grado_ABC.md`'s fifteen.**
*(Both were measured before #9, which on 2026-09-23 removed the only two mods pulling in
`rusty-locale`. `Grado_ABC`'s fifteen is fourteen after it. #39 reconciles the two.)*
That file counts ABC's *share* — the closure of its 45 members minus what the two lower packs
already pull in — and it names **five** subtracted mods: `flib`, `alien-biomes-graphics`,
`kry_stdlib`, `stdlib2` and `+FluidWagonColorMask`. On those five it says counting them "would have
made the number twenty".

**Four of the five are real, and fifteen plus four is this file's nineteen.** The fifth,
`+FluidWagonColorMask`, is a named member of `Grado_NonChanging` rather than a hidden dependency of
anything — the `+` belongs to `Automatic_Train_Painter`, which declares it mandatory against a mod
the pack already lists. So it was never in the closure to be subtracted from it, and ABC's twenty is
one too many for exactly that reason. That is issue **#39**, and it moves ABC's stated twenty to
nineteen; it moves neither the fifteen nor this file's nineteen, which are the two numbers that have
to agree. *Applied 2026-10-01 (#39): `docs/catalogue/Grado_ABC.md` now names four subtracted mods
and states fifteen plus four as this file's nineteen.*

This is issue #15's measurement for this pack. The number to declare instead is issue #16 and is
Truls's to set; no `info.json` was modified.

## Dropped during the port

**None.** The 1.1 `Grado_ABCX` held 56 mods; 55 of them are accounted for under `Grado_ABC` and
catalogued there, as its 45 members and its 10 drops, and the 56th, `SpaceMod`, was replaced rather
than dropped — it is the **Supersedes** row above. `docs/porting-notes.md` records the split.
*Superseded 2026-09-22 by #8 and 2026-09-23 by #9: 40 of the 55 are `Grado_ABC` members now,
`bobinserters` is `Grado_ChangingBase`'s, four are under* Ruled out after the port *there, and
`RealisticFusionPowerPort`, replacing one of the 10 drops, is ABC's 41st member.* This
section is empty as a claim, not as an omission.

## Pressure on the one-mod-per-branch rule

`CLAUDE.md` says anything both branches need lives in `Grado_ABC` and each branch adds exactly one
thing. #6 was asked to report pressure on that rule, not resolve it. Two findings, one in each
direction, and **neither is pressure on this branch**:

**Nothing in `Grado_ABC` belongs here instead.** Checked rather than assumed: across the latest 2.x
release of all 117 mods in the chain's closure, **not one declares `! SpaceMod`,
`! SpaceModFeorasFork` or a hard incompatibility of any kind involving this branch.** The chain
declares sixteen hard incompatibilities in total — fifteen from named members and one from
`reskins-library` in the hidden set — and every one of them names a mod that is in no pack. So no
member of `Grado_ABC` is SpaceX-specific by declaration, and none is forbidden here.
*Superseded 2026-09-22 by #7 and #8 and 2026-09-23 by #9, which changed the three lower lists to
87 named members. Re-read 2026-09-24 (#61) for those 87: none declares a `!` against this branch,
and every `!` among them names a mod in no pack. The hidden members were not re-read.*

**Nothing this branch needs is missing from `Grado_ABC`.** The fork's mandatory dependency list is
`base >= 2.1.9` and nothing else. Its 22 optional entries are satisfied seven-for-seven on the Bob's
side, six by named `Grado_ABC` members and `boblibrary` by the closure beneath them; the eighth,
`? angelsindustries`, is unsatisfiable rather than misplaced, because the mod has
no 2.x release to add to any pack. The remaining fourteen name other overhauls — `Krastorio2`,
`IndustrialRevolution`, `IndustrialRevolution3`, the Pyanodons set, `Milestones`,
`better-victory-screen` — none of which is in any Grado pack, and adding one would be a new
membership decision rather than a relocation.

**The rule is under no pressure from `Grado_ABCX`.** It is under pressure from `Grado_ABCS`, and
that is reported in `docs/catalogue/Grado_ABCS.md`.
