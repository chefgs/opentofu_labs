# Azure Storage Account

## What This Example Creates

An **Azure Storage Account** with secure defaults.

## Commands

```bash
cd azure/04-storage-account
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

Storage account costs vary by usage. Empty accounts incur minimal costs.

**Always run `tofu destroy` when done.**
