# Environment Strategy

---

## 1. Separate State per Environment

Always use separate state files for each environment:

```text
# S3 backend keys
dev/terraform.tfstate
staging/terraform.tfstate
prod/terraform.tfstate
```

---

## 2. Option 1: Directory-per-Environment

```text
environments/
├── dev/
│   ├── providers.tf    # backend "s3" { key = "dev/tfstate" }
│   └── main.tf
├── staging/
│   ├── providers.tf    # backend "s3" { key = "staging/tfstate" }
│   └── main.tf
└── prod/
    ├── providers.tf    # backend "s3" { key = "prod/tfstate" }
    └── main.tf
```

**Pros**: Explicit, easy to understand  
**Cons**: Code duplication

---

## 3. Option 2: Workspaces (limited use)

```bash
tofu workspace new dev
tofu workspace new staging
tofu workspace new prod
tofu workspace select prod
```

**Pros**: Same code for all environments  
**Cons**: State is in same backend; easier to accidentally apply to wrong environment

---

## 4. Option 3: Terragrunt (advanced)

[Terragrunt](https://terragrunt.gruntwork.io/) is a thin wrapper that helps manage multi-environment configurations. It works with both Terraform and OpenTofu.

---

## 5. Environment Naming Standards

Use consistent environment names:

| Short | Full | Example |
|-------|------|---------|
| `dev` | Development | `opentofu-lab-dev-vpc` |
| `stg` | Staging | `opentofu-lab-stg-vpc` |
| `prd` | Production | `opentofu-lab-prd-vpc` |

---

## 6. What Changes Between Environments

| Setting | Dev | Staging | Prod |
|---------|-----|---------|------|
| Instance size | `t3.micro` | `t3.small` | `t3.medium` |
| Min replicas | 1 | 1 | 3 |
| Backup enabled | No | Yes | Yes |
| Monitoring | Basic | Full | Full + Alerting |
| Cost | Low | Medium | Higher |
