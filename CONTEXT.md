# Grado Factorio Modpack

Five Factorio modpacks published on the mod portal. This file is the glossary: the terms that have
one meaning here and have already been used with two. It is not a spec - `CLAUDE.md` is how to work
in the repo, `docs/porting-notes.md` is what happened to the 1.1 packs.

## Language

**Pack**:
One of the five things this repo publishes. A pack is an `info.json` whose `dependencies` list is the
whole of it; it contributes no content of its own.
_Avoid_: modpack (fine in prose, but "pack" is the unit), mod

**Member mod**:
A mod named in a pack's `dependencies`. Written by someone else, published separately, and never
vendored into this repo. A pack that depends on another pack depends on it as a member.
_Avoid_: dependency (true but wider - it also covers `base` and optional entries), child mod

**Lower / higher**:
Position in the chain, measured by dependency. `Grado_NonChanging` is the lowest and `Grado_ABCX`
and `Grado_ABCS` are the highest; a pack is higher than every pack it depends on, and loads all of
them. The README's diagram nests the chain downwards and so reads the opposite way - the words
follow the dependency, not the indentation. Both directions have been written for the same pair
(`docs/catalogue/Grado_NonChanging.md` called `Grado_ChangingBase` "one layer down" twice before
2026-09-21), which is why it is here.
_Avoid_: above/below without saying of what, upstream/downstream, base pack (`base` is Factorio's
own mod)

**Portal entry**:
A mod's page on the mod portal, identified by its name and holding every release ever published
under it. One entry spans game versions: the 1.1 and 2.0 releases of a pack live on the same entry.
_Avoid_: portal page, mod listing, release

**Name**:
The `name` field in `info.json`, e.g. `Grado_ABCS`. What another mod's `dependencies` resolves and
what the portal URL carries. Permanent once published - changing it means a new entry.
_Avoid_: mod name, id, directory name (the directory happens to match, but it is not the name)

**Title**:
The `title` field in `info.json`, e.g. `Grado ABCS: Angel's, Bob's, MadClown, Space Age`. Display
only - shown in the in-game mod list and on the pack's portal entry, and freely changed in any
release.
_Avoid_: name, display name

**Promise**:
What a pack guarantees about what it will do to a game. Each pack has one, and it is the test a
candidate member has to pass. `Grado_NonChanging`'s, settled 2026-09-22: it **adds no content** -
no craftable item, entity or recipe - it may tune vanilla prototypes, it may store data of its
own in the save, and it changes the built factory only when the player asks it to.
`Grado_ChangingBase`'s: it may add content, but not content that competes with an overhaul for the
same ground, because all three overhaul packs inherit it.
`Grado_ABC`'s, settled 2026-09-23 (#9): it is Truls's own Angel's, Bob's and MadClown setup, so a
member need not be *about* the overhaul - it may extend the overhaul mods or add content of its own,
but it must not conflict with them. Because both end-games build on it, nothing in it may declare
`! space-age`.
`Grado_ABCX`'s, settled 2026-09-23 (#10): `Grado_ABC` plus the SpaceX end-game and nothing else;
the pack is never installed beside Space Age.
`Grado_ABCS`'s, settled 2026-09-23 (#10): `Grado_ABC` *beside* Space Age, not integrated with it -
the planets and the overhaul run side by side, so a mod whose job is to merge the two fails
the test.
_Avoid_: "does not change save state or the factory", which was the original wording of
`Grado_NonChanging`'s promise and is false under any reading that lets that pack do its job -
`Tapeline`, `Todo-List`, `YARM` and `SpeedControl` all write to the save, and half the pack exists
to change the factory on request.
Also avoid: guarantee, contract, rule (all used for this and for three other things)
