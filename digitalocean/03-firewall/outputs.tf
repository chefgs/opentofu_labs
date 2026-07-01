output "firewall_id" {
  description = "The firewall ID"
  value       = digitalocean_firewall.web.id
}

output "firewall_name" {
  description = "The firewall name"
  value       = digitalocean_firewall.web.name
}
