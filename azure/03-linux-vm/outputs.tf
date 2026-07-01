output "vm_id" {
  description = "The VM resource ID"
  value       = azurerm_linux_virtual_machine.example.id
}

output "public_ip" {
  description = "The public IP address"
  value       = azurerm_public_ip.example.ip_address
}

output "private_ip" {
  description = "The private IP address"
  value       = azurerm_network_interface.example.private_ip_address
}
