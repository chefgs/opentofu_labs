# Contributing to OpenTofu Multi-Cloud Labs

Thank you for your interest in contributing to this project! This repository aims to be a beginner-friendly, practical learning resource for OpenTofu and Infrastructure-as-Code.

---

## How to Contribute

### Reporting Issues

If you find an error, outdated information, or something that could be improved:

1. Search existing [issues](https://github.com/chefgs/opentofu_labs/issues) to see if it has already been reported
2. Open a new issue with a clear title and description
3. Include the file path and what you believe is incorrect or missing

### Suggesting New Examples

If you want to suggest a new cloud provider example, best practice, or documentation topic:

1. Open an issue describing what you want to add
2. Explain the learning value it provides
3. Wait for feedback before investing time in implementation

### Submitting Pull Requests

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-example-name`
3. Make your changes
4. Run `tofu fmt -recursive` to format all `.tf` files
5. Run `tofu validate` in your example directory
6. Commit your changes: `git commit -m "Add: description of change"`
7. Push to your fork: `git push origin feature/your-example-name`
8. Open a Pull Request

---

## Contribution Guidelines

### For OpenTofu/Terraform Code

- All `.tf` files must pass `tofu fmt -check -recursive`
- All examples must pass `tofu validate`
- Do not hardcode credentials, access keys, or tokens
- Use variables for all configurable values
- Pin provider versions in `required_providers`
- Include `terraform.tfvars.example` — never include real `.tfvars` files
- Add a `README.md` to every example folder

### For Documentation

- Use clear, simple language suitable for beginners
- Include the command comparison table (Terraform vs OpenTofu) where relevant
- Maintain a neutral tone — do not position one tool as always better
- Include cost warnings in any documentation that creates cloud resources
- Include cleanup instructions (`tofu destroy`) whenever resources are created

### Code Style for `.tf` Files

```hcl
# Good example
resource "aws_instance" "example" {
  # Comment explaining what this does
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    ManagedBy   = "opentofu"
  }
}
```

- Use 2-space indentation
- Group related arguments together
- Add comments for non-obvious configuration
- Use `tags` consistently for all taggable resources
- Use `var.*` for all configurable values

---

## Example Folder Structure

Every example should follow this structure:

```text
cloud/example-name/
├── README.md              # What this creates, how to run it, cost warning
├── providers.tf           # Provider configuration and required_providers
├── main.tf                # Main resource definitions
├── variables.tf           # Variable declarations with descriptions
├── outputs.tf             # Output values
└── terraform.tfvars.example  # Example variable values (no real values)
```

---

## What NOT to Submit

- Real API keys, tokens, passwords, or credentials
- Real cloud account IDs (use placeholder values like `123456789012`)
- Real state files (`.tfstate`)
- Real `.tfvars` files with sensitive data
- Overcomplicated production-grade infrastructure for beginner examples
- Code that creates expensive resources without clear cost warnings

---

## Questions

If you have questions about contributing, open a Discussion or an Issue.

Thank you for helping make this a better learning resource for the community!
