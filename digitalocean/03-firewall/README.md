# DigitalOcean Firewall

## What This Example Creates

A **DigitalOcean Cloud Firewall** with rules for web and SSH traffic.

## Commands

```bash
cd digitalocean/03-firewall
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

Firewalls are **free**. **Always destroy when done.**
