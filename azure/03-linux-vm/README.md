# Azure Linux VM

## What This Example Creates

An **Azure Linux VM** (Ubuntu 22.04) with a virtual network.

## Authentication

```bash
az login
az account set --subscription "<subscription-id>"
```

## Commands

```bash
cd azure/03-linux-vm
cp terraform.tfvars.example terraform.tfvars
# Set admin_password in terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

Standard_B1s VM costs approximately **$0.0104/hour** (~$7.50/month).

**Always run `tofu destroy` when done.**

## 🔒 Security Note

- Use SSH keys instead of passwords in production
- Do not commit `terraform.tfvars` with real passwords
