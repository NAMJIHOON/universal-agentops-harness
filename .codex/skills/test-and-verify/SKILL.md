---
name: test-and-verify
description: Run and summarize build, test, lint, type, syntax, and optional security verification, including clear analysis of failed commands.
---

# Test And Verify

Use this skill after implementation and before final reporting.

## Verification Coverage

Run the strongest available checks:

- Build
- Test
- Lint
- Type check
- Syntax check
- Security check where available

Prefer project scripts when present:

```bash
./scripts/verify.sh
./scripts/test.sh
./scripts/lint.sh
```

## Process

1. Detect the project type and available package tooling.
2. Run targeted tests for changed behavior when possible.
3. Run build, test, lint, type, syntax, and security checks when available.
4. Do not hide failed commands.
5. For each failure, identify whether it is caused by the change, pre-existing, environment-related, or unknown.
6. If a command is unavailable, report it as skipped with the reason.

## Required Output

```markdown
## Verification

| Check | Command | Result | Notes |
| --- | --- | --- | --- |
| Build |  |  |  |
| Test |  |  |  |
| Lint |  |  |  |
| Type check |  |  |  |
| Syntax check |  |  |  |
| Security check |  |  |  |

## Failed Command Analysis

- Command:
- Exit code:
- Relevant output:
- Likely cause:
- Recommended fix or next step:
```

## Decision Rules

- A skipped optional command is acceptable only when clearly explained.
- A failed required command blocks completion unless the user explicitly accepts the risk.
- Prefer exact commands over vague descriptions.
- Do not install dependencies or modify project state unless the task or project workflow explicitly requires it.
