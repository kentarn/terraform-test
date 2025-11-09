locals {
  location = "norwayeast"
  rg_name  = "rg-terraform-vms"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = local.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-main"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-main"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# VM 1
module "vm1" {
  source              = "./modules/vm"
  vm_name             = "vm-001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.subnet.id
  private_ip          = "10.0.1.10"
  admin_password      = var.admin_password
}

# VM 2
module "vm2" {
  source              = "./modules/vm"
  vm_name             = "vm-002"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.subnet.id
  private_ip          = "10.0.1.11"
  admin_password      = var.admin_password
}

# VM 3
module "vm3" {
  source              = "./modules/vm"
  vm_name             = "vm-003"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.subnet.id
  private_ip          = "10.0.1.12"
  admin_password      = var.admin_password
}
