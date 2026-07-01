# Usage Guide

This guide walks you through everything you need to get started with OpenTofu and run examples from this repository.

---

## 1. Installing OpenTofu

### Linux (AMD64)

```bash
# Download the latest release
curl -LO https://github.com/opentofu/opentofu/releases/latest/download/tofu_linux_amd64.zip
unzip tofu_linux_amd64.zip
sudo mv tofu /usr/local/bin/tofu

# Verify installation
tofu version
```

### macOS (Homebrew)

```bash
brew install opentofu

# Verify installation
tofu version
```

### Windows (winget)

```powershell
winget install --id=OpenTofu.OpenTofu

# Verify installation
tofu version
```

### Using the official install script

```bash
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh | sh
```

For all installation methods, see the [official installation guide](https://opentofu.org/docs/intro/install/).

---

## 2. Authenticating to AWS

OpenTofu uses the AWS provider which supports multiple authentication methods.

### Option 1: AWS CLI (recommended for beginners)

```bash
# Install AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

# Configure credentials
aws configure
# Enter: AWS Access Key ID
# Enter: AWS Secret Access Key
# Enter: Default region (e.g., us-east-1)
# Enter: Default output format (json)
```

### Option 2: Environment variables

```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
export AWS_DEFAULT_REGION="us-east-1"
```

### Option 3: AWS IAM Role (for CI/CD or EC2 instances)

When running on EC2 or in GitHub Actions, use IAM roles or OIDC-based authentication instead of long-lived credentials.

---

## 3. Authenticating to Azure

```bash
# Install Azure CLI
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

# Log in to Azure
az login

# Set your subscription
az account set --subscription "<your-subscription-id>"

# Verify
az account show
```

Then run OpenTofu commands:

```bash
tofu init
tofu plan
tofu apply
```

---

## 4. Authenticating to GCP

```bash
# Install gcloud CLI
# https://cloud.google.com/sdk/docs/install

# Authenticate
gcloud auth application-default login

# Set your project
gcloud config set project <your-project-id>

# Verify
gcloud auth application-default print-access-token
```

Then run OpenTofu commands:

```bash
tofu init
tofu plan
tofu apply
```

---

## 5. Authenticating to DigitalOcean

```bash
# Create a Personal Access Token in the DigitalOcean console:
# https://cloud.digitalocean.com/account/api/tokens

# Set the token as an environment variable
export DIGITALOCEAN_TOKEN="dop_v1_your_token_here"
```

Then run OpenTofu commands:

```bash
tofu init
tofu plan
tofu apply
```

---

## 6. OpenTofu Workflow

### `tofu init`

Initializes the working directory. Downloads providers and sets up the backend.

```bash
tofu init
```

Run this once per directory, or after adding new providers or backends.

| Terraform equivalent | OpenTofu command |
|---------------------|-----------------|
| `terraform init` | `tofu init` |

---

### `tofu fmt`

Formats your `.tf` files to the standard style.

```bash
# Format current directory
tofu fmt

# Format recursively
tofu fmt -recursive

# Check formatting without changing files (used in CI)
tofu fmt -check -recursive
```

| Terraform equivalent | OpenTofu command |
|---------------------|-----------------|
| `terraform fmt` | `tofu fmt` |

---

### `tofu validate`

Validates the syntax and internal consistency of your configuration.

```bash
tofu validate
```

| Terraform equivalent | OpenTofu command |
|---------------------|-----------------|
| `terraform validate` | `tofu validate` |

---

### `tofu plan`

Creates an execution plan, showing you what changes OpenTofu will make.

```bash
# Basic plan
tofu plan

# Save plan to file
tofu plan -out=tfplan

# Plan with variable file
tofu plan -var-file="terraform.tfvars"
```

| Terraform equivalent | OpenTofu command |
|---------------------|-----------------|
| `terraform plan` | `tofu plan` |

---

### `tofu apply`

Applies the planned changes to your infrastructure.

```bash
# Apply with confirmation prompt
tofu apply

# Apply saved plan (no confirmation needed)
tofu apply tfplan

# Auto-approve (use carefully)
tofu apply -auto-approve
```

| Terraform equivalent | OpenTofu command |
|---------------------|-----------------|
| `terraform apply` | `tofu apply` |

---

### `tofu destroy`

Destroys all resources managed by the configuration.

```bash
# Destroy with confirmation prompt
tofu destroy

# Auto-approve destroy (use carefully)
tofu destroy -auto-approve
```

> ⚠️ **Always run `tofu destroy` when you are done with tutorial examples** to avoid unexpected cloud costs.

| Terraform equivalent | OpenTofu command |
|---------------------|-----------------|
| `terraform destroy` | `tofu destroy` |

---

## 7. Other Useful Commands

```bash
# Show current state
tofu show

# List resources in state
tofu state list

# Show a specific resource
tofu state show aws_instance.example

# Import existing resource
tofu import aws_instance.example i-1234567890abcdef0

# Get all provider and module versions
tofu version -json

# Upgrade providers
tofu init -upgrade
```

---

## 8. Troubleshooting Common Beginner Issues

### `tofu: command not found`

OpenTofu is not installed or not in your PATH. Follow the installation instructions in Section 1.

### Provider authentication errors

Make sure you have configured your cloud provider credentials correctly. See Sections 2–5.

### `Error: No valid credential sources found`

For AWS, ensure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are set, or you have run `aws configure`.

### `Error: Backend configuration changed`

Run `tofu init -reconfigure` to re-initialize with the new backend configuration.

### `Error: state file locked`

If a previous run was interrupted, the state may be locked. Run:

```bash
tofu force-unlock <lock-id>
```

Use the lock ID shown in the error message.

### `.terraform.lock.hcl` conflicts

The lock file records exact provider versions. If you or a teammate updated providers on a different machine, run:

```bash
tofu init -upgrade
```

### `tofu plan` shows unexpected changes

This can happen if your cloud resources were modified outside of OpenTofu (configuration drift). Review the diff carefully before applying.

### `Error: Provider version constraints unsatisfied`

Update the `required_providers` block in your `providers.tf` to allow the installed provider version, or run `tofu init -upgrade`.

---

## 9. Working with `.tfvars` Files

The `.tfvars` file lets you set variable values for your environment.

**Never commit your real `.tfvars` file.** This repository includes `.tfvars.example` files instead:

```bash
# Copy the example file
cp terraform.tfvars.example terraform.tfvars

# Edit with your real values
nano terraform.tfvars

# terraform.tfvars is in .gitignore and will NOT be committed
```

---

## 10. Quick Reference: Terraform vs OpenTofu Commands

| Terraform | OpenTofu |
|-----------|----------|
| `terraform init` | `tofu init` |
| `terraform fmt` | `tofu fmt` |
| `terraform validate` | `tofu validate` |
| `terraform plan` | `tofu plan` |
| `terraform apply` | `tofu apply` |
| `terraform destroy` | `tofu destroy` |
| `terraform show` | `tofu show` |
| `terraform state` | `tofu state` |
| `terraform import` | `tofu import` |
| `terraform output` | `tofu output` |
| `terraform version` | `tofu version` |
