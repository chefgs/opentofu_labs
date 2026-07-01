variable "droplet_name" {
  description = "The name of the droplet"
  type        = string
}

variable "region" {
  description = "The DigitalOcean region slug"
  type        = string
  default     = "nyc3"
}

variable "size" {
  description = "The Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "The image slug for the droplet"
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "ssh_keys" {
  description = "List of SSH key IDs or fingerprints to enable"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "List of tags to apply to the droplet"
  type        = list(string)
  default     = []
}
