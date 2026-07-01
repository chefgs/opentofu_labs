# Security Scanning for IaC

---

## 1. Why Scan IaC Code?

IaC code can introduce security misconfigurations such as:
- S3 buckets with public access enabled
- Security groups with `0.0.0.0/0` on port 22
- Unencrypted storage volumes
- Resources without tags
- Overly permissive IAM policies

---

## 2. Checkov

[Checkov](https://www.checkov.io/) is a static analysis tool for IaC.

```bash
# Install
pip install checkov

# Scan a directory
checkov -d .

# Scan a specific file
checkov -f main.tf

# Output in JSON
checkov -d . -o json
```

GitHub Actions:

```yaml
- uses: bridgecrewio/checkov-action@v12
  with:
    directory: .
    framework: terraform
    soft_fail: true
```

---

## 3. Trivy

[Trivy](https://aquasecurity.github.io/trivy/) scans IaC for misconfigurations:

```bash
# Install
brew install trivy  # macOS

# Scan a directory
trivy config .

# Scan with specific severity
trivy config --severity HIGH,CRITICAL .
```

---

## 4. tfsec

[tfsec](https://aquasecurity.github.io/tfsec/) is specifically designed for Terraform/OpenTofu:

```bash
# Install
brew install tfsec  # macOS

# Scan
tfsec .
```

---

## 5. Common Security Issues to Check

| Issue | Checkov Rule |
|-------|-------------|
| S3 public access | CKV_AWS_53, CKV_AWS_54 |
| Unencrypted S3 | CKV_AWS_19 |
| Security group open to world | CKV_AWS_24, CKV_AWS_25 |
| Unencrypted EBS | CKV_AWS_3 |
| Root account used | CKV_AWS_36 |
| No MFA on IAM | CKV_AWS_9 |

---

## 6. False Positives

Security scanners sometimes flag legitimate configurations. You can suppress specific checks:

```hcl
# checkov:skip=CKV_AWS_24:Port 22 intentionally open for tutorial
resource "aws_security_group_rule" "ssh" {
  ...
}
```

Use suppressions sparingly and always document why.
