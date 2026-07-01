# DigitalOcean VPC

## What This Example Creates

A **DigitalOcean VPC** for network isolation.

## Commands

```bash
cd digitalocean/02-vpc
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

VPCs are **free**. **Always destroy when done.**
