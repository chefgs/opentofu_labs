# Azure Virtual Network

## What This Example Creates

An **Azure Virtual Network** with subnets.

## Authentication

```bash
az login
az account set --subscription "<subscription-id>"
```

## Commands

```bash
cd azure/02-virtual-network
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

VNets are **free**. **Always destroy when done.**
