# GCP Firewall Rules

## What This Example Creates

**GCP Firewall rules** for a VPC network.

## Commands

```bash
cd gcp/04-firewall-rules
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

Firewall rules are **free**. **Destroy when done.**
