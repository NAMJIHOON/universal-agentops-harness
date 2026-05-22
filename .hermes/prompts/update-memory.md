# Prompt: Update Memory

Use this prompt to decide whether a task result should update Hermes memory.

## Input

- Task result:
- New domain facts:
- New decisions:
- New verification baseline:
- Repeated task patterns:

## Instructions

1. Save durable facts only.
2. Do not store secrets, credentials, personal data, or temporary logs.
3. Update project profile when stack, ownership, environments, or verification baseline changes.
4. Update domain map when ownership, paths, APIs, data, or risk rules become clearer.
5. Update decision log when future work should follow a decision.
6. Update recurring tasks when a pattern repeats or should become a skill.

## Output

```markdown
## Memory Update Proposal

- File:
- Change:
- Reason:
- Sensitivity check:
```
