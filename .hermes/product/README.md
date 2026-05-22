# ProductOps Extension

ProductOps Extension is the pre-implementation layer for Universal AgentOps Harness. It helps teams turn early product thinking into implementation-ready Codex task backlogs.

Use it before code work begins, when the work is still shaped as ideas, user pains, product strategy, UX direction, marketing hypotheses, MVP scope, or sprint planning.

## Why This Exists

AgentOps handles delivery: orchestration, execution, verification, review, and reporting.

ProductOps handles the work that happens before delivery:

- clarify vague ideas
- discover pain points and unmet needs
- define users and customer segments
- compare alternatives and competitors
- shape value proposition and positioning
- scope an MVP
- plan UX and marketing sprints
- convert product outputs into Codex-ready implementation tasks

Without this layer, Codex may receive implementation requests before the product problem is clear. ProductOps reduces that risk by making the "why", "for whom", "what first", and "how to validate" explicit.

## How It Connects To Codex

Hermes owns orchestration across the ProductOps layer. It chooses workflows, routes context between ProductOps agents, stores durable learning, and decides when the output is ready for delivery.

Codex receives implementation-ready task briefs only after ProductOps has produced enough clarity:

- product goal
- target users
- MVP scope
- UX flow or screen list
- acceptance criteria
- delivery slices
- risks and dependencies
- verification expectations

The final ProductOps handoff is usually `templates/codex-task-backlog.md`, which can be translated into Codex tasks using `agents/codex-backlog-translator.md`.

## Recommended Idea-To-MVP Workflow

1. Clarify the idea.
2. Extract pain points and unmet needs.
3. Define target users and priority segments.
4. Compare direct, indirect, and substitute alternatives.
5. Design the value proposition and positioning.
6. Scope the MVP.
7. Create the product brief or PRD.
8. Plan UX flow, IA, screens, and prototype scope.
9. Plan marketing message, landing copy, channels, and experiments.
10. Create sprint goals, user stories, and acceptance criteria.
11. Translate the backlog into Codex-ready implementation tasks.

## When To Use Each Workflow

- `idea-to-mvp.yaml`: use when starting from a raw idea.
- `pain-point-discovery.yaml`: use when the problem space is unclear.
- `product-planning.yaml`: use when strategy, metrics, and roadmap need structure.
- `ux-marketing-sprint.yaml`: use when UX direction and go-to-market thinking must move together.
- `prd-to-backlog.yaml`: use when a PRD exists and needs implementation slicing.
- `mvp-validation.yaml`: use after an MVP or prototype needs feedback-driven backlog updates.

## Operating Principle

ProductOps should make implementation easier, not heavier. Keep outputs concise, decision-oriented, and ready to hand off to Hermes and Codex.
