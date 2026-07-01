variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group to create the VM in"
  type        = string
}

variable "location" {
  description = "The Azure region to create the VM in"
  type        = string
  default     = "East US"
}

variable "subnet_id" {
  description = "The subnet ID to attach the VM NIC to"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the VM (use SSH keys in production)"
  type        = string
  sensitive   = true
}

variable "create_public_ip" {
  description = "Whether to create a public IP for the VM"
  type        = bool
  default     = false
}

variable "additional_tags" {
  description = "Additional tags to apply"
  type        = map(string)
  default     = {}
}
