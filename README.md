# Universal AgentOps Harness

Universal AgentOps Harness is a reusable operating template for AI-assisted software delivery. It gives any repository a consistent way to plan work, route tasks, execute code changes, verify results, review risk, and report outcomes.

This template is intentionally generic. Apply it to an LMS, portal, SaaS product, mobile app, backend API, infrastructure repository, or public-sector system by filling in the project-specific domain map, verification commands, and risk rules.

## What This Repository Is For

Use this repository when you want AI agents to work inside a software project with clear roles, predictable workflows, and safer delivery rules.

This harness is designed for teams that want:

- plan-first implementation instead of ad hoc prompting
- clear separation between orchestration and code execution
- reusable skills and templates across many projects
- consistent verification and reporting before changes are considered done
- project-specific customization without rewriting the whole operating model

## Quick Start

If you are applying this harness to a new repository, start here:

1. Copy this template into the target repository root.
2. Run `./scripts/detect-project.sh`.
3. Fill out `.hermes/memory/project-profile.md`.
4. Fill out `.hermes/memory/domain-map.md`.
5. Update root `AGENTS.md` and add domain-level `AGENTS.md` files where needed.
6. Adjust `./scripts/verify.sh`, `./scripts/test.sh`, and `./scripts/lint.sh` to match the project.
7. Run `./scripts/verify.sh`.
8. Commit the harness as the repository's AgentOps baseline.

## How To Use It

The harness is meant to be used in an execution loop:

1. A request comes in: feature, bugfix, infra task, incident action, or documentation work.
2. Hermes chooses the workflow, reads memory, and prepares a Codex task brief.
3. Codex inspects the repository, performs impact analysis, and changes only the necessary files.
4. Codex runs verification and reports changed files, risk, and rollback notes.
5. Hermes summarizes the result and updates project memory if the learning should persist.

In practice, that means:

- use `.hermes/workflows/` to decide the task path
- use `.hermes/memory/` to store durable project facts
- use `.codex/skills/` to standardize repeated execution patterns
- use `AGENTS.md` to control behavior inside the repository
- use `docs/templates/` for consistent task, review, rollback, and report outputs

## Layer Model

The harness separates orchestration from execution.

- **Hermes layer**: orchestration, memory, routing, workflow selection, agent roles, and task handoff.
- **Codex layer**: repository execution, code modification, build, test, lint, PR work, and review.
- **Project layer**: domain map, tech stack, verification commands, risk policy, templates, and local AGENTS.md rules.

Hermes decides what should happen and why. Codex performs the repository work safely and reports what changed.

## Responsibility Boundary

- Hermes should classify requests, route domains, select workflows, prepare Codex task briefs, evaluate policy gates, summarize results, and update memory.
- Codex should inspect repository files, make code or document changes, run shell commands, execute verification, review diffs, and produce rollback notes.
- Project files should provide facts and constraints. They should not duplicate agent behavior when a Hermes role or Codex skill already owns it.

## Repository Layout

```text
universal-agentops-harness/
├── AGENTS.md
├── README.md
├── .codex/
├── .hermes/
├── docs/
└── scripts/
```

## Applying This Template To A New Project

1. Copy the contents of `universal-agentops-harness/` into the root of the target repository.
2. Rename `.codex/config.example.toml` and `.hermes/hermes.config.example.yaml` only if your local tooling expects non-example filenames.
3. Fill out `.hermes/memory/project-profile.md` with the project type, stack, environments, and owners.
4. Fill out `.hermes/memory/domain-map.md` with domains, boundaries, owned files, and sensitive flows.
5. Update `AGENTS.md` and add domain-level `AGENTS.md` files near important subsystems.
6. Customize `scripts/verify.sh`, `scripts/test.sh`, and `scripts/lint.sh` if the auto-detected defaults are not enough.
7. Run `scripts/verify.sh` once and record the expected baseline in `.hermes/memory/recurring-tasks.md`.

## Typical Setup By Layer

### 1. Hermes Layer

Customize:

- `.hermes/hermes.config.example.yaml`
- `.hermes/memory/project-profile.md`
- `.hermes/memory/domain-map.md`
- `.hermes/workflows/` if your team has extra task types

Use this layer to define orchestration rules, memory, routing, and workflow expectations.

### 2. Codex Layer

Customize:

- `AGENTS.md`
- `.codex/config.example.toml`
- `.codex/hooks.example.json`
- `.codex/skills/`

Use this layer to define how repository execution should happen: planning, risk checks, verification, reporting, and reusable skills.

### 3. Project Layer

Customize:

- verification commands
- domain ownership
- risk policy
- rollback expectations
- template outputs used by the team

Use this layer to make the harness fit the actual system without changing the core model.

## Recommended First Setup Steps

- Identify the primary project type using `scripts/detect-project.sh`.
- Define the minimum verification gate: build -> test -> lint.
- Write down high-risk domains such as auth, payments, personal data, data migration, deployment, and permissions.
- Add domain-level `AGENTS.md` files for modules that need stricter rules.
- Create the first decision entry in `.hermes/memory/decision-log.md` explaining how the harness is customized.

## Recommended Workflow

1. Hermes classifies the request and routes it to a workflow.
2. Hermes updates or reads memory: project profile, domain map, decisions, and recurring tasks.
3. Hermes produces a Codex task brief with expected domain, files, risks, and verification commands.
4. Codex performs impact analysis before editing.
5. Codex makes minimal reversible changes.
6. Codex runs verification: build, test, lint, and optional security checks.
7. Codex reports changed files, verification results, risk, and rollback notes.
8. Hermes summarizes the result and updates memory when the learning is reusable.

## Example Adoption Sequence

For a backend API project:

1. Add this harness to the repository.
2. Map domains such as auth, users, billing, notifications, and deployment.
3. Point verification scripts to the project's real build, test, lint, and type-check commands.
4. Add stricter `AGENTS.md` files under high-risk paths such as `auth/`, `migrations/`, or `infra/`.
5. Start using Hermes workflows and Codex skills for day-to-day tasks.

For an infrastructure repository:

1. Keep the same Hermes and Codex structure.
2. Tighten risk rules around destructive changes, credentials, and production environments.
3. Replace generic verification commands with `plan`, `validate`, `diff`, and runbook checks.

## Customizing Domain Rules

Use `.hermes/memory/domain-map.md` as the source of truth for domains. For each domain, define:

- Owned paths and files
- APIs and events
- Database tables or storage resources
- External integrations
- Sensitive data handled
- Required checks
- Reviewers or approval expectations
- Rollback notes

For strict areas, place a local `AGENTS.md` inside the domain directory. Codex must follow the nearest `AGENTS.md` in addition to the root rules.

## Adding New Skills

Create a folder under `.codex/skills/<skill-name>/SKILL.md`.

Each skill should include:

- YAML frontmatter with `name` and `description`
- When to use the skill
- Required inputs
- Step-by-step behavior
- Required output format
- Safety or failure-handling rules

Keep skills short and procedural. Put only reusable guidance into skills. Project-specific details belong in the Hermes memory files or local `AGENTS.md` files.

## Running Verification

Use the scripts from the repository root:

```bash
./scripts/detect-project.sh
./scripts/verify.sh
./scripts/test.sh
./scripts/lint.sh
./scripts/summarize-changes.sh
```

`verify.sh` chooses reasonable defaults based on project files. Missing optional commands should be reported clearly instead of hiding the problem or failing without context.

For a real project, replace generic defaults with the exact commands your team trusts in CI.

## What To Customize Per Project

- `.hermes/memory/project-profile.md`
- `.hermes/memory/domain-map.md`
- `.hermes/hermes.config.example.yaml`
- `.codex/config.example.toml`
- Root and domain-level `AGENTS.md`
- Verification scripts
- Documentation templates used by the team

## Operating Principle

Plan first, change minimally, verify automatically, report honestly, and preserve enough memory that the next task starts smarter than the last one.
