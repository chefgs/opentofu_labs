output "generated_name" {
  description = "The generated name string"
  value       = random_string.name.result
}

output "environment_id" {
  description = "The environment-specific random ID"
  value       = random_id.env_id.hex
}

output "full_resource_name" {
  description = "A full resource name combining project, environment, and random suffix"
  value       = "${var.project_name}-${var.environment}-${random_id.env_id.hex}"
}

output "all_tags" {
  description = "The tag map passed in"
  value       = var.tags
}
