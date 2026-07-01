# OpenTofu vs Terraform: A Balanced Comparison

> **Note**: This document aims to present a fair, balanced view of both tools. Neither tool is universally better. The right choice depends on your team, organization, licensing requirements, and existing infrastructure estate.

---

## 1. Origin and History

### Terraform

- Created by **HashiCorp** in 2014
- Licensed under Mozilla Public License (MPL 2.0) until August 2023
- In August 2023, HashiCorp changed the license to the **Business Source License (BSL 1.1)**
- BSL restricts use of Terraform in competing products and services

### OpenTofu

- Created as a community fork of Terraform in September 2023
- Formed by the open-source community in response to Terraform's license change
- Accepted into the **Linux Foundation** as a hosted project
- Accepted into **CNCF (Cloud Native Computing Foundation) as a Sandbox project** on **April 23, 2025**
- Licensed under **Mozilla Public License 2.0 (MPL 2.0)**
- CLI command is `tofu` instead of `terraform`

---

## 2. Feature and Capability Comparison

| Area | Terraform | OpenTofu |
|------|-----------|----------|
| **Origin** | HashiCorp tool (now IBM-owned) | Community fork of Terraform |
| **Governance** | Vendor-led (HashiCorp/IBM) | Linux Foundation / CNCF Sandbox |
| **License** | BSL 1.1 (newer versions) | MPL 2.0 (fully open-source) |
| **CLI** | `terraform` | `tofu` |
| **Configuration language** | HCL (HashiCorp Configuration Language) | HCL-compatible (same syntax) |
| **Provider ecosystem** | Mature, large registry | Uses Terraform-compatible providers |
| **Module ecosystem** | Terraform Registry | Compatible with public Terraform modules |
| **State format** | JSON-based `.tfstate` | Compatible `.tfstate` format |
| **Remote backends** | Native Terraform Cloud support | S3, GCS, Azure Blob, and other backends |
| **Terraform Cloud** | Full support | Not directly supported (see below) |
| **OPA / Sentinel policy** | Terraform Enterprise/Cloud feature | Uses OPA separately |
| **Community** | Large, established | Fast-growing |
| **Release cadence** | Regular HashiCorp releases | Community-driven releases |

---

## 3. CLI Command Differences

The OpenTofu CLI is named `tofu` instead of `terraform`. The command structure is otherwise nearly identical.

| Terraform | OpenTofu | Notes |
|-----------|----------|-------|
| `terraform init` | `tofu init` | Same behavior |
| `terraform fmt` | `tofu fmt` | Same behavior |
| `terraform validate` | `tofu validate` | Same behavior |
| `terraform plan` | `tofu plan` | Same behavior |
| `terraform apply` | `tofu apply` | Same behavior |
| `terraform destroy` | `tofu destroy` | Same behavior |
| `terraform show` | `tofu show` | Same behavior |
| `terraform state` | `tofu state` | Same behavior |
| `terraform import` | `tofu import` | Same behavior |
| `terraform output` | `tofu output` | Same behavior |
| `terraform version` | `tofu version` | Same behavior |

---

## 4. Configuration Compatibility

OpenTofu maintains **strong backward compatibility** with Terraform configurations:

- `.tf` file syntax is identical
- Same HCL configuration language
- Same resource block structure
- Same variable, output, and locals syntax
- Same module structure
- Same provider configuration blocks
- Same `required_providers` syntax

**In practice**: Most Terraform configurations can run with OpenTofu with only CLI command changes.

---

## 5. Provider Ecosystem

| Aspect | Terraform | OpenTofu |
|--------|-----------|----------|
| Provider registry | `registry.terraform.io` | `registry.opentofu.org` (mirrors Terraform registry) |
| AWS provider | `hashicorp/aws` | `hashicorp/aws` (same) |
| Azure provider | `hashicorp/azurerm` | `hashicorp/azurerm` (same) |
| GCP provider | `hashicorp/google` | `hashicorp/google` (same) |
| Provider source | `registry.terraform.io/hashicorp/aws` | `registry.opentofu.org/hashicorp/aws` |

OpenTofu can use the same providers as Terraform. The provider source notation may differ slightly but most providers work with both tools.

---

## 6. State File Compatibility

- OpenTofu and Terraform share a **compatible state file format**
- You can migrate from Terraform to OpenTofu using the same state file
- Always back up your state before migrating
- See [`MIGRATION_FROM_TERRAFORM.md`](MIGRATION_FROM_TERRAFORM.md) for details

---

## 7. Terraform Cloud and Enterprise

| Feature | Terraform | OpenTofu |
|---------|-----------|----------|
| Terraform Cloud (free tier) | Supported | **Not compatible** |
| Terraform Enterprise | Supported | Not compatible |
| Remote execution | TFC/TFE feature | Must use self-hosted alternatives |
| Sentinel policy | TFC/TFE feature | Use OPA separately |
| Workspace management | TFC/TFE feature | Self-managed |

> If your organization relies heavily on Terraform Cloud or Terraform Enterprise features, OpenTofu may not be a direct drop-in replacement for those hosted services.

---

## 8. When Terraform May Be Preferred

- Your organization uses **Terraform Cloud or Terraform Enterprise** features deeply
- Your existing workflows are stable and there is **no license concern**
- Your procurement or legal team has **approved Terraform BSL**
- **Migration risk** is higher than the expected benefit
- Your team relies on **Sentinel policy-as-code** (a Terraform Cloud feature)
- You need **HashiCorp commercial support**

---

## 9. When OpenTofu May Be Preferred

- **Open-source licensing** and governance are important to your organization
- You prefer **Linux Foundation / CNCF-backed** tooling
- Your organization wants a **vendor-neutral IaC workflow**
- Your project is **new** and does not depend on Terraform Cloud
- You want to learn Terraform-compatible IaC through an **open-source path**
- Your organization has **procurement restrictions** on BSL software
- You want to contribute to or influence the tool's direction via **open governance**

---

## 10. Why Engineers Should Understand Both

The HCL language and workflow concepts are the same in both tools. Learning one means you effectively know the other. Understanding both tools makes you a more versatile infrastructure engineer who can:

- Work in organizations using either tool
- Evaluate migration decisions with confidence
- Contribute to both ecosystems
- Make tool-neutral architectural decisions

---

## 11. Summary

Both Terraform and OpenTofu are capable, production-ready Infrastructure-as-Code tools. The practical differences for day-to-day usage are minimal. The key differences come down to:

1. **License**: MPL 2.0 (OpenTofu) vs BSL 1.1 (Terraform)
2. **Governance**: Community/CNCF (OpenTofu) vs Vendor/HashiCorp (Terraform)
3. **Cloud service compatibility**: Terraform Cloud works with Terraform only

For most new projects without Terraform Cloud dependency, both tools are equally viable. The decision often comes down to organizational policy, existing investments, and personal or team preference.

See also: [`DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md`](DECISION_MATRIX_OPENTOFU_VS_TERRAFORM.md)
