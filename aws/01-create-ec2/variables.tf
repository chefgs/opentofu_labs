variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project (used in resource naming)"
  type        = string
  default     = "opentofu-lab"
}

variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "allowed_cidr" {
  description = "The CIDR block allowed for SSH access (use your IP: x.x.x.x/32)"
  type        = string
  default     = "0.0.0.0/0"
}

# Uncomment to enable SSH key attachment
# variable "key_pair_name" {
#   description = "The name of an existing EC2 key pair for SSH access"
#   type        = string
# }
