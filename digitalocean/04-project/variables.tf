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

variable "do_environment" {
  description = "DigitalOcean project environment (Development, Staging, Production)"
  type        = string
  default     = "Development"

  validation {
    condition     = contains(["Development", "Staging", "Production"], var.do_environment)
    error_message = "DO environment must be Development, Staging, or Production."
  }
}
