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

**Hidden member**:
A mod in a pack's mandatory closure that no pack's `dependencies` names. It is installed because a
member mod requires it, and it arrives and leaves with that member. `Warheads_Continued` is one:
`True-Nukes_Continued` requires it and no pack lists it. Added 2026-10-04 (#81).
_Avoid_: unnamed dependency, transitive dependency, and "hidden" for anything in the closure that a
lower pack does name

**Declared line**:
The Factorio release line a pack's `factorio_version` names - `2.0` or `2.1` - and so the games the
portal serves it to. All five packs share one, because a pack cannot depend on a pack its game is
not served. One portal entry can carry a release on each line.
_Avoid_: target (that word is taken - "Space Age is a target" means an expansion the packs support,
while "a 2.0 target" and "a 2.1 target" have meant a line)

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

**Resolve**:
Two senses, kept apart by what the subject is. A dependency line *resolves* to the mod whose name
it carries (see *Name*). A pack *resolves* on a game version when every mod in its mandatory closure
has a release that version is served (`factorio_version`) and can install (`base >=`), and those
releases satisfy each other's version constraints. Added 2026-09-24 (#43), where "all five packs
resolve on 2.0.77" is the second sense.
_Avoid_: "installs" for the second sense on portal evidence alone - a pack that resolves has not
thereby been loaded (see *Load*)

**Load**:
Factorio run with exactly a pack's resolved closure enabled, plus any bundled mods named explicitly,
and nothing else: the prototypes load, a map is created, and the run exits clean. Scripted and
repeatable. A load is recorded with its build, its resolved member versions and its bundled mods, or
it cannot be compared with the next one. It runs no ticks and loads no sprites, so it says nothing
about how a mod behaves in play. Added 2026-09-29 (#17).
_Avoid_: "loaded" for a *Start*; "launched" and "play-tested" as loose synonyms for any of the three

**Start**:
Factorio run with a pack enabled but the set of mods not controlled - #59's run on 2026-09-24, with
`space-age`, `quality` and `elevated-rails` auto-enabled beside `Grado_NonChanging`, is one. Weaker
evidence than a *Load*, and it does not count as one. Added 2026-09-29 (#17).
_Avoid_: load

**Play session**:
A person playing with a pack in the client - ticks run and the mods are used - and writing down what
they did. The only one of the three that says anything about how the members behave together.
Added 2026-09-29 (#17).
_Avoid_: play-test (used here for "any of the three" before 2026-09-29), playthrough

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
