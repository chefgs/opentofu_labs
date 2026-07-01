# String variable with a default value
variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "opentofu-lab"
}

# String variable with validation
variable "environment" {
  description = "The deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

# Number variable with validation
variable "name_length" {
  description = "The length of the generated name string"
  type        = number
  default     = 10

  validation {
    condition     = var.name_length >= 4 && var.name_length <= 32
    error_message = "Name length must be between 4 and 32 characters."
  }
}

# Boolean variable
variable "include_uppercase" {
  description = "Whether to include uppercase letters in the generated name"
  type        = bool
  default     = false
}

# List variable
variable "tags_list" {
  description = "A list of tag names to apply"
  type        = list(string)
  default     = ["opentofu", "tutorial", "iac"]
}

# Map variable
variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default = {
    ManagedBy = "opentofu"
    Purpose   = "tutorial"
  }
}
