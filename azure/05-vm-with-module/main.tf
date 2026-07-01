# Azure VM with module example

resource "azurerm_resource_group" "example" {
  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.project_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Use the reusable Azure Linux VM module
module "linux_vm" {
  source = "../../modules/azure-linux-vm"

  vm_name             = "${var.project_name}-${var.environment}-vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  subnet_id           = azurerm_subnet.example.id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  create_public_ip    = true
}
