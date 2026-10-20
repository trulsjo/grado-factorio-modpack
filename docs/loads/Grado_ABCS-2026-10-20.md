# Load record: `Grado_ABCS`, 2026-10-20

A **load** (`GLOSSARY.md`, *Load*) of `Grado_ABCS` **without `PlutoniumEnergy`**, for #332. One
load, with Space Age, clean: 103 mods validated beside `space-age`, `quality` and
`elevated-rails`, and a map created. The record to compare with is
`docs/loads/Grado_ABCS-2026-10-04.md`, and how the pack under it was staged is in
`docs/loads/Grado_ABC-2026-10-20.md`. There is **no play session** here; that is #29's.

## Configuration

| | |
|---|---|
| Date | 2026-10-20 |
| Game | Factorio **2.0.77** (build 84539, win64, Steam), headless |
| Declared line | `2.0`, `base >= 2.0.74` |
| Repo | `0a58b02` (`main`) and the working-tree edit `Grado_ABC`'s record describes |
| Tools | `vendor/grado-factorio-tools` at `a882314` |
| Bundled mods | `space-age`, `quality` and `elevated-rails`, all `2.0.77`, enabled |

Commands, from the repo root:

```
pwsh -File scripts/stage-pack.ps1 -Pack Grado_ABCS
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -KeepTemp -With space-age .mod-cache/Grado_ABCS
```

The resolve read line `2.0` on build 2.0.77: 99 mods, effective floor `base >= 2.0.74` from
`miniloader-redux` `1.2.0`. Every mod was taken from the local cache. The staging removed
`PlutoniumEnergy` from `.mod-cache/Grado_ABCS`.

## Resolved closure

99 portal mods, the four packs and the three bundled mods: `Grado_ABC`'s closure of the same day
(`docs/loads/Grado_ABC-2026-10-20.md`), plus `Grado_ABCS` `0.1.0`. Compared mod for mod, the
harness's lists of the two loads. So every mod is at its 2026-10-04 release, and
`PlutoniumEnergy` is the one gone.

## Loads

**Load 1, with `space-age`, `quality` and `elevated-rails`.** Exit 0. **103 mods validated and a
map created.** The log's per-mod checksum list has 107 entries: `base`, the three bundled mods and
the 103. The data stage ran 83 member `data.lua` files, one fewer than on 2026-10-04. Prototypes
were ready at 55.9 s (prototype list checksum `4259335355`) and the run ended at 72.0 s.

**`factorio-current.log`:** no line the game marks as an error or a warning. The search is as in
`docs/loads/Grado_ABC-2026-10-04.md`. The members' `Script` lines are 549, against 574 then: 25
fewer, the number `PlutoniumEnergy` logged in `Grado_ABC`'s load of 2026-10-04. The counts that
the 2026-10-04 record gives for Space Age's changes are the same now: `reverse-factory` 453 and
`alien-biomes` 23, and `rso-mod` without its two `stone` lines.

The times are from one machine (i7-9850H) and one run. They are context, not a benchmark.

## Conflicts

**Nothing stopped the load, and nothing new is logged.** `Grado_ABC`'s three complaints (#125)
are here, word for word, and no member logs a complaint that names a Space Age prototype. None
involves `PlutoniumEnergy`.

## Not checked <!-- deliberate: checked -->

- **Play.** No play session. #29.
- **What Space Age and the overhaul do to each other's prototypes** without `PlutoniumEnergy`. No
  dump of this pack was made for #332. None of the 29 names both define (#128) is
  `PlutoniumEnergy`'s, read from that list in `docs/catalogue/Grado_ABCS.md`.
