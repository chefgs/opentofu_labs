# Variables example: demonstrates different variable types and uses

# Generate a random string using string variable
resource "random_string" "name" {
  length  = var.name_length
  special = false
  upper   = var.include_uppercase
}

# Generate a random ID with environment-based keepers
resource "random_id" "env_id" {
  keepers = {
    environment = var.environment
    project     = var.project_name
  }
  byte_length = 4
}
