# AgentOps Overview

Universal AgentOps Harness standardizes how AI agents plan, implement, verify, review, and report software changes.

## Core Model

- Hermes orchestrates work.
- ProductOps prepares early product thinking before delivery.
- Codex executes repository changes.
- Project memory stores durable facts.
- Templates standardize repeatable outputs.
- Scripts provide portable verification defaults.

## Pre-Delivery ProductOps Layer

ProductOps lives under `.hermes/product/` and is used before implementation when a project still needs idea discovery, pain point analysis, customer segmentation, UX sprint planning, marketing planning, MVP scoping, or backlog creation.

Its main output is an implementation-ready Codex task backlog. Hermes owns orchestration across ProductOps workflows, then hands focused task briefs to Codex when the product direction is clear enough to build.

## Standard Flow

1. Classify the request.
2. Identify the domain.
3. Perform impact analysis.
4. Create a Codex task.
5. Implement minimal reversible changes.
6. Run build, test, and lint checks.
7. Review the diff.
8. Report results and update memory.

## What Good Looks Like

- The affected domain is clear.
- Risk is named before editing.
- Changes are small and reversible.
- Verification results are explicit.
- Rollback notes exist before completion.
- Reusable learnings are saved to memory.
