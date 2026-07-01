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
  description = "DigitalOcean region slug"
  type        = string
  default     = "nyc3"
}

variable "droplet_size" {
  description = "Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "Droplet image slug"
  type        = string
  default     = "ubuntu-22-04-x64"
}
