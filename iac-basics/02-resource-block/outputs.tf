output "prefix" {
  description = "The generated prefix string"
  value       = random_string.prefix.result
}

output "suffix_hex" {
  description = "The generated suffix in hex format"
  value       = random_id.suffix.hex
}

output "combined_name" {
  description = "The prefix and suffix combined"
  value       = "${random_string.prefix.result}-${random_id.suffix.hex}"
}
