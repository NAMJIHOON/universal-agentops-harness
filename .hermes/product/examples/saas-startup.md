# Example: SaaS Startup

## Idea

A lightweight revenue operations dashboard for early-stage B2B SaaS teams that need one view of pipeline, activation, expansion, and churn risk.

## Pain Points

- Founders and RevOps leads combine CRM, billing, product analytics, and spreadsheets manually.
- Weekly revenue meetings spend too much time reconciling numbers.
- Churn signals are discovered after account health has already declined.
- Existing BI tools are too slow to configure for small teams.

## Target Users

- Primary user: RevOps lead or founder.
- Buyer: founder, COO, or head of revenue.
- Secondary users: sales managers and customer success leads.

## Value Proposition

One setup-light dashboard that turns scattered SaaS growth signals into weekly decisions for pipeline, activation, expansion, and retention.

## MVP Scope

Must have:

- CSV import for CRM, billing, and product events
- KPI dashboard for pipeline, activation, MRR, expansion, and churn risk
- Account health table with filters
- Weekly summary export

Later:

- Native integrations
- Forecasting
- Custom metric builder
- Role-based dashboards

## UX Direction

Start with a work-focused dashboard. Prioritize scanability, filters, and drill-down from KPI to account list. Avoid a marketing-style analytics homepage.

## Marketing Message

"Stop stitching revenue signals together before every weekly meeting."

Primary channels:

- Founder communities
- RevOps newsletters
- LinkedIn founder/operator posts

## Sprint Backlog

| Story | Acceptance Criteria |
| --- | --- |
| Import CSV files | User can upload sample CRM, billing, and product event CSVs and see validation errors. |
| View KPI dashboard | User can see five core SaaS metrics with date range filtering. |
| Identify churn risk | User can sort accounts by risk score and inspect contributing signals. |
| Export weekly summary | User can download a simple report for leadership review. |

## Sample Codex Tasks

### Task: Build CSV Import Flow

- Goal: Add upload and validation flow for CRM, billing, and product event CSVs.
- Affected domain: data ingestion
- Likely files: upload UI, parser, validation service, tests
- Acceptance criteria: invalid rows show actionable errors; valid files populate normalized staging data.
- Verification commands: build, tests, lint

### Task: Create Account Health Dashboard

- Goal: Display KPI cards and account health table from normalized sample data.
- Affected domain: analytics dashboard
- Likely files: dashboard page, metrics service, table component, tests
- Acceptance criteria: metrics update by date range; account table supports sorting by churn risk.
- Verification commands: build, tests, lint
