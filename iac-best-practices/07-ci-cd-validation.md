# CI/CD Validation for OpenTofu

---

## 1. What to Validate in CI

Every pull request should run:

1. `tofu fmt -check -recursive` — formatting check
2. `tofu init -backend=false` — initialize without real backend
3. `tofu validate` — syntax and configuration validation
4. Security scanning (Checkov, tfsec, or Trivy)

---

## 2. GitHub Actions Example

```yaml
name: OpenTofu Validate

on:
  push:
    paths:
      - "**.tf"
  pull_request:
    paths:
      - "**.tf"

jobs:
  validate:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Setup OpenTofu
        uses: opentofu/setup-opentofu@v1
        with:
          tofu_version: "1.8.0"

      - name: Format check
        run: tofu fmt -check -recursive

      - name: Init
        run: tofu init -backend=false
        working-directory: aws/01-create-ec2

      - name: Validate
        run: tofu validate
        working-directory: aws/01-create-ec2
```

---

## 3. Security Scanning in CI

```yaml
- name: Run Checkov
  uses: bridgecrewio/checkov-action@v12
  with:
    directory: .
    framework: terraform
    soft_fail: true
```

---

## 4. Plan in CI (with credentials)

For non-tutorial projects where you want to run a real plan in CI:

```yaml
- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v4
  with:
    role-to-assume: arn:aws:iam::ACCOUNT:role/github-actions-role
    aws-region: us-east-1

- name: OpenTofu Plan
  run: tofu plan
  working-directory: aws/01-create-ec2
```

Use OIDC-based authentication (not static keys) for CI/CD.

---

## 5. CI Validation Without Cloud Credentials

For `tofu validate`, you don't need cloud credentials:

```bash
# This works without real AWS credentials
tofu init -backend=false
tofu validate
```

The `-backend=false` flag skips backend initialization (no state backend connection needed).
