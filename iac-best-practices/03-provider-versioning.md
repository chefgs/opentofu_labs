# Provider Versioning Best Practices

---

## 1. Always Pin Provider Versions

Always specify version constraints in `required_providers`:

```hcl
terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Allows 5.x.x but not 6.0.0
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}
```

---

## 2. Version Constraint Syntax

| Constraint | Meaning |
|-----------|---------|
| `= 5.31.0` | Exact version only |
| `>= 5.0` | Version 5.0 or higher |
| `~> 5.0` | Any 5.x.x version (pessimistic) |
| `~> 5.31.0` | Any 5.31.x version |
| `>= 5.0, < 6.0` | Range constraint |

---

## 3. Commit the Lock File

The `.terraform.lock.hcl` file records exact provider versions and cryptographic hashes.

**For production projects**: Commit `.terraform.lock.hcl` to ensure all team members and CI systems use identical provider versions.

**For tutorial labs**: Optional, but good practice.

---

## 4. Upgrade Providers Deliberately

Don't accidentally upgrade providers:

```bash
# Normal init (uses lock file)
tofu init

# Upgrade to latest allowed versions
tofu init -upgrade
```

Review changes after upgrading:

```bash
git diff .terraform.lock.hcl
```

---

## 5. OpenTofu vs Terraform Lock File

The lock file hashes may differ between OpenTofu and Terraform because each tool signs providers with different keys. If migrating from Terraform to OpenTofu, regenerate the lock file:

```bash
rm .terraform.lock.hcl
tofu init
```
