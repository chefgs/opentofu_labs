# Terraform to OpenTofu: Same Code

## What This Example Demonstrates

This example shows that the **exact same `.tf` code** works with both `terraform apply` and `tofu apply`.

The only difference is the CLI command you use. The HCL configuration, resource definitions, variables, and outputs are identical.

---

## How to Run with OpenTofu

```bash
cd examples/terraform-to-opentofu-same-code

# Initialize with OpenTofu
tofu init

# Apply with OpenTofu
tofu apply

# Clean up
tofu destroy
```

## How to Run with Terraform

```bash
cd examples/terraform-to-opentofu-same-code

# Initialize with Terraform
terraform init

# Apply with Terraform
terraform apply

# Clean up
terraform destroy
```

---

## Key Takeaway

The configuration files (`.tf`) are **100% compatible**. When you switch from Terraform to OpenTofu:

1. ✅ Keep all your `.tf` files as-is
2. ✅ Keep your state file as-is
3. 🔄 Run `tofu init` instead of `terraform init`
4. 🔄 Use `tofu` instead of `terraform` for all commands
5. 🔄 Update CI/CD to use `opentofu/setup-opentofu@v1` action

---

## CLI Comparison

| Operation | Terraform | OpenTofu |
|-----------|-----------|----------|
| Initialize | `terraform init` | `tofu init` |
| Format | `terraform fmt` | `tofu fmt` |
| Validate | `terraform validate` | `tofu validate` |
| Plan | `terraform plan` | `tofu plan` |
| Apply | `terraform apply` | `tofu apply` |
| Destroy | `terraform destroy` | `tofu destroy` |
