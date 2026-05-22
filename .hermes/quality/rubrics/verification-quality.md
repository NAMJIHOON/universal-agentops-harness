# Verification Quality Rubric

## Purpose

Evaluate whether build, test, lint, type, security, and manual checks provide enough confidence.

## Required Inputs

- Verification report
- Commands run
- Command output or summaries
- Changed files
- Known skipped checks

## Quality Dimensions

| Dimension | What To Check |
| --- | --- |
| Coverage | Relevant checks match the change risk. |
| Evidence | Commands and results are explicit. |
| Failure analysis | Failures are classified and explained. |
| Skipped checks | Skips have reason and risk notes. |
| Reproducibility | Another agent can rerun the checks. |

## 5-Point Scoring Criteria

| Score | Criteria |
| --- | --- |
| 1 | No meaningful verification. |
| 2 | Some checks run but important coverage is missing. |
| 3 | Basic checks with minor gaps or unclear skips. |
| 4 | Relevant checks run and results are clear. |
| 5 | Strong verification with targeted and broad checks plus failure analysis. |

## Pass/Fail Threshold

Pass at 4 or higher. Fail if required checks fail without accepted risk.

## Common Failure Patterns

- Reports "tests passed" without commands.
- Skips lint or build without explanation.
- Does not connect checks to changed behavior.
- Hides flaky or environment failures.

## Improvement Guidance

List commands, results, relevant output, skipped checks, and whether failures are change-caused, pre-existing, environment-related, or unknown.

## Example Of A High-Quality Output

"Ran `./scripts/verify.sh`, targeted learner analytics tests, and lint. All passed. Security scan unavailable; skipped with tool-not-installed reason and low risk because no auth or dependency changes occurred."
