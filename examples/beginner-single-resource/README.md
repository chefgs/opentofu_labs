# Beginner Single Resource Example

## What This Example Creates

A single random string resource — the simplest possible OpenTofu configuration. Perfect for beginners to understand the full `tofu init / plan / apply / destroy` cycle.

---

## No Cloud Account Needed

This example uses only the `random` provider. No cloud account or credentials are required.

---

## Commands to Run

```bash
cd examples/beginner-single-resource

tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
tofu output
tofu destroy
```

---

## What You'll Learn

1. The basic structure of a `.tf` file
2. How `tofu init` downloads providers
3. How `tofu plan` shows what will be created
4. How `tofu apply` creates resources
5. How `tofu output` shows output values
6. How `tofu destroy` removes resources

---

## Terraform Comparison

This example works identically with Terraform:

```bash
# OpenTofu
tofu apply

# Terraform (same result)
terraform apply
```
