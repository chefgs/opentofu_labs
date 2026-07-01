variable "project_name" {
  description = "Project name"
  type        = string
  default     = "opentofulab"
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

variable "storage_account_name" {
  description = "Globally unique storage account name (3-24 lowercase alphanumeric)"
  type        = string
  # Storage account names must be 3-24 chars, lowercase letters and numbers only
  default = "opentofuchangeme"
}
