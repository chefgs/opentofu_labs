# Output values for the provider block example

output "random_string_value" {
  description = "The generated random string"
  value       = random_string.example.result
}
