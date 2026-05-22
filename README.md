# Universal AgentOps Harness

Universal AgentOps Harness is a reusable operating template for AI-assisted software delivery. It gives any repository a consistent way to plan work, route tasks, execute code changes, verify results, review risk, and report outcomes.

This template is intentionally generic. Apply it to an LMS, portal, SaaS product, mobile app, backend API, infrastructure repository, or public-sector system by filling in the project-specific domain map, verification commands, and risk rules.

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
