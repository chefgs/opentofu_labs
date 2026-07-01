variable "project_id" {
  description = "GCP project ID"
  type        = string
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

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "network_name" {
  description = "VPC network name for the firewall rules"
  type        = string
  default     = "default"
}

variable "allowed_ssh_cidr" {
  description = "CIDR range allowed for SSH (use your IP)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "internal_cidr" {
  description = "Internal CIDR range for internal traffic"
  type        = string
  default     = "10.0.0.0/8"
}
