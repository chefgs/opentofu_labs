# Best Practices for OpenTofu

For the complete best practices guide, see [`../iac-best-practices/`](../iac-best-practices/).

This document provides a high-level overview.

---

## Essential Best Practices

### 1. Pin Provider Versions

Always specify provider versions in `required_providers`:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Allow patch updates within 5.x
    }
  }
}
```

### 2. Use Remote State for Teams

Never use local state for team projects:

```hcl
terraform {
  backend "s3" {
    bucket         = "my-tf-state"
    key            = "project/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tf-state-lock"
  }
}
```

### 3. Never Hardcode Credentials

```hcl
# BAD - never do this
provider "aws" {
  access_key = "AKIAIOSFODNN7EXAMPLE"  # ❌
  secret_key = "wJalrXUtnFEMI/K7MDENG"  # ❌
}

# GOOD - use environment variables or IAM roles
provider "aws" {
  region = var.aws_region  # ✅
}
```

### 4. Use `.tfvars.example`

Commit `.tfvars.example` with placeholder values. Never commit real `.tfvars` files.

```bash
# Always in .gitignore:
*.tfvars

# Always allowed:
*.tfvars.example
```

### 5. Tag All Resources

```hcl
tags = {
  Name        = var.name
  Environment = var.environment
  Project     = var.project
  ManagedBy   = "opentofu"
}
```

### 6. Always Destroy Tutorial Resources

```bash
tofu destroy
```

This prevents unexpected cloud costs when learning.

---

## CI/CD Best Practices

```yaml
# Validate on every PR
- name: OpenTofu Format Check
  run: tofu fmt -check -recursive

- name: OpenTofu Validate
  run: tofu validate

# Run security scanning
- name: Run Checkov
  uses: bridgecrewio/checkov-action@v12
```

---

## Next Steps

- `../iac-best-practices/` — Complete best practices documentation
- `../iac-best-practices/10-production-readiness-checklist.md` — Production checklist
