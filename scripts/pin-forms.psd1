# The forms vendor/grado-factorio-tools/scripts/pin-measure.ps1 runs at the old pin and the new
# when the tools pin moves (#389). Its shape, and what each placeholder becomes, is in that
# script's header (grado-factorio-tools#247). One form for each way this repository runs a tools
# script, in .githooks/, .github/workflows/check.yml and .claude/settings.json, follow-pin.ps1
# by its -SelfTest alone, and for each script of its own that reaches into vendor/. The first 20
# forms, 21 runs, are those PR #387 measured by hand (2026-10-26, its Evidence table), the
# commit check's range and hook forms given -ScopeFile commit-scopes.txt since #415; the rest
# are named where they start.
@{
    Forms = @(
        @{ Name = 'commit-check-selftest'; From = 'tools'; Script = 'commit-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'commit-check-range'; From = 'tools'; Script = 'commit-check.ps1'; Args = @('-ScopeFile', 'commit-scopes.txt', '-Range', 'HEAD~20..HEAD', '-RequireCommits') }
        # .githooks/commit-msg hands it the message file.
        @{ Name = 'commit-check-hook'; From = 'tools'; Script = 'commit-check.ps1'; Args = @('-ScopeFile', 'commit-scopes.txt', '{headmsg}') }
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
        # The shared reword-commit.ps1 since #418, in place of the scripts/ copy PR #387 measured.
        @{ Name = 'reword-commit-selftest'; From = 'tools'; Script = 'reword-commit.ps1'; Args = @('-SelfTest') }
        # This repository's scripts that reach into vendor/.
        @{ Name = 'member-change-selftest'; From = 'sibling'; Script = 'scripts/member-change-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'member-change-range'; From = 'sibling'; Script = 'scripts/member-change-check.ps1'; Args = @('-Range', 'HEAD~20..HEAD') }
        @{ Name = 'member-change-hook'; From = 'sibling'; Script = 'scripts/member-change-check.ps1'; Args = @('-MessageFile', '{headmsg}') }
        @{ Name = 'overlap-rows-selftest'; From = 'sibling'; Script = 'scripts/overlap-rows-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'overlap-rows-revision'; From = 'sibling'; Script = 'scripts/overlap-rows-check.ps1'; Args = @('-Revision', 'HEAD') }
        @{ Name = 'overlap-rows-hook'; From = 'sibling'; Script = 'scripts/overlap-rows-check.ps1'; Args = @() }
        @{ Name = 'mentions-selftest'; From = 'sibling'; Script = 'scripts/mentions.ps1'; Args = @('-SelfTest') }
        @{ Name = 'stage-pack-selftest'; From = 'sibling'; Script = 'scripts/stage-pack.ps1'; Args = @('-SelfTest') }
        # Beyond PR #387's list. pr-body.ps1 loads Test-Body from pr-body-check.ps1 (#388).
        @{ Name = 'pr-body-selftest'; From = 'sibling'; Script = 'scripts/pr-body.ps1'; Args = @('-SelfTest') }
        # Four more tools scripts this repository names, by self-tests that need no game and no
        # network.
        @{ Name = 'resolve-modpack-selftest'; From = 'tools'; Script = 'resolve-modpack.ps1'; Args = @('-SelfTest') }
        @{ Name = 'get-dump-selftest'; From = 'tools'; Script = 'get-dump.ps1'; Args = @('-SelfTest') }
        @{ Name = 'markdown-rewrap-selftest'; From = 'tools'; Script = 'markdown-rewrap.ps1'; Args = @('-SelfTest') }
        @{ Name = 'trace-definitions-selftest'; From = 'tools'; Script = 'trace-definitions.ps1'; Args = @('-SelfTest', '-NoGame') }
        # .githooks/post-checkout, post-merge and post-rewrite run it (#391); added by #413.
        @{ Name = 'follow-pin-selftest'; From = 'tools'; Script = 'follow-pin.ps1'; Args = @('-SelfTest') }
        # The session hooks .claude/settings.json wires, each by its self-test on that file; added
        # by #416 for #414.
        @{ Name = 'download-hook-selftest'; From = 'tools'; Script = 'ask-before-download.ps1'; Args = @('-SelfTest', '-Settings', '.claude/settings.json') }
        @{ Name = 'heredoc-hook-selftest'; From = 'tools'; Script = 'refuse-python-heredoc.ps1'; Args = @('-SelfTest', '-Settings', '.claude/settings.json') }
        @{ Name = 'backtick-hook-selftest'; From = 'tools'; Script = 'refuse-backtick-substitution.ps1'; Args = @('-SelfTest', '-Settings', '.claude/settings.json') }
        @{ Name = 'hanging-bash-hook-selftest'; From = 'tools'; Script = 'refuse-hanging-bash.ps1'; Args = @('-SelfTest', '-Settings', '.claude/settings.json') }
        @{ Name = 'hook-skip-hook-selftest'; From = 'tools'; Script = 'refuse-git-hook-skip.ps1'; Args = @('-SelfTest', '-Settings', '.claude/settings.json') }
        @{ Name = 'skipped-install-hook-selftest'; From = 'tools'; Script = 'warn-skipped-install.ps1'; Args = @('-SelfTest', '-Settings', '.claude/settings.json') }
        # The shared checks #416 runs in place of scripts/glossary-check.ps1 and
        # scripts/header-length-check.ps1, and the four .githooks/pre-commit runs on the staged
        # scripts, here over all of scripts/.
        @{ Name = 'glossary-check-selftest'; From = 'tools'; Script = 'glossary-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'glossary-check-range'; From = 'tools'; Script = 'glossary-check.ps1'; Args = @('-Range', 'HEAD~20...HEAD', '-LeftFile', 'glossary-left.txt') }
        @{ Name = 'comment-line-selftest'; From = 'tools'; Script = 'comment-line-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'comment-line-all'; From = 'tools'; Script = 'comment-line-check.ps1'; Args = @('-All', '-Path', 'scripts/*.ps1,.githooks/*,.github/workflows/*.yml') }
        # .githooks/pre-commit, on the staged files: the clone's index matches HEAD, so none.
        @{ Name = 'comment-line-hook'; From = 'tools'; Script = 'comment-line-check.ps1'; Args = @('-Path', 'scripts/*.ps1,.githooks/*,.github/workflows/*.yml') }
        @{ Name = 'param-check-selftest'; From = 'tools'; Script = 'param-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'param-check-scripts'; From = 'tools'; Script = 'param-check.ps1'; Args = @('scripts') }
        @{ Name = 'variable-case-selftest'; From = 'tools'; Script = 'variable-case-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'variable-case-scripts'; From = 'tools'; Script = 'variable-case-check.ps1'; Args = @('scripts') }
        @{ Name = 'help-check-selftest'; From = 'tools'; Script = 'help-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'help-check-scripts'; From = 'tools'; Script = 'help-check.ps1'; Args = @('scripts') }
        @{ Name = 'strict-list-selftest'; From = 'tools'; Script = 'strict-list-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'strict-list-scripts'; From = 'tools'; Script = 'strict-list-check.ps1'; Args = @('scripts') }
        @{ Name = 'cited-commit-selftest'; From = 'tools'; Script = 'cited-commit-check.ps1'; Args = @('-SelfTest') }
        @{ Name = 'cited-commit-tree'; From = 'tools'; Script = 'cited-commit-check.ps1'; Args = @('-Exempt', 'docs/loads/,docs/traces/') }
        # The shared absolute-words.ps1, in place of scripts/absolute-words.ps1; added by #417.
        @{ Name = 'absolute-words-selftest'; From = 'tools'; Script = 'absolute-words.ps1'; Args = @('-SelfTest') }
    )
}
