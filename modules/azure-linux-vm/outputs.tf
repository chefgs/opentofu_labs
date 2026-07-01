output "vm_id" {
  description = "The resource ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.id
}

output "private_ip" {
  description = "The private IP address of the VM"
  value       = azurerm_network_interface.this.private_ip_address
}

output "public_ip" {
  description = "The public IP address of the VM (if created)"
  value       = var.create_public_ip ? azurerm_public_ip.this[0].ip_address : null
}
