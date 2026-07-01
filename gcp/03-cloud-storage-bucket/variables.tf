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

variable "location" {
  description = "Bucket location (region or multi-region)"
  type        = string
  default     = "US"
}

variable "bucket_name" {
  description = "Globally unique bucket name"
  type        = string
  default     = "opentofu-lab-bucket-change-me"
}
