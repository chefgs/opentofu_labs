variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "opentofu-lab"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed for SSH access (use your IP: x.x.x.x/32)"
  type        = string
  default     = "0.0.0.0/0"
}
