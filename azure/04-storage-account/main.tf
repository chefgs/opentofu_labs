# Azure Storage Account example

resource "azurerm_resource_group" "example" {
  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location

  tags = {
    ManagedBy = "opentofu"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Security: disable public blob access
  allow_nested_items_to_be_public = false

  # Security: require HTTPS
  enable_https_traffic_only = true

  # Security: minimum TLS version
  min_tls_version = "TLS1_2"

  tags = {
    ManagedBy   = "opentofu"
    Environment = var.environment
  }
}
