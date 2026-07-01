# This main.tf is 100% compatible with both Terraform and OpenTofu
# The HCL syntax, resource types, and behavior are identical

resource "random_string" "compatible_example" {
  length  = 16
  special = false
  upper   = true
  numeric = true
}

resource "random_pet" "friendly_name" {
  length    = 2
  separator = "-"
}
