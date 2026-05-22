---
name: impact-analysis
description: Analyze task impact before implementation, especially for changes touching code, data, APIs, configuration, operations, security, or compatibility.
---

# Impact Analysis

Use this skill before implementation when a task may affect behavior, data, APIs, configuration, security, operations, deployment, or rollback.

## Inputs

- User request or task brief
- Project profile and domain map when available
- Relevant `AGENTS.md` files
- Candidate files or directories
- Existing tests and verification commands

## Process

1. Restate the task in one or two sentences.
2. Identify affected domains and boundaries.
3. Identify files likely to change and files that must be read first.
4. Check data, API, database, config, security, operational, and compatibility impact.
5. Choose the smallest safe implementation approach.
6. Define verification before editing.
7. Define rollback before editing.
8. Escalate if the change is destructive, ambiguous, or production-sensitive.

## Required Output

```markdown
## Impact Analysis

- Task summary:
- Affected domains:
- Affected files:
- Affected APIs:
- Affected database tables:
- Security impact:
- Operational impact:
- Compatibility risk:
- Recommended implementation approach:
- Verification plan:
- Rollback plan:
- Open questions:
```

## Decision Rules

- Mark unknowns explicitly instead of guessing.
- Treat auth, permissions, personal data, billing, migrations, deployment, and public APIs as high risk.
- Prefer reversible code changes over schema or data changes when both are viable.
- If verification cannot cover the risk, report the gap.
