# Azure Virtual Network example

resource "azurerm_resource_group" "example" {
  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location

  tags = {
    ManagedBy   = "opentofu"
    Environment = var.environment
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.project_name}-${var.environment}-vnet"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = {
    ManagedBy   = "opentofu"
    Environment = var.environment
  }
}

resource "azurerm_subnet" "public" {
  name                 = "public-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.public_subnet_prefix]
}

resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.private_subnet_prefix]
}
