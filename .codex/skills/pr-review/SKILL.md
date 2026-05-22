---
name: pr-review
description: Review repository changes or pull requests for correctness, security, performance, error handling, compatibility, DB/API impact, test coverage, and rollback risk.
---

# PR Review

Use this skill to review a diff, branch, or pull request.

## Severity Levels

- **P0 critical**: Must fix immediately. Causes data loss, security breach, outage, or severe production failure.
- **P1 high**: Should block merge. Likely bug, security issue, compatibility break, or missing essential verification.
- **P2 medium**: Should fix soon. Meaningful quality, maintainability, edge-case, or test gap.
- **P3 low**: Nice to improve. Style, clarity, or minor maintainability issue.

## Review Checklist

- Correctness
- Security
- Performance
- Error handling
- Backward compatibility
- Database impact
- API impact
- Configuration impact
- Test coverage
- Rollback risk
- Operational observability

## Process

1. Inspect changed files and relevant surrounding code.
2. Focus on defects and merge-blocking risk.
3. Avoid commenting on unrelated pre-existing issues unless they affect the change.
4. Provide file and line references when possible.
5. State when no findings are found.
6. Include residual risks and missing verification.

## Output Format

```markdown
## Findings

- [P1] Title
  - File:
  - Issue:
  - Impact:
  - Recommendation:

## Open Questions

- 

## Verification Gaps

- 
```
