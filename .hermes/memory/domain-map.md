# Domain Map

Use this file to map project domains to files, APIs, data, risks, and required checks.

## Domain Template

### Domain: <name>

- Purpose:
- Owned paths:
- Related paths:
- Public APIs:
- Internal APIs:
- Database tables or storage:
- Events or queues:
- External systems:
- Sensitive data:
- Common risks:
- Required checks:
- Rollback notes:
- Domain-level `AGENTS.md` path:

## Domain Index

| Domain | Owned Paths | Risk Level | Required Checks |
| --- | --- | --- | --- |
| Example domain | `src/example/` | Low | Unit tests |

## Boundary Rules

- Cross-domain changes must identify all impacted domains.
- Public API changes require compatibility review.
- Data model changes require rollback and migration notes.
- Auth, permission, and personal-data changes require security review.
