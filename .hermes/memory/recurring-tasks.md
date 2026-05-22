# Recurring Tasks

Use this file to capture repeated tasks that may become skills, runbooks, or automation.

## Task Template

### <task name>

- Trigger:
- Frequency:
- Owner:
- Inputs:
- Steps:
- Verification:
- Risks:
- Candidate skill or runbook:

## Candidates

### Verification Baseline Check

- Trigger: Before completing implementation tasks.
- Frequency: Every code change.
- Owner: Repository agent.
- Inputs: Changed files and project type.
- Steps: Run `./scripts/verify.sh`, inspect failures, summarize results.
- Verification: Build, tests, lint, type or syntax checks where available.
- Risks: Skipped checks may hide regressions.
- Candidate skill or runbook: `test-and-verify`.
