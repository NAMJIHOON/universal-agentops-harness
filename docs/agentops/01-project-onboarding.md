# Project Onboarding

Use this checklist when applying the harness to a new repository.

## Initial Setup

1. Copy the harness into the repository root.
2. Run `./scripts/detect-project.sh`.
3. Fill out `.hermes/memory/project-profile.md`.
4. Fill out `.hermes/memory/domain-map.md`.
5. Update verification commands in `.codex/config.example.toml`.
6. Add domain-level `AGENTS.md` files for high-risk subsystems.
7. Run `./scripts/verify.sh`.

## Minimum Required Project Facts

- Project type and tech stack
- Main source paths
- Test paths
- Build, test, lint, type, and security commands
- High-risk domains
- Data stores and external integrations
- Deployment and rollback expectations

## Onboarding Exit Criteria

- A new agent can identify the stack.
- A new agent can find domain ownership.
- Verification commands run or fail with clear reasons.
- Risk policy names the highest-risk areas.
- Templates are ready for task, review, rollback, and reporting.
