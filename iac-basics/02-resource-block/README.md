# Resource Block

## What This Example Covers

This example demonstrates how to write a **resource block** in OpenTofu.

A resource block defines an infrastructure object that OpenTofu will create and manage.

---

## What is a Resource Block?

```hcl
resource "<provider>_<type>" "<name>" {
  argument1 = value1
  argument2 = value2
}
```

- `<provider>_<type>` — the resource type (e.g., `aws_instance`, `random_string`)
- `<name>` — a local label for referencing this resource in your config
- arguments — configuration specific to the resource type

---

## Files in This Example

| File | Purpose |
|------|---------|
| `providers.tf` | Provider configuration |
| `main.tf` | Resource block examples |
| `variables.tf` | Variable declarations |
| `outputs.tf` | Output values |

---

## Prerequisites

- OpenTofu installed
- No cloud credentials required (uses the `random` provider)

---

## Commands to Run

```bash
cd iac-basics/02-resource-block

tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
tofu destroy
```

---

## Key Concepts

### Resource References

You can reference one resource's attributes in another:

```hcl
resource "random_string" "prefix" {
  length  = 6
  special = false
  upper   = false
}

resource "random_id" "suffix" {
  # Use the random_string result as a keepers value
  keepers = {
    prefix = random_string.prefix.result
  }
  byte_length = 4
}
```

### Resource Dependencies

OpenTofu automatically detects dependencies between resources. In the example above, `random_id.suffix` depends on `random_string.prefix`.

---

## Terraform Comparison

The resource block syntax is identical in Terraform and OpenTofu:

```hcl
# This works with both 'terraform apply' and 'tofu apply'
resource "random_string" "example" {
  length  = 12
  special = false
}
```

| Terraform | OpenTofu |
|-----------|----------|
| `terraform apply` | `tofu apply` |
| Same resource block syntax | Same resource block syntax |

---

## Cost Warning

This example uses only the `random` provider. **No cloud costs are incurred.**
