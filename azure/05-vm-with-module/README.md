# Azure VM with Module

## What This Example Creates

A Linux VM using the **reusable Azure Linux VM module** from `modules/azure-linux-vm/`.

## Commands

```bash
cd azure/05-vm-with-module
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

Standard_B1s VM: ~$0.0104/hour. **Always destroy when done.**
