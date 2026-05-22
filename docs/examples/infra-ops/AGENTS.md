# Infra Ops AGENTS.md

## Stack Description

Infrastructure, deployment, CI/CD, containers, Kubernetes, Terraform, cloud resources, or operational scripts.

## Common Risks

- Destructive resource changes
- Production outage
- Credential exposure
- Irreversible state changes
- Drift between environments
- Missing rollback or observability

## Required Checks

- Run format and validation commands for infrastructure code.
- Run plan or dry-run before apply commands.
- Review blast radius and rollback plan.
- Confirm environment and target account before any operation.

## Domain-Specific Rules

- Never run production-destructive commands without explicit approval.
- Use placeholders for secrets in docs and examples.
- Prefer dry-run and plan output before change execution.
- Include monitoring and rollback steps in every runbook.
- Keep environment-specific values separate from generic templates.

## Recommended Verification Commands

```bash
terraform fmt -check
terraform validate
terraform plan
docker compose config
kubectl diff -f .
```
