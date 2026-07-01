output "instance_id" {
  description = "Instance ID from module"
  value       = module.web_instance.instance_id
}

output "external_ip" {
  description = "External IP from module"
  value       = module.web_instance.nat_ip
}
