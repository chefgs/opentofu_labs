output "random_string" {
  description = "Random string resource (tracked in state)"
  value       = random_string.example.result
}

output "random_id_hex" {
  description = "Random ID in hex (tracked in state)"
  value       = random_id.example.hex
}

output "random_pet_name" {
  description = "Random pet name (tracked in state)"
  value       = random_pet.example.id
}
