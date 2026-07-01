output "vm_id" {
  description = "VM resource ID (from module)"
  value       = module.linux_vm.vm_id
}

output "public_ip" {
  description = "Public IP address (from module)"
  value       = module.linux_vm.public_ip
}

output "private_ip" {
  description = "Private IP address (from module)"
  value       = module.linux_vm.private_ip
}
