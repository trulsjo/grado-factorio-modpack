# Load record: `Grado_ABCS`, 2026-10-04

The first recorded **load** (`CONTEXT.md`, *Load*) of `Grado_ABCS`, for #118: the overhaul beside
the expansion, and the first measurement of the one pack the portal could not answer for. **One
load, with Space Age, clean:** 104 mods validated beside `space-age`, `quality` and
`elevated-rails`, and a map created. The data-stage failure the ticket thought possible did not
happen.

A clean load is not integration. The pack's promise is `Grado_ABC` *beside* Space Age, and a load
runs no ticks: whether the two are playable together is #29's play session, and whether a bridge
mod is wanted is #31's.

The shape is the first record's, `docs/loads/Grado_NonChanging-2026-09-29.md`.

## Configuration

| | |
|---|---|
| Date | 2026-10-04 |
| Game | Factorio **2.0.77** (build 84539, win64, Steam), headless |
| Declared line | `2.0`, `base >= 2.0.74` |
| Repo | `f2e51f4` (`main`), all four packs in the chain at `0.1.0` |
| Tools | `vendor/grado-factorio-tools` at `d251481` |
| Bundled mods | `space-age`, `quality` and `elevated-rails`, all `2.0.77`, enabled |

Commands, from the repo root:

```
pwsh -File scripts/stage-pack.ps1 Grado_ABCS
pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 -Mods .mod-cache/Grado_ABCS -With space-age -KeepTemp
```

The stage printed that load line itself, `-With space-age` included, because the pack names
`space-age`.

The resolve read line `2.0` on build 2.0.77: 100 mods, every one resolved, no constraint violated,
effective floor `base >= 2.0.74` from `miniloader-redux` `1.2.0`. It matches the declared floor.
`space-age` is the game's own mod, so the resolver does not count it and does not fetch it.

## Resolved closure

100 portal mods, the four packs, and the three bundled mods.

| Mod | Release |
|---|---|
| `space-age` (bundled) | 2.0.77 |
| `quality` (bundled, hidden) | 2.0.77 |
| `elevated-rails` (bundled, hidden) | 2.0.77 |
| `Grado_ABCS` | 0.1.0 |
| `Grado_ABC`, `Grado_ChangingBase`, `Grado_NonChanging` | 0.1.0 each |
| the 100 mods of `Grado_ABC`'s closure | as in `docs/loads/Grado_ABC-2026-10-04.md` |

The 100 were resolved again for this stage and compared with `Grado_ABC`'s pin file of the same
day: every one is at the same release and nothing is added. The table in that record is therefore
this pack's too, hidden members included.

## Does naming `space-age` bring `quality` and `elevated-rails`?

**They are required, and the game does not switch them on by itself.** Three observations:

1. **The harness enabled all three.** `-With space-age` reads the installed `space-age`'s
   `info.json`, follows its mandatory dependencies, and writes a `mod-list.json` with `space-age`,
   `quality` and `elevated-rails` enabled. The load above ran with that list. It is the harness
   that closed over the two, not the game.
2. **With the other two switched off, the game refuses.** One extra run, same stage directory, with
   `space-age` enabled and `quality` and `elevated-rails` written as disabled (through
   `load-harness-lib.ps1`, setting the harness's `EnabledBundled` to `space-age` alone). Exit 1 at
   0.2 s, no map. The game's message, complete:

   ```
      0.214 Error Util.cpp:81: Failed to load mod "space-age": 
   • space-age
       • Missing required dependency elevated-rails >= 2.0.0
       • Missing required dependency quality >= 2.0.0
   ```

3. **Left out of the list, the game enables them.** Not run today. #59's start on 2026-09-24, with
   no `mod-list.json` written, had the game enable `space-age`, `quality` and `elevated-rails`
   beside `Grado_NonChanging`.

So the installed `space-age` `2.0.77` does require both, as its `info.json` was read to say on
2026-09-23, and a pack that names `space-age` alone depends on both through it. A disabled
dependency is an error, not something the game turns on. What the client's mod manager offers a
player who enables `Grado_ABCS` with the two off was not looked at.

## Loads

**Load 1, with `space-age`, `quality` and `elevated-rails`.** Exit 0. **104 mods validated and a
map created.** The log's per-mod checksum list has 108 entries: `base`, the three bundled mods and
the 104. The data stage ran 84 member `data.lua` files and 81 later-stage files, the same counts as
`Grado_ABC`'s base-only load, beside the expansion's own. Prototypes were ready at 36.8 s
(prototype list checksum `2316474952`) and the run ended at 50.8 s.

**`factorio-current.log`:** no line the game marks as an error or a warning, no deprecation, and
stderr was empty. The search and the harness's own lines are as in
`docs/loads/Grado_ABC-2026-10-04.md`. The same three complaints are here, word for word
(`Nanobots2` through `stdlib2`, and `boblibrary` twice); see that record's *Conflicts*.

**What Space Age changed in the members' log lines**, comparing this load's 574 `Script` lines with
the 565 of `Grado_ABC`'s base-only load:

- `reverse-factory` logs 10 more lines, 453 against 443, about eight recipes it will not reverse:
  `turbo-loader`, `copper-bacteria`, `iron-bacteria`, `quantum-processor`,
  `cryogenic-science-pack`, `heat-interface`, `infinity-chest` and `infinity-pipe`. Ten lines for
  eight recipes because `copper-bacteria` and `iron-bacteria` are each logged twice, once for
  multiple results and once for a probability. The first five are defined only in `space-age`
  (2.0.77, the game's `data/` searched for each name), so it is reading the expansion's recipes.
- `alien-biomes` disables one more tree, `water-cane`.
- `rso-mod` no longer reports `Resource not available: stone` (twice in the base-only load). It
  still reports `iron-ore`, `copper-ore` and `uranium-ore`.
- `UltimateResearchQueue2`'s three timing lines differ. Nothing else changed.

No member logged a complaint that names a Space Age prototype.

The times are from one machine (i7-9850H) and one run. They are context, not a benchmark.

## Conflicts

**None found in the load that Space Age adds.** The three complaints `Grado_ABC`'s record lists are
all here unchanged, and none is fatal. Compatibility Lua is not needed to load the pack.

That is a narrow verdict. A load sees the prototype stages and `on_init`. It does not see:

- **Whether the overhaul's recipes are reachable on the other planets**, or whether Space Age's
  science can be made from Angel's and Bob's materials. Nothing here says the game can be finished.
- **Prototypes silently replaced.** Two mods defining one name load without a word, and the second
  wins. With an overhaul and an expansion both rewriting vanilla recipes, this is the likeliest
  place for damage, and a load cannot show it. *A data dump can: see the note under* Not checked
  *(2026-10-04, #128).*
- **Sprites**, which a headless run does not read.

## Not checked

- **Play.** No play session. #29.
- **Base only.** `Grado_ABCS` requires `space-age`, so there is no base-only load of this pack;
  `Grado_ABC`'s record is that run.
- **What Space Age and the overhaul do to each other's prototypes.** No `--dump-data` run was made.
  *Made 2026-10-04 (#128): 29 prototype names are defined by both, and 299 recipes, 148
  technologies and 150 items of Space Age's differ in this pack. The five science packs Space Age
  adds are untouched. See* Where the overhaul and Space Age touch *in
  `docs/catalogue/Grado_ABCS.md`. It is a comparison of prototypes, not play.*
- **A 2.1 build of `space-age`.** Still unread.
- **The client's mod manager**, as said above.
- **The floor itself.** 2.0.77 is above `base >= 2.0.74`, so this confirms only that the floor is at
  or below 2.0.77.
- **Key bindings**, **multiplayer** and **mod settings other than the defaults**.
