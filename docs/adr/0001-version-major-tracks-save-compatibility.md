# A pack's major version tracks save compatibility

> **Superseded by [ADR 0002](0002-any-pack-can-go-major-and-1-0-0-signals-maturity.md)**
> (2026-09-22). The rule below stands. Two claims about it do not: `Grado_NonChanging` *can*
> go major, and `0.x` to `1.0.0` *does* signal maturity.

A pack carries no content of its own, so the usual semver reading - how much of the API changed -
has nothing to measure. The one question a player actually asks a pack's version is whether they can
update mid-save, so that is what the number answers: **major** for a dependency change an existing
save cannot survive (a member mod of `Grado_ChangingBase` or below added or removed), **minor** for a
save-safe dependency change, **patch** for metadata only. This matches the breaking-change rule
`CLAUDE.md` already applies to commit messages.

## Consequences

The overhaul packs will reach a high major number quickly, and a reader who takes the major version
as a maturity signal will misread it - `Grado_ABC 4.0.0` means four save-breaking updates, not four
years of polish. That is the accepted cost: a number that looks alarming is cheaper than a player
losing a long save to an update that looked routine.

`Grado_NonChanging` can never go major under this rule. That is not an oversight - a pack that by
definition does not change save state has no save-breaking change available to it.

## Considered options

Reserving major for a restructure of the pack set itself (as the three-into-five split was) and
using minor for every dependency change. Rejected: it keeps the numbers calm at the cost of the
version carrying no information a player can act on, which is the only reason to version these packs
independently at all.
