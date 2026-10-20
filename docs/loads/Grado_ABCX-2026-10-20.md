# Load record: `Grado_ABCX`, 2026-10-20

A **load** (`GLOSSARY.md`, *Load*) of `Grado_ABCX` **without `PlutoniumEnergy`**, for #332. One
load, base only, clean: 104 mods validated and a map created. The record to compare with is
`docs/loads/Grado_ABCX-2026-10-04.md`, and how the pack under it was staged is in
`docs/loads/Grado_ABC-2026-10-20.md`. The refusal beside Space Age was not run again: nothing
here changes a `!` line. There is **no play session** here; that is #28's.

## Configuration

| | |
|---|---|
| Date | 2026-10-20 |
| Game | Factorio **2.0.77** (build 84539, win64, Steam), headless |
| Declared line | `2.0`, `base >= 2.0.74` |
| Repo | `0a58b02` (`main`) and the working-tree edit `Grado_ABC`'s record describes |
| Tools | `vendor/grado-factorio-tools` at `a882314` |
| Bundled mods | none (base only) |

Commands, from the repo root:

```
pwsh -File scripts/stage-pack.ps1 -Pack Grado_ABCX
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -KeepTemp .mod-cache/Grado_ABCX
```

The resolve read line `2.0` on build 2.0.77: 100 mods, effective floor `base >= 2.0.74` from
`miniloader-redux` `1.2.0`. Every mod was taken from the local cache. The staging removed
`PlutoniumEnergy` from `.mod-cache/Grado_ABCX`.

## Resolved closure

100 mods and the four packs, 104 rows: `Grado_ABC`'s closure of the same day
(`docs/loads/Grado_ABC-2026-10-20.md`), plus `SpaceModFeorasFork` **1.3.3** and `Grado_ABCX`
`0.1.0`. Compared mod for mod, the harness's lists of the two loads. So every mod is at its
2026-10-04 release, and `PlutoniumEnergy` is the one gone.

## Loads

**Load 1, base only.** Exit 0. **104 mods validated and a map created.** The log's per-mod checksum
list has 105 entries: `base` and the 104. The data stage ran 84 member `data.lua` files and 80
later-stage files, against 85 and 82 on 2026-10-04: `PlutoniumEnergy`'s `data.lua`,
`data-updates.lua` and `data-final-fixes.lua`. Prototypes were ready at 41.1 s (prototype list
checksum `3113249636`) and the run ended at 59.3 s.

**`factorio-current.log`:** no line the game marks as an error or a warning. The search is as in
`docs/loads/Grado_ABC-2026-10-04.md`. The members' `Script` lines are 544: `Grado_ABC`'s 540 of
the same day, and the fork's four through `boblibrary`.

The times are from one machine (i7-9850H) and one run. They are context, not a benchmark.

## Conflicts

**Nothing stopped the load, and nothing new is logged.** The complaints are the 2026-10-04 record's,
word for word: `Grado_ABC`'s three, and the fork's two technologies that `boblibrary` does not find,
`drydock-assembly` and `bob-battery-equipment-6`. Those are the complaints #125 is about. None
involves `PlutoniumEnergy`.

## Not checked <!-- deliberate: checked -->

- **Play.** No play session. #28.
- **Beside Space Age.** Not run again; the refusal is the 2026-10-04 record's.
