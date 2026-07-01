# Folder Structure Best Practices

A clear folder structure makes IaC projects easier to navigate, maintain, and scale.

---

## Single Project Structure

For small, single-environment projects:

```text
my-project/
├── providers.tf          # Provider configuration
├── main.tf               # Main resources
├── variables.tf          # Variable declarations
├── outputs.tf            # Output values
├── terraform.tfvars      # Variable values (NOT committed)
└── terraform.tfvars.example  # Example values (committed)
```

---

## Multi-Environment Structure

For projects with multiple environments:

```text
my-project/
├── modules/
│   ├── compute/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── networking/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── providers.tf
│   │   ├── main.tf
│   │   └── terraform.tfvars
│   ├── staging/
│   │   ├── providers.tf
│   │   ├── main.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── providers.tf
│       ├── main.tf
│       └── terraform.tfvars
└── README.md
```

---

## Multi-Cloud Structure

For multi-cloud projects:

```text
infrastructure/
├── aws/
│   ├── networking/
│   ├── compute/
│   └── storage/
├── azure/
│   ├── networking/
│   ├── compute/
│   └── storage/
├── modules/
│   ├── aws-vpc/
│   ├── azure-vnet/
│   └── common-tagging/
└── README.md
```

---

## Key Principles

1. **One directory = one state file** — keep state boundaries clear
2. **Group by function, not by provider** — `networking/`, `compute/`, `storage/`
3. **Use `modules/` for shared code** — don't repeat yourself
4. **Separate dev/staging/prod** — never share state between environments
5. **Include a `README.md`** in every directory
