# Locals example: demonstrates defining and using local values

# Local values block - computed expressions used throughout the config
locals {
  # Combine project and environment into a name prefix
  name_prefix = "${var.project_name}-${var.environment}"

  # Common tags applied to all resources
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "opentofu"
  }

  # Compute whether we are in production
  is_production = var.environment == "prod"

  # Name length varies by environment
  name_length = local.is_production ? 16 : 8
}

# Use locals in resource configuration
resource "random_string" "resource_name" {
  # Use the locally computed name length
  length  = local.name_length
  special = false
  upper   = false
}

resource "random_id" "resource_id" {
  keepers = {
    # Regenerate if the name prefix changes
    prefix = local.name_prefix
  }
  byte_length = 4
}
