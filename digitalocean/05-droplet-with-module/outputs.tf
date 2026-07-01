output "droplet_id" {
  description = "Droplet ID from module"
  value       = module.web_droplet.droplet_id
}

output "ipv4_address" {
  description = "Public IPv4 from module"
  value       = module.web_droplet.ipv4_address
}
