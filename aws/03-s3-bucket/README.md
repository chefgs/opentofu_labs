# AWS S3 Bucket

## What This Example Creates

This example creates an **Amazon S3 bucket** with versioning, server-side encryption, and public access blocking enabled.

---

## Prerequisites

- OpenTofu installed
- AWS credentials configured

---

## Commands to Run

```bash
cd aws/03-s3-bucket

cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars (bucket name must be globally unique)

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

S3 storage costs approximately **$0.023/GB/month**. For empty buckets in this tutorial, the cost is effectively zero.

**Always run `tofu destroy` when done.**

---

## Security Features Enabled

- ✅ Versioning enabled
- ✅ Server-side encryption (AES256)
- ✅ Public access block (all public access blocked)
- ✅ No ACLs (bucket-owner-enforced)
