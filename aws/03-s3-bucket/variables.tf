variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The project name"
  type        = string
  default     = "opentofu-lab"
}

variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "The globally unique name for the S3 bucket"
  type        = string
  # S3 bucket names must be globally unique - customize this
  default = "opentofu-lab-example-bucket-change-me"
}
