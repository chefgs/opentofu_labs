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

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc3"
}

variable "ip_range" {
  description = "IP range for the VPC (CIDR notation)"
  type        = string
  default     = "10.10.10.0/24"
}
