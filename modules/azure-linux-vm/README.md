# Azure Linux VM Module

## Usage

```hcl
module "linux_vm" {
  source = "../../modules/azure-linux-vm"

  vm_name             = "my-linux-vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = "East US"
  subnet_id           = azurerm_subnet.example.id
  admin_username      = "azureuser"
  admin_password      = var.admin_password
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vm_name | Name of the VM | string | - | yes |
| resource_group_name | Resource group name | string | - | yes |
| location | Azure region | string | East US | no |
| subnet_id | Subnet ID | string | - | yes |
| vm_size | VM size | string | Standard_B1s | no |
| admin_username | Admin username | string | azureuser | no |
| admin_password | Admin password | string | - | yes (sensitive) |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | The VM resource ID |
| private_ip | The private IP address |
| public_ip | The public IP address |
