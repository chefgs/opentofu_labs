# Resource block example: demonstrates defining multiple resources
# and referencing one resource's attributes in another

# First resource: a random string used as a name prefix
resource "random_string" "prefix" {
  length  = var.prefix_length
  special = false
  upper   = false
  numeric = false
}

# Second resource: a random ID used as a suffix
# This resource depends on random_string.prefix
resource "random_id" "suffix" {
  # keepers force this resource to regenerate when prefix changes
  keepers = {
    prefix = random_string.prefix.result
  }

  byte_length = 4
}

# Third resource: combines the prefix and suffix into a full name
resource "random_string" "full_name" {
  length  = var.prefix_length + 8
  special = false

  # This creates an implicit dependency on the two resources above
  keepers = {
    combined = "${random_string.prefix.result}-${random_id.suffix.hex}"
  }
}
