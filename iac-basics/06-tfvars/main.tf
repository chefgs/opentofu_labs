# tfvars example: demonstrates variable values from .tfvars files

locals {
  resource_name = "${var.project_name}-${var.environment}"
}

resource "random_string" "example" {
  length  = var.name_length
  special = false
  upper   = false
}

resource "random_id" "env_id" {
  keepers = {
    environment = var.environment
  }
  byte_length = 4
}
