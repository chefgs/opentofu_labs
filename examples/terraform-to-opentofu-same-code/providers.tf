# This file works with BOTH terraform and tofu
# Run with: terraform init && terraform apply
# OR run with: tofu init && tofu apply

terraform {
  required_version = ">= 1.6"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "random" {}
