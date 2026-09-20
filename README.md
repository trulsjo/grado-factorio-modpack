# grado-factorio-modpack

Five Factorio **2.0** modpacks, ported from the three 1.1 packs published on the mod portal by
`ostogvin`. A pack is an `info.json` and nothing else unless compatibility between member mods forces
Lua into it.

## The chain

```
Grado_NonChanging      quality of life; does not change save state or the factory
  |
  +-- Grado_ChangingBase   may change saves/factory; compatible with most overhauls
        |
        +-- Grado_ABC          Angel's + Bob's + MadClown. The shared overhaul core.
              |
              +-- Grado_ABCX     + Space Extension (SpaceX), via SpaceModFeorasFork
              +-- Grado_ABCS     + Space Age
```

**ABCX and ABCS are mutually exclusive.** `SpaceModFeorasFork` declares `! space-age`, so the two
end-game routes cannot be combined. That is why ABC exists as its own pack: everything they share
lives there, and each branch adds exactly one thing.

## Status

**Skeleton only.** The dependency lists are resolved from the 1.1 packs against the mod portal, but
**nothing has been launched in Factorio and no pack has been loaded.** See
[docs/porting-notes.md](docs/porting-notes.md) for what was kept, replaced and dropped, and for the
open questions.

## Publishing

New portal entries for `Grado_ABC` and `Grado_ABCS`; `Grado_NonChanging`, `Grado_ChangingBase` and
`Grado_ABCX` already exist as 1.1 entries under `ostogvin`.
