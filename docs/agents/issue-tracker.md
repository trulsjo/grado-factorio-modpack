# Issue tracker: GitHub

Issues and specs for this repo live as GitHub issues. Use the `gh` CLI for all operations.

## Conventions

- **Create an issue**: `gh issue create --title "..." --body "..."`. Write a multi-line body to a
  file and pass `--body-file <path>`; the same goes for `gh issue comment` and `gh pr create`. Write
  the file with the Write tool: a heredoc that writes the file is no safer.
  `scripts/ask-before-download.ps1` refuses a heredoc when one of its lines opens with a command it
  matches (measured 2026-10-08, recorded on PR #186), and `realistic-fusion-refreshed`'s tracker
  page records heredoc bodies failing under the Bash tool.
- **Before filing, list the open tickets** here and in `trulsjo/grado-factorio-tools`:
  `gh issue list --state open --limit 200 --json number,title`, and the same with
  `-R trulsjo/grado-factorio-tools`. The new ticket names any open one it touches. On 2026-10-09
  a line-length ticket for this repository's own Markdown check was close to being filed beside
  trulsjo/grado-factorio-tools#93, which had ruled the same day that the limit lives in the
  shared check (by the account of the session that filed #209).
- **What a ticket states**: a statement about the repository or about a past pull request is read
  from the source when the ticket is written. One that was not read is marked as an account, as
  `docs/agents/pre-pr-review-brief.md` does with "by #167's account" (#195).
- **A quantifier in a ticket carries its search**: a claim about all, none or the only one of a
  set ("every", "no", "the one", "nowhere else") is followed by the search that showed it, as a
  command or as the files walked. The session that implements the ticket runs the search before
  it copies the claim anywhere; if the two disagree, the page gets what the search showed and
  the pull request says the ticket was wrong. On 2026-10-09 #206 called one file "the one file
  where the three ranges stand side by side", two other files held all three, and the claim
  reached a commit message before a review caught it (PR #210, finding 2 in its body).
- **A criterion that a setting took effect names a newly started process**: where a ticket asks
  that a setting, a hook or a plugin be shown working or absent, the criterion names a `claude`
  process started after the commit that holds the setting is
  checked out, <!-- deliberate: checked -->
  and the process's start time is kept beside the start of its transcript. A new session
  id <!-- deliberate: id -->
  does not show it. On 2026-10-12 #160's "a new session" was met with a `/clear` in a
  process started four minutes before the commit: both sessions opened with the plugin's text,
  and neither could show whether the setting worked (#245).
- **Read an issue**: `gh issue view <number> --json title,body,labels,comments`, filtered with
  `--jq`. One call gets the body, the labels and every comment; `--comments` alone, piped, printed
  the comments and not the body (2026-10-06).
- **List issues**:
  `gh issue list --state open --json number,title,body,labels,comments --jq '[.[] | {number, title, body, labels: [.labels[].name], comments: [.comments[].body]}]'`
  with appropriate `--label` and `--state` filters.
- **Comment on an issue**: `gh issue comment <number> --body "..."`
- **Apply / remove labels**: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- **Close**: `gh issue close <number> --comment "..."`
- **Add a blocker**: a native issue dependency, which GitHub shows on the ticket.
  `gh api --method POST repos/trulsjo/grado-factorio-modpack/issues/<n>/dependencies/blocked_by -F issue_id=<blocker-db-id>`,
  where `<blocker-db-id>` is the blocker's numeric **database id**, <!-- deliberate: id -->
  GitHub's word for it, and _not_ its `#number` or `node_id`:
  `gh api repos/trulsjo/grado-factorio-modpack/issues/<blocker> --jq .id`. For a blocker in
  `grado-factorio-tools` it is read from
  `repos/trulsjo/grado-factorio-tools/issues/<blocker>` and the POST is the same: #225 carries
  such an edge to trulsjo/grado-factorio-tools#113 (read 2026-10-12).
  **The POST is allowed by a rule in the tracked `.claude/settings.json`** (#233), in this
  spelling, for a ticket of this repository or of `grado-factorio-tools`. Another spelling, and
  the DELETE that removes an edge, are not covered. Not measured: that the client's auto mode
  honours the rule. On 2026-10-13 the write ran in auto mode on `main`, which had no rule
  (client 2.1.296, one run), so a run with the rule would not show it. The client's
  documentation, as code.claude.com served *Auto mode configuration* that day, says: "By
  default, narrow Bash and PowerShell allow rules such as `Bash(npm test)` stay in effect in
  auto mode. Claude Code resolves them before the classifier runs".
- **A decision that makes a ticket wait** is recorded in one step with three parts: the
  `blocked_by` edge is added, the body's "Blocked by" line names the blocker, and
  `ready-for-agent` comes off. On 2026-10-12 #225 was handed to a session as `ready-for-agent`
  with "None" under "Blocked by" in its body, while Truls's decision of 2026-10-11 that it waits
  stood in its comments (#232).
- **Pull request body**: written with the `mattpocock-skills:pr` skill, where that plugin is
  installed. This repository adds to what it produces: above its template, a `Closes #<n>` for each
  ticket the branch resolves, where it resolves any; below it, under one heading, the pre-PR
  review's findings and its confirmation as they stand in the reviewer's report
  (`docs/agents/pre-pr-review-brief.md`, *Into the pull request*). `docs/agents/code-review.md` says
  what else the pull request records once the plugin pass has run.

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

Run `gh issue view <number> --json title,body,labels,comments`.

## Wayfinding operations

Used by `/wayfinder`. The **map** is a single issue with **child** issues as tickets.

- **Map**: a single issue labelled `wayfinder:map`, holding the Notes / Decisions-so-far / Fog body.
  `gh issue create --label wayfinder:map`.
- **Child ticket**: an issue linked to the map as a GitHub sub-issue (`gh api` on the sub-issues
  endpoint). Where sub-issues aren't enabled, add the child to a task list in the map body and put
  `Part of #<map>` at the top of the child body. Labels: `wayfinder:<type>`
  (`research`/`prototype`/`grilling`/`task`). Once claimed, the ticket is assigned to the driving
  dev.
- **Blocking**: GitHub's **native issue dependencies**, the canonical, UI-visible representation.
  The command that adds an edge is under *Conventions*, *Add a blocker*. GitHub
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
