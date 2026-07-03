# OpenTofu Multi-Cloud Labs

> A beginner-friendly and practical OpenTofu Infrastructure-as-Code tutorial repository for creating infrastructure resources across AWS, Azure, GCP, and DigitalOcean, while helping learners compare OpenTofu with Terraform.

[![OpenTofu AWS Validate](https://github.com/chefgs/opentofu_labs/actions/workflows/opentofu-validate-aws.yml/badge.svg)](https://github.com/chefgs/opentofu_labs/actions/workflows/opentofu-validate-aws.yml)
[![OpenTofu Format Check](https://github.com/chefgs/opentofu_labs/actions/workflows/opentofu-format-check.yml/badge.svg)](https://github.com/chefgs/opentofu_labs/actions/workflows/opentofu-format-check.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 🌐 Project Purpose

This repository is created for technologists who want to learn OpenTofu practically while also understanding its relationship with Terraform. The goal is not tool loyalty, but engineering awareness — knowing how to evaluate, compare, adopt, and migrate infrastructure tools responsibly.

---

## 🔍 What is OpenTofu?

[OpenTofu](https://opentofu.org) is an open-source Infrastructure-as-Code tool that is a community-driven fork of Terraform. It was created after HashiCorp changed Terraform's license from the Mozilla Public License (MPL 2.0) to the Business Source License (BSL) in August 2023.

Key facts:
- **Governed by**: The Linux Foundation
- **CNCF Status**: Accepted as a CNCF Sandbox project on April 23, 2025
- **License**: Mozilla Public License 2.0 (MPL 2.0)
- **CLI**: `tofu` (instead of `terraform`)
- **Configuration**: Compatible with Terraform HCL (`.tf` files)
- **Website**: https://opentofu.org

---

## ⚖️ A Note for Technologists

> OpenTofu has gained strong community momentum under Linux Foundation stewardship and CNCF Sandbox governance. As technologists, we should remain neutral, curious, and adaptable when evaluating tools. Terraform and OpenTofu both matter in the Infrastructure-as-Code ecosystem, and the goal of this repository is not to create tool bias, but to help learners understand the practical differences, similarities, and migration path between them.

Both tools use HCL (HashiCorp Configuration Language) and share nearly identical workflow. Understanding one means understanding the other. Choose wisely based on your project, team, and organizational requirements.

---

## 📊 OpenTofu vs Terraform Quick Comparison

| Area | Terraform | OpenTofu |
|------|-----------|----------|
| Origin | HashiCorp tool | Community fork of Terraform |
| Governance | Community Edition & Vendor-led | Linux Foundation / CNCF Sandbox |
| License | BSL (newer versions) | MPL 2.0 open-source |
| CLI | `terraform` | `tofu` |
| Configuration | HCL | HCL-compatible |
| Provider ecosystem | Mature | Uses Terraform-compatible providers |
| State compatibility | Native | Compatible |

See the full comparison in [`OPENTOFU_VS_TERRAFORM.md`](OPENTOFU_VS_TERRAFORM.md).

---

## 🗂️ Repository Structure

```text
opentofu_labs/
├── README.md                              # This file
├── USAGE.md                               # Practical usage guide
├── OPENTOFU_VS_TERRAFORM.md               # Comparison document
├── MIGRATION_FROM_TERRAFORM.md            # Migration guide
├── DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md  # Decision matrix
├── CONTRIBUTING.md                        # Contribution guidelines
├── CODE_OF_CONDUCT.md                     # Code of conduct
├── LICENSE                                # MIT License
├── .gitignore                             # OpenTofu/Terraform gitignore
│
├── .github/workflows/                     # GitHub Actions CI/CD
│   ├── opentofu-validate-aws.yml
│   ├── opentofu-validate-azure.yml
│   ├── opentofu-validate-gcp.yml
│   ├── opentofu-validate-digitalocean.yml
│   ├── opentofu-format-check.yml
│   └── security-scan-checkov.yml
│
├── docs/                                  # Learning documentation
│   ├── 01-what-is-opentofu.md
│   ├── 02-installing-opentofu.md
│   ├── 03-opentofu-workflow.md
│   ├── 04-state-and-backends.md
│   ├── 05-modules.md
│   ├── 06-opentofu-vs-terraform.md
│   ├── 07-migration-guide.md
│   ├── 08-best-practices.md
│   ├── 09-genai-with-opentofu.md
│   └── 10-kubernetes-workloads-with-opentofu.md
│
├── iac-basics/                            # IaC fundamentals
│   ├── 01-provider-block/
│   ├── 02-resource-block/
│   ├── 03-variables/
│   ├── 04-outputs/
│   ├── 05-locals/
│   ├── 06-tfvars/
│   └── 07-state-file/
│
├── aws/                                   # AWS examples
│   ├── 01-create-ec2/
│   ├── 02-vpc-basics/
│   ├── 03-s3-bucket/
│   ├── 04-security-group/
│   ├── 05-remote-state-s3-dynamodb/
│   └── 06-ec2-with-module/
│
├── azure/                                 # Azure examples
│   ├── 01-resource-group/
│   ├── 02-virtual-network/
│   ├── 03-linux-vm/
│   ├── 04-storage-account/
│   └── 05-vm-with-module/
│
├── gcp/                                   # GCP examples
│   ├── 01-vpc-network/
│   ├── 02-compute-instance/
│   ├── 03-cloud-storage-bucket/
│   ├── 04-firewall-rules/
│   └── 05-instance-with-module/
│
├── digitalocean/                          # DigitalOcean examples
│   ├── 01-droplet/
│   ├── 02-vpc/
│   ├── 03-firewall/
│   ├── 04-project/
│   └── 05-droplet-with-module/
│
├── modules/                               # Reusable modules
│   ├── aws-ec2/
│   ├── azure-linux-vm/
│   ├── gcp-compute-instance/
│   └── do-droplet/
│
├── iac-best-practices/                    # Best practices guide
│   ├── README.md
│   ├── 01-folder-structure.md
│   ├── 02-state-management.md
│   ├── 03-provider-versioning.md
│   ├── 04-secrets-and-sensitive-data.md
│   ├── 05-modules.md
│   ├── 06-environment-strategy.md
│   ├── 07-ci-cd-validation.md
│   ├── 08-security-scanning.md
│   ├── 09-cost-awareness.md
│   └── 10-production-readiness-checklist.md
│
└── examples/                              # Complete examples
    ├── beginner-single-resource/
    ├── intermediate-vpc-vm/
    ├── multicloud-basic-vm/
    └── terraform-to-opentofu-same-code/
```

---

## 🎓 Beginner Learning Path

Follow this path if you are new to OpenTofu or Infrastructure-as-Code:

```
1. Start with docs/01-what-is-opentofu.md
2. Install OpenTofu using docs/02-installing-opentofu.md
3. Learn the workflow using docs/03-opentofu-workflow.md
4. Run examples from iac-basics/ (start with 01-provider-block)
5. Run a simple single-resource example from examples/beginner-single-resource/
6. Try one cloud provider example (aws/01-create-ec2 is a good start)
7. Learn variables, outputs, and state in iac-basics/
8. Move to modules in iac-basics/05-locals and modules/
9. Compare Terraform and OpenTofu using OPENTOFU_VS_TERRAFORM.md
10. Try remote state in aws/05-remote-state-s3-dynamodb/
11. Add validation and security scanning from iac-best-practices/
```

---

## 🧠 Scenario Guides

Once you understand the basics, these guides show how OpenTofu can support real application platforms:

- [`docs/09-genai-with-opentofu.md`](docs/09-genai-with-opentofu.md) — using OpenTofu for GenAI application infrastructure
- [`docs/10-kubernetes-workloads-with-opentofu.md`](docs/10-kubernetes-workloads-with-opentofu.md) — managing Kubernetes workloads with OpenTofu

---

## ✅ Prerequisites

Before running any examples, ensure you have:

- [OpenTofu installed](https://opentofu.org/docs/intro/install/) (v1.6+)
- A cloud provider account (AWS, Azure, GCP, or DigitalOcean)
- Cloud provider CLI installed and authenticated
- Git

See [`USAGE.md`](USAGE.md) for detailed authentication and setup instructions.

---

## 🚀 How to Run an Example

```bash
# Navigate to any example folder
cd aws/01-create-ec2

# Initialize OpenTofu
tofu init

# Check formatting
tofu fmt

# Validate configuration
tofu validate

# Preview changes
tofu plan

# Apply changes
tofu apply

# When done - ALWAYS clean up resources to avoid costs
tofu destroy
```

---

## ☁️ Cloud Provider Coverage

| Provider | Examples | Authentication |
|----------|----------|----------------|
| AWS | 6 examples | AWS CLI / environment variables |
| Azure | 5 examples | Azure CLI (`az login`) |
| GCP | 5 examples | gcloud CLI |
| DigitalOcean | 5 examples | API token (`DIGITALOCEAN_TOKEN`) |

---

## 📋 OpenTofu vs Terraform Decision Matrix

This repository includes a practical decision matrix to help learners and engineering teams decide when to use OpenTofu, when Terraform may still be a better fit, and when both tools can coexist during a transition period.

The goal is not tool loyalty. The goal is engineering judgment.

See:

- [`OPENTOFU_VS_TERRAFORM.md`](OPENTOFU_VS_TERRAFORM.md)
- [`MIGRATION_FROM_TERRAFORM.md`](MIGRATION_FROM_TERRAFORM.md)
- [`DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md`](DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md)

---

## 🛡️ Best Practices Covered

This repository does not only show how to create cloud resources. It also explains how to structure OpenTofu projects responsibly.

Best practices include:

- Provider version pinning
- State file protection
- Remote backend usage
- Secrets management
- Reusable module design
- Environment separation
- Naming and tagging standards
- CI/CD validation
- Security scanning
- Cost-aware infrastructure creation
- Production-readiness checks

See [`iac-best-practices/`](iac-best-practices/) for full documentation.

---

## ⚠️ Security and Cost Disclaimer

> **Important**: Running cloud infrastructure examples will incur real costs in your cloud provider account. Always run `tofu destroy` when you are done with an example to avoid unexpected charges.

Security notes:
- **Never commit real credentials** to this repository
- **Never commit `.tfstate` files** to version control
- **Never commit `.tfvars` files** with real values — use `.tfvars.example` as templates
- Always review the `terraform.tfvars.example` file before creating your own `terraform.tfvars`

---

## 🤝 Contributing

Contributions are welcome! Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) before submitting a pull request.

---

## 📄 License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE) for details.

---

## 🙏 Acknowledgments

Inspired by the structure and learning intent of [chefgs/terraform_repo](https://github.com/chefgs/terraform_repo), adapted for the OpenTofu ecosystem.
