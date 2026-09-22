# The mod catalogue: format and evidence rules

Every mod in every pack gets an entry. This file is the shape of one entry; the entries live in
`docs/catalogue/`. The evidence rules behind an entry are in `CLAUDE.md` under *Checking the mod
portal* — this file does not repeat them, it says how they land in an entry.

`docs/porting-notes.md` records what happened to the 1.1 packs. The catalogue records what is in the
packs now and why, which is a question that outlives the port, so it is a separate document rather
than a section growing inside the notes.

## Where it lives

One file per pack, under `docs/catalogue/`, named for the pack: `docs/catalogue/Grado_ABC.md` and so
on. Per pack rather than one combined file because the five surveys run in parallel, and five
sessions appending to one file collide on every write.

Each pack file has two sections: **In the pack**, one entry per mod in its dependency list in list
order, and **Dropped during the port**, one entry per mod that was in the 1.1 pack and is not here
now. Every mod, not only the interesting ones — an absent entry and a boring entry are different
claims, and only one of them is verifiable.

## Two kinds of duplication

Five packs in four layers — `Grado_ABCX` and `Grado_ABCS` share the top one — and a pack loads
every pack it depends on, so a mod can be duplicated two different ways. They are not the same
problem and do not get the same treatment.

*Lower* and *higher* below mean position in the chain measured by dependency, not by the README
diagram's indentation, which runs the other way. `CONTEXT.md` is the glossary entry.

**The same mod in two dependency lists** is a name collision, and this file's answer was to wait:
`bobinserters` was the only instance named as a member of two lists — `Grado_ChangingBase` and
`Grado_ABC` — and it was entered in both files until which layer kept it was settled. A survey that
reaches such a mod may *recommend* a layer, which is what a **Recommendation** is for; the
`Grado_ChangingBase` survey did, on 2026-09-21. Recommending is not settling, and the entry stays in
both files either way.

**Settled 2026-09-22 by #8: kept in `Grado_ChangingBase`, and the line removed from
`Grado_ABC/info.json`**, because the mod's only dependency is `base >= 2.1.0` and removing the ABC
line costs no player anything. It is now named as a member of exactly one of the five lists, and the
joint #8-and-#9 disposal this paragraph described no longer applies — #8 made the edit, because "the
duplication is gone" was its own acceptance criterion. **Both entries survive**, which is what the
last sentence above requires and what the fifth variant below exists to license. There is no second
instance; if one appears, the procedure is the one described here and the ruling belongs to the
lower pack's decide-and-apply ticket.

**Two different mods doing an overlapping job in two packs** is the other one, and it is the one
that compounds as the surveys climb. It is recorded with an **Overlaps** row in the entry table,
`| **Overlaps** | `other-mod` (`Pack_Name`) |`, and a comparison in prose under the entry that owns
it.

**The lower pack's entry owns the comparison.** A mod in a lower pack is loaded for every pack
above it, so its entry is the one every affected player's pack reaches. The higher pack's entry
carries the **Overlaps** row and one sentence pointing at the comparison — at the lower entry if
it is written, at the issue filed for it if it is not. Either side can be the one that notices;
the comparison still goes below.

**Two packs on the same layer have no lower one.** `Grado_ABCX` and `Grado_ABCS` are the only
pair, they cannot be installed together, and one survey (#6) covers both — so that survey writes
the comparison in whichever entry it reaches first and points at it from the other.

**A survey assesses only the mods it was given**, and edits only those packs' catalogue files,
because the surveys run in parallel and two sessions writing one file collide. Ticket and file do
not map one to one — #4 and #5 split `Grado_ABC` between them and #6 covers two packs — so the
constraint is the file, not the ticket. So the survey that notices an overlap:

- adds the **Overlaps** row to its own entry, whichever side it is on;
- writes the comparison if its own pack is the lower one, out of what both mods claim on the
  portal and in their own docs — that much is checkable without judging the other mod's fit;
- otherwise files an issue against the lower pack's catalogue, because the comparison it would
  write has no file it is allowed to touch, and points the row's sentence at that issue until
  someone writes it.

A **Recommendation** never disposes of the other pack's mod. An overlap is evidence for
`reconsider:` in this entry; what the other pack does about it is that pack's ticket, and which
layer a feature belongs in is pack membership, which is Truls's under `CLAUDE.md`.

This section was added on 2026-09-21, after the `Grado_NonChanging` survey found
`blueprint-sandboxes` and `EditorExtensions` — different mods, adjacent packs, and one silently
disables a feature of the other. The format had a rule for the same mod named twice and nothing for
this. Surveys #3 through #6 are each likely to hit it again, with more layers beneath them than
this one had. #3 reached the other half of *this* overlap on 2026-09-21 — `EditorExtensions` is a
`Grado_ChangingBase` member, and its entry carries the row and points at the comparison in
`docs/catalogue/Grado_NonChanging.md`, which is what the rule asks of the higher side.

**That survey found two more**, both against `Grado_ABC` and both with their comparison in
`docs/catalogue/Grado_ChangingBase.md`, because that pack is the lower one:
`UltimateBeltsSpaceAge` against `boblogistics`, and `miniloader-redux` against
`deadlock-beltboxes-loaders`. Three instances out of two surveys is the rate to plan for: #4, #5
and #6 sit above more layers than either of these did.

**#4 found a fourth on 2026-09-21**, and it is the first one found from the higher side with no
comparison already written: `angelsaddons-storage` (`Grado_ABC`) against the four `WideChests` mods
(`Grado_ChangingBase`) — warehouses and silos against merged chests, the same outcome by different
mechanisms. It is the case this section's third bullet describes, so the row and a pointer went in
the `Grado_ABC` entry and issue **#30** was filed against the lower pack's file for the comparison
itself. The one other overlap #4 reached, `boblogistics` against `UltimateBeltsSpaceAge`, was
already written up by #3, and the higher survey spent a sentence pointing at it rather than
re-deriving it — which is the rule working. The third instance against `Grado_ABC`,
`deadlock-beltboxes-loaders` against `miniloader-redux`, hangs off a mod #4 did not survey: it is
one of #5's sixteen, so #4 reached two overlaps and not three.

**#6 found the fifth and sixth on 2026-09-22**, and between them they are the only survey to have
used both of the rules above. `SpaceModFeorasFork` (`Grado_ABCX`)
against `space-age` (`Grado_ABCS`) is the same-layer case this section names — the only pair that
can reach it: one survey, two packs,
no lower one, so the comparison is written in `docs/catalogue/Grado_ABCX.md` because #6 reached the
fork first, and `docs/catalogue/Grado_ABCS.md` points at it. `space-age` against
`UltimateBeltsSpaceAge` (`Grado_ChangingBase`) is the third-bullet case again — noticed from the
higher side, with no comparison already written — so the row and a pointer went in the `Grado_ABCS`
entry and issue **#38** was filed against the lower pack's file. **Six instances across the five
surveys**, and none of them was predicted before the survey that hit it; a survey that reports none
should re-check rather than conclude.

## The entry

The heading is always the bare portal name, on its own, because it is what makes the catalogue
greppable against a dependency list. Nothing else goes on that line — no arrows, no status.

````markdown
### `portal-name`

| | |
|---|---|
| **Title** | The display name on the portal |
| **Does** | One line: what the mod puts in the game |
| **Latest** | `version`, `factorio_version`, release date |
| **Downloads** | Count, as read |
| **Owner** | Portal owner |
| **Read on** | The date the portal was queried |

**Alternatives considered.** What else was looked at and why it was not preferred, or "none found"
and the search that was run.

**Recommendation: keep | replace with `x` | drop | reconsider: `<what>`.** The reason, in prose.
````

Four variants. The first adds one row and changes nothing else; the second adds a row and
requires prose to go with it; the third and fourth also move the entry and constrain what its
**Recommendation** may say. The third and fourth differ only in *when* the mod left: during the
1.1 -> 2.0 port, or by a decision taken afterwards.

- **A mod that replaced a 1.1 mod** adds one row, `| **Supersedes** | `old-name`, last 1.1 release |`,
  and changes nothing else. The heading is the mod that is in the pack now, not the one it replaced
  — the heading has to match the dependency list.

`reconsider:` was added to the in-pack verdicts on 2026-09-21, after the `Grado_NonChanging` survey
hit a case the first three could not express. `keep`, `replace with` and `drop` each assert an
answer; a mod whose membership is genuinely unresolved has none of them to offer, and writing `keep`
to stay inside the vocabulary would claim a decision nobody has taken. It names the open question
instead. Use it sparingly — a survey where several entries reconsider has not done its work.

- **A mod overlapping a mod in another pack** adds one row,
  `| **Overlaps** | `other-mod` (`Pack_Name`) |`, and nothing else in the table — but the row is
  never the whole of it. The entry also carries either the comparison itself or one sentence
  pointing at where it lives; which of the two is *Two kinds of duplication* above. A row on its
  own leaves an overlap nobody can trace.

- **A mod dropped during the port** does three things: it adds
  `| **Status** | dropped during the port |`, it sits in the *Dropped during the port* section rather
  than *In the pack*, and its **Recommendation** begins `stay dropped` or `reconsider:` followed by
  what is to be reconsidered.

- **A mod ruled out after the port** is the same shape for a mod that survived the port and was
  removed later, by a decision rather than by an upstream gap. It adds
  `| **Status** | dropped <date> (#<issue>) |`, or
  ``| **Status** | replaced by `new-name`, <date> (#<issue>) |`` if something took its place, and it
  sits in the *Ruled out after the port* section. **Its Recommendation is left exactly as the survey
  wrote it**, with the ruling appended below as its own paragraph — because a ruling that overwrites
  the recommendation it acted on cannot be audited afterwards. The replacement, if there is one, gets
  its own entry under *In the pack* carrying the `**Supersedes**` row.

  Added 2026-09-22, settling a gap #7 hit: the three variants above all assume a mod left during the
  port, and `Grado_NonChanging` removed three mods that had survived it. Without this variant the
  entries stayed under *In the pack*, which broke the one guarantee the heading rule exists to give.

- **A mod added after the port** is the mirror of the one above: a mod that was never in the 1.1
  pack and entered by a decision. It sits under *In the pack*, carries the `**Supersedes**` row if
  it displaced an existing member, and **its Recommendation reads `keep`, followed by "Added by
  #<issue> on <date>" and the reason** — the verdict vocabulary is unchanged, because the entry is
  describing a mod that is in the pack now. There is no `**Status**` row; membership is the
  dependency list's job and the mod is in it.

- **A mod resolved through a lower pack but no longer named in this one** keeps its entry under
  *In the pack* and adds
  `| **Status** | line removed from this pack <date> (#<issue>); still a member of `Pack_Name` |`.
  **This is the one case where *In the pack* holds an entry the dependency list does not name**, and
  it is deliberate: every player of this pack still installs the mod, so an entry that vanished
  would lose the comparison work with it. A reader checking the section against `info.json` finds
  the discrepancy answered in the row rather than unexplained.

  Both added 2026-09-22 by #8, which hit all three gaps at once: it added three mods to
  `Grado_ChangingBase` that no variant covered, and it resolved the `bobinserters` duplication by
  deleting a line from `Grado_ABC` whose entry then had no licensed shape. The lesson is the same one
  the variant above records — the format assumed the port was the only thing that ever moved a mod,
  and it is not.

Field notes, where the name does not carry the meaning:

- **`portal-name`** is the name `info.json` resolves, not the title: `even-pickier-dollies`, not
  "Even Pickier Dollies".
- **Title** is the portal's display name, recorded because it is what a human searching the portal
  sees and what the search rule below matches against.
- **Does** is the field most likely to be written lazily. "Adds Bob's plates" is not a description.
- **Latest** carries `factorio_version` because a 2.x release and a Space Age compatible release are
  different claims that get conflated. Record what the portal says, not an interpretation.
- **Downloads** is context, not an argument. A 20,000-download successor to a 200,000-download mod
  is normal; say the asymmetry out loud rather than letting a reader infer quality from it.
- **Owner** is recorded because an author going quiet explains a whole family of mods dying at once,
  which is cheaper to notice than nine separate investigations.
- **Read on** exists because every other row goes stale. An entry with no date cannot be trusted
  later and cannot be refreshed cheaply either, because nobody knows whether it needs refreshing.
- **Alternatives considered** is where "not checked" must be written rather than left blank. A blank
  reads as "nothing there"; the difference between *searched and found nothing* and *did not search*
  is what the `SpaceMod` mistake turned on.
- **Recommendation** is a recommendation. Pack membership is Truls's call under `CLAUDE.md`; surveys
  recommend, the decide-and-apply tickets settle. An entry that says "dropped" rather than
  "recommend dropping" has overstepped.

## What the evidence rules mean here

The rules are in `CLAUDE.md`. Two of them decide whether an entry is finished:

**The `2.x` check** governs the **Latest** row: a mod on 2.1 is not a mod that is missing.

**Search titles and summaries, not just names**, governs **Alternatives considered**. This is the
expensive one, and the worked example below is what it found the first time it was properly applied.
The full list is one call — the `version=2.0` parameter means "2.0 and later", so the 9,642 entries
it returns include the 2.1 mods. Match against `name`, `title` *and* `summary`.

A successor can be a fork, a rewrite, or a different mod covering the same ground; do not require
the name to look related. `PickerExtended` became `kry-picker-extended`, `WaterWell` became
`StoneWaterWell-ActuallyUpdated`.

**Two of the six were voided on 2026-09-22 by #8**, which removed `UltimateBeltsSpaceAge` from
`Grado_ChangingBase` — in part because of the overlaps recorded here. `boblogistics` against it and
`space-age` against it are both gone, and **#38 was closed as moot**. The instances are left in the
text above because the point they make is about the *rate* at which surveys find overlaps, which the
removal does not change; only the tally of live overlaps does, and that is **three**: `miniloader-redux` against
`deadlock-beltboxes-loaders`, `angelsaddons-storage` against the `WideChests` family, and
`SpaceModFeorasFork` against `space-age`. Three of the six are void — the two above and, earlier,
`blueprint-sandboxes` against `EditorExtensions`, which **#7** voided on 2026-09-22 by removing
`blueprint-sandboxes` from `Grado_NonChanging`.

## Worked examples

Real entries, read on **2026-09-20**, one per variant. When a survey reaches these mods its entry
supersedes the copy here; these exist to show the shape.

### `bobplates`

| | |
|---|---|
| **Title** | Bob's Metals, Chemicals and Intermediates |
| **Does** | Adds the ore-to-plate chain the rest of Bob's mods build on: new metals, chemical processing, and the intermediates other Bob's mods take as inputs |
| **Latest** | `3.0.1`, `factorio_version` **2.1**, 2026-07-26 |
| **Downloads** | 290,643 |
| **Owner** | `Bobingabout` |
| **Read on** | 2026-09-20 |

**Alternatives considered.** None. This is load-bearing for the rest of the Bob's set; replacing it
would mean replacing the overhaul.

**Recommendation: keep.** Actively maintained, current within two months, and the thing most of the
pack depends on.

It declares `factorio_version` **2.1** while the pack declares 2.0 — a live instance of the open
question in `docs/porting-notes.md`, not a reason to change either number here.

### `miniloader-redux`

| | |
|---|---|
| **Title** | Miniloader (Redux) |
| **Does** | Compact one-tile loaders moving items between belts and containers at full belt throughput, without the inserter animation |
| **Latest** | `2.2.3`, `factorio_version` **2.1**, 2026-09-16 |
| **Downloads** | 22,472 |
| **Owner** | `hgschmie` |
| **Supersedes** | `miniloader` by `therax`, last `1.15.7` on 2023-09-11, 193,085 downloads |
| **Read on** | 2026-09-20 |

**Alternatives considered.** No other 2.x mod was found offering one-tile full-throughput loaders,
searching name, title and summary.

**Recommendation: keep.** Released four days before this reading, so actively maintained rather than
merely present. The download gap against the original measures how long each has existed and how
many players were on 1.1, not quality — the original cannot accumulate downloads from 2.0 players
because it does not run for them.

### `PickerAtheneum`

| | |
|---|---|
| **Title** | Picker Atheneum |
| **Does** | The shared library the rest of the Picker family was built on, plus a few interface tweaks of its own |
| **Latest** | `1.2.5`, `factorio_version` **1.1**, 2022-06-05 |
| **Downloads** | 30,639 |
| **Owner** | `Nexela` |
| **Status** | dropped during the port |
| **Read on** | 2026-09-20 |

**Alternatives considered.** Searching the full 2.x list by title rather than name returns
**`kry-picker-complete`**, *Picker Complete Feature Pack* by `Kryzeth` — `1.1.0`, 2.1, 2026-07-24,
744 downloads. Its summary calls it a modpack of "all 2.0 mods required to recreate the complete
Picker experience"; it depends on `kry-picker-extended`, `even-pickier-dollies`, `belt-visualizer`,
`CursorEnhancements`, `Shortcuts-ick`, `AutoDeconstruct`, `BottleneckLite`, `EvenDistributionLite`
and `fluid-connection-indicators`. `kry-picker-extended` (`1.2.4`, 2.1, 2026-08-10) states outright
that it is the 2.0/2.1 update of `PickerExtended` by `Nexela`, "who has seemingly left Factorio
modding" — which is why the whole family went quiet at once rather than nine separate abandonments.

**Recommendation: reconsider:** the whole Picker family against `kry-picker-complete`, as one
question. Not simply "add it": `BottleneckLite` and `EvenDistributionLite` overlap with
`even-distribution` already in `Grado_NonChanging` — and with `BottleneckLite` itself, which #7 made
a member on 2026-09-22, so half of this overlap is now the bundle duplicating a mod the pack already
has rather than competing with a different one. Its optional
`squeak-through-2` is already a mandatory dependency of `Grado_ChangingBase` and the subject of
issue #11. Whether a pack should depend on another pack at all is worth asking before the smaller
question.

This entry is why the search rule is worth its cost. The port checked nine Picker mods by name,
found seven with no 2.0 release, and recorded them as dropped with no replacement found. The
replacement is a pack whose name contains none of those nine names.
