# GCP Instance with Module

## What This Example Creates

A GCP Compute Instance using the reusable module from `modules/gcp-compute-instance/`.

## Commands

```bash
cd gcp/05-instance-with-module
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

e2-micro is free tier eligible. **Always destroy when done.**
