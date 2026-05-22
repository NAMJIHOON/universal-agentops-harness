# Risk Policy

Risk policy defines when agents must slow down, analyze, and ask for approval.

## High-Risk Areas

- Authentication and authorization
- Personal data and privacy
- Billing and payments
- Database migrations and data fixes
- Public APIs and contracts
- Deployment and infrastructure
- Security controls
- Compliance reporting

## Required Controls

- Impact analysis before editing
- Minimal reversible implementation
- Required verification
- Rollback plan
- Review before merge or release

## Approval Required

Require explicit human approval for:

- Destructive data operations
- Production deployment
- Credential rotation
- Permission model changes
- Public API breaking changes
- Irreversible infrastructure changes

## Secret Handling

- Never print secrets.
- Never commit secrets.
- Use placeholders in documentation.
- Redact sensitive logs before storing memory.
