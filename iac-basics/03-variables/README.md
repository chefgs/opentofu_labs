# Variables

## What This Example Covers

This example demonstrates how to use **variables** in OpenTofu to make your configurations flexible and reusable.

---

## What are Variables?

Variables allow you to parameterize your configurations so they can be reused with different values.

```hcl
variable "instance_name" {
  description = "The name of the instance"
  type        = string
  default     = "my-server"
}
```

Use a variable with `var.<name>`:

```hcl
resource "random_string" "example" {
  length = var.string_length
}
```

---

## Variable Types

| Type | Example |
|------|---------|
| `string` | `"us-east-1"` |
| `number` | `3` |
| `bool` | `true` |
| `list(string)` | `["a", "b", "c"]` |
| `map(string)` | `{key = "value"}` |
| `object({...})` | Complex objects |

---

## Setting Variable Values

Variables can be set in several ways (in order of precedence, highest first):

1. **Command-line flag**: `tofu apply -var="name=value"`
2. **`.tfvars` file**: `tofu apply -var-file="prod.tfvars"`
3. **`terraform.tfvars`** file (automatically loaded)
4. **Environment variables**: `TF_VAR_name=value`
5. **Default value** in the variable declaration

---

## Variable Validation

```hcl
variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}
```

---

## Commands to Run

```bash
cd iac-basics/03-variables

tofu init
tofu fmt
tofu validate

# Use default values
tofu plan

# Override a variable
tofu plan -var="environment=prod"

tofu apply
tofu destroy
```

---

## Terraform Comparison

Variable syntax is identical in Terraform and OpenTofu.

| Terraform | OpenTofu |
|-----------|----------|
| `terraform plan -var="x=y"` | `tofu plan -var="x=y"` |
| `TF_VAR_x=y terraform plan` | `TF_VAR_x=y tofu plan` |

---

## Cost Warning

This example uses only the `random` provider. **No cloud costs are incurred.**
