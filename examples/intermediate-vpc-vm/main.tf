# Intermediate example: VPC-like naming structure
# Demonstrates resource dependencies and naming patterns

locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

# Simulate VPC ID generation
resource "random_id" "vpc" {
  byte_length = 4
  keepers = {
    name = "${local.name_prefix}-vpc"
  }
}

# Simulate subnet IDs - depend on VPC
resource "random_id" "subnet_public" {
  byte_length = 4
  keepers = {
    vpc_id = random_id.vpc.hex
    type   = "public"
  }
}

resource "random_id" "subnet_private" {
  byte_length = 4
  keepers = {
    vpc_id = random_id.vpc.hex
    type   = "private"
  }
}

# Simulate instance - depends on subnet
resource "random_id" "instance" {
  byte_length = 4
  keepers = {
    subnet_id = random_id.subnet_public.hex
  }
}

resource "random_pet" "instance_name" {
  length = 2
  keepers = {
    id = random_id.instance.hex
  }
}
