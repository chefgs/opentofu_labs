# AWS VPC Basics

## What This Example Creates

This example creates a basic **Amazon VPC** with public and private subnets.

---

## Architecture

```
AWS Region (us-east-1)
└── VPC (10.0.0.0/16)
    ├── Public Subnet (10.0.1.0/24) - us-east-1a
    ├── Public Subnet (10.0.2.0/24) - us-east-1b
    ├── Private Subnet (10.0.3.0/24) - us-east-1a
    ├── Private Subnet (10.0.4.0/24) - us-east-1b
    ├── Internet Gateway
    └── Route Tables
```

---

## Prerequisites

- OpenTofu installed
- AWS account with credentials configured

---

## Commands to Run

```bash
cd aws/02-vpc-basics

cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars

tofu init
tofu fmt
tofu validate
tofu plan
tofu apply

# Clean up
tofu destroy
```

---

## Expected Outputs

```
Outputs:
vpc_id             = "vpc-0abc123def456789"
public_subnet_ids  = ["subnet-0abc...", "subnet-0def..."]
private_subnet_ids = ["subnet-0ghi...", "subnet-0jkl..."]
```

---

## ⚠️ Cost Warning

A VPC itself is free. However, a NAT Gateway (not included in this example) costs approximately **$0.045/hour**. This example does not create a NAT Gateway.

**Always run `tofu destroy` when done.**

---

## Terraform Comparison

| Terraform | OpenTofu |
|-----------|----------|
| `terraform apply` | `tofu apply` |
| Same `aws_vpc` resource | Same `aws_vpc` resource |
