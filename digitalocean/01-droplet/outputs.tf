output "droplet_id" {
  description = "The Droplet ID"
  value       = digitalocean_droplet.example.id
}

output "ipv4_address" {
  description = "The public IPv4 address"
  value       = digitalocean_droplet.example.ipv4_address
}

output "status" {
  description = "The Droplet status"
  value       = digitalocean_droplet.example.status
}
