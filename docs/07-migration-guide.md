# Migration Guide: Terraform to OpenTofu

For the full migration guide, see [`../MIGRATION_FROM_TERRAFORM.md`](../MIGRATION_FROM_TERRAFORM.md).

This document provides a quick-reference summary for migration.

---

## Quick Migration Steps

```bash
# 1. Install OpenTofu
brew install opentofu  # macOS
# or use https://get.opentofu.org/install-opentofu.sh

# 2. Verify installation
tofu version

# 3. Back up your state
cp terraform.tfstate terraform.tfstate.backup

# 4. Delete old lock file (will be regenerated)
rm .terraform.lock.hcl

# 5. Run OpenTofu init
tofu init

# 6. Verify plan shows no unexpected changes
tofu plan

# 7. If plan looks correct, continue using tofu instead of terraform
```

---

## CI/CD Migration

| Before (Terraform) | After (OpenTofu) |
|-------------------|-----------------|
| `uses: hashicorp/setup-terraform@v3` | `uses: opentofu/setup-opentofu@v1` |
| `run: terraform init` | `run: tofu init` |
| `run: terraform plan` | `run: tofu plan` |
| `run: terraform apply` | `run: tofu apply` |

---

## Key Risks

| Risk | Mitigation |
|------|-----------|
| State format update | Back up state before migration |
| Lock file hash mismatch | Delete and regenerate `.terraform.lock.hcl` |
| Terraform Cloud incompatibility | Migrate to S3 or GCS backend first |
| CI pipeline failures | Test workflows in a non-production branch first |

---

## Next Steps

- `08-best-practices.md` — IaC best practices
- `../MIGRATION_FROM_TERRAFORM.md` — Complete migration guide
- `../DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md` — When to migrate
