output "name_prefix" {
  description = "The computed name prefix (from locals)"
  value       = local.name_prefix
}

output "resource_name" {
  description = "The generated resource name"
  value       = "${local.name_prefix}-${random_string.resource_name.result}"
}

output "is_production" {
  description = "Whether this is a production environment"
  value       = local.is_production
}

output "common_tags" {
  description = "The common tags map (from locals)"
  value       = local.common_tags
}
