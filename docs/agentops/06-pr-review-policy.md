# PR Review Policy

PR review focuses on defects, regressions, and release risk.

## Review Priorities

- Correctness
- Security
- Data integrity
- Backward compatibility
- Performance
- Error handling
- Test coverage
- Rollback safety

## Severity Levels

- P0 critical: Must fix immediately. Data loss, outage, exploit, or severe production failure.
- P1 high: Blocks merge. Likely bug, security issue, compatibility break, or missing required verification.
- P2 medium: Should fix soon. Edge case, maintainability risk, incomplete test coverage, or operational concern.
- P3 low: Nice to improve. Clarity, style, or small cleanup.

## Review Output

Use findings first:

```markdown
## Findings

- [P1] Title
  - File:
  - Issue:
  - Impact:
  - Recommendation:

## Open Questions

## Verification Gaps
```

## No Findings

If no findings are discovered, say so directly and list residual risks or missing verification.
