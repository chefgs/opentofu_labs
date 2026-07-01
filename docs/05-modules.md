# Modules in OpenTofu

Modules allow you to package and reuse groups of resources across projects and teams.

---

## What is a Module?

A module is a collection of `.tf` files in a directory that defines a reusable group of resources.

Every directory with `.tf` files is technically a module. The directory where you run `tofu` commands is called the **root module**. Modules called from the root module are called **child modules**.

---

## Why Use Modules?

- **Reusability**: Define infrastructure once, use it in many places
- **Consistency**: Enforce standards across environments and teams
- **Encapsulation**: Hide complexity behind a simple interface
- **Versioning**: Version and release module updates independently

---

## Module Structure

A well-structured module looks like this:

```text
modules/aws-ec2/
├── main.tf         # Resources
├── variables.tf    # Input variables
├── outputs.tf      # Output values
└── README.md       # Usage documentation
```

---

## Creating a Module

### `modules/aws-ec2/main.tf`

```hcl
# AWS EC2 instance module
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = merge(
    {
      Name        = var.instance_name
      ManagedBy   = "opentofu"
    },
    var.additional_tags
  )
}
```

### `modules/aws-ec2/variables.tf`

```hcl
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to apply to the instance"
  type        = map(string)
  default     = {}
}
```

### `modules/aws-ec2/outputs.tf`

```hcl
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.this.public_ip
}
```

---

## Using a Module

### From a local path

```hcl
module "web_server" {
  source = "../../modules/aws-ec2"

  ami_id        = var.ami_id
  instance_type = "t3.micro"
  instance_name = "web-server"
  subnet_id     = aws_subnet.main.id
}
```

### From the Terraform/OpenTofu Registry

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
}
```

### From GitHub

```hcl
module "security_group" {
  source = "github.com/example/terraform-aws-sg"
}
```

---

## Module Outputs

Access module outputs using `module.<name>.<output>`:

```hcl
output "web_server_id" {
  value = module.web_server.instance_id
}

output "web_server_ip" {
  value = module.web_server.public_ip
}
```

---

## Module Best Practices

1. **Keep modules focused** — one module should do one thing well
2. **Use descriptive variable names** with `description` attributes
3. **Provide sensible defaults** for optional variables
4. **Use validation** for critical variables
5. **Always write a README.md** with usage examples
6. **Version modules** using git tags
7. **Avoid hardcoding** values — use variables
8. **Use `merge()` for tags** to allow callers to add their own tags

---

## Module Variable Validation

```hcl
variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"

  validation {
    condition = contains([
      "t3.micro", "t3.small", "t3.medium"
    ], var.instance_type)
    error_message = "Instance type must be t3.micro, t3.small, or t3.medium."
  }
}
```

---

## Reusable Modules in This Repository

This repository includes modules under `modules/`:

| Module | Description |
|--------|-------------|
| `modules/aws-ec2/` | Reusable AWS EC2 instance |
| `modules/azure-linux-vm/` | Reusable Azure Linux VM |
| `modules/gcp-compute-instance/` | Reusable GCP Compute Instance |
| `modules/do-droplet/` | Reusable DigitalOcean Droplet |

---

## Next Steps

- `06-opentofu-vs-terraform.md` — Comparing the two tools
- `../modules/aws-ec2/` — Explore the AWS EC2 module
- `../aws/06-ec2-with-module/` — Use the module in an example
