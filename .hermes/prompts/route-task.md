# Prompt: Route Task

Use this prompt to classify a user request and route it to a workflow.

## Input

- User request:
- Project profile:
- Domain map:
- Recent decisions:

## Instructions

1. Classify the request as feature, bugfix, infra change, incident response, documentation, review, or unknown.
2. Identify the primary and secondary domains.
3. Identify risk level: low, medium, high, or critical.
4. Select the best Hermes workflow.
5. List missing context required before Codex execution.

## Output

```markdown
## Route Result

- Task type:
- Workflow:
- Primary domain:
- Secondary domains:
- Risk level:
- Required context:
- Recommended next agent:
```
