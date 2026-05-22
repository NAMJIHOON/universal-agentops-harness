# Node Next.js AGENTS.md

## Stack Description

Node.js web application using Next.js, React, TypeScript or JavaScript, API routes, server actions, and package scripts.

## Common Risks

- Server and client boundary mistakes
- Exposing secrets to client bundles
- Breaking route behavior or metadata
- Hydration errors
- Missing loading, error, or empty states
- Regressing accessibility

## Required Checks

- Run package tests when available.
- Run lint and type checks when configured.
- Run build for production-impacting changes.
- Check changed UI flows manually when practical.

## Domain-Specific Rules

- Keep secrets server-side only.
- Preserve route and API compatibility.
- Use existing component patterns and design tokens.
- Add tests for business logic and critical rendering behavior.
- Avoid broad dependency upgrades without approval.

## Recommended Verification Commands

```bash
npm test
npm run lint
npm run typecheck
npm run build
pnpm test
pnpm lint
pnpm build
```
