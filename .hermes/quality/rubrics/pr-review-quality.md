# PR Review Quality Rubric

## Purpose

Evaluate whether PR review findings are useful, risk-focused, and actionable.

## Required Inputs

- PR diff or changed files
- Verification report
- Review findings
- Domain and risk policy

## Quality Dimensions

| Dimension | What To Check |
| --- | --- |
| Defect focus | Review prioritizes bugs and risk over style. |
| Severity accuracy | P0 to P3 labels match impact. |
| Evidence | Findings include file, line, issue, and impact. |
| Actionability | Recommendations are specific. |
| Residual risk | No-finding reviews still mention gaps. |

## 5-Point Scoring Criteria

| Score | Criteria |
| --- | --- |
| 1 | Review is superficial or unsupported. |
| 2 | Findings exist but are vague or low-signal. |
| 3 | Usable review with some missing context. |
| 4 | Clear review with severity, evidence, and recommendations. |
| 5 | Strong risk-based review with precise findings and verification gaps. |

## Pass/Fail Threshold

Pass at 4 or higher. Fail if high-risk changes are not reviewed for correctness, security, data, API, and rollback impact.

## Common Failure Patterns

- Comments mostly on style while missing behavior risk.
- Does not include file or line references.
- Uses severity inconsistently.
- Says "looks good" without residual risk.

## Improvement Guidance

Lead with findings, include severity and evidence, explain impact, recommend a fix, and name remaining verification gaps.

## Example Of A High-Quality Output

"[P1] Missing permission check on staff review action. File: review API. Impact: non-reviewers can change case status. Recommendation: enforce reviewer role and add regression test."
