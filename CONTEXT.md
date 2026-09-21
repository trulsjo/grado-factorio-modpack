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
only - shown in the in-game mod list and on the portal page, and freely changed in any release.
_Avoid_: name, display name
