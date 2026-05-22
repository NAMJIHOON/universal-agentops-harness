# Release Ready Gate

## When This Gate Is Used

Use before merge, deployment, public release, or stakeholder handoff.

## Required Artifacts

- Final verification report
- PR review findings
- Release notes or PR summary
- Rollout plan
- Rollback plan
- Known risks

## Required Checks

- Verification quality rubric
- PR review quality rubric
- Implementation quality rubric
- Release checklist

## Pass Criteria

- Verification and PR review score 4 or higher.
- Blocking findings are resolved or explicitly accepted.
- Rollout and rollback are clear.
- Release communication is ready.

## Block Conditions

- P0 or unresolved P1 finding.
- Required verification fails.
- Rollback path is unknown.
- Production-impacting risk lacks approval.

## Recommended Next Action

If passed, proceed to merge, release, or handoff. If blocked, resolve findings, rerun verification, or revise rollout and rollback plans.
