# Verification Gates

Verification protects the repository from accidental regressions.

## Default Gate

Run checks in this order when available:

1. Syntax or type check
2. Build
3. Targeted tests
4. Full tests
5. Lint
6. Security check
7. Change summary

## Required Reporting

For each check, report:

- Command
- Result
- Relevant output
- Whether failure is change-caused, pre-existing, environment-related, or unknown

## Missing Commands

Missing optional commands should not crash the workflow without context. Report the missing command, explain the skipped coverage, and recommend the closest available check.

## Completion Rule

Do not mark a code change complete when required checks fail unless the user explicitly accepts the risk.
