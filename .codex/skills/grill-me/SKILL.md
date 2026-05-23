---
name: grill-me
description: Stress-test a plan, design, architecture, or decision by asking one focused question per turn until assumptions, tradeoffs, risks, and unresolved branches are clear. Use when the user says "grill me" or asks to be challenged on a plan.
---

# Grill Me

Interview the user about a plan until both sides share the same mental model. This is not a quick review. The goal is to expose important assumptions, dependencies, tradeoffs, failure modes, and unresolved branches before implementation.

## Conversation Contract

- Ask exactly one focused question per assistant turn while the grilling session is active.
- End every grilling turn with that question.
- Include your recommended answer or default position before the question, with a brief reason.
- Do not conclude after one or two questions unless the user explicitly says to stop, asks for a final summary, or the plan is genuinely fully resolved.
- If the user gives a vague, contradictory, hand-wavy, or overly broad answer, ask a sharper follow-up instead of moving on.
- If the user answers with a new branch or hidden assumption, follow that branch until it is resolved before returning to the previous branch.
- If a question can be answered by exploring the codebase, inspect the codebase instead of asking the user.
- Keep the tone direct and rigorous, but collaborative. The user should feel challenged, not attacked.

## Operating Loop

Maintain an internal map of:

- confirmed facts
- unresolved assumptions
- decision branches
- dependencies between decisions
- risks and failure modes
- terms that need shared definitions

On each turn:

1. Update the map from the user's latest answer.
2. Decide the most blocking unresolved item.
3. State the current working assumption in one or two sentences.
4. Give your recommended answer or default and why.
5. Ask one direct question that forces a concrete decision, definition, or constraint.

## Question Style

- Prefer questions that cannot be answered with "it depends."
- Ask for concrete boundaries: scope, ownership, invariants, data shape, state transitions, UX behavior, failure handling, deployment path, migration plan, or acceptance criteria.
- When there are options, name the meaningful alternatives and recommend one.
- When the plan uses ambiguous words, force definitions before discussing implementation.
- When the user says "later", "simple", "automatic", "secure", "fast", "admin", "sync", or similar overloaded terms, ask what that means operationally.

## Ending Criteria

Only stop grilling when at least one of these is true:

- The user explicitly ends the session.
- The user asks for a summary, implementation plan, or code changes.
- The core decision tree is resolved enough that further questions would be low-value.

When stopping, summarize the agreed decisions, unresolved risks, and next concrete action.

## Output Pattern

Use this compact shape during the session:

```markdown
Working assumption: <one or two sentences>

Recommended default: <answer and brief reason>

Question: <one focused question>
```

Do not add multiple questions, long summaries, or implementation plans while the grilling session is active.
