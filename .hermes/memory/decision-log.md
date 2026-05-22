# Decision Log

Record durable engineering decisions that future agents should know. Do not store secrets.

## Entry Template

### YYYY-MM-DD: <decision title>

- Status: proposed | accepted | superseded
- Context:
- Decision:
- Alternatives considered:
- Consequences:
- Follow-up:

## Decisions

### YYYY-MM-DD: Initialize AgentOps Harness

- Status: proposed
- Context: The project needs a reusable plan-first AI engineering workflow.
- Decision: Use Hermes for orchestration and Codex for repository execution.
- Alternatives considered: Ad hoc prompting, project-specific scripts only.
- Consequences: Project-specific memory and verification commands must be maintained.
- Follow-up: Customize project profile, domain map, risk policy, and verification scripts.
