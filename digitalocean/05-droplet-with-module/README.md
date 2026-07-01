# DigitalOcean Droplet with Module

## What This Example Creates

A Droplet using the reusable `modules/do-droplet/` module.

## Commands

```bash
cd digitalocean/05-droplet-with-module
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

s-1vcpu-1gb: **$6/month**. **Always destroy when done.**
