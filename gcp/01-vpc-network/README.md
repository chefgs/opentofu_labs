# GCP VPC Network

## What This Example Creates

A **GCP VPC network** with subnets.

## Authentication

```bash
gcloud auth application-default login
gcloud config set project <project-id>
```

## Commands

```bash
cd gcp/01-vpc-network
cp terraform.tfvars.example terraform.tfvars
# Set your project_id
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

VPC networks are **free**. Subnets are free. Egress charges may apply.

**Always destroy when done.**
