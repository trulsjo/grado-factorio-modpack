<#
.SYNOPSIS
    Starts Claude Code's executable under a given CLAUDE_CONFIG_DIR with one prompt, and writes
    the evidence a criterion on a newly started process asks for to one file. It fails when the
    reply is not JSON, when the transcript is not under that directory's projects/, or when the
    process started before HEAD's commit.

.DESCRIPTION
    WHY (#404). A criterion that a setting took effect names a newly started process, its start
    time kept beside the start of its transcript (docs/agents/issue-tracker.md, the bullet on a
    newly started process). That evidence was built by hand on #160, #231, #245 and #401, three
    times on #401 alone, by #404's account of 2026-10-27. Why it starts the executable and not
    the `claude` command is in the same bullet.

    WHAT IT DOES. Reads HEAD and its commit time in the current directory. Starts the executable
    there with CLAUDE_CONFIG_DIR set to -ConfigDir, as `-p <prompt> --output-format json`, and
    takes the process's start time, and writes where it was read from. Reads `session_id` and
    `result` from the reply, finds `<ConfigDir>/projects/*/<session_id>.jsonl`, and reads the
    first `timestamp` in it. With -Pattern it counts the transcript's lines that match, and
    writes the first match.
    The evidence file holds the command as run, each of those, the verdict, the raw reply and
    any stderr. Once the process has exited, it is written whether the run passes or fails.

    WHAT THE START-TIME FAILURE GUARDS. The script starts the process itself, so it starts
    before HEAD's commit only where that commit is dated ahead of this machine's clock. The
    self-test dates one a day ahead. It does not show the setting was committed.

    WHAT IT DOES NOT JUDGE. The pattern: whether the criterion wants a thing present or absent
    is the session's call (#404's triage). The exit code and `result` are written, not judged.
    The working tree: the paths `git status --porcelain` lists are written, and a probe run with
    any is the session's to explain, since the process reads an uncommitted setting and HEAD
    does not name it.

    WHAT IT CANNOT SEE. Whether the commit holding the setting is HEAD or older.
    An interactive probe, which is still made by hand (#231). A process that never exits: it
    waits for it. A transcript the reply does not name. Where a transcript not under
    <ConfigDir>/projects/ went: the run fails without finding it.

    THE EXECUTABLE. Without -Executable it is the first application named `claude` on the path,
    so never a shell function or alias: in pwsh 7.6.9 on 2026-10-27,
    C:\Users\TrulsJ\.local\bin\claude.exe. A .ps1 given as -Executable is run with pwsh, which
    is how the self-test passes its stub.

.PARAMETER ConfigDir
    The profile directory the process runs under, which must exist: -ConfigDir
    $HOME/.claude-personal.

.PARAMETER Prompt
    The one prompt the process is given.

.PARAMETER Out
    The evidence file to write. Its directory must exist.

.PARAMETER Pattern
    A regular expression read against each line of the transcript. Its count and first match
    are written; without it, no match line is.

.PARAMETER Executable
    The executable to start, in place of the `claude` application on the path.

.PARAMETER SelfTest
    Prove, with a stub for the executable in a repository it builds, so with no real session:
    that a run writes each field of the evidence file and exits 0; that the working tree is
    written clean, and as the paths that differ when a file is left uncommitted; that the stub
    is started with CLAUDE_CONFIG_DIR and the arguments -p <prompt> --output-format json; that
    -Pattern writes the count of matching lines and the first match, and a run without it
    writes no match line; that a reply that is not JSON fails, so does a transcript outside the
    given projects/, and so does a process started before HEAD's commit, each with the evidence
    file still written. That part needs git.

.EXAMPLE
    pwsh -NoProfile -File scripts/probe-session.ps1 -ConfigDir $HOME/.claude-personal -Prompt 'List your skills.' -Out probe.txt -Pattern 'mod-portal'
#>

#Requires -Version 7
[CmdletBinding()]
param(
    [string] $ConfigDir,
    [string] $Prompt,
    [string] $Out,
    [string] $Pattern,
    [string] $Executable,
    [switch] $SelfTest
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

# An argument single-quoted as PowerShell quotes one, where it holds more than word characters
# and ./:\=-. The command line it goes into is a record, not a line to paste into a shell.
function Format-Argument([string] $Text) {
    if ($Text -match '^[\w./:\\=-]+$') { $Text } else { "'" + ($Text -replace "'", "''") + "'" }
}

if ($SelfTest) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) "probe-session-selftest-$([guid]::NewGuid().ToString('N').Substring(0, 8))"
    New-Item -ItemType Directory -Path $temp -Force | Out-Null
    try {
        $git = { param([string] $repo) git -C $repo -c user.name=selftest -c user.email=selftest@example.invalid -c commit.gpgsign=false @args | Out-Null; if ($LASTEXITCODE -ne 0) { throw "git $args failed; the self-test needs git." } }
        # Two repositories: one committed now, and one whose HEAD is dated a day ahead, so any
        # process started now started before it.
        $repo = Join-Path $temp 'repo'
        $future = Join-Path $temp 'future'
        foreach ($r in $repo, $future) { New-Item -ItemType Directory -Path $r | Out-Null; & $git $r init --quiet }
        & $git $repo commit --quiet --allow-empty -m base
        $env:GIT_COMMITTER_DATE = [DateTimeOffset]::UtcNow.AddDays(1).ToString('o')
        try { & $git $future commit --quiet --allow-empty -m ahead } finally { Remove-Item Env:GIT_COMMITTER_DATE }
        Set-Content -LiteralPath (Join-Path $future 'settings.json') -Value '{}'
        $profileDir = Join-Path $temp 'profile'
        New-Item -ItemType Directory -Path $profileDir | Out-Null

        # The stub writes what it was started with, a transcript of three lines and a reply.
        # With $where 'outside' the transcript goes to another profile's projects/.
        $stub = {
            param([string] $name, [string] $where)
            $root = if ($where -eq 'outside') { "'$(Join-Path $temp 'other')'" } else { '$env:CLAUDE_CONFIG_DIR' }
            $path = Join-Path $temp "$name.ps1"
            Set-Content -LiteralPath $path -Value @(
                '$sid = "stub-' + $name + '"'
                '$dir = Join-Path ' + $root + ' "projects/C--stub"'
                'New-Item -ItemType Directory -Path $dir -Force | Out-Null'
                'Set-Content -LiteralPath (Join-Path $dir "$sid.jsonl") -Value @('
                '    ''{"type":"summary"}'''
                '    ''{"type":"user","timestamp":"2026-10-27T10:16:22.123Z","text":"skill mod-portal"}'''
                '    ''{"type":"assistant","timestamp":"2026-10-27T10:16:25.000Z","text":"mod-portal again"}'''
                ')'
                'Set-Content -LiteralPath "' + (Join-Path $temp "$name.args.txt") + '" -Value (@("CLAUDE_CONFIG_DIR=$env:CLAUDE_CONFIG_DIR") + $args)'
                '[Console]::Error.Write("stub warning")'
                $(if ($name -eq 'notjson') { '[Console]::Out.Write("Error: the stub is not signed in")' }
                  else { '[Console]::Out.Write((@{ type = "result"; result = "stub reply"; session_id = $sid } | ConvertTo-Json -Compress))' })
            )
            $path
        }
        $run = {
            param([string] $where, [string] $name, [string[]] $more)
            $exe = & $stub $name $(if ($name -eq 'outside') { 'outside' } else { 'inside' })
            $file = Join-Path $temp "$name.evidence.txt"
            Push-Location $where
            try { $text = (& pwsh -NoProfile -File $PSCommandPath -ConfigDir $profileDir -Prompt 'List your skills.' -Out $file -Executable $exe @more 2>&1 | Out-String) } finally { Pop-Location }
            @{ Code = $LASTEXITCODE; Text = $text; File = $(if (Test-Path -LiteralPath $file) { (Get-Content -LiteralPath $file -Raw) -replace "`r" } else { '' }); Args = @(Get-Content -LiteralPath (Join-Path $temp "$name.args.txt") -ErrorAction SilentlyContinue) }
        }
        $plain = & $run $repo 'plain' @()
        $matched = & $run $repo 'matched' @('-Pattern', 'mod-portal')
        $outside = & $run $repo 'outside' @()
        $early = & $run $future 'early' @()
        $notJson = & $run $repo 'notjson' @()
        $headSha = (git -C $repo rev-parse HEAD)
        $projects = [regex]::Escape((Join-Path $profileDir 'projects'))
        $field = { param([string] $text, [string] $name) if ($text -match "(?m)^$([regex]::Escape($name)): (.*)$") { $Matches[1] } else { $null } }
    }
    finally { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
    Write-Host ($plain.File.TrimEnd() -replace '(?m)^', '    ')

    $cases = @(
        @{ Name = 'a run writes the command as run, the directory, HEAD and its commit time, the start time, the exit code, the session id, the result, the verdict, the raw reply and stderr, and exits 0'; Test = {
            $plain.Code -eq 0 -and
                (& $field $plain.File 'command') -match "^CLAUDE_CONFIG_DIR=.+ .+plain\.ps1 -p 'List your skills\.' --output-format json$" -and
                (& $field $plain.File 'working directory') -eq $repo -and
                (& $field $plain.File 'head') -eq $headSha -and (& $field $plain.File 'session id') -eq 'stub-plain' -and
                $plain.File -match '(?m)^raw reply:\n\{.*"session_id":"stub-plain".*\}\n\nstderr:\nstub warning$' -and
                [DateTimeOffset]::Parse((& $field $plain.File 'head commit time (UTC)')) -le [DateTimeOffset]::Parse(((& $field $plain.File 'process start (UTC)') -replace ' \(.*$')) -and
                (& $field $plain.File 'exit code') -eq '0' -and (& $field $plain.File 'result') -eq 'stub reply' -and
                (& $field $plain.File 'verdict') -eq 'OK' } }
        @{ Name = 'a run writes the transcript path under the given projects/ and its first timestamp'; Test = {
            (& $field $plain.File 'transcript') -match "^$projects[\\/]C--stub[\\/]stub-plain\.jsonl$" -and
                (& $field $plain.File 'transcript first timestamp') -eq '2026-10-27T10:16:22.123Z' } }
        @{ Name = 'the working tree is written clean, and as the paths that differ when a file is left uncommitted'; Test = {
            (& $field $plain.File 'working tree') -eq 'clean' -and (& $field $early.File 'working tree') -eq '1 path(s) differ from HEAD: ?? settings.json' } }
        @{ Name = 'the executable is started with CLAUDE_CONFIG_DIR and -p <prompt> --output-format json'; Test = {
            $a = $plain.Args
            $a.Count -eq 5 -and $a[0] -eq "CLAUDE_CONFIG_DIR=$profileDir" -and $a[1] -eq '-p' -and $a[2] -eq 'List your skills.' -and $a[3] -eq '--output-format' -and $a[4] -eq 'json' } }
        @{ Name = 'with -Pattern it writes the count of matching lines and the first match, and exits 0'; Test = {
            $matched.Code -eq 0 -and (& $field $matched.File 'pattern') -eq 'mod-portal' -and
                (& $field $matched.File 'pattern lines matching') -eq '2' -and (& $field $matched.File 'pattern first match') -eq 'line 2: mod-portal' } }
        @{ Name = 'a run without -Pattern writes no match line'; Test = {
            $plain.File -ne '' -and $plain.File -notmatch '(?m)^pattern' } }
        @{ Name = 'a transcript outside the given projects/ fails, and the evidence file is still written'; Test = {
            $outside.Code -ne 0 -and (& $field $outside.File 'verdict') -match '^FAILED: .*not under ' -and
                (& $field $outside.File 'head') -eq $headSha -and (& $field $outside.File 'result') -eq 'stub reply' } }
        @{ Name = 'a reply that is not JSON fails, and the evidence file is still written'; Test = {
            $notJson.Code -ne 0 -and (& $field $notJson.File 'verdict') -match '^FAILED: the reply is not JSON' -and
                (& $field $notJson.File 'head') -eq $headSha -and $notJson.File -match '(?m)^raw reply:\nError: the stub is not signed in$' } }
        @{ Name = 'a process started before HEAD''s commit fails, and the evidence file is still written'; Test = {
            $early.Code -ne 0 -and (& $field $early.File 'verdict') -match '^FAILED: .*started before HEAD''s commit' -and
                (& $field $early.File 'transcript first timestamp') -eq '2026-10-27T10:16:22.123Z' } }
    )
    $failures = 0
    $n = 0
    foreach ($c in $cases) {
        $n++
        $ok = try { [bool] (& $c.Test) } catch { Write-Host "    threw: $($_.Exception.Message)"; $false }
        Write-Host ("self-test {0}/{1}: {2} -- {3}" -f $n, $cases.Count, $c.Name, $(if ($ok) { 'ok' } else { 'FAILED' }))
        if (-not $ok) { $failures++ }
    }
    Write-Host ''
    if ($failures) { Write-Host "FAILED - self-test: $failures of $($cases.Count) case(s) did not hold."; exit 1 }
    Write-Host "OK - self-test passed: all $($cases.Count) cases."
    exit 0
}

if (-not $ConfigDir -or -not $Prompt -or -not $Out) { throw 'Say what to run: -ConfigDir <profile directory> -Prompt <text> -Out <file> [-Pattern <regex>] [-Executable <path>], or -SelfTest.' }
if (-not (Test-Path -LiteralPath $ConfigDir -PathType Container)) { throw "No profile directory at $ConfigDir." }
$ConfigDir = (Resolve-Path -LiteralPath $ConfigDir).Path
$Out = Join-Path (Resolve-Path -LiteralPath (Split-Path -Parent ([IO.Path]::GetFullPath($Out, (Get-Location).Path)))).Path (Split-Path -Leaf $Out)
if (-not $Executable) {
    $app = Get-Command claude -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $app) { throw 'No application named claude on the path. Say which with -Executable.' }
    $Executable = $app.Source
}
$Executable = (Resolve-Path -LiteralPath $Executable).Path

$head = git rev-parse HEAD
if ($LASTEXITCODE -ne 0) { throw 'git could not read HEAD. Run it inside the repository.' }
$commitTime = [DateTimeOffset]::Parse((git log -1 --format=%cI HEAD)).ToUniversalTime()
$changed = @(git status --porcelain --untracked-files=all)
if ($LASTEXITCODE -ne 0) { throw 'git could not read the working tree.' }

$probeArgs = @('-p', $Prompt, '--output-format', 'json')
$info = [Diagnostics.ProcessStartInfo]::new()
if ($Executable -match '\.ps1$') {
    $info.FileName = (Get-Process -Id $PID).Path
    foreach ($a in @('-NoProfile', '-File', $Executable)) { $info.ArgumentList.Add($a) }
}
else { $info.FileName = $Executable }
foreach ($a in $probeArgs) { $info.ArgumentList.Add($a) }
$info.WorkingDirectory = (Get-Location).Path
$info.Environment['CLAUDE_CONFIG_DIR'] = $ConfigDir
$info.UseShellExecute = $false
$info.RedirectStandardOutput = $true
$info.RedirectStandardError = $true
$info.StandardOutputEncoding = [Text.Encoding]::UTF8
$command = "CLAUDE_CONFIG_DIR=$(Format-Argument $ConfigDir) $((@($Executable) + $probeArgs | ForEach-Object { Format-Argument $_ }) -join ' ')"

$before = [DateTimeOffset]::UtcNow
$process = [Diagnostics.Process]::Start($info)
$startSource = 'from the process'
try { $start = [DateTimeOffset]::new($process.StartTime).ToUniversalTime() }
catch { $start = $before; $startSource = 'read just before the start; the process had exited' }
$stderr = $process.StandardError.ReadToEndAsync()
$reply = $process.StandardOutput.ReadToEnd()
$process.WaitForExit()
$exitCode = $process.ExitCode

$failures = [Collections.Generic.List[string]]::new()
$sessionId = $null
$result = $null
try {
    $json = $reply | ConvertFrom-Json
    if ($json.PSObject.Properties['session_id']) { $sessionId = [string] $json.session_id }
    if ($json.PSObject.Properties['result']) { $result = [string] $json.result }
}
catch { $failures.Add('the reply is not JSON') }

$projects = Join-Path $ConfigDir 'projects'
$transcript = $null
if ($sessionId -and $sessionId -match '^[\w-]+$') {
    $transcript = Get-ChildItem -LiteralPath $projects -Directory -ErrorAction SilentlyContinue |
        ForEach-Object { Get-Item -LiteralPath (Join-Path $_.FullName "$sessionId.jsonl") -ErrorAction SilentlyContinue } | Select-Object -First 1
}
if (-not $transcript) { $failures.Add("the transcript of session_id '$sessionId' is not under $projects") }
if ($start -lt $commitTime) { $failures.Add("the process started before HEAD's commit ($($start.ToString('o')) < $($commitTime.ToString('o')))") }

$lines = @(if ($transcript) { Get-Content -LiteralPath $transcript.FullName })
$firstTimestamp = $null
foreach ($l in $lines) { if ($l -match '"timestamp"\s*:\s*"([^"]+)"') { $firstTimestamp = $Matches[1]; break } }

$evidence = [Collections.Generic.List[string]]::new()
$evidence.Add("command: $command")
$evidence.Add("working directory: $($info.WorkingDirectory)")
$evidence.Add("head: $head")
$evidence.Add("head commit time (UTC): $($commitTime.ToString('o'))")
$evidence.Add("working tree: $(if ($changed.Count) { "$($changed.Count) path(s) differ from HEAD: $(($changed | ForEach-Object { $_.Trim() }) -join '; ')" } else { 'clean' })")
$evidence.Add("process start (UTC): $($start.ToString('o')) ($startSource)")
$evidence.Add("exit code: $exitCode")
$evidence.Add("session id: $sessionId")
$evidence.Add("result: $($result -replace '\r?\n', ' / ')")
$evidence.Add("transcript: $(if ($transcript) { $transcript.FullName })")
$evidence.Add("transcript first timestamp: $firstTimestamp")
if ($Pattern) {
    $hits = @(for ($i = 0; $i -lt $lines.Count; $i++) { $m = [regex]::Match($lines[$i], $Pattern); if ($m.Success) { "line $($i + 1): $($m.Value)" } })
    $evidence.Add("pattern: $Pattern")
    $evidence.Add("pattern lines matching: $($hits.Count)")
    $evidence.Add("pattern first match: $(if ($hits) { $hits[0] })")
}
$evidence.Add("verdict: $(if ($failures.Count) { 'FAILED: ' + ($failures -join '; ') } else { 'OK' })")
$evidence.Add('')
$evidence.Add('raw reply:')
$evidence.Add($reply.TrimEnd())
$err = $stderr.Result.TrimEnd()
if ($err) { $evidence.Add(''); $evidence.Add('stderr:'); $evidence.Add($err) }
Set-Content -LiteralPath $Out -Value $evidence -Encoding utf8

if ($failures.Count) {
    Write-Host "FAILED - probe-session: $($failures -join '; '). Evidence in $Out."
    exit 1
}
Write-Host "OK - probe-session: process started $($start.ToString('o')), transcript $($transcript.FullName), first timestamp $firstTimestamp. Evidence in $Out."
exit 0
