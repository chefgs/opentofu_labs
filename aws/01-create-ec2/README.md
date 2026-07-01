# AWS EC2 Instance

## What This Example Creates

This example creates a single **Amazon EC2 t2.micro instance** in the default VPC.

---

## Architecture

```
AWS Account
└── Region (us-east-1)
    └── Default VPC
        └── EC2 Instance (t2.micro)
            └── Security Group (SSH + HTTP)
```

---

## Prerequisites

- OpenTofu installed
- AWS account
- AWS credentials configured (`aws configure` or environment variables)
- An existing key pair name (or remove the `key_name` argument to skip SSH)

---

## Files

| File | Purpose |
|------|---------|
| `providers.tf` | AWS provider configuration |
| `main.tf` | EC2 instance and security group |
| `variables.tf` | Configurable variables |
| `outputs.tf` | Instance details |
| `terraform.tfvars.example` | Example variable values |

---

## Commands to Run

```bash
cd aws/01-create-ec2

# Copy and customize the variables file
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values

# Initialize OpenTofu
tofu init

# Check formatting
tofu fmt

# Validate
tofu validate

# Preview
tofu plan

# Apply
tofu apply

# Clean up (IMPORTANT - to avoid charges)
tofu destroy
```

---

## Authentication

```bash
# Option 1: AWS CLI
aws configure

# Option 2: Environment variables
export AWS_ACCESS_KEY_ID="your-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

---

## Expected Outputs

```
Outputs:
instance_id    = "i-0abc123def456789"
instance_state = "running"
public_ip      = "54.123.45.67"
public_dns     = "ec2-54-123-45-67.compute-1.amazonaws.com"
```

---

## Terraform Comparison

| Terraform | OpenTofu |
|-----------|----------|
| `terraform init` | `tofu init` |
| `terraform apply` | `tofu apply` |
| Same `aws_instance` resource | Same `aws_instance` resource |

---

## ⚠️ Cost Warning

An EC2 t2.micro instance costs approximately **$0.0116/hour** (~$8.35/month) in us-east-1.

**Always run `tofu destroy` when you are done to avoid unexpected charges.**

---

## 🔒 Security Note

- Do not hardcode AWS credentials in `.tf` files
- The default security group in this example opens SSH (port 22) — restrict it to your IP in production
- Never commit real `.tfvars` files to version control
