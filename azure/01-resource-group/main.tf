# Azure Resource Group example

resource "azurerm_resource_group" "example" {
  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location

  tags = {
    ManagedBy   = "opentofu"
    Environment = var.environment
    Project     = var.project_name
  }
}
