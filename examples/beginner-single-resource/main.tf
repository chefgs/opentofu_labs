# A single resource: the simplest possible OpenTofu configuration
resource "random_string" "hello" {
  length  = 16
  special = false
}
