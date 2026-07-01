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

variable "state_bucket_name" {
  description = "Globally unique name for the S3 state bucket"
  type        = string
  # Must be globally unique - replace with your own unique name
  default = "opentofu-state-change-me-unique"
}

variable "lock_table_name" {
  description = "Name for the DynamoDB lock table"
  type        = string
  default     = "opentofu-state-lock"
}
