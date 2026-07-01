# Decision Matrix: OpenTofu vs Terraform

> **Purpose**: This document helps engineers, teams, and organizations decide whether to use OpenTofu, Terraform, or both based on their specific context.
>
> **Tone**: This matrix is intentionally neutral. Neither tool is presented as universally superior. The goal is to help you make an informed engineering decision.

---

## 1. Quick Decision Summary

| Scenario | Recommended Tool |
|----------|-----------------|
| New project, no Terraform Cloud dependency | OpenTofu or Terraform (either works) |
| Existing Terraform + Terraform Cloud heavily used | Continue with Terraform |
| Organization has BSL licensing concerns | Evaluate OpenTofu |
| New team learning IaC | Either (concepts are identical) |
| Vendor-neutral open-source requirement | OpenTofu |
| HashiCorp commercial support needed | Terraform |
| Gradual migration during transition | Both (parallel adoption) |

---

## 2. Detailed Decision Matrix

| Criteria | Terraform Better Fit | OpenTofu Better Fit | Notes |
|----------|---------------------|---------------------|-------|
| **License preference** | BSL acceptable | MPL 2.0 preferred | Legal/procurement teams may have strong opinions |
| **Open-source governance** | Vendor governance acceptable | Linux Foundation/CNCF governance preferred | OpenTofu is CNCF Sandbox (April 2025) |
| **Existing Terraform usage** | Strong | Medium | Existing Terraform configs work with either tool |
| **Terraform Cloud dependency** | Strong | Weak | Terraform Cloud is not compatible with OpenTofu |
| **Terraform Enterprise dependency** | Strong | Weak | TFE features like Sentinel don't apply to OpenTofu |
| **Provider compatibility** | Strong | Strong | Both tools use the same provider ecosystem |
| **Module ecosystem usage** | Strong | Strong | Public Terraform modules work with OpenTofu |
| **Internal team skillset** | Strong (if Terraform trained) | Strong (if OpenTofu trained) | CLI change is minor; HCL concepts are identical |
| **CI/CD compatibility** | Strong | Strong | Both have GitHub Actions support |
| **State migration complexity** | Strong (no migration needed) | Medium (state compatible, lock file regeneration needed) | State format is compatible; lock file needs refresh |
| **Compliance and procurement** | Depends on BSL policy | Strong (MPL 2.0 is permissive) | Some organizations ban BSL-licensed software |
| **Community and ecosystem** | Large, established | Fast-growing, active | OpenTofu community growing rapidly |
| **Long-term vendor-neutral strategy** | Medium | Strong | OpenTofu has community-governed, vendor-neutral roadmap |
| **Support model requirements** | Strong (HashiCorp commercial support) | Medium (community support) | Commercial support exists through third parties for OpenTofu |
| **Production migration risk** | Strong (no risk, already using it) | Medium (migration testing needed) | Risk is low if Terraform Cloud is not involved |
| **Learning and training goals** | Strong | Strong | Both are excellent for learning IaC concepts |
| **Beginner learning** | Strong | Strong | Workflow and HCL concepts are identical |
| **Multi-cloud IaC learning** | Strong | Strong | Both tools support AWS, Azure, GCP, DigitalOcean equally |
| **CNCF ecosystem integration** | Medium | Strong | OpenTofu is a CNCF Sandbox project |
| **Open governance participation** | Weak | Strong | OpenTofu accepts community contributions to roadmap |

---

## 3. Recommendation Framework

### Use Terraform when:

1. Your organization already **uses Terraform Cloud or Terraform Enterprise** heavily (workspaces, Sentinel, VCS integration, remote execution)
2. Existing workflows are **stable** and there is **no license or procurement concern**
3. Teams rely on **Terraform-specific commercial features**
4. **Migration risk** is higher than the expected benefit
5. You need **HashiCorp commercial support** contracts
6. Your organization has **invested significantly** in Terraform Cloud dashboards, audit logging, or SSO features

### Use OpenTofu when:

1. **Open-source licensing and governance** are important to your organization or project
2. Your team prefers **Linux Foundation / CNCF-backed** open-source tooling
3. Your organization wants a **vendor-neutral IaC workflow** with community-driven development
4. The project is **new and does not have Terraform Cloud dependency**
5. You want to learn Terraform-compatible IaC through an **open-source path**
6. Your procurement or legal team has **concerns about BSL licensing**
7. Your organization participates in the **CNCF ecosystem** and prefers Sandbox-level governance
8. You want the ability to **contribute to and influence the tool's roadmap**

### Use both during transition when:

1. Your organization has **existing Terraform projects** that should not be disrupted
2. **New projects** can be tested with OpenTofu before committing organization-wide
3. Migration needs to be **validated gradually** across environments
4. **CI/CD workflows need time** to be updated and tested
5. Teams need to **compare provider and module behavior** safely in parallel
6. You are in a **proof-of-concept phase** to evaluate OpenTofu before full adoption

---

## 4. Scoring Model

Use this simplified scoring model to evaluate your situation.

Score each criterion from 1 (low importance) to 5 (high importance), then see which column has more weight.

| Criteria | Weight | Terraform Score | OpenTofu Score |
|----------|--------|-----------------|----------------|
| License preference (MPL vs BSL) | 1-5 | BSL acceptable → 5 | MPL preferred → 5 |
| Terraform Cloud/Enterprise usage | 1-5 | Heavy usage → 5 | No usage → 0 |
| Open-source governance preference | 1-5 | Vendor OK → 3 | CNCF preferred → 5 |
| Procurement/compliance constraints | 1-5 | BSL cleared → 5 | BSL concerns → 5 (OpenTofu) |
| Migration risk tolerance | 1-5 | Low tolerance → 5 | High tolerance → 5 (OpenTofu) |
| Vendor-neutral strategy | 1-5 | Not required → 3 | Required → 5 |
| Commercial support requirement | 1-5 | Required → 5 | Not required → N/A |

**Interpretation**: 
- If most of your high-weight criteria favor Terraform → Stay with Terraform
- If most of your high-weight criteria favor OpenTofu → Evaluate OpenTofu
- If split → Consider parallel adoption (new projects on OpenTofu)

---

## 5. Migration Risk Assessment

| Risk Factor | Low Risk | Medium Risk | High Risk |
|-------------|----------|-------------|-----------|
| State file migration | No Terraform Cloud | Local or S3/GCS/Azure backend | Terraform Cloud remote backend |
| Provider compatibility | Standard AWS/Azure/GCP providers | Custom or third-party providers | Proprietary or internal providers |
| CI/CD pipeline changes | Simple GitHub Actions | Complex multi-stage pipelines | Tightly integrated TFC/TFE pipelines |
| Team skill change | Minor (same HCL, different CLI) | Moderate (some wrapper scripts) | High (deep Terraform Cloud integration) |
| Rollback complexity | State backup + Terraform reinstall | State backup + pipeline rollback | Terraform Cloud workspace restoration |

---

## 6. Key Questions to Ask Your Team

Before making a decision, answer these questions:

1. **Do we use Terraform Cloud or Terraform Enterprise?** If yes, what features do we rely on?
2. **Does our legal/procurement team have any concerns about BSL?**
3. **Is our team comfortable with CLI tool changes?** (Only the command name changes)
4. **Do we have a non-production environment to test the migration?**
5. **Is our state stored in a compatible backend (S3, GCS, Azure Blob)?**
6. **Do we have CI/CD pipelines that use Terraform CLI directly?**
7. **Are we using any Terraform-specific modules that may behave differently?**
8. **What is our rollback plan if migration causes unexpected drift?**

---

## 7. Neutral Engineering Perspective

Both Terraform and OpenTofu are capable, production-ready tools for Infrastructure-as-Code. Engineers who know one tool effectively know the other, because:

- The configuration language (HCL) is the same
- The workflow (`init`, `plan`, `apply`, `destroy`) is the same
- The provider ecosystem is shared
- The state file format is compatible

The differences are primarily:

1. **Governance model**: Vendor vs community
2. **License**: BSL vs MPL 2.0
3. **Terraform Cloud**: Only works with Terraform
4. **CLI name**: `terraform` vs `tofu`

As engineers, we should evaluate tools based on **technical merit, organizational fit, license implications, and operational maturity** — not based on marketing or community sentiment.

---

## 8. Further Reading

- [`OPENTOFU_VS_TERRAFORM.md`](OPENTOFU_VS_TERRAFORM.md) — Detailed feature comparison
- [`MIGRATION_FROM_TERRAFORM.md`](MIGRATION_FROM_TERRAFORM.md) — Step-by-step migration guide
- [OpenTofu official documentation](https://opentofu.org/docs/)
- [Terraform official documentation](https://developer.hashicorp.com/terraform/docs)
- [OpenTofu GitHub repository](https://github.com/opentofu/opentofu)
- [CNCF OpenTofu project page](https://www.cncf.io/projects/opentofu/)
