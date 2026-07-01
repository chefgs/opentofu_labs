variable "instance_name" {
  description = "The name of the compute instance"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "zone" {
  description = "The GCP zone to create the instance in"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "The machine type for the instance"
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "The boot disk image"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "network" {
  description = "The VPC network name"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "The subnetwork name (optional)"
  type        = string
  default     = null
}

variable "create_public_ip" {
  description = "Whether to create an ephemeral public IP"
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment label"
  type        = string
  default     = "dev"
}

variable "additional_labels" {
  description = "Additional labels to apply"
  type        = map(string)
  default     = {}
}

variable "metadata" {
  description = "Instance metadata"
  type        = map(string)
  default     = {}
}
