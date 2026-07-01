# DigitalOcean Droplet

## What This Example Creates

A **DigitalOcean Droplet** (s-1vcpu-1gb Ubuntu 22.04).

## Authentication

```bash
export DIGITALOCEAN_TOKEN="dop_v1_your_token_here"
```

Get a token from: https://cloud.digitalocean.com/account/api/tokens

## Commands

```bash
cd digitalocean/01-droplet
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

s-1vcpu-1gb costs **$6/month** ($0.009/hour).

**Always run `tofu destroy` when done.**
