# grado-factorio-modpack

Five Factorio **2.0** modpacks, ported from the three 1.1 packs published on the mod portal by
`ostogvin`. A pack is an `info.json` and nothing else unless compatibility between member mods forces
Lua into it.

## The chain

```
Grado_NonChanging      quality of life; adds no content (see GLOSSARY.md, *Promise*)
  |
  +-- Grado_ChangingBase   may add content and change saves; compatible with most overhauls
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
**one pack has been loaded and played: `Grado_NonChanging`**, on Factorio 2.0.77 (2026-09-29 to
2026-09-30). 24 of its 26 named members were seen working, the save reloaded with the members'
data that was checked, and one key-binding clash turned up - see
[docs/loads/Grado_NonChanging-2026-09-29.md](docs/loads/Grado_NonChanging-2026-09-29.md). The
other four packs each have a recorded load, from 2026-10-04, and have not been played: a load shows the mods
start together, not that the pack plays well. `Grado_ABCX` was also refused beside Space Age, as
intended. The records are in [docs/loads/](docs/loads/). See
[docs/porting-notes.md](docs/porting-notes.md) for what was kept, replaced and dropped, and for the
open questions. [docs/catalogue/](docs/catalogue/) is the other half: one file per pack, one entry
per mod, recording what each mod does, how current it is and whether it should stay. **All five
packs have now been surveyed**, the last two on 2026-09-22 - which is a claim about the portal, not
about the game.

## Staging a pack

One command puts a pack, and every mod it needs, into one mods directory:

```
git submodule update --init
pwsh -File scripts/stage-pack.ps1 Grado_ABC
```

It resolves the pack's closure to exact releases for the pack's `factorio_version` and the
installed game's build, fetches those releases, and zips the pack and every pack under it as
`<name>_<version>.zip`, the version read from each `info.json`. Resolving, fetching and
packing are the shared tools', as is the load the printed line runs: the zip is
`pack-mods.ps1`'s, which packs the files git tracks under the pack directory and warns of any
untracked file it leaves out - a git-ignored one is left out without a word. Staging again
replaces the old zips and any unpacked directory of a pack, and removes any other
`<name>_<version>` copy of a member first. The default target is
`.mod-cache/<pack>/`, which is git-ignored, and staging there again also removes any mod the pack
has since dropped; the command prints the `load-harness.ps1` line that
loads it. The options:

- `-ModsDirectory <dir>` puts the set somewhere else, and is never pruned: a mod the pack drops
  stays there until you remove it. Factorio took a staged directory as its mods directory as it
  stands, on the one run checked: the fetch leaves a `.zips` subdirectory there, and the game
  passed over it without a word - no log line, no `mod-list.json` entry (2.0.77 headless,
  `Grado_NonChanging`, 2026-09-24, #59). The game then writes a `mod-list.json` into the
  directory, enabling every mod it finds there - and `space-age`, `quality` and `elevated-rails`
  too, on an install that owns the expansion. Use one directory per pack: a second pack staged
  into the same one joins the first pack's members, and `Grado_ABCX` beside
  `Grado_ABCS` is a set that must never exist.
- `-Build 2.0.77` resolves for a build other than the installed one. It has to be on the pack's
  `factorio_version` line, or the command refuses.
- `-FactorioExe <path>` names the install, when it is not where `load-harness.ps1` looks.

A pack that does not resolve stops the command before anything is fetched. A pack whose declared
`base >=` is below its members' floor still stages: the resolver reports that without failing
(#16).

It needs PowerShell 7, and fetching needs the mod-portal login Factorio stores once you sign in
in the game. `pwsh -File scripts/stage-pack.ps1 -SelfTest` checks the staging half without the
network. The tools it runs live in `vendor/grado-factorio-tools`.

## Dumping a staged pack's prototypes

One command gives the path of a `--dump-data` dump of a staged pack, on its last line:

```
pwsh -File scripts/get-dump.ps1 Grado_ABC
pwsh -File scripts/get-dump.ps1 Grado_ABCS -With space-age
```

The dump is kept in `.dump-cache/` at the repository root, which is git-ignored and outside the
staged mod directories, as `<pack>[+<bundled mods>]-<checksum>-<id>.json`: the checksum is the
prototype list checksum the game prints, and the game's log (`.log`) and the staged set the dump is
of (`.key`) lie beside it. Asking again runs nothing while the staged set is the same, and the
command says which it did. A member at another release, a mod disabled with `-Disabled <names>`,
another `-With` selection, another game build, or a file added to or removed from a staged mod, is
another set and gets a dump of its own. What it cannot see is in the script's header.

To clear the cache, delete `.dump-cache/`, or the three files of one dump. Nothing else reads it.
`pwsh -File scripts/get-dump.ps1 -SelfTest` checks the caching without the game.

## Checks

Two git hooks, both wired up by `git config core.hooksPath .githooks`: `commit-msg` checks the
shape of a commit message, and `pre-commit` runs `scripts/markdown-check.ps1` on the staged
Markdown files. That one refuses emphasis or a code span left open at the end of its paragraph, a
table row with another column count than its header, and a link to a file git does not track. It
does not judge prose. `-Range origin/main...HEAD` checks the Markdown a branch changed, `-All` every
tracked file, and `-SelfTest` proves it can fail.

A pull request gets both checks from `.github/workflows/check.yml`, over its own commits, with
each check's self-test and the download hook's first. Nothing is installed on the runner.

`scripts/glossary-check.ps1 -Range origin/main...HEAD` lists each line a branch adds that uses a
word `GLOSSARY.md` tells you to avoid, with the term that avoids it, and fails if it lists one.
A deliberate use is marked on its line with `<!-- deliberate: word -->` and is not listed.
A pull request gets this one from the same workflow, with its self-test. No hook runs it.
`-List` prints the avoid entries it matches and the ones it leaves to a reader, with why.

`scripts/reword-commit.ps1 -Commit <sha> -MessageFile <file>` rewords one commit of a branch that
is not pushed, the tip or one under it, replays the commits above it, and prints each old and new
hash. It moves the branch only when every tree is unchanged and the commit check passes the new
messages. Its self-test runs in the same workflow.

`scripts/pr-body.ps1 -Draft <file> -Review <report> -Out <file>` puts the pre-PR reviewer's
findings and confirmation under the draft of a pull request body, word for word, and fails on a
finding the confirmation does not answer. Its self-test runs in the same workflow.

Agent sessions also get a hook from `.claude/settings.json`: a shell command that changes
directory into `.mod-cache/` is refused before it runs, because a session's tooling writes state
files where its shell stands. Reading the cache by path is not affected.
`scripts/refuse-cd-into-mod-cache.ps1` has one refused and one allowed example to check it with,
and a `-SelfTest`.

A second hook there, `scripts/ask-before-download.ps1`, stops a command that installs a package
(`npm install`, `ci`, `add` or `exec`, `npx`, `pip install`, `gem install`, `cargo install`, and `install` under `winget`,
`choco` or `scoop`) or fetches an `.exe`, `.msi`, `.zip`, `.tar.gz` or `.tgz` from anywhere but
`mods.factorio.com`, and tells the session to ask Truls, who runs an approved command himself.
It refuses and does not ask: its header has the measurement of 2026-10-08 that says why. Reading
the portal, staging a pack, `git` and the rest of `gh` pass: `gh release
download` is refused. Its header says what it cannot
see, and it has a `-SelfTest` too.

## Publishing

`Grado_NonChanging`, `Grado_ChangingBase` and `Grado_ABCX` already exist on the portal under
`ostogvin` as 1.1 entries, and the 2.0 packs go to those same entries - the 1.1 releases stay in
place, and a player still on 1.1 keeps a working install. `Grado_ABC` and `Grado_ABCS` are new
entries.

All five start at `0.1.0` and version independently from there, and a pack's version does not move
before its first release. A pack's major version tracks save compatibility: a major bump means a
dependency change an existing save cannot survive, a minor a save-safe one, a patch metadata only.
The one exception is `0.x` to `1.0.0`, which signals maturity instead - the pack has been loaded in
Factorio and works. See [docs/adr/0002-any-pack-can-go-major-and-1-0-0-signals-maturity.md](docs/adr/0002-any-pack-can-go-major-and-1-0-0-signals-maturity.md).
