output "instance_id" {
  description = "The EC2 instance ID (from module)"
  value       = module.web_server.instance_id
}

output "public_ip" {
  description = "The EC2 public IP (from module)"
  value       = module.web_server.public_ip
}
