variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "opentofu-lab"
}

variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "dev"
}
