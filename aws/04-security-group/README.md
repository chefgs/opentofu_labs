# AWS Security Group

## What This Example Creates

This example creates a standalone **AWS Security Group** with common rule patterns.

---

## Prerequisites

- OpenTofu installed
- AWS credentials configured

---

## Commands to Run

```bash
cd aws/04-security-group

cp terraform.tfvars.example terraform.tfvars
tofu init
tofu apply

# Clean up
tofu destroy
```

---

## ⚠️ Cost Warning

Security groups themselves are **free**. You are only charged for the resources that use them.

---

## Security Note

- SSH (port 22) is restricted to `allowed_ssh_cidr` variable
- In production, restrict SSH to your organization's VPN CIDR or bastion host IP
