# OpenTofu IaC Best Practices

This section covers practical best practices for building and maintaining OpenTofu Infrastructure-as-Code projects.

---

## Topics Covered

| File | Topic |
|------|-------|
| [01-folder-structure.md](01-folder-structure.md) | Recommended folder structure for IaC projects |
| [02-state-management.md](02-state-management.md) | Safe and reliable state management |
| [03-provider-versioning.md](03-provider-versioning.md) | Provider version pinning and lock files |
| [04-secrets-and-sensitive-data.md](04-secrets-and-sensitive-data.md) | Handling credentials and secrets safely |
| [05-modules.md](05-modules.md) | Module design principles and patterns |
| [06-environment-strategy.md](06-environment-strategy.md) | Environment separation strategies |
| [07-ci-cd-validation.md](07-ci-cd-validation.md) | CI/CD validation pipelines |
| [08-security-scanning.md](08-security-scanning.md) | Security scanning tools and practices |
| [09-cost-awareness.md](09-cost-awareness.md) | Cost-conscious infrastructure design |
| [10-production-readiness-checklist.md](10-production-readiness-checklist.md) | Pre-production checklist |

---

## Quick Best Practices Summary

1. **Pin provider versions** — always use `~> X.Y` version constraints
2. **Use remote state** — S3, GCS, or Azure Blob with locking
3. **Never hardcode credentials** — use environment variables or IAM roles
4. **Use `.tfvars.example`** — never commit real `.tfvars` files
5. **Tag all resources** — consistent tagging enables cost tracking and governance
6. **Validate in CI** — run `tofu fmt -check`, `tofu validate`, and Checkov on every PR
7. **Use modules for reuse** — DRY your infrastructure code with local or registry modules
8. **Separate environments** — use separate backends or workspaces for dev/staging/prod
9. **Always destroy tutorial resources** — avoid unexpected cloud costs
10. **Review plans carefully** — understand every change before applying

---

## Terraform vs OpenTofu: Same Best Practices

These best practices apply equally to Terraform and OpenTofu. The underlying HCL language, state management, and provider ecosystem are the same.
