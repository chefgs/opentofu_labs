# GCP Cloud Storage Bucket

## What This Example Creates

A **GCP Cloud Storage bucket** with security best practices.

## Commands

```bash
cd gcp/03-cloud-storage-bucket
cp terraform.tfvars.example terraform.tfvars
tofu init && tofu apply
tofu destroy
```

## ⚠️ Cost Warning

GCS: ~$0.020/GB/month. Empty buckets are nearly free. **Destroy when done.**
