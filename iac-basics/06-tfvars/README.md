# tfvars Files

## What This Example Covers

This example demonstrates how to use `.tfvars` files to manage variable values across different environments.

---

## What is a `.tfvars` File?

A `.tfvars` file contains variable value assignments. It separates your configuration logic from the specific values used in each environment.

```hcl
# terraform.tfvars
project_name = "my-app"
environment  = "prod"
name_length  = 16
```

---

## Automatic Loading

OpenTofu automatically loads these files if present in the working directory:

- `terraform.tfvars`
- `terraform.tfvars.json`
- `*.auto.tfvars`
- `*.auto.tfvars.json`

---

## Manual Loading

Use `-var-file` to load a specific file:

```bash
tofu plan -var-file="prod.tfvars"
tofu plan -var-file="staging.tfvars"
```

---

## Environment-Specific Files Pattern

```text
environments/
├── dev.tfvars      # Development values
├── staging.tfvars  # Staging values
└── prod.tfvars     # Production values
```

Apply with:

```bash
tofu plan -var-file="environments/prod.tfvars"
```

---

## Security Rules for `.tfvars`

- ❌ **Never commit real `.tfvars` files** to version control
- ✅ **Always commit `.tfvars.example`** files with placeholder values
- ✅ **Always add `*.tfvars` to `.gitignore`**

This repository has `*.tfvars` in `.gitignore` and `!*.tfvars.example` to allow example files.

---

## Commands to Run

```bash
cd iac-basics/06-tfvars

# Copy example file and customize
cp terraform.tfvars.example terraform.tfvars

# Run with default terraform.tfvars
tofu init
tofu plan

# Run with a specific var file
tofu plan -var-file="terraform.tfvars.example"

tofu apply
tofu destroy
```

---

## Terraform Comparison

`.tfvars` file handling is identical in Terraform and OpenTofu.

| Terraform | OpenTofu |
|-----------|----------|
| `terraform plan -var-file="prod.tfvars"` | `tofu plan -var-file="prod.tfvars"` |

---

## Cost Warning

This example uses only the `random` provider. **No cloud costs are incurred.**
