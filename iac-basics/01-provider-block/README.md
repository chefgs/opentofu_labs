# Provider Block

## What This Example Covers

This example demonstrates how to configure a **provider block** in OpenTofu.

A provider is a plugin that enables OpenTofu to interact with a cloud platform, SaaS, or API. You must configure the provider before you can create any resources with it.

---

## What is a Provider Block?

```hcl
provider "aws" {
  region = "us-east-1"
}
```

The provider block tells OpenTofu:
1. Which provider plugin to use
2. How to configure it (region, credentials, etc.)

---

## Files in This Example

| File | Purpose |
|------|---------|
| `providers.tf` | Provider configuration |
| `main.tf` | Minimal resource to demonstrate the provider |
| `variables.tf` | Variable declarations |
| `outputs.tf` | Output values |

---

## Prerequisites

- OpenTofu installed
- No cloud credentials required (this example uses the `random` provider which needs no auth)

---

## Commands to Run

```bash
# Navigate to this directory
cd iac-basics/01-provider-block

# Initialize OpenTofu (downloads the random provider)
tofu init

# Check formatting
tofu fmt

# Validate configuration
tofu validate

# Preview changes
tofu plan

# Apply
tofu apply

# Clean up
tofu destroy
```

---

## Expected Output

After `tofu apply`:

```
Outputs:
random_string_value = "abc123xyz"
```

---

## Terraform Comparison

| Terraform | OpenTofu |
|-----------|----------|
| `terraform init` | `tofu init` |
| `terraform apply` | `tofu apply` |
| Same provider block syntax | Same provider block syntax |

The provider block syntax is identical in Terraform and OpenTofu.

---

## Cost Warning

This example uses only the `random` provider which creates no real cloud resources. **No cloud costs are incurred.**
