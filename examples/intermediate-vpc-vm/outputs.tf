output "vpc_id" {
  description = "Simulated VPC ID"
  value       = "vpc-${random_id.vpc.hex}"
}

output "public_subnet_id" {
  description = "Simulated public subnet ID"
  value       = "subnet-${random_id.subnet_public.hex}"
}

output "private_subnet_id" {
  description = "Simulated private subnet ID"
  value       = "subnet-${random_id.subnet_private.hex}"
}

output "instance_id" {
  description = "Simulated instance ID"
  value       = "i-${random_id.instance.hex}"
}

output "instance_name" {
  description = "Friendly instance name"
  value       = "${local.name_prefix}-${random_pet.instance_name.id}"
}
