# Module Design Best Practices

---

## 1. Module Principles

- **Single responsibility**: one module does one thing well
- **Composable**: modules work well together
- **Documented**: every module has a `README.md`
- **Versioned**: released via git tags
- **Tested**: validate module behavior in CI

---

## 2. Required Module Files

```text
module-name/
├── main.tf         # Resources
├── variables.tf    # Input variables with descriptions
├── outputs.tf      # Output values
└── README.md       # Usage, inputs, outputs
```

---

## 3. Variable Design

```hcl
# ✅ Good: descriptive, typed, validated
variable "instance_type" {
  description = "The EC2 instance type. Use t3.micro for development."
  type        = string
  default     = "t3.micro"

  validation {
    condition     = can(regex("^[a-z][0-9][a-z]?\\.", var.instance_type))
    error_message = "Must be a valid EC2 instance type."
  }
}

# ❌ Bad: no description, no type
variable "type" {}
```

---

## 4. Output Design

```hcl
# ✅ Good: descriptive with clear description
output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.this.id
}

# ❌ Bad: no description
output "id" {
  value = aws_instance.this.id
}
```

---

## 5. Tags and Labels

Use `merge()` for tags so callers can add their own:

```hcl
tags = merge(
  {
    Name      = var.name
    ManagedBy = "opentofu"
  },
  var.additional_tags
)
```

---

## 6. DRY vs Readability Trade-off

Modules should balance code reuse with readability:

- **Too much abstraction**: hard to understand what is being created
- **Too little abstraction**: duplicated code across many places

**Rule of thumb**: if you copy-paste more than 3 times, create a module.

---

## 7. Module Versioning

Use git tags for module versions:

```hcl
module "vpc" {
  source  = "git::https://github.com/example/terraform-aws-vpc.git?ref=v1.2.0"
  ...
}
```
