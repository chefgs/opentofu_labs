# Simple string output
output "project_name" {
  description = "The project name"
  value       = var.project_name
}

# Output from a resource attribute
output "resource_id" {
  description = "A randomly generated resource ID"
  value       = random_string.resource_id.result
}

# Output with a computed value
output "unique_id_hex" {
  description = "A unique ID in hexadecimal format"
  value       = random_id.unique_id.hex
}

# Output with a computed value using base64
output "unique_id_base64" {
  description = "A unique ID in base64 URL-safe format"
  value       = random_id.unique_id.b64_url
}

# Output combining multiple values
output "full_resource_name" {
  description = "A full resource name for use as cloud resource names"
  value       = "${var.project_name}-${var.environment}-${random_string.resource_id.result}"
}

# Output with a friendly name
output "friendly_name" {
  description = "A human-friendly random name"
  value       = random_pet.friendly_name.id
}

# Map output
output "resource_info" {
  description = "Combined resource information as a map"
  value = {
    project       = var.project_name
    environment   = var.environment
    resource_id   = random_string.resource_id.result
    unique_id     = random_id.unique_id.hex
    friendly_name = random_pet.friendly_name.id
  }
}
