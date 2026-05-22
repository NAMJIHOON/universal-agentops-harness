# Python FastAPI AGENTS.md

## Stack Description

Python backend API using FastAPI, Pydantic, dependency injection, async handlers, tests, and environment-based configuration.

## Common Risks

- Breaking request or response schemas
- Blocking the event loop
- Weakening auth dependencies
- Unsafe migrations
- Missing input validation
- Leaking secrets through logs or errors

## Required Checks

- Run unit and API tests.
- Run type checks when configured.
- Run lint or formatting checks when configured.
- Run syntax checks for changed Python files.

## Domain-Specific Rules

- Preserve OpenAPI compatibility unless approved.
- Keep validation in Pydantic models or dependencies.
- Do not log secrets or personal data.
- Use dependency injection for auth, settings, and database sessions.
- Add regression tests for endpoint behavior changes.

## Recommended Verification Commands

```bash
pytest
ruff check .
mypy .
./scripts/verify.sh
```
