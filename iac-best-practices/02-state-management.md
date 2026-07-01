# State Management Best Practices

---

## 1. Always Use Remote State for Teams

Local state is only suitable for single-user, non-production use.

For any shared or production environment:

```hcl
terraform {
  backend "s3" {
    bucket         = "my-company-terraform-state"
    key            = "project/env/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
```

---

## 2. Enable State Locking

Always use state locking to prevent concurrent modifications:

| Backend | Locking mechanism |
|---------|------------------|
| S3 | DynamoDB table |
| Azure Blob | Azure blob leases |
| GCS | GCS object locks |
| Local | None (single user only) |

---

## 3. Enable Encryption

Always enable encryption for remote state:

- **S3**: `encrypt = true`
- **Azure**: Storage account encryption (enabled by default)
- **GCS**: Google-managed encryption (enabled by default)

---

## 4. Enable Versioning

Enable versioning on your state bucket for recovery:

```hcl
resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}
```

---

## 5. Restrict State Access

Only authorized users and CI systems should access state:

```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": {"AWS": "arn:aws:iam::ACCOUNT:role/terraform-role"},
    "Action": ["s3:GetObject", "s3:PutObject"],
    "Resource": "arn:aws:s3:::my-state-bucket/*"
  }]
}
```

---

## 6. Separate State per Environment

Never share state between environments:

```text
s3://my-state-bucket/
├── dev/terraform.tfstate
├── staging/terraform.tfstate
└── prod/terraform.tfstate
```

---

## 7. Never Commit State Files

The `.gitignore` in this repository excludes:

```gitignore
*.tfstate
*.tfstate.*
```

**Never override this.**
