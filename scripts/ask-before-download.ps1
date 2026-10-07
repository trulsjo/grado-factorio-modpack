<#
.SYNOPSIS
    A hook for agent sessions: stops a shell command that installs a package or fetches a program
    from outside the mod portal, and has the session ask Truls before it runs. It prints a
    permission decision of "ask" with the reason and exits 0; for any other command it prints
    nothing and exits 0.

.DESCRIPTION
    WHY (#179). On 2026-10-07 a subagent surveying Markdown linters fetched five binaries from
    GitHub releases, and Node, Python and Ruby packages, into the session's scratch directory and
    ran them on this machine. Truls was told after. The rule is in CLAUDE.md, *Conventions*: a
    session asks before it downloads a program and runs it here.

    HOW IT IS WIRED. .claude/settings.json names it as a PreToolUse hook on the two shell tools,
    beside refuse-cd-into-mod-cache.ps1, and hands it the tool call as JSON on stdin: this reads
    `tool_input.command`. The wiring starts this script only when that JSON holds one of the words
    below or one of the file endings, as the other hook's does and for the same reason.

    WHAT IT ASKS ABOUT. Standing where a command can stand: npm install, i, ci, add or exec; npx;
    pip install, also as python -m pip; gem install; cargo install; winget, choco and scoop
    install; gh release download. And a command holding curl, wget, iwr, irm, Invoke-WebRequest,
    Invoke-RestMethod, Start-BitsTransfer or DownloadFile with an http address that ends in .exe,
    .msi, .zip, .tar.gz or .tgz and is not on factorio.com.

    WHAT "ASK" DOES. The session shows Truls its permission prompt with the reason, whatever its
    permission mode, and runs the command only if he allows it. That is read from the hooks
    reference at https://code.claude.com/docs/en/hooks on 2026-10-08 and was not run in a session:
    the self-test proves what this script prints, not what a session does with it.

    WHAT IT LETS THROUGH. Everything else, and so the project's own work: a read of the portal
    API, a mod fetched from the portal, scripts/stage-pack.ps1, scripts/get-dump.ps1, the resolver
    and the other tools in vendor/grado-factorio-tools, gh and git. A member mod is Lua the game
    runs; #179 takes staging one as the project's work and not as downloading a program.

    WHAT IT CANNOT SEE. A download made by a script or program it lets through, the staging
    scripts included. One made by a subagent in a session without this hook, or by a session
    started outside this repository. Another package manager (pnpm, yarn, pipx, uv, go, dotnet
    tool, Install-Module), a git clone of a program, and an address that does not end in one of
    the five endings or is built from a variable. An installer or fetcher named in another case
    than the wiring's words, or reached through cmd /c, an alias or a full path. It reads the
    command as text and does not parse the shell, so `npm install` where a command could stand is
    asked about inside a quoted string too.

    TO CHECK IT, from the repository root. The first prints the decision, the second nothing:

        '{"tool_input":{"command":"npm install -g markdownlint-cli"}}' | pwsh -NoProfile -File scripts/ask-before-download.ps1
        '{"tool_input":{"command":"gh issue view 179"}}' | pwsh -NoProfile -File scripts/ask-before-download.ps1

.PARAMETER SelfTest
    Prove it asks about what it should and lets the rest through, the wiring's own command
    included. The last case needs sh: the one on the path, or the one Git for Windows ships.
#>

#Requires -Version 7
[CmdletBinding()]
param([switch] $SelfTest)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ROOT = Split-Path $PSScriptRoot -Parent

function Get-Download {
    <#  What $Command would install or fetch, as a phrase for the reason, or nothing.  #>
    param([Parameter(Mandatory)] [AllowEmptyString()] [string] $Command)

    $install = [regex]::Match($Command,
        '(?:^|[;&|({\n]|\b(?:then|do|else|if|elif|while|until)\s)\s*((?:npm\s+(?:install|i|ci|add|exec)|npx|(?:py(?:thon[\d.]*)?\s+-m\s+)?pip[\d.]*\s+install|gem\s+install|cargo\s+install|(?:winget|choco|scoop)\s+install|gh\s+release\s+download)\b)', 'IgnoreCase')
    if ($install.Success) { return "installs or downloads a package ($($install.Groups[1].Value -replace '\s+', ' '))" }
    if ($Command -notmatch '\b(curl|wget|iwr|irm|Invoke-WebRequest|Invoke-RestMethod|Start-BitsTransfer|DownloadFile)\b') { return }
    foreach ($url in [regex]::Matches($Command, 'https?://([^/\s"''`]+)[^\s"''`]*?\.(?:exe|msi|zip|tar\.gz|tgz)(?=$|[\s"''`?#)])', 'IgnoreCase')) {
        if ($url.Groups[1].Value -notmatch '(^|\.)factorio\.com$') { return "fetches $($url.Value)" }
    }
}

if ($SelfTest) {
    # Each: the command, and whether it is asked about.
    $cases = @(
        @('npm install -g markdownlint-cli', $true),
        @('cd tools && npm i remark-cli', $true),
        @('npx markdownlint-cli2 "**/*.md"', $true),
        @('pip install pymarkdownlnt', $true),
        @('python -m pip install --user mdformat', $true),
        @('gem install mdl', $true),
        @('cargo install rumdl', $true),
        @('winget install --id Rustlang.Rustup', $true),
        @('choco install ruby -y', $true),
        @('scoop install vale', $true),
        @('gh release download v0.0.150 -R rvben/rumdl -p "*.zip"', $true),
        @('curl -L -o rumdl.zip https://github.com/rvben/rumdl/releases/download/v0.0.150/rumdl-x86_64-pc-windows-msvc.zip', $true),
        @('Invoke-WebRequest "https://example.com/tool.exe" -OutFile tool.exe', $true),
        @('wget https://example.com/linter.tar.gz', $true),
        @('iwr https://example.com/setup.msi -OutFile setup.msi; Start-Process setup.msi', $true),
        @('curl -s https://mods.factorio.com/api/mods/flib/full', $false),
        @("Invoke-RestMethod 'https://mods.factorio.com/api/mods?page_size=max&version=2.0'", $false),
        @('curl -L -o flib.zip "https://mods.factorio.com/download/flib/5f7b2c?username=u&token=t.zip"', $false),
        @('pwsh -File scripts/stage-pack.ps1 Grado_ABC', $false),
        @('pwsh -File scripts/get-dump.ps1 Grado_ABCS -With space-age', $false),
        @('pwsh -File vendor/grado-factorio-tools/scripts/resolve-modpack.ps1 -Line 2.0 -Build 2.0.77 Grado_ABC/info.json', $false),
        @('gh issue view 179 --json title,body,comments', $false),
        @('gh pr create --title "x" --body "y"', $false),
        @('git fetch origin && git status', $false),
        @('git commit -m "ask before npm install runs"', $false),
        @('echo pip install nothing', $false),
        @('npm test', $false),
        @('curl -s https://example.com/page.html', $false),
        @('ls .mod-cache/Grado_ABC/.zips/flib_0.16.5.zip', $false),
        @('', $false)
    )
    $failures = 0
    $n = 0
    $total = $cases.Count + 1
    foreach ($c in $cases) {
        $n++
        $ok = [bool] (Get-Download -Command $c[0]) -eq $c[1]
        Write-Host ("self-test {0}/{1}: {2}: `{3}` -- {4}" -f $n, $total, $(if ($c[1]) { 'asked' } else { 'allowed' }), $c[0], $(if ($ok) { 'ok' } else { 'FAILED' }))
        if (-not $ok) { $failures++ }
    }
    # The wiring as the session runs it: the command in .claude/settings.json, through sh, with
    # the tool call on stdin. A decision of "ask" for one, exit 0 and silence for the others.
    $n++
    $wired = (Get-Content -LiteralPath (Join-Path $ROOT '.claude/settings.json') -Raw | ConvertFrom-Json).hooks.PreToolUse[0].hooks[1].command
    $env:CLAUDE_PROJECT_DIR = $ROOT
    # Git for Windows keeps its sh, and the cat beside it, off the path PowerShell sees.
    $sh = (Get-Command sh -ErrorAction SilentlyContinue)?.Source ?? (Join-Path (git --exec-path) "../../../usr/bin/sh.exe")
    $env:PATH = "$(Split-Path $sh)$([IO.Path]::PathSeparator)$env:PATH"
    $through = {
        param($command)
        $text = (@{ cwd = $ROOT; tool_input = @{ command = $command } } | ConvertTo-Json -Compress) | & $sh -c $wired 2>&1 | Out-String
        @{ Code = $LASTEXITCODE; Text = $text }
    }
    $asked = & $through 'cargo install rumdl'
    $fetch = & $through 'curl -LO https://example.com/tool.zip'
    $portal = & $through 'curl -s https://mods.factorio.com/api/mods/flib'
    $plain = & $through 'git status'
    $decision = try { ($asked.Text | ConvertFrom-Json).hookSpecificOutput } catch { $null }
    $ok = $asked.Code -eq 0 -and $decision -and $decision.hookEventName -eq 'PreToolUse' -and $decision.permissionDecision -eq 'ask' -and
        $decision.permissionDecisionReason -match 'ask Truls' -and $fetch.Text -match '"ask"' -and
        $portal.Code -eq 0 -and -not $portal.Text.Trim() -and $plain.Code -eq 0 -and -not $plain.Text.Trim()
    Write-Host ("self-test {0}/{1}: the wired hook answers ask, with a reason, for an install and for a fetched zip, and passes a portal read and a plain command in silence -- {2}" -f $n, $total, $(if ($ok) { 'ok' } else { 'FAILED' }))
    if (-not $ok) { $failures++; Write-Host "    asked: $($asked.Code) $($asked.Text)"; Write-Host "    fetch: $($fetch.Code) $($fetch.Text)"; Write-Host "    portal: $($portal.Code) $($portal.Text)"; Write-Host "    plain: $($plain.Code) $($plain.Text)" }
    Write-Host ''
    if ($failures) { Write-Host "FAILED - self-test: $failures of $total case(s) did not hold."; exit 1 }
    Write-Host "OK - self-test passed: all $total cases."
    exit 0
}

try { $what = Get-Download -Command ([string] ([Console]::In.ReadToEnd() | ConvertFrom-Json).tool_input.command) }
catch {
    # Loud, and not a refusal: a hook that cannot read its input must not stop every command.
    [Console]::Error.WriteLine("ask-before-download: could not read the tool call, so the command was NOT checked: $($_.Exception.Message)")
    exit 1
}
if ($what) {
    @{ hookSpecificOutput = @{
        hookEventName            = 'PreToolUse'
        permissionDecision       = 'ask'
        permissionDecisionReason = "This command $what. CLAUDE.md, Conventions: a session has to ask Truls before it downloads a program and runs it on this machine (#179). Allow it only if the session asked first and was told yes."
    } } | ConvertTo-Json -Compress
}
exit 0
