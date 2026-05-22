# Implementation Gate

## When This Gate Is Used

Use after Codex implementation and before PR review or release readiness.

## Required Artifacts

- Codex task brief
- Changed files
- Diff summary
- Verification report
- Risk notes
- Rollback notes

## Required Checks

- Implementation quality rubric
- Verification quality rubric
- Codex task quality rubric

## Pass Criteria

- Implementation and verification score 4 or higher.
- Acceptance criteria are satisfied.
- Required checks pass or accepted risks are documented.
- Change is scoped, reversible, and aligned with repository rules.

## Block Conditions

- Required verification fails.
- Change includes unrelated refactoring.
- Public API, data, security, or configuration impact is unreviewed.
- Rollback notes are missing for risky changes.

## Recommended Next Action

If passed, proceed to PR review. If blocked, return to Codex implementation or verification.
