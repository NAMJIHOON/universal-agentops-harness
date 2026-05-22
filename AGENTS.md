# Universal Codex Agent Rules

These rules apply to every task in this repository unless a nearer domain-level `AGENTS.md` provides stricter or more specific guidance.

## Required Working Pattern

1. Understand the request before editing.
2. Identify the affected domain or state that the domain is unknown.
3. List files likely to change before making edits when the task is non-trivial.
4. Analyze impact across data, APIs, configuration, security, operations, compatibility, and rollback.
5. Make the smallest reversible change that satisfies the task.
6. Preserve existing behavior unless the task explicitly asks to change it.
7. Run applicable verification commands after changes.
8. Report changed files, verification results, remaining risk, and rollback notes.

## Plan Before Editing

Before modifying files, prepare a short plan that includes:

- Task summary
- Affected domain
- Expected files or directories
- Implementation approach
- Verification commands
- Rollback strategy

For non-trivial edits, state this plan in the working notes or response before editing. For simple documentation-only edits, a compact plan is enough. For code, data, infrastructure, security, or production-impacting changes, perform explicit impact analysis first.

## Domain Rules

- Respect the nearest `AGENTS.md` file to the code being changed.
- If rules conflict, follow the more specific and safer rule.
- If no domain-level rules exist, use `.hermes/memory/domain-map.md` when available.
- Do not cross domain boundaries without naming the reason.

## Safety Rules

- Do not expose secrets, credentials, tokens, private keys, cookies, or production data.
- Do not commit generated secrets or real credentials.
- Do not run destructive production operations.
- Do not perform unrelated refactoring.
- Do not silently change public APIs, database schemas, permissions, auth flows, billing logic, deployment logic, or compliance-sensitive behavior.
- Do not remove user changes or unrelated work.

## Implementation Rules

- Prefer minimal, readable, reversible changes.
- Match the existing project style.
- Add or update tests when behavior changes.
- Keep error handling clear and observable.
- Document non-obvious operational behavior.
- Avoid speculative abstractions.

## Verification Rules

Run the strongest available checks for the project:

```bash
./scripts/verify.sh
```

If the project does not use these scripts yet, run equivalent commands for:

- Build
- Tests
- Lint
- Type check or syntax check
- Security scan when available

If a command cannot be run, report why and suggest the next best verification step.

## Required Final Report

Every implementation response must include:

- Summary of the change
- Changed files
- Verification commands and results
- Risk assessment
- Rollback notes
- Follow-up items, if any
