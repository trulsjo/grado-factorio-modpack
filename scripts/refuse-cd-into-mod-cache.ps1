<#
.SYNOPSIS
    A hook for agent sessions: refuses a shell command that changes directory into the mod cache,
    .mod-cache/ under the repository root. Exit 2 refuses the command before it runs and says what
    to do instead; exit 0 lets it run.

.DESCRIPTION
    WHY (#150). An agent session's tooling writes state files into whatever directory its shell
    stands in. On 2026-10-05 a command that changed directory into a staged mod left two state
    directories in the mod cache, one of them inside a staged mod, and a file inside a staged mod
    is part of what the game loads. Reading the cache by path from the repository root leaves
    nothing behind.

    HOW IT IS WIRED. .claude/settings.json, which is tracked, names it as a PreToolUse hook on the
    two shell tools. The session hands the hook the tool call as JSON on stdin: this reads
    `tool_input.command` and `cwd`. The wiring starts this script only when that JSON holds the
    text `mod-cache`, because starting PowerShell took a second on the machine it was written on
    (2026-10-06) and the hook runs before every shell command.

    WHAT IT REFUSES. A cd, chdir, pushd, sl, Set-Location or Push-Location, standing where a
    command can stand, whose target resolves to the cache or anything under it: relative or
    absolute, with either slash, as /c/... or C:\.... A relative target is resolved from where the
    earlier ones in the command left the shell, and from where it started, since one in a subshell
    does not last. A target it cannot resolve - one holding a variable, a substitution or a
    wildcard - is refused if it holds the text `.mod-cache`. And any command at all while the
    shell already stands in the cache, unless it begins by changing directory out.

    WHAT IT LETS THROUGH. Everything else, and so a command that reads, lists or searches the
    cache by path, and scripts/stage-pack.ps1, scripts/get-dump.ps1 and the load harness, which
    are given paths and never stand there.

    WHAT IT CANNOT SEE. A script or program that changes directory itself. A target that reaches
    the cache through a variable, a wildcard, a link or a junction whose text does not say so.
    `git -C`, and a tool's own working-directory option. The cache spelt in another case than
    `mod-cache`, which Windows opens and the wiring does not start this script for. Anything under
    WSL or Linux, read from the code and not run there: a /mnt/c/ path is turned into a Windows
    one. It reads the command as text
    and does not parse the shell, so `cd .mod-cache` where a command could stand is refused inside
    a quoted string too: after a `;`, `&`, `|`, `(` or `{`, or at the start of a line.

    TO CHECK IT, from the repository root. The first is refused with exit 2, the second passes
    with exit 0:

        '{"cwd":".","tool_input":{"command":"cd .mod-cache/Grado_ABC && ls"}}' | pwsh -NoProfile -File scripts/refuse-cd-into-mod-cache.ps1; $LASTEXITCODE
        '{"cwd":".","tool_input":{"command":"ls .mod-cache/Grado_ABC"}}' | pwsh -NoProfile -File scripts/refuse-cd-into-mod-cache.ps1; $LASTEXITCODE

.PARAMETER SelfTest
    Prove it refuses what it should and lets the rest through, the wiring's own command included.
    The last case needs sh: the one on the path, or the one Git for Windows ships.
#>

#Requires -Version 7
[CmdletBinding()]
param([switch] $SelfTest)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ROOT = Split-Path $PSScriptRoot -Parent

function Test-EntersCache {
    <#  Whether $Command, run by a shell standing in $Cwd, would stand in $Root/.mod-cache.  #>
    param(
        [Parameter(Mandatory)] [AllowEmptyString()] [string] $Command,
        [Parameter(Mandatory)] [string] $Cwd,
        [Parameter(Mandatory)] [string] $Root
    )

    # Git Bash's /c/..., WSL's /mnt/c/... and ~ become what .NET resolves.
    $native = { param($p) $p -replace '^~(?=$|[\\/])', $HOME -replace '^/(?:mnt/)?([a-zA-Z])(?=$|/)', '$1:' }
    $cache = [IO.Path]::GetFullPath((Join-Path $Root '.mod-cache'))
    $inside = { param($p) $p -eq $cache -or $p.StartsWith($cache + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) }

    $start = $here = [IO.Path]::GetFullPath((& $native $Cwd), $Root)
    $moves = [regex]::Matches($Command,
        '(?:^|[;&|({\n]|\b(?:then|do|else|if|elif|while|until)\s)\s*(?:cd|chdir|pushd|sl|Set-Location|Push-Location)\s+(?:--?\w*\s+)*("[^"]*"|''[^'']*''|[^\s;&|)}]+)', 'IgnoreCase')
    if ((& $inside $here) -and -not ($moves.Count -and $moves[0].Index -eq 0)) { return $true }
    foreach ($m in $moves) {
        $target = $m.Groups[1].Value.Trim('"', "'")
        if ($target -match '[$`%*?]') {
            if ($target -match '\.mod-cache') { return $true }
            continue
        }
        $here = [IO.Path]::GetFullPath((& $native $target), $here)
        if ((& $inside $here) -or (& $inside ([IO.Path]::GetFullPath((& $native $target), $start)))) { return $true }
    }
    $false
}

if ($SelfTest) {
    $fixture = Join-Path ([IO.Path]::GetTempPath()) 'refuse-cd-selftest/repo'
    $drive = $fixture.Substring(0, 1).ToLower()
    $posix = "/$drive" + ($fixture.Substring(2) -replace '\\', '/')
    # Each: the command, where the shell stands (relative to the root), and whether it is refused.
    $cases = @(
        @('cd .mod-cache', '.', $true),
        @('cd .mod-cache/Grado_ABC/flib/prototypes && ls', '.', $true),
        @('cd ./.mod-cache/', '.', $true),
        @('if cd .mod-cache; then ls; fi', '.', $true),
        @('cd -P .mod-cache', '.', $true),
        @('(cd docs && ls); cd .mod-cache', '.', $true),
        @("cd `"$fixture\.mod-cache\Grado_ABC`"", '.', $true),
        @("cd '$posix/.mod-cache' && pwd", '.', $true),
        @("cd /mnt$posix/.mod-cache", '.', $true),
        @('git status; cd .mod-cache', '.', $true),
        @('ls && (cd .mod-cache/Grado_ABC; ls)', '.', $true),
        @('Set-Location -LiteralPath .mod-cache\Grado_ABC', '.', $true),
        @('Push-Location .mod-cache; Get-ChildItem; Pop-Location', '.', $true),
        @('pushd .mod-cache', '.', $true),
        @('cd ../.mod-cache/Grado_ABC', 'docs', $true),
        @('cd docs && cd ../.mod-cache', '.', $true),
        @('cd "$CACHE/.mod-cache/Grado_ABC"', '.', $true),
        @('ls', '.mod-cache/Grado_ABC', $true),
        @('cd flib', '.mod-cache/Grado_ABC', $true),
        @('git status && cd ../..', '.mod-cache/Grado_ABC', $true),
        @('cd ../.. && git status', '.mod-cache/Grado_ABC', $false),
        @("cd `"$fixture`"", '.mod-cache', $false),
        @('ls .mod-cache/Grado_ABC', '.', $false),
        @('grep -rn "name" .mod-cache/Grado_ABC/flib/info.json', '.', $false),
        @('Get-ChildItem -LiteralPath .mod-cache/Grado_ABC -Recurse', '.', $false),
        @('git -C .mod-cache/Grado_ABC/flib log', '.', $false),
        @('pwsh -File scripts/stage-pack.ps1 Grado_ABC', '.', $false),
        @('pwsh -File scripts/get-dump.ps1 Grado_ABC', '.', $false),
        @('pwsh -File vendor/grado-factorio-tools/scripts/load-harness.ps1 ".mod-cache/Grado_ABC"', '.', $false),
        @('cd docs && ls', '.', $false),
        @('cd .mod-cache-notes', '.', $false),
        @('cd .mod-cache/..', '.', $false),
        @('cd docs && cd agents', '.', $false),
        @('cd -', '.', $false),
        @('git commit -m "never cd .mod-cache again"', '.', $false),
        @('echo cd .mod-cache', '.', $false),
        @('', '.', $false)
    )
    $failures = 0
    $n = 0
    $total = $cases.Count + 1
    foreach ($c in $cases) {
        $n++
        $got = Test-EntersCache -Command $c[0] -Cwd (Join-Path $fixture $c[1]) -Root $fixture
        $ok = $got -eq $c[2]
        Write-Host ("self-test {0}/{1}: {2} from {3}: `{4}` -- {5}" -f $n, $total, $(if ($c[2]) { 'refused' } else { 'allowed' }), $c[1], $c[0], $(if ($ok) { 'ok' } else { 'FAILED' }))
        if (-not $ok) { $failures++ }
    }
    # The wiring as the session runs it: the command in .claude/settings.json, through sh, with
    # the tool call on stdin. Exit 2 and the reason for one, exit 0 and silence for the other.
    $n++
    $wired = (Get-Content -LiteralPath (Join-Path $ROOT '.claude/settings.json') -Raw | ConvertFrom-Json).hooks.PreToolUse[0].hooks[0].command
    $env:CLAUDE_PROJECT_DIR = $ROOT
    # Git for Windows keeps its sh, and the cat beside it, off the path PowerShell sees.
    $sh = (Get-Command sh -ErrorAction SilentlyContinue)?.Source ?? (Join-Path (git --exec-path) "../../../usr/bin/sh.exe")
    $env:PATH = "$(Split-Path $sh)$([IO.Path]::PathSeparator)$env:PATH"
    $through = {
        param($command)
        $text = (@{ cwd = $ROOT; tool_input = @{ command = $command } } | ConvertTo-Json -Compress) | & $sh -c $wired 2>&1 | Out-String
        @{ Code = $LASTEXITCODE; Text = $text }
    }
    $refused = & $through 'cd .mod-cache/Grado_ABC && ls'
    $read = & $through 'ls .mod-cache/Grado_ABC'
    $plain = & $through 'git status'
    $ok = $refused.Code -eq 2 -and $refused.Text -match 'Refused' -and $refused.Text -match 'repository root' -and
        $read.Code -eq 0 -and -not $read.Text.Trim() -and $plain.Code -eq 0 -and -not $plain.Text.Trim()
    Write-Host ("self-test {0}/{1}: the wired hook refuses a cd into the cache with exit 2 and a reason, and passes a read by path and a plain command -- {2}" -f $n, $total, $(if ($ok) { 'ok' } else { 'FAILED' }))
    if (-not $ok) { $failures++; Write-Host "    refused: $($refused.Code) $($refused.Text)"; Write-Host "    read: $($read.Code) $($read.Text)"; Write-Host "    plain: $($plain.Code) $($plain.Text)" }
    Write-Host ''
    if ($failures) { Write-Host "FAILED - self-test: $failures of $total case(s) did not hold."; exit 1 }
    Write-Host "OK - self-test passed: all $total cases."
    exit 0
}

try {
    $call = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $refuse = Test-EntersCache -Command ([string] $call.tool_input.command) -Cwd ([string] $call.cwd) -Root $ROOT
}
catch {
    # Loud, and not a refusal: a hook that cannot read its input must not stop every command.
    [Console]::Error.WriteLine("refuse-cd-into-mod-cache: could not read the tool call, so the command was NOT checked: $($_.Exception.Message)")
    exit 1
}
if ($refuse) {
    [Console]::Error.WriteLine(@"
Refused: this command would stand in the mod cache, $(Join-Path $ROOT '.mod-cache').
A session's tooling writes state files into the directory its shell stands in, and a file inside a
staged mod is part of what the game loads (#150). Run it from the repository root and name the
cache by path instead: ls .mod-cache/<Pack>, Get-ChildItem -LiteralPath .mod-cache/<Pack>,
git -C <path>, or a script given the path. If the shell already stands there, cd out first.
"@)
    exit 2
}
exit 0
