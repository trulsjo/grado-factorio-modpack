# The forms vendor/grado-factorio-tools/scripts/pin-measure.ps1 runs at the old pin and the new
# when the tools pin moves (#389). Its shape, and what each placeholder becomes, is in that
# script's header (grado-factorio-tools#247). One form for each way this repository runs a tools
# script, in .githooks/, .github/workflows/check.yml and .claude/settings.json, and for each
# script of its own that reaches into vendor/. The first 20 forms, 21 runs, are those PR #387
# measured by hand (2026-10-26, its Evidence table); the rest are named where they start.
@{
    Forms = @(
        @{ Name = 'commit-check-selftest'; From = 'tools'; Script = 'commit-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'commit-check-range'; From = 'tools'; Script = 'commit-check.ps1'; Args = @('-Range', 'HEAD~20..HEAD', '-RequireCommits') }
        # .githooks/commit-msg hands it the message file.
        @{ Name = 'commit-check-hook'; From = 'tools'; Script = 'commit-check.ps1'; Args = @('{headmsg}') }
        @{ Name = 'markdown-check-selftest'; From = 'tools'; Script = 'markdown-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'markdown-check-range'; From = 'tools'; Script = 'markdown-check.ps1'; Args = @('-Range', 'HEAD~20...HEAD', '-MaxLineLength', '100') }
        # .githooks/pre-commit, on the staged files: the clone's index matches HEAD, so none.
        @{ Name = 'markdown-check-hook'; From = 'tools'; Script = 'markdown-check.ps1'; Args = @('-MaxLineLength', '100') }
        @{ Name = 'pr-body-check-selftest'; From = 'tools'; Script = 'pr-body-check.ps1'; Args = @('-SelfTest') }
        # The workflow's body step; run once for each of the last two merged pull requests.
        @{ Name = 'pr-body-check-body'; From = 'tools'; Script = 'pr-body-check.ps1'; Args = @('-Body', '{prbody:last-merged:2}') }
        @{ Name = 'cd-hook-selftest'; From = 'tools'; Script = 'refuse-cd-into-mod-cache.ps1'; Args = @('-SelfTest', '-Settings', '.claude/settings.json') }
        # The hook as .claude/settings.json wires it: one command refused, one let through.
        @{ Name = 'cd-hook-refused'; From = 'tools'; Script = 'refuse-cd-into-mod-cache.ps1'; Args = @('-Root', '.', '-CacheName', '.mod-cache', '{stdin:{"cwd":".","tool_input":{"command":"cd .mod-cache/Grado_ABC"}}}') }
        @{ Name = 'cd-hook-passed'; From = 'tools'; Script = 'refuse-cd-into-mod-cache.ps1'; Args = @('-Root', '.', '-CacheName', '.mod-cache', '{stdin:{"cwd":".","tool_input":{"command":"ls .mod-cache"}}}') }
        # This repository's scripts that reach into vendor/.
        @{ Name = 'member-change-selftest'; From = 'sibling'; Script = 'scripts/member-change-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'member-change-range'; From = 'sibling'; Script = 'scripts/member-change-check.ps1'; Args = @('-Range', 'HEAD~20..HEAD') }
        @{ Name = 'member-change-hook'; From = 'sibling'; Script = 'scripts/member-change-check.ps1'; Args = @('-MessageFile', '{headmsg}') }
        @{ Name = 'overlap-rows-selftest'; From = 'sibling'; Script = 'scripts/overlap-rows-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'overlap-rows-revision'; From = 'sibling'; Script = 'scripts/overlap-rows-check.ps1'; Args = @('-Revision', 'HEAD') }
        @{ Name = 'overlap-rows-hook'; From = 'sibling'; Script = 'scripts/overlap-rows-check.ps1'; Args = @() }
        @{ Name = 'mentions-selftest'; From = 'sibling'; Script = 'scripts/mentions.ps1'; Args = @('-SelfTest') }
        @{ Name = 'reword-commit-selftest'; From = 'sibling'; Script = 'scripts/reword-commit.ps1'; Args = @('-SelfTest') }
        @{ Name = 'stage-pack-selftest'; From = 'sibling'; Script = 'scripts/stage-pack.ps1'; Args = @('-SelfTest') }
        # Beyond PR #387's list. pr-body.ps1 loads Test-Body from pr-body-check.ps1 (#388).
        @{ Name = 'pr-body-selftest'; From = 'sibling'; Script = 'scripts/pr-body.ps1'; Args = @('-SelfTest') }
        # Four more tools scripts this repository names, by self-tests that need no game and no
        # network.
        @{ Name = 'resolve-modpack-selftest'; From = 'tools'; Script = 'resolve-modpack.ps1'; Args = @('-SelfTest') }
        @{ Name = 'get-dump-selftest'; From = 'tools'; Script = 'get-dump.ps1'; Args = @('-SelfTest') }
        @{ Name = 'markdown-rewrap-selftest'; From = 'tools'; Script = 'markdown-rewrap.ps1'; Args = @('-SelfTest') }
        @{ Name = 'trace-definitions-selftest'; From = 'tools'; Script = 'trace-definitions.ps1'; Args = @('-SelfTest', '-NoGame') }
    )
}
