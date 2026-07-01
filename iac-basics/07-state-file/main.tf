# State file example
# After applying this configuration, inspect the terraform.tfstate file
# to understand how OpenTofu tracks resources

resource "random_string" "example" {
  length  = 12
  special = false
}

resource "random_id" "example" {
  byte_length = 8
}

resource "random_pet" "example" {
  length    = 2
  separator = "-"
}
