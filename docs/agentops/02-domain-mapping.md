# Domain Mapping

Domain mapping tells agents where a change belongs and what rules apply.

## Domain Definition

A domain is a meaningful business, technical, or operational area with owned behavior and files. Examples include authentication, course management, billing, notifications, deployment, observability, and reporting.

## What To Capture

- Purpose
- Owned paths
- Related paths
- APIs
- Database tables or storage
- Events or queues
- External systems
- Sensitive data
- Required checks
- Rollback notes

## Boundary Rules

- One task may affect multiple domains.
- Cross-domain changes must be named in the plan.
- Public API and data model changes require compatibility review.
- Auth, permission, personal-data, billing, and deployment changes are high risk by default.

## Practical Tip

Start broad, then refine. A useful imperfect domain map is better than a perfect map that never gets written.
