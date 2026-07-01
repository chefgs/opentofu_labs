# What is OpenTofu?

## Overview

OpenTofu is an open-source Infrastructure-as-Code (IaC) tool that allows you to define, provision, and manage cloud infrastructure using a declarative configuration language called HCL (HashiCorp Configuration Language).

OpenTofu is a community-driven fork of Terraform, created in response to HashiCorp's license change from Mozilla Public License (MPL 2.0) to Business Source License (BSL) in August 2023.

---

## Key Facts

| Fact | Details |
|------|---------|
| **Founded** | September 2023 |
| **Governance** | Linux Foundation |
| **CNCF Status** | Sandbox project (accepted April 23, 2025) |
| **License** | Mozilla Public License 2.0 (MPL 2.0) |
| **CLI** | `tofu` |
| **Configuration format** | HCL (`.tf` files) |
| **Website** | https://opentofu.org |
| **GitHub** | https://github.com/opentofu/opentofu |

---

## Why Does OpenTofu Exist?

In August 2023, HashiCorp changed the license of Terraform from the open-source Mozilla Public License 2.0 to the Business Source License 1.1 (BSL). The BSL restricts certain commercial uses, particularly for competing products and services.

In response, a community of engineers, companies, and open-source contributors created OpenTofu as a community-governed, open-source fork of Terraform. The project was donated to the Linux Foundation to ensure neutral, community-driven governance.

---

## How OpenTofu Works

OpenTofu follows a declarative IaC approach:

1. You write `.tf` configuration files describing your desired infrastructure state
2. OpenTofu compares your desired state against current state (stored in a state file)
3. OpenTofu generates an execution plan showing what changes will be made
4. You review and approve the plan
5. OpenTofu creates, updates, or destroys resources to reach the desired state

### The OpenTofu Workflow

```
Write .tf files
      ↓
tofu init (initialize, download providers)
      ↓
tofu fmt (format code)
      ↓
tofu validate (check syntax)
      ↓
tofu plan (preview changes)
      ↓
tofu apply (make changes)
      ↓
tofu destroy (clean up when done)
```

---

## OpenTofu vs Terraform

OpenTofu and Terraform share the same HCL configuration language and nearly identical workflow. The key differences are:

| Aspect | Terraform | OpenTofu |
|--------|-----------|----------|
| CLI command | `terraform` | `tofu` |
| License | BSL 1.1 | MPL 2.0 |
| Governance | HashiCorp (now IBM) | Linux Foundation / CNCF |
| Terraform Cloud | Supported | Not directly compatible |

For a full comparison, see `06-opentofu-vs-terraform.md`.

---

## Core Concepts

### Providers

Providers are plugins that allow OpenTofu to interact with cloud platforms, services, and APIs. Examples:

- `hashicorp/aws` — Amazon Web Services
- `hashicorp/azurerm` — Microsoft Azure
- `hashicorp/google` — Google Cloud Platform
- `digitalocean/digitalocean` — DigitalOcean

### Resources

Resources are the fundamental building blocks — they represent infrastructure objects like virtual machines, databases, networks, etc.

```hcl
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

### State

OpenTofu maintains a state file (`terraform.tfstate`) that maps your configuration to real-world resources. This allows OpenTofu to detect and manage changes incrementally.

### Modules

Modules are reusable groups of resources that can be shared across projects and teams.

---

## Next Steps

- `02-installing-opentofu.md` — How to install OpenTofu
- `03-opentofu-workflow.md` — Understanding the workflow
- Start with `iac-basics/01-provider-block/` for hands-on practice
