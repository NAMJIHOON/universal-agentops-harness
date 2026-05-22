# Codex Task Quality Rubric

## Purpose

Evaluate whether a task brief is ready for Codex repository execution.

## Required Inputs

- Codex task backlog item
- Acceptance criteria
- Domain map hints
- Verification commands
- Risk and rollback notes

## Quality Dimensions

| Dimension | What To Check |
| --- | --- |
| Goal clarity | The task outcome is specific. |
| Scope control | In-scope and out-of-scope boundaries are visible. |
| Repository hints | Domains and likely files are named when known. |
| Verifiability | Commands and acceptance criteria are concrete. |
| Safety | Risks, secrets, data, and rollback are considered. |

## 5-Point Scoring Criteria

| Score | Criteria |
| --- | --- |
| 1 | Task is vague or not actionable. |
| 2 | Goal exists but scope, files, or checks are missing. |
| 3 | Usable task with minor ambiguity. |
| 4 | Clear implementation task ready for Codex. |
| 5 | Excellent task with domain, constraints, acceptance criteria, verification, and rollback. |

## Pass/Fail Threshold

Pass at 4 or higher. Fail if Codex would need to guess the goal, domain, or success criteria.

## Common Failure Patterns

- Says "build the feature" without slices.
- Omits verification commands.
- Hides product questions inside implementation work.
- Has no risk or rollback notes for sensitive changes.

## Improvement Guidance

Add goal, product source, affected domain, likely files, constraints, acceptance criteria, verification, risks, and rollback notes.

## Example Of A High-Quality Output

"Task: Build learner risk table. Domain: learner analytics. Likely files: analytics service, table component, filters, tests. Criteria: filter by course and risk reason. Verification: build, unit tests, lint."
