output "resource_name" {
  description = "The generated resource name"
  value       = "${local.resource_name}-${random_string.example.result}"
}

output "environment_id" {
  description = "The environment-specific ID"
  value       = random_id.env_id.hex
}

output "applied_tags" {
  description = "The tags applied"
  value       = var.tags
}
