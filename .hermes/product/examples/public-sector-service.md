# Example: Public-Sector Service

## Idea

A citizen service application tracker that helps residents submit requests, monitor status, and receive clear guidance while staff manage review workflows.

## Pain Points

- Citizens do not know which documents are required.
- Status updates are hard to understand or arrive late.
- Staff manually check incomplete applications.
- Accessibility, privacy, and audit requirements increase delivery risk.

## Target Users

- Primary user: citizen or applicant.
- Staff user: case reviewer.
- Sponsor: public agency service owner.
- Secondary users: accessibility reviewer and policy owner.

## Value Proposition

A transparent and accessible application workflow that reduces incomplete submissions and gives both citizens and staff a shared status view.

## MVP Scope

Must have:

- Guided eligibility and document checklist
- Application submission draft
- Status tracker
- Staff review queue
- Notification copy templates
- Accessibility and privacy review checklist

Later:

- Identity integration
- Payment
- Multi-language support
- Advanced case routing

## UX Direction

Design for clarity, accessibility, and trust. Use simple step-by-step flows for citizens and an efficient review queue for staff. Include error, draft, missing-document, and accessibility states.

## Marketing Message

Public message: "Know what to submit, where your application stands, and what happens next."

## Sprint Backlog

| Story | Acceptance Criteria |
| --- | --- |
| Complete guided checklist | Applicant can see required documents based on selected service type. |
| Save draft application | Applicant can save progress without submitting. |
| Track application status | Applicant can see plain-language status and next step. |
| Review applications | Staff can filter submitted applications and mark missing information. |

## Sample Codex Tasks

### Task: Build Guided Document Checklist

- Goal: Show required documents based on service type and applicant answers.
- Affected domain: application intake
- Likely files: checklist flow, rules model, accessibility tests, content files
- Acceptance criteria: checklist updates from answers and uses plain-language labels.
- Verification commands: build, tests, lint, accessibility check where available

### Task: Implement Staff Review Queue

- Goal: Provide review queue for submitted applications.
- Affected domain: case review
- Likely files: staff page, review API, permissions, audit log, tests
- Acceptance criteria: staff can filter applications and mark missing information with audit history.
- Verification commands: build, tests, lint
