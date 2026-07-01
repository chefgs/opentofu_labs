# Secrets and Sensitive Data Best Practices

---

## 1. Never Hardcode Credentials

```hcl
# ❌ NEVER do this
provider "aws" {
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

# ✅ DO this instead
provider "aws" {
  region = var.aws_region
  # Credentials from environment variables or IAM role
}
```

---

## 2. Use Environment Variables

```bash
# AWS
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."

# Azure
az login  # Uses Azure CLI auth

# GCP
gcloud auth application-default login

# DigitalOcean
export DIGITALOCEAN_TOKEN="dop_v1_..."
```

---

## 3. Use `.tfvars.example` Not `.tfvars`

```bash
# ✅ Commit this (placeholder values only)
terraform.tfvars.example

# ❌ Never commit this (real values)
terraform.tfvars
```

The `.gitignore` in this repository excludes `*.tfvars` but allows `*.tfvars.example`.

---

## 4. Mark Sensitive Variables

```hcl
variable "database_password" {
  description = "Database password"
  type        = string
  sensitive   = true  # Prevents value from appearing in plan/apply output
}
```

---

## 5. Mark Sensitive Outputs

```hcl
output "database_password" {
  value     = random_password.db.result
  sensitive = true
}
```

---

## 6. Use a Secrets Manager

For production environments, retrieve secrets from a secrets manager instead of passing them as variables:

```hcl
# AWS Secrets Manager
data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "prod/myapp/db-password"
}

# Then reference
resource "aws_db_instance" "example" {
  password = data.aws_secretsmanager_secret_version.db_password.secret_string
}
```

---

## 7. Pre-Commit Secret Scanning

Use tools like `git-secrets`, `trufflehog`, or `gitleaks` to scan for accidentally committed secrets before pushing.

---

## 8. Rotate Credentials Regularly

- Use IAM roles instead of long-lived access keys
- Set credential expiry policies
- Rotate any accidentally committed credentials immediately
