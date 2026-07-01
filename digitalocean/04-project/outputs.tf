output "project_id" {
  description = "The project ID"
  value       = digitalocean_project.example.id
}

output "project_name" {
  description = "The project name"
  value       = digitalocean_project.example.name
}
