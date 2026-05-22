# Example: Internal Admin System

## Idea

An internal request management console for operations teams handling access requests, approvals, and audit trails across multiple internal systems.

## Pain Points

- Requests arrive through chat, email, and spreadsheets.
- Approval status is hard to track.
- Operators repeat the same checks manually.
- Audit history is incomplete or scattered.

## Target Users

- Primary user: operations admin.
- Approver: team lead or system owner.
- Secondary users: compliance reviewer and requester.

## Value Proposition

A controlled request workspace that standardizes intake, approvals, execution status, and audit history for internal operations.

## MVP Scope

Must have:

- Request intake form
- Approval queue
- Status tracking
- Audit log
- Basic role permissions

Later:

- External system automation
- SLA alerts
- Advanced approval policies
- Reporting dashboard

## UX Direction

Use a dense admin interface with queue, filters, request detail panel, status timeline, and approval actions. Prioritize clarity, permissions, and auditability.

## Marketing Message

Internal message: "One queue for requests, approvals, and audit-ready status."

## Sprint Backlog

| Story | Acceptance Criteria |
| --- | --- |
| Submit request | Requester can submit a structured request with type, reason, and target system. |
| Review approval queue | Approver can approve, reject, or request more information. |
| Track execution status | Operator can update request status and see pending work. |
| View audit history | Admin can see timestamped events for each request. |

## Sample Codex Tasks

### Task: Implement Request Intake

- Goal: Add structured request creation flow.
- Affected domain: request management
- Likely files: form, API endpoint, validation model, tests
- Acceptance criteria: required fields validate; created requests enter pending approval.
- Verification commands: build, tests, lint

### Task: Add Approval Queue

- Goal: Let approvers review and act on pending requests.
- Affected domain: approvals
- Likely files: queue page, approval API, permission checks, tests
- Acceptance criteria: only approvers can approve or reject; actions are recorded in audit log.
- Verification commands: build, tests, lint
