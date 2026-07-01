# State File

## What This Example Covers

This example demonstrates how OpenTofu uses a **state file** to track infrastructure resources.

---

## What is the State File?

The state file (`terraform.tfstate`) is how OpenTofu remembers what resources it has created:

- It maps your configuration to real cloud resources
- It stores resource IDs, attributes, and metadata
- It enables OpenTofu to detect and plan changes
- It is required for `tofu destroy` to know what to remove

---

## The State File in Action

1. **Before `tofu apply`**: No state file (or empty state)
2. **After `tofu apply`**: State file contains all created resources
3. **Second `tofu plan`**: OpenTofu compares config against state to detect drift
4. **After `tofu destroy`**: State file is empty again

---

## State File Security

The state file can contain:
- Resource IDs and ARNs
- IP addresses
- Any attribute values of your resources

Best practices:
- **Never commit** `terraform.tfstate` to version control
- **Enable encryption** for remote state backends
- **Restrict access** to the state backend using IAM
- **Enable versioning** on state buckets for recovery

---

## Local vs Remote State

| Aspect | Local State | Remote State |
|--------|------------|--------------|
| Location | `terraform.tfstate` file | S3, Azure Blob, GCS, etc. |
| Team support | Single user only | Multiple users |
| State locking | None | Yes (prevents conflicts) |
| Backup | Manual | Automatic (with versioning) |
| Tutorial use | ✅ Fine | ✅ Recommended for teams |

---

## State Commands

```bash
# List all resources in state
tofu state list

# Show a specific resource
tofu state show random_string.example

# Show full state
tofu show

# Output state as JSON
tofu show -json
```

---

## Commands to Run

```bash
cd iac-basics/07-state-file

# Initialize
tofu init

# Apply (creates the state file)
tofu apply

# Inspect the state file
cat terraform.tfstate

# List resources in state
tofu state list

# Show a specific resource
tofu state show random_string.example

# Destroy (empties the state file)
tofu destroy
```

---

## Terraform Comparison

State handling is identical in Terraform and OpenTofu.

| Terraform | OpenTofu |
|-----------|----------|
| `terraform state list` | `tofu state list` |
| `terraform state show` | `tofu state show` |
| `terraform show` | `tofu show` |

---

## Cost Warning

This example uses only the `random` provider. **No cloud costs are incurred.**
