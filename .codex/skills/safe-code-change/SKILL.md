---
name: safe-code-change
description: Guide safe implementation with minimal reversible edits, behavior preservation, clear error handling, tests where appropriate, and no unrelated refactoring.
---

# Safe Code Change

Use this skill while implementing repository changes.

## Core Rules

- Make the smallest change that satisfies the task.
- Do not perform unrelated refactoring.
- Preserve existing behavior unless the task explicitly changes it.
- Respect root and nearest domain-level `AGENTS.md`.
- Keep error handling clear and observable.
- Do not expose or create secrets.
- Do not run unsafe production operations.
- Add or update tests when behavior changes.
- Keep rollback simple.

## Process

1. Read the relevant code before editing.
2. Confirm the affected domain and nearest rules.
3. Edit only files required for the requested behavior.
4. Keep public interfaces backward compatible unless explicitly approved.
5. Prefer existing patterns, naming, and structure.
6. Add tests near existing tests when possible.
7. Run targeted checks first, then broader verification.
8. Report remaining risk honestly.

## Stop Conditions

Stop and ask for guidance if:

- The task requires destructive data or infrastructure operations.
- The correct domain boundary is unclear and multiple options have material consequences.
- A required secret or production credential is missing.
- The change would silently break API, schema, auth, permission, or deployment behavior.

## Output Expectations

Final reports should include changed files, verification results, risk notes, and rollback notes.
