# Provider configuration for the provider block example
# This example uses the 'random' provider which requires no cloud credentials

terraform {
  # Require a minimum OpenTofu version
  required_version = ">= 1.6"

  required_providers {
    # The random provider generates random values
    # It does not require any authentication
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# Provider block configuration
# The random provider has no required configuration
provider "random" {}
