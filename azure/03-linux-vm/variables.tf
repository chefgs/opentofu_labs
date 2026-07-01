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

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vm_size" {
  description = "The VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "The VM admin username"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The VM admin password (use SSH keys in production)"
  type        = string
  sensitive   = true
}
