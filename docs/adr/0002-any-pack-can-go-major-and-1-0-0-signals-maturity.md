# Any pack can go major, and `1.0.0` signals maturity

Supersedes [ADR 0001](0001-version-major-tracks-save-compatibility.md), whose rule is kept and whose
two claims about it are corrected.

**The rule stands.** A pack carries no content, so the only question its version can usefully answer
is whether a player can update mid-save: **major** for a dependency change an existing save cannot
survive, **minor** for a save-safe one, **patch** for metadata. Nothing below changes that.

## What 0001 got wrong

**`Grado_NonChanging` can go major.** 0001 said it "can never go major under this rule... a pack that
by definition does not change save state has no save-breaking change available to it". That premise
is false, and #7 established it on 2026-09-22 while settling what the pack's promise actually means.
Several members write to the save: `Tapeline`'s measurements, `Todo-List`'s list, `YARM`'s monitored
sites, `SpeedControl`, and - until #7 removed it - `blueprint-sandboxes`, which created whole
surfaces. Removing a mod that owns surfaces is exactly the kind of change the rule exists to warn
about. The pack is not exempt; it was only ever described as exempt.

The promise it was exempt on the strength of is now stated once, in `CONTEXT.md` under *Promise*,
and it does not say what 0001 assumed it said.

**`0.x` to `1.0.0` is the one major that means maturity.** 0001 named the maturity reading as a
misreading and accepted it as a cost. That holds for every major after the first. It does not hold
for the `0.x` boundary, which semver already gives the meaning "this is now stable" and which each
pack crosses exactly once. A pack goes `1.0.0` when it has been loaded in Factorio and works - the
claim none of the five can make today.

After `1.0.0`, 0001's reading resumes unchanged: `2.0.0` means a broken save, not a second year of
polish.

## Consequences

Two majors now mean two different things, separated by which one it is. `1.0.0` is a claim about the
pack working; every later major is a warning about a save. A reader who learns only the second rule
will misread the first, which is why both live here rather than in a one-line convention.

A pack's version does not move at all before its first release. All five sit at `0.1.0` and absorb
any number of dependency edits without bumping, because there is no player and no save for the number
to inform. `Grado_NonChanging` reached 26 members from 29 on 2026-09-22 and stayed at `0.1.0`.

## Considered options

**Amend 0001 in place.** Rejected: it would have to be amended twice, and the reasoning for the
never-major claim is worth keeping legible as a thing that was believed and then measured.

**Keep the never-major claim and treat a lost sandbox surface as not the kind of loss the rule
protects against.** Rejected as unmeasured - nothing has been loaded in Factorio, so what Factorio
does when a surface-creating mod is removed is not known here. A rule should not rest on an
untested guess a second time.
