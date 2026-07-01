# Outputs example

resource "random_string" "resource_id" {
  length  = 8
  special = false
  upper   = false
}

resource "random_id" "unique_id" {
  byte_length = 8
}

resource "random_pet" "friendly_name" {
  length    = 2
  separator = "-"
}
