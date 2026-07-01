# EC2 with Reusable Module

## What This Example Creates

This example demonstrates how to use the **reusable AWS EC2 module** from the `modules/aws-ec2/` directory.

---

## Prerequisites

- OpenTofu installed
- AWS credentials configured
- The `modules/aws-ec2/` directory must exist in the repository root

---

## Commands to Run

```bash
cd aws/06-ec2-with-module

cp terraform.tfvars.example terraform.tfvars
tofu init
tofu apply

# Clean up
tofu destroy
```

---

## Module Source

This example references the local module:

```hcl
module "web_server" {
  source = "../../modules/aws-ec2"
  ...
}
```

---

## ⚠️ Cost Warning

An EC2 t2.micro instance costs approximately **$0.0116/hour** in us-east-1.

**Always run `tofu destroy` when done.**
