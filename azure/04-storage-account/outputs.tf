output "storage_account_id" {
  description = "The storage account ID"
  value       = azurerm_storage_account.example.id
}

output "storage_account_name" {
  description = "The storage account name"
  value       = azurerm_storage_account.example.name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint"
  value       = azurerm_storage_account.example.primary_blob_endpoint
}
