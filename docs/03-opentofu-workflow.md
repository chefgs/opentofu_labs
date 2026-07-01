# OpenTofu Workflow

This document explains the standard OpenTofu workflow from writing configuration to destroying resources.

---

## Overview

The OpenTofu workflow has six main steps:

```
1. Write   →  Create .tf configuration files
2. Init    →  tofu init
3. Format  →  tofu fmt
4. Validate →  tofu validate
5. Plan    →  tofu plan
6. Apply   →  tofu apply
7. Destroy →  tofu destroy (when done)
```

---

## Step 1: Write Configuration

Create `.tf` files describing your infrastructure. Typically you'll have:

```text
my-example/
├── providers.tf    # Provider configuration
├── main.tf         # Main resource definitions
├── variables.tf    # Variable declarations
├── outputs.tf      # Output values
└── terraform.tfvars  # Variable values (not committed to version control)
```

Example `providers.tf`:

```hcl
terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
```

---

## Step 2: `tofu init`

Initialize the working directory. This downloads providers and sets up the backend.

```bash
tofu init
```

What it does:
- Downloads provider plugins specified in `required_providers`
- Initializes the backend (where state is stored)
- Creates a `.terraform/` directory with downloaded plugins
- Creates/updates `.terraform.lock.hcl` with provider version locks

Run `tofu init` whenever you:
- Start working in a new directory
- Add or change providers
- Change backend configuration

---

## Step 3: `tofu fmt`

Formats `.tf` files to the canonical style.

```bash
# Format current directory
tofu fmt

# Format recursively
tofu fmt -recursive

# Check without changing (used in CI)
tofu fmt -check -recursive
```

Automatically fixes:
- Indentation
- Alignment of equals signs
- Trailing whitespace

> **Tip**: Run `tofu fmt` before every commit to keep code consistent.

---

## Step 4: `tofu validate`

Validates syntax and configuration without connecting to any providers.

```bash
tofu validate
```

Checks:
- HCL syntax errors
- Required arguments
- Invalid attribute names
- Type mismatches
- Reference errors

Example output when valid:

```
Success! The configuration is valid.
```

---

## Step 5: `tofu plan`

Creates an execution plan showing what changes will be made.

```bash
tofu plan
```

The output shows three types of changes:
- `+` (green) — resources to be created
- `~` (yellow) — resources to be updated in-place
- `-/+` (red/yellow) — resources to be destroyed and recreated
- `-` (red) — resources to be destroyed

Example:

```
Plan: 2 to add, 0 to change, 0 to destroy.
```

Save the plan to a file for review:

```bash
tofu plan -out=tfplan
```

---

## Step 6: `tofu apply`

Applies the planned changes.

```bash
# Apply with confirmation prompt
tofu apply

# Apply a saved plan
tofu apply tfplan

# Auto-approve (use carefully)
tofu apply -auto-approve
```

After applying:
- Resources are created/updated/destroyed as planned
- State file is updated
- Outputs are displayed

---

## Step 7: `tofu destroy`

Destroys all resources managed by the configuration.

```bash
tofu destroy
```

> ⚠️ **Always run `tofu destroy`** when you finish a tutorial example to avoid unexpected cloud costs.

---

## Other Useful Commands

### `tofu output`

Show output values:

```bash
tofu output
tofu output instance_id
tofu output -json
```

### `tofu show`

Show the current state:

```bash
tofu show
tofu show -json
```

### `tofu state`

Manage state:

```bash
# List all resources
tofu state list

# Show a specific resource
tofu state show aws_instance.example

# Remove a resource from state (does not destroy it)
tofu state rm aws_instance.example
```

### `tofu import`

Import existing cloud resources into state:

```bash
tofu import aws_instance.example i-1234567890abcdef0
```

---

## Terraform vs OpenTofu Command Reference

| Terraform | OpenTofu | Notes |
|-----------|----------|-------|
| `terraform init` | `tofu init` | Identical behavior |
| `terraform fmt` | `tofu fmt` | Identical behavior |
| `terraform validate` | `tofu validate` | Identical behavior |
| `terraform plan` | `tofu plan` | Identical behavior |
| `terraform apply` | `tofu apply` | Identical behavior |
| `terraform destroy` | `tofu destroy` | Identical behavior |
| `terraform show` | `tofu show` | Identical behavior |
| `terraform output` | `tofu output` | Identical behavior |
| `terraform state` | `tofu state` | Identical behavior |
| `terraform import` | `tofu import` | Identical behavior |
| `terraform version` | `tofu version` | Identical behavior |

---

## Next Steps

- `04-state-and-backends.md` — Understanding state and remote backends
- `../iac-basics/01-provider-block/` — Practice with your first configuration
