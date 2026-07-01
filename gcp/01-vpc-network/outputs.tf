output "network_id" {
  description = "The VPC network ID"
  value       = google_compute_network.example.id
}

output "network_name" {
  description = "The VPC network name"
  value       = google_compute_network.example.name
}

output "public_subnet_id" {
  description = "The public subnet ID"
  value       = google_compute_subnetwork.public.id
}

output "private_subnet_id" {
  description = "The private subnet ID"
  value       = google_compute_subnetwork.private.id
}
