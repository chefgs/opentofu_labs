# Locals

## What This Example Covers

This example demonstrates how to use **local values** (`locals`) in OpenTofu to define reusable expressions within a configuration.

---

## What are Locals?

Local values are named expressions that you can reference multiple times without repeating the expression.

```hcl
locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "opentofu"
    Project     = var.project_name
  }
}
```

Reference locals with `local.<name>`:

```hcl
resource "aws_instance" "example" {
  tags = local.common_tags
}
```

---

## When to Use Locals vs Variables

| Use Case | Locals | Variables |
|----------|--------|-----------|
| Computed/derived values | ✅ | ❌ |
| User-provided input | ❌ | ✅ |
| Values repeated in config | ✅ | ❌ |
| External configuration | ❌ | ✅ |
| Reusable expressions | ✅ | ❌ |

---

## Commands to Run

```bash
cd iac-basics/05-locals

tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
tofu destroy
```

---

## Terraform Comparison

Locals syntax is identical in Terraform and OpenTofu.

```hcl
# Works with both 'terraform apply' and 'tofu apply'
locals {
  name = "${var.project}-${var.environment}"
}
```

---

## Cost Warning

This example uses only the `random` provider. **No cloud costs are incurred.**
