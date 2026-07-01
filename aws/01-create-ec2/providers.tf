# AWS provider configuration for the EC2 example

terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.aws_region

  # Default tags applied to all resources created by this provider
  default_tags {
    tags = {
      ManagedBy   = "opentofu"
      Project     = var.project_name
      Environment = var.environment
    }
  }
}
