---
name: runbook-writer
description: Create operational runbooks with purpose, scope, preconditions, impact, procedure, verification, rollback, risk checklist, and communication template.
---

# Runbook Writer

Use this skill for operational procedures, releases, migrations, incident actions, scheduled jobs, or manual recovery steps.

## Required Sections

- Purpose
- Scope
- Preconditions
- Impact
- Step-by-step procedure
- Verification commands
- Rollback procedure
- Risk checklist
- Communication template

## Process

1. Define the exact operational goal.
2. Identify impacted systems, users, data, and environments.
3. List required permissions and preconditions.
4. Write steps that are safe, ordered, and observable.
5. Add verification after each risky phase.
6. Add rollback steps that can be executed under pressure.
7. Include communication for start, progress, incident, rollback, and completion.

## Safety Rules

- Never include real secrets or credentials.
- Mark environment-specific values as placeholders.
- Avoid irreversible commands unless the user explicitly approves them.
- Include backups or snapshots before data changes.
- Include a clear stop condition.

## Output Format

```markdown
# Runbook: <title>

## Purpose

## Scope

## Preconditions

## Impact

## Procedure

## Verification Commands

## Rollback Procedure

## Risk Checklist

## Communication Template
```
