# Implementation Quality Rubric

## Purpose

Evaluate whether a code or documentation change is minimal, correct, reversible, and aligned with the task.

## Required Inputs

- Codex task brief
- Changed files
- Diff summary
- Verification report
- Risk and rollback notes

## Quality Dimensions

| Dimension | What To Check |
| --- | --- |
| Correctness | Change satisfies acceptance criteria. |
| Scope discipline | No unrelated refactoring or behavior drift. |
| Maintainability | Fits existing patterns and is readable. |
| Risk control | Security, data, API, config, and operations impact are handled. |
| Reversibility | Rollback path is clear. |

## 5-Point Scoring Criteria

| Score | Criteria |
| --- | --- |
| 1 | Change is unsafe, incomplete, or unrelated. |
| 2 | Partial implementation with major gaps or risky assumptions. |
| 3 | Works in common path but has notable gaps. |
| 4 | Correct, scoped, tested, and rollback-aware. |
| 5 | Strong implementation with clear tests, observability, and low residual risk. |

## Pass/Fail Threshold

Pass at 4 or higher. Fail if acceptance criteria are unmet or required checks fail.

## Common Failure Patterns

- Broad refactor mixed into feature work.
- Breaks backward compatibility silently.
- Adds behavior without tests.
- Leaves rollback or config impact unclear.

## Improvement Guidance

Reduce scope, align with existing patterns, add targeted tests, document risk, and confirm rollback.

## Example Of A High-Quality Output

"The implementation adds only the readiness checklist model, API, UI, and tests. Existing course views are unchanged, validation errors are explicit, and rollback is removing the new route and table."
