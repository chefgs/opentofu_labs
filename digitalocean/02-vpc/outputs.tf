output "vpc_id" {
  description = "The VPC ID"
  value       = digitalocean_vpc.example.id
}

output "vpc_name" {
  description = "The VPC name"
  value       = digitalocean_vpc.example.name
}

output "ip_range" {
  description = "The VPC IP range"
  value       = digitalocean_vpc.example.ip_range
}
