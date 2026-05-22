# Quality Gate Layer

Quality Gate Layer defines how to evaluate and improve outputs across ProductOps, Hermes, Codex, and release readiness.

It is not a new execution engine. It is a reusable quality system that helps teams decide whether an artifact is ready to move to the next stage, needs refinement, or should be rewritten.

## Why Quality Gates Are Needed

AI-assisted delivery can move quickly, but speed creates risk when early artifacts are vague or unverifiable. Quality gates help prevent weak ideas, unclear PRDs, oversized MVPs, vague backlogs, risky Codex tasks, incomplete verification, and shallow reviews from moving downstream.

Use quality gates to:

- improve artifacts before handoff
- make readiness criteria explicit
- reduce rework during implementation
- preserve traceability from idea to release
- expose risks before they become delivery problems

## How It Connects The Harness

- **ProductOps** creates discovery, planning, UX, marketing, MVP, and backlog artifacts.
- **Hermes** selects workflows, routes artifacts through gates, and decides whether to continue, refine, or stop.
- **Codex** receives implementation-ready tasks that have passed delivery readiness checks.
- **Release** uses final gates for verification, review, rollout, rollback, and reporting.

## Common Quality Principles

- **Clarity**: the artifact is understandable without hidden context.
- **Traceability**: claims connect to evidence, decisions, source artifacts, or user needs.
- **Feasibility**: the work can be implemented with known constraints.
- **Verifiability**: success can be tested, measured, or reviewed.
- **Reusability**: the output can guide future work without being rewritten from scratch.
- **Risk awareness**: assumptions, dependencies, security, data, operational, and rollback risks are visible.

## Scoring Model

Use a 1 to 5 score for each rubric:

| Score | Meaning |
| --- | --- |
| 1 | Unusable. Missing core information or unsafe to hand off. |
| 2 | Weak. Some useful material, but major gaps remain. |
| 3 | Acceptable. Usable with minor clarification or follow-up. |
| 4 | Strong. Clear, traceable, and ready for the next stage. |
| 5 | Excellent. High-confidence, reusable, and low ambiguity. |

Default threshold:

- **Pass**: average score 4 or higher with no blocking issue.
- **Improve**: average score 3 to 3.9, or one important gap.
- **Rewrite**: score below 3, or any blocking issue.

## Recommended Use

1. Select the matching gate from `gates/`.
2. Evaluate required artifacts using the relevant rubrics from `rubrics/`.
3. Use the checklist from `checklists/` to catch operational gaps.
4. Decide: pass, improve, or rewrite.
5. Record the result in the workflow report or Hermes memory if it affects future work.
