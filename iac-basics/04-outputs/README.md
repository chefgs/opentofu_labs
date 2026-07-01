# Outputs

## What This Example Covers

This example demonstrates how to use **output values** in OpenTofu to expose information about your infrastructure.

---

## What are Outputs?

Outputs expose values from your configuration, making them:
- Visible after `tofu apply`
- Available to other configurations via `tofu output`
- Passable to other modules

```hcl
output "instance_id" {
  description = "The ID of the created instance"
  value       = aws_instance.example.id
}
```

---

## Key Output Features

### Sensitive Outputs

Mark outputs as sensitive to prevent them from showing in logs:

```hcl
output "database_password" {
  description = "The database password"
  value       = var.db_password
  sensitive   = true
}
```

### Depends On

Explicitly declare dependencies for outputs:

```hcl
output "result" {
  value      = some_resource.example.id
  depends_on = [another_resource.dependency]
}
```

---

## Commands to Run

```bash
cd iac-basics/04-outputs

tofu init
tofu apply

# Show all outputs
tofu output

# Show a specific output
tofu output project_name

# Show outputs in JSON format
tofu output -json

tofu destroy
```

---

## Terraform Comparison

Output syntax is identical in Terraform and OpenTofu.

| Terraform | OpenTofu |
|-----------|----------|
| `terraform output` | `tofu output` |
| `terraform output -json` | `tofu output -json` |

---

## Cost Warning

This example uses only the `random` provider. **No cloud costs are incurred.**
