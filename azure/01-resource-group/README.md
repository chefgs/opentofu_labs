# Azure Resource Group

## What This Example Creates

A basic **Azure Resource Group** — the fundamental container for all Azure resources.

---

## Prerequisites

- OpenTofu installed
- Azure CLI installed and logged in

## Authentication

```bash
az login
az account set --subscription "<your-subscription-id>"
```

---

## Commands to Run

```bash
cd azure/01-resource-group

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

## ⚠️ Cost Warning

Resource groups are **free**. You are charged for resources inside them.

**Always run `tofu destroy` when done.**
