# GCP Compute Instance

## What This Example Creates

A **GCP Compute Instance** (e2-micro).

## Authentication

```bash
gcloud auth application-default login
gcloud config set project <project-id>
```

## Commands

```bash
cd gcp/02-compute-instance
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

e2-micro is in the GCP free tier (1 per month). Costs may apply beyond free tier.

**Always destroy when done.**
