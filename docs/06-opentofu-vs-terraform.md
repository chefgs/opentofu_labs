# OpenTofu vs Terraform: In-Depth Comparison

For the full comparison, see [`../OPENTOFU_VS_TERRAFORM.md`](../OPENTOFU_VS_TERRAFORM.md).

This document provides a practical, hands-on perspective on working with both tools.

---

## Practical Day-to-Day Differences

### CLI Commands

The most visible difference is the CLI name:

```bash
# Terraform
terraform init
terraform plan
terraform apply

# OpenTofu
tofu init
tofu plan
tofu apply
```

Everything else is functionally identical.

---

## Configuration File Compatibility

A Terraform configuration file works with OpenTofu with zero changes:

**Example `main.tf`** — works with both tools:

```hcl
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}
```

You can literally run the same `.tf` files with either `terraform apply` or `tofu apply`.

---

## Running the Same Code with Different CLIs

This repository includes a comparison example at:

```text
examples/terraform-to-opentofu-same-code/
```

The same `main.tf` file, run first with `terraform`, then with `tofu`, to demonstrate compatibility.

---

## When the Same Code Might Behave Differently

1. **Provider versions**: OpenTofu may use different default provider versions if you don't pin versions
2. **State format**: After applying with OpenTofu, the state version may be updated
3. **Lock file hashes**: `.terraform.lock.hcl` hashes differ between tools
4. **Experimental features**: Any features that are experimental or beta may differ

For stable, production-grade configurations using standard providers — the behavior is effectively identical.

---

## Next Steps

- `07-migration-guide.md` — How to migrate from Terraform
- `../DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md` — Decision framework
- `../examples/terraform-to-opentofu-same-code/` — Hands-on comparison
