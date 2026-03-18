resource "azurerm_virtual_network" "aks_virtual_network" {
  name                = var.aks_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = {
    environment = var.cluster_name
  }
}

resource "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_virtual_network.name
  address_prefixes     = [var.aks_subnet_cidr]
}

resource "azurerm_network_security_group" "aks" {
  name                = "${var.aks_vnet_name}-aks-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "aks" {
  subnet_id                 = azurerm_subnet.aks.id
  network_security_group_id = azurerm_network_security_group.aks.id
}
