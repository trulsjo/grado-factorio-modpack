> **Re-running `/setup-matt-pocock-skills` rewrites this stub page in place** and drops its links
> to the shared pages below: restore them from git.

# Issue tracker: GitHub

Issues and specs for this repo live as GitHub issues. Use the `gh` CLI for all operations.

**The conventions shared with the siblings are on
[`tracker-conventions.md`](../../vendor/grado-factorio-tools/docs/tracker-conventions.md)**, in
the tools submodule at its pin
([on GitHub](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/tracker-conventions.md),
whose `main` may be ahead of the pin): reading an issue with `--json`, multi-line bodies through
`--body-file`, searching before filing, blocked-by, closing, and the bar for a follow-up ticket.
Read it before filing, blocking or closing an issue. What a pull request's body holds is on
[`pr-body-convention.md`](../../vendor/grado-factorio-tools/docs/pr-body-convention.md)
([on GitHub](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/pr-body-convention.md)),
and what a ticket's evidence holds on
[`claim-grades.md`](../../vendor/grado-factorio-tools/docs/claim-grades.md)'s *Tickets and ruling
comments* ([on GitHub](https://github.com/trulsjo/grado-factorio-tools/blob/main/docs/claim-grades.md)),
both in the same submodule. This page holds the setup template's core and this repository's own
parts.

## Conventions

- **Create an issue**: `gh issue create --title "..." --body-file <path>`, after searching the open
  issues as the shared page says. **The other tracker to search is
  `trulsjo/grado-factorio-tools`**, with the same command and `-R trulsjo/grado-factorio-tools`.
- **A ticket's evidence**: the four rules for a ticket and a ruling comment are `claim-grades.md`'s.
  This repository's own parts and incidents:
  - **A statement.** One not read from its source is marked as an account, as
    `docs/agents/pre-pr-review-brief.md` does with "by #167's account" (#195, #273).
  - **A figure.** One that a triage or a grill makes or repeats goes into the ticket's comment
    with its command and its output, as `docs/agents/code-review.md`, *Where a session is
    cleared*, asks of a session with no branch. A figure copied from that comment into
    `docs/decisions.md` cites the comment by its link (#392).
  - **A quantifier.** On 2026-10-09 #206 called one file "the one file where the three ranges
    stand side by side", two other files held all three, and the claim reached a commit message
    before a review caught it (PR #210, finding 2 in its body).
- **A criterion that a setting took effect names a newly started process**: where a ticket asks
  that a setting, a hook or a plugin be shown working or absent, the criterion names a process of
  Claude Code's executable started after the commit that holds the setting is
  checked out, <!-- deliberate: checked -->
  and the process's start time is kept beside the start of its transcript. A new session
  id <!-- deliberate: id -->
  does not show it. On 2026-10-12 #160's "a new session" was met with a `/clear` in a
  process started four minutes before the commit: both sessions opened with the plugin's text,
  and neither could show whether the setting worked (#245). A run made to stand in for a refused
  case is read against that case's transcript before its result is used: who issued the command,
  a typed prompt or the session itself; its shape, alone or inside a compound command; and what
  asked for it. A difference is stated beside the result (#272). On 2026-10-13 #233's control
  ran the `blocked_by` write as a typed prompt, while the refusal it stood in for was a session's
  own compound command, and a run was skipped on its result before a review found the difference.
  **The process is started under the intended profile explicitly** (#280): set
  `CLAUDE_CONFIG_DIR` and start Claude Code's executable, not the `claude` command, and save the
  path of the `projects/` directory its transcript was written to beside its command and output,
  since that path shows which profile ran it. A probe made with one prompt is run by
  `scripts/probe-session.ps1` (#404), which does each of these for a transcript under the given
  directory's `projects/` and writes the evidence to one file; a transcript written elsewhere
  fails the run, and the file does not say where it went. Its header says what that file holds
  and what it does not judge. Where the `claude`
  command chooses its profile by the directory it is started in, an interactive `claude` started
  in a clone outside the repository's directory can run with another profile's settings, sign-in
  and folder trust, and write its transcript under that profile. On 2026-10-14 it happened to
  #231's measurement, whose write-up did not say so
  ([#231's addendum](https://github.com/trulsjo/grado-factorio-modpack/issues/231#issuecomment-6185969252)),
  and twice to #160's second process before it was started under the intended profile
  ([#160](https://github.com/trulsjo/grado-factorio-modpack/issues/160#issuecomment-6178947824)).
  On 2026-10-27 #401's first probe was started through the `claude` command, which this page then
  named as the process; it ran under the intended profile, and was run again from the executable
  (#403).
- **Read an issue**:
  `gh issue view <number> --json title,body,labels,comments --jq '{title, body, labels: [.labels[].name], comments: [.comments[].body]}'`,
  not `--comments`, for the shared page's reason.
- **List issues**:
  `gh issue list --state open --json number,title,body,labels,comments --jq '[.[] | {number, title, body, labels: [.labels[].name], comments: [.comments[].body]}]'`
  with appropriate `--label` and `--state` filters.
- **Comment on an issue**: `gh issue comment <number> --body "..."`
- **Apply / remove labels**: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- **Close**: `gh issue close <number> --comment "..."`, after the shared page's *Before closing*.
- **Add a blocker** as the shared page's *Blocked by* says. **Run the POST with the Bash tool: a
  `Bash(...)` rule in the tracked `.claude/settings.json` allows it there, and the file has no
  `PowerShell(...)` rule** (#233, #267), in the shared page's spelling, for a ticket of this
  repository, `grado-factorio-tools`, `realistic-fusion-refreshed` or `true-nukes-refreshed`
  (#414). `-X POST` for `--method POST`, and the DELETE that removes an edge, are not covered.
  Not measured: that the client honours the rule. On 2026-10-13 the write ran in auto mode on
  `main`, which had no rule, when the command was typed as the session's prompt (client 2.1.296,
  one run), so a run asked for that way would not show it. The client's documentation, as
  code.claude.com served *Auto mode configuration* that day, says: "By default, narrow Bash and
  PowerShell allow rules such as `Bash(npm test)` stay in effect in auto mode." #267 left the
  rule unmeasured: the refusal of 2026-10-12 was one event, so a run on a commit without the rule
  might be allowed as well, and a run with the rule would then show nothing. #269: one tool keeps
  one unmeasured rule set, and a `PowerShell(...)` rule would need an edit to the settings file,
  which the auto-mode check refused on 2026-10-13 until Truls allowed it in the session. If the
  POST in this spelling, run with the Bash tool as a command of its own, is refused, the rule is
  not honoured: file a ticket with the transcript's lines and the client's version.
- **A ticket that waits carries no `ready-for-agent`**, as the shared page's *Blocked by* says.
  On 2026-10-25 #383 was filed with an open blocker and without the label, where the `to-tickets`
  skill's default is the label.
- **Pull request body**: the shared page's four rules, with no switch turned on here. The
  `mattpocock-skills:pr` template is filled with that skill, where the plugin is installed, and
  from the same three headings by hand where it is not. This repository adds to what it
  produces: above its template, a `Closes #<n>` for each ticket the branch resolves, where it
  resolves any; below it, under one heading, the pre-PR review's findings and its confirmation
  as they stand in the reviewer's report (`docs/agents/pre-pr-review-brief.md`, *Into the pull
  request*). `scripts/pr-body.ps1` builds the body and refuses a draft without the three
  headings. `docs/agents/code-review.md` says what else the pull request records once the plugin
  pass has run.
- **A branch commit is named as the shared page's *Naming a branch commit* says**, in the body,
  the pull request's comments and the commit messages alike (Truls, 2026-10-19, #321). A comment
  on a check run names the run, whose page records the commit, and says "on the branch tip"
  rather than a hash.
- **A closing line quoted anywhere but a bare `Closes #N` line is reworded**, in the reviewer's
  report too (#321). `vendor/grado-factorio-tools/scripts/pr-body-check.ps1` holds the body to
  this rule and the one above: the session runs it on the body file before `gh pr create`
  (`docs/agents/pre-pr-review-brief.md`, *Into the pull request*), and
  `.github/workflows/check.yml` runs it on the pull request's body, again when the body is
  edited. Nothing reads comments or commit messages for it.

Infer the repo from `git remote -v`; `gh` does this automatically when run inside a clone.

## Pull requests as a triage surface

**PRs as a request surface: no.** _(Set to `yes` if this repo treats external PRs as feature
requests; `/triage` reads this flag.)_

When set to `yes`, PRs run through the same labels and states as issues, using the `gh pr`
equivalents:

- **Read a PR**: `gh pr view <number> --comments` and `gh pr diff <number>` for the diff.
- **List external PRs for triage**:
  `gh pr list --state open --json number,title,body,labels,author,authorAssociation,comments` then
  keep only `authorAssociation` of `CONTRIBUTOR`, `FIRST_TIME_CONTRIBUTOR`, or `NONE` (drop
  `OWNER`/`MEMBER`/`COLLABORATOR`).
- **Comment / label / close**: `gh pr comment`, `gh pr edit --add-label`/`--remove-label`,
  `gh pr close`.

GitHub shares one number space across issues and PRs, so a bare `#42` may be either: resolve with
`gh pr view 42` and fall back to `gh issue view 42`.

## When a skill says "publish to the issue tracker"

Create a GitHub issue.

## When a skill says "fetch the relevant ticket"

Read it as in **Read an issue** above.

## Wayfinding operations

Used by `/wayfinder`. The **map** is a single issue with **child** issues as tickets.

- **Map**: a single issue labelled `wayfinder:map`, holding the Notes / Decisions-so-far / Fog body.
  `gh issue create --label wayfinder:map`.
- **Child ticket**: an issue linked to the map as a GitHub sub-issue (`gh api` on the sub-issues
  endpoint). Where sub-issues aren't enabled, add the child to a task list in the map body and put
  `Part of #<map>` at the top of the child body. Labels: `wayfinder:<type>`
  (`research`/`prototype`/`grilling`/`task`). Once claimed, the ticket is assigned to the driving
  dev.
- **Blocking**: GitHub's **native issue dependencies**, the canonical, UI-visible representation,
  added as the shared page's *Blocked by* says. GitHub
  reports `issue_dependencies_summary.blocked_by` (open blockers only, the live gate). Where
  dependencies aren't available, fall back to a `Blocked by: #<n>, #<n>` line at the top of the
  child body. A ticket is unblocked when every blocker is closed.
- **Frontier query**: list the map's open children (`gh issue list --state open`, scoped to the
  map's sub-issues / task list), drop any with an open blocker
  (`issue_dependencies_summary.blocked_by > 0`, or an open issue in the `Blocked by` line) or an
  assignee; first in map order wins.
- **Claim**: `gh issue edit <n> --add-assignee @me`, the session's first write.
- **Resolve**: `gh issue comment <n> --body "<answer>"`, then `gh issue close <n>`, then append a
  context pointer (gist + link) to the map's Decisions-so-far.
