# Migrating from Terraform to OpenTofu

> **Important**: This guide is for informational and educational purposes. Always test migrations thoroughly in a non-production environment before migrating production infrastructure.

---

## 1. When Migration Makes Sense

Consider migrating from Terraform to OpenTofu when:

- Your organization has concerns about the **Business Source License (BSL)** introduced in Terraform 1.6+
- You want to move to a **Linux Foundation / CNCF-governed** open-source tool
- Your organization has **procurement restrictions** on BSL-licensed software
- You want to **reduce vendor dependency** in your IaC toolchain
- You are starting a **new project** and prefer an open-source-first approach

---

## 2. When NOT to Migrate Immediately

Do not rush a migration if:

- You are **actively using Terraform Cloud or Terraform Enterprise** features (workspaces, Sentinel, VCS integration, remote execution)
- Your production infrastructure is **stable and working well**
- Your team does **not have capacity** to test and validate the migration
- The **migration risk** outweighs the licensing benefit in your current context
- Your organization's **legal/procurement team** has already approved Terraform BSL

Gradual migration (new projects on OpenTofu, existing on Terraform) is often the safest path.

---

## 3. Pre-Migration Checklist

Before starting migration:

- [ ] Document all Terraform versions currently in use
- [ ] Document all provider versions currently in use
- [ ] List all remote backends in use (S3, Azure Blob, GCS, etc.)
- [ ] Identify any Terraform Cloud / Enterprise dependencies
- [ ] Identify Sentinel policy usage
- [ ] Back up all state files
- [ ] Review `.terraform.lock.hcl` files
- [ ] Inventory all CI/CD pipelines using Terraform
- [ ] Review any Terraform-specific wrapper scripts
- [ ] Identify team members who need to install OpenTofu

---

## 4. Step-by-Step Migration Process

### Step 1: Install OpenTofu

Install OpenTofu alongside your existing Terraform installation:

```bash
# macOS
brew install opentofu

# Linux
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh | sh

# Verify
tofu version
```

### Step 2: Back Up Your State File

Always back up your state before attempting migration:

```bash
# For local state
cp terraform.tfstate terraform.tfstate.backup-$(date +%Y%m%d)

# For S3 remote state
aws s3 cp s3://your-bucket/path/to/terraform.tfstate s3://your-bucket/path/to/terraform.tfstate.backup-$(date +%Y%m%d)
```

### Step 3: Review Provider Lock File

The `.terraform.lock.hcl` file records provider version hashes. OpenTofu may generate different hashes for the same provider version because it validates against a different set of signing keys.

```bash
# Review your existing lock file
cat .terraform.lock.hcl

# After switching to OpenTofu, you may need to regenerate the lock file
tofu init -upgrade
```

### Step 4: Review Backend Configuration

Most standard backends work with both Terraform and OpenTofu:

| Backend | Terraform | OpenTofu |
|---------|-----------|----------|
| Local | ✅ | ✅ |
| S3 | ✅ | ✅ |
| Azure Blob | ✅ | ✅ |
| GCS | ✅ | ✅ |
| Consul | ✅ | ✅ |
| Terraform Cloud (remote) | ✅ | ⚠️ Limited |
| Terraform Enterprise | ✅ | ⚠️ Limited |

If you use Terraform Cloud as a remote backend, you will need to migrate to a self-managed backend before switching to OpenTofu.

### Step 5: Replace CLI Commands

The simplest part of migration is replacing `terraform` with `tofu` in all scripts and pipelines:

```bash
# Old Terraform commands
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy

# New OpenTofu commands
tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
tofu destroy
```

### Step 6: Test in a Non-Production Environment

Always test migration in a non-production environment first:

```bash
# In your test environment
tofu init

# Verify the plan matches what Terraform would produce
tofu plan

# If the plan looks correct, apply
tofu apply

# Verify your resources are unchanged
tofu show
```

### Step 7: Run `tofu init`

OpenTofu will initialize the directory and download providers:

```bash
tofu init
```

If you see provider hash mismatch warnings, this is expected. Run:

```bash
tofu init -upgrade
```

This regenerates the `.terraform.lock.hcl` with OpenTofu-compatible hashes.

### Step 8: Review the Plan Output

Compare the `tofu plan` output with a `terraform plan` from the same configuration:

```bash
# Check that OpenTofu plan shows no unexpected changes
tofu plan

# The output should show "No changes" or only the expected diff
```

If you see unexpected destroy/recreate operations, **stop and investigate** before proceeding.

### Step 9: Update CI/CD Workflows

Update GitHub Actions, GitLab CI, Jenkins, or other CI systems to use OpenTofu:

**Before (Terraform):**
```yaml
- name: Setup Terraform
  uses: hashicorp/setup-terraform@v3

- name: Terraform Init
  run: terraform init
```

**After (OpenTofu):**
```yaml
- name: Setup OpenTofu
  uses: opentofu/setup-opentofu@v1

- name: OpenTofu Init
  run: tofu init
```

---

## 5. State File Considerations

- The state file format is **compatible** between Terraform and OpenTofu
- You do **not** need to modify the state file itself
- The state file version number may be updated by OpenTofu; this is normal
- Once updated by OpenTofu, the state file may not be readable by older Terraform versions — this is another reason to test carefully

---

## 6. Provider Lock File Review

The `.terraform.lock.hcl` file includes cryptographic hashes for provider binaries. These hashes may differ between Terraform and OpenTofu because the tools sign providers differently.

When migrating:

```bash
# Delete the old lock file and regenerate with OpenTofu
rm .terraform.lock.hcl
tofu init
```

Review the new lock file before committing it:

```bash
cat .terraform.lock.hcl
git diff .terraform.lock.hcl
```

---

## 7. Production Migration Checklist

Use this checklist before migrating any production environment:

- [ ] ✅ State file backed up
- [ ] ✅ All providers tested with OpenTofu in non-production
- [ ] ✅ Plan shows no unexpected changes
- [ ] ✅ CI/CD pipeline updated and tested
- [ ] ✅ Lock file regenerated and reviewed
- [ ] ✅ Remote backend verified (non-Terraform Cloud)
- [ ] ✅ Team trained on `tofu` CLI commands
- [ ] ✅ Runbooks and documentation updated
- [ ] ✅ Rollback plan defined
- [ ] ✅ Monitoring in place for infrastructure changes

---

## 8. Rollback Considerations

If migration causes issues:

1. **Restore the state backup** to the remote backend or local directory
2. **Reinstall Terraform** and re-run `terraform init`
3. **Verify `terraform plan`** shows no unexpected drift
4. **Investigate the root cause** before attempting migration again

The safest rollback is always keeping the old Terraform binary available and having a valid pre-migration state backup.

---

## 9. Remote Backend Migration (Terraform Cloud to Self-Managed)

If you are moving away from Terraform Cloud:

```bash
# 1. Pull state from Terraform Cloud to local
terraform state pull > terraform.tfstate

# 2. Update backend configuration to S3 or other self-managed backend
# Edit providers.tf to use s3 backend instead of cloud block

# 3. Initialize OpenTofu with new backend
tofu init -migrate-state

# 4. Verify state was migrated correctly
tofu show
```

---

## 10. Summary

Migration from Terraform to OpenTofu is technically straightforward for most configurations. The primary steps are:

1. Back up state
2. Install OpenTofu
3. Run `tofu init`
4. Check `tofu plan` for drift
5. Update CI/CD pipelines
6. Update lock files

The complexity increases when Terraform Cloud, Terraform Enterprise, or Sentinel policies are involved. For those cases, plan a more comprehensive migration project.

For more comparison details, see [`OPENTOFU_VS_TERRAFORM.md`](OPENTOFU_VS_TERRAFORM.md).
For the decision matrix, see [`DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md`](DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md).
