# Main configuration for the provider block example
# This creates a random string to demonstrate that the provider is working

resource "random_string" "example" {
  # Length of the random string
  length = var.string_length

  # Include lowercase letters
  lower = true

  # Include numbers
  numeric = true

  # Exclude special characters for simplicity
  special = false
}
