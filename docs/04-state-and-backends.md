# State and Backends

Understanding how OpenTofu manages state is essential for working safely with infrastructure.

---

## What is State?

OpenTofu maintains a **state file** (`terraform.tfstate`) that:

- Maps your configuration resources to real-world infrastructure
- Tracks metadata about resources (IDs, attributes, dependencies)
- Enables OpenTofu to detect what has changed since the last apply
- Is used to determine what changes are needed in `tofu plan`

The state file is JSON-formatted and should be treated as sensitive — it may contain credentials, IP addresses, and other infrastructure details.

---

## Local State

By default, OpenTofu stores state locally in a `terraform.tfstate` file in the working directory.

**Advantages**: Simple, no setup required  
**Disadvantages**: Not suitable for teams (no locking, no sharing)

> ⚠️ **Never commit `terraform.tfstate` to version control.** It is listed in `.gitignore` for this reason.

---

## Remote Backends

For team use or production environments, store state in a remote backend.

### S3 Backend (AWS)

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "project/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
```

Create the S3 bucket and DynamoDB table first. See `aws/05-remote-state-s3-dynamodb/` for a complete example.

### Azure Blob Storage Backend

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorage"
    container_name       = "tfstate"
    key                  = "project.terraform.tfstate"
  }
}
```

### GCS Backend (GCP)

```hcl
terraform {
  backend "gcs" {
    bucket = "my-terraform-state-bucket"
    prefix = "project/state"
  }
}
```

---

## State Locking

When multiple users or CI jobs run `tofu apply` simultaneously, state locking prevents conflicts.

- **S3 + DynamoDB**: Locking via DynamoDB table
- **Azure Blob**: Locking via Azure blob leases
- **GCS**: Locking via GCS object locks
- **Local**: No locking (single user only)

---

## State Commands

```bash
# List all resources in state
tofu state list

# Show details of a specific resource
tofu state show aws_instance.example

# Remove a resource from state (does not destroy it)
tofu state rm aws_instance.example

# Move a resource to a different address
tofu state mv aws_instance.old_name aws_instance.new_name

# Pull current state (useful for remote backends)
tofu state pull

# Push state (use with caution)
tofu state push terraform.tfstate
```

---

## State File Security

The state file can contain:
- IP addresses and hostnames
- Database passwords (if passed as variables)
- Cloud account IDs
- Resource ARNs and IDs

Best practices:
- Enable encryption at rest for remote backends
- Restrict access to the state bucket/container using IAM policies
- Enable versioning on the state bucket for recovery
- Never commit state files to version control

---

## The `.terraform.lock.hcl` File

The lock file records the exact provider versions used:

```hcl
provider "registry.opentofu.org/hashicorp/aws" {
  version     = "5.31.0"
  constraints = "~> 5.0"
  hashes = [
    "h1:...",
    ...
  ]
}
```

**Should you commit `.terraform.lock.hcl`?**

- For teams and production: **Yes** — ensures all team members use identical provider versions
- For tutorial labs: **Optional** — this repository includes it for reproducibility, but beginners can leave it out

---

## Next Steps

- `05-modules.md` — Using and creating modules
- `../aws/05-remote-state-s3-dynamodb/` — Set up S3 remote state
