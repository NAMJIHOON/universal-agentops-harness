# Example: Education Platform

## Idea

A course operations workspace for online learning teams that need to monitor enrollment, learner progress, content readiness, and instructor support in one place.

## Pain Points

- Course managers track launch readiness across spreadsheets, LMS screens, and messages.
- Learner drop-off is visible only after weekly reports.
- Instructor questions and content issues are disconnected from course health.
- Public or institutional reporting requires repeated manual compilation.

## Target Users

- Primary user: course operations manager.
- Buyer or sponsor: education program lead or institution administrator.
- Secondary users: instructors, support staff, reporting staff.

## Value Proposition

A single course operations view that helps teams launch courses on time, detect learner risk earlier, and prepare reliable reporting with less manual work.

## MVP Scope

Must have:

- Course readiness checklist
- Enrollment and progress dashboard
- Learner risk list based on inactivity and low progress
- Issue register for content and instructor support
- Exportable status summary

Later:

- LMS API integrations
- Automated nudges
- Advanced cohort analytics
- Approval workflows

## UX Direction

Use an operational workspace layout with course selector, readiness status, learner risk table, and issue queue. Keep the first prototype focused on one course manager workflow.

## Marketing Message

"Run online courses with earlier risk signals and fewer manual status reports."

## Sprint Backlog

| Story | Acceptance Criteria |
| --- | --- |
| Track course readiness | Course manager can mark content, instructor, schedule, and QA readiness. |
| Monitor learner progress | Dashboard shows enrollment, active learners, completion progress, and inactivity. |
| Review learner risk | User can filter learners by inactivity and progress thresholds. |
| Export status summary | User can export a course status brief for stakeholders. |

## Sample Codex Tasks

### Task: Add Course Readiness Checklist

- Goal: Implement readiness checklist for one course.
- Affected domain: course operations
- Likely files: course page, checklist component, persistence model, tests
- Acceptance criteria: checklist state persists and readiness percentage updates.
- Verification commands: build, tests, lint

### Task: Build Learner Risk Table

- Goal: Show learners with inactivity and low-progress risk indicators.
- Affected domain: learner analytics
- Likely files: analytics service, risk table, filters, tests
- Acceptance criteria: risk list can be filtered by course and risk reason.
- Verification commands: build, tests, lint
