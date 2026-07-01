# AWS Remote State: S3 + DynamoDB

## What This Example Creates

This example creates the infrastructure needed for **remote state storage**:
- An S3 bucket for storing the Terraform/OpenTofu state file
- A DynamoDB table for state locking

---

## Why Remote State?

Local state works for single users, but teams need remote state to:
- Share state between team members
- Prevent concurrent modifications (state locking)
- Back up state automatically
- Enable CI/CD pipelines to access state

---

## Usage Pattern

**Step 1**: Run this example to create the S3 bucket and DynamoDB table.

**Step 2**: Use the outputs to configure your backend in other projects:

```hcl
terraform {
  backend "s3" {
    bucket         = "<bucket-name-from-output>"
    key            = "myproject/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "<table-name-from-output>"
  }
}
```

---

## Commands to Run

```bash
cd aws/05-remote-state-s3-dynamodb

cp terraform.tfvars.example terraform.tfvars
# Edit: set a unique bucket name

tofu init
tofu apply

# Note the outputs for use in other projects
tofu output

# Clean up (only do this if you no longer need remote state)
tofu destroy
```

---

## ⚠️ Cost Warning

- S3: ~$0.023/GB/month (effectively free for empty buckets)
- DynamoDB: Free tier covers 25 GB storage and 25 RCU/WCU

**Always run `tofu destroy` when done.**
