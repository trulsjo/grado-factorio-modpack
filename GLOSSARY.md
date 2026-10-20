# Grado Factorio Modpack

Five Factorio modpacks published on the mod portal. This file is the glossary: the terms that have
one meaning here and have already been used with two. It is not a spec - `CLAUDE.md` is how to work
in the repo, `docs/porting-notes.md` is what happened to the 1.1 packs.

## Language

**Pack**:
One of the five things this repo publishes. A pack is an `info.json` whose `dependencies` list is
the whole of it; it contributes no content of its own.
_Avoid_: modpack (fine in prose, but "pack" is the unit), mod

**Member mod**:
A mod named in a pack's `dependencies`. Written by someone else, published separately, and never
vendored into this repo. A pack that depends on another pack depends on it as a member.
_Avoid_: dependency (true but wider - it also covers `base` and optional entries), child mod

**Hidden member**:
A mod in a pack's mandatory closure that no pack's `dependencies` names. It is not a *Member mod*,
which is named: it is installed because a member mod requires it, and it arrives and leaves with
that member. `stdlib2` is one: `Nanobots2` requires it and no pack lists it. Added 2026-10-04
(#81).
_Avoid_: unnamed dependency, transitive dependency, and "hidden" for anything in the closure that a
lower pack does name

**Load drop**:
A member mod that was kept at the 1.1 -> 2.0 port and removed later because the pack does not load
with it. Distinct from a port drop, which is a 1.1 mod with no 2.x release, and from a
*Choice drop*, a member ruled out by choice. Added 2026-10-04 (#81).
_Avoid_: drop without saying which kind, port drop for a mod that has a 2.x release

**Choice drop**:
A member mod removed at Truls's ruling, for what it adds to the pack, while it still has a release
and the pack still loads with it. The third kind of drop beside a port drop and a *Load drop*. It
names no condition that would reopen it unless its ruling says one. Added 2026-10-20 (#330).
_Avoid_: "load drop" for one; pruning

**Glue**:
Lua a pack carries to join two member mods that each load on their own, where the join belongs in
neither member's own code. The one kind of code a pack is expected to carry. Added 2026-10-15
(#147).
_Avoid_: compatibility patch or compat for the pack's own Lua (the catalogues use the first for a
mod that patches others)

**Patch**:
Lua a pack would carry to do one member mod's own job for it: a fix that belongs in that member's
code, such as a case the member left out. The test against *Glue* is whose code the fix belongs in.
The lean is against it: report upstream instead, ruled case by case (#81, #147). Added 2026-10-15
(#147).
_Avoid_: glue for code that does one member's job; fix for the pack's own Lua (it hides whose job
it was)

**Coexistence fix**:
A mod that makes an end-game and `Grado_ABC` run together without merging their progressions or
moving either's content between planets: a crash fix, a missing recipe, a soft-lock removed. It
passes `Grado_ABCS`'s promise, and a branch may carry one beside its end-game. Added 2026-10-20
(#31).
_Avoid_: "glue" for it (that is the pack's own Lua between two members); "bridge" for it (kept for
a mod that merges or relocates); "compat mod" for it (used for both)

**Shared name**:
A prototype type and name that two or more members define, or a member and an expansion. It says
nothing of which definition stands or what the game ends with: the later definition can replace
the earlier whole, and a later stage can still change the prototype, so the game can end with a
mix of the two. Added 2026-10-20 (#330).
_Avoid_: "clash" for it (the load records keep the word for a key binding where one input stops
working)

**Replaced definition**:
A shared name whose later definition replaces the earlier one whole, so the earlier definition is
gone without a log line. It judges the definitions, not what the game ends with: a later stage of
either mod can still change the prototype that stands, which then ends as a mix. Which definition
stands follows the load order, which a release of either mod can change. Added 2026-10-20 (#330).
_Avoid_: "clash" for it (as for a shared name); "override" for it (the catalogues use the word
loosely, for deliberate changes and for replaced definitions)

**Declared line**:
The Factorio release line a pack's `factorio_version` names - `2.0` or `2.1` - and so the games the
portal serves it to. All five packs share one, because a pack cannot depend on a pack its game is
not served. One portal entry can carry a release on each line.
_Avoid_: target (that word is taken - "Space Age is a target" means an expansion the packs support,
while "a 2.0 target" and "a 2.1 target" have meant a line)

**Lower / higher**:
Position in the chain, by dependency. `Grado_NonChanging` is the lowest and `Grado_ABCX`
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

**Dead end**:
Something a pack contains that a player cannot reach from a new game at the default settings: a
technology no research gets to, a recipe nothing unlocks, or a goal that needs one of those.
Added 2026-10-15 (#294).
_Avoid_: dead end for a mod with no future (say *abandoned* if no release is expected, *no
successor* if nothing replaces it)

**Unplaced**:
A resource that exists in a game's prototypes and of which no planet has an entity in the area
counted. Unplaced is not unobtainable: an ore can be unplaced and still come from sorting. Added
2026-10-17 (#309).
_Avoid_: "unavailable" for a resource no planet places (it reads as "cannot be obtained")

**Known defect**:
A member's defect that has been reported to its author with a fix proposed. It is not a conflict
under the pack's *Promise* while it is with the author; it becomes one when the author says
explicitly that it will not be fixed. Silence and a release without the fix leave it a known
defect. Added 2026-10-17 (#309).
_Avoid_: "conflict" for a defect still with its author

**Measured**:
The strongest of the three claim grades, defined on the
[shared page](vendor/grado-factorio-tools/docs/claim-grades.md). Added 2026-10-06 (#157), amended
2026-10-15 (#292), defined there since 2026-10-16 (#301).
_Avoid_: confirmed, verified, observed, checked (none says which grade is meant); "measured" for
anything whose day neither it nor its section gives

**Read from source**:
The middle of the three claim grades, defined on the
[shared page](vendor/grado-factorio-tools/docs/claim-grades.md). Added 2026-10-06 (#157), defined
there since 2026-10-16 (#301).
_Avoid_: read or reading on its own (a portal reading is *Measured*), "the mod does" for what its
source says it would do

**Inferred**:
The weakest of the three claim grades, defined on the
[shared page](vendor/grado-factorio-tools/docs/claim-grades.md). Added 2026-10-06 (#157), defined
there since 2026-10-16 (#301).
_Avoid_: assumed (a claim that names nothing it rests on has no grade; it is marked "not measured"
or it is a finding), likely without saying from what

**Rule of review**:
What a reviewer judges a branch by, or what defines a review: what the reviewer is handed, who
reads a fix against its finding, and where the findings go. The rules of review are in
`docs/agents/code-review.md`. What a session does to prepare and send the pre-PR review, and how
the report comes back, is *procedure*: it binds the session, through the one rule that says
which page the review is run by, and it is not what a branch is judged by. Added 2026-10-13
(#178).
_Avoid_: rule for a step of procedure, mechanics, requirement without saying which of the two

**Dated note**:
Text added to a record after it was written, opening in italics with a word and the day it was
added, as in *Checked 2026-09-24 (#25)*. It runs from that opening to the end of its paragraph,
in either of two forms: one italic run, which may leave italics for a section title or a file
path and go on, or an italic label with the note's text after it in roman. Added 2026-10-14
(#181).
_Avoid_: note on its own where an undated aside could be meant; the italics as the note's extent

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
the planets and the overhaul run side by side, so a mod that merges the two, or moves either's
content between planets, fails the test; a coexistence fix passes it. Restated 2026-10-20 (#31).
_Avoid_: "does not change save state or the factory" (the original wording of
`Grado_NonChanging`'s promise, and false under any reading that lets that pack do its job -
`Tapeline`, `Todo-List`, `YARM` and `SpeedControl` all write to the save, and half the pack exists
to change the factory on request), guarantee, contract, rule (all used for this and for three
other things)
