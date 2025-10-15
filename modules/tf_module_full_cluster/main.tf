# Create ACR
resource "azurerm_container_registry" "acr" {
  name = var.acr_name
  resource_group_name = var.resource
  location = var.location
  admin_enabled = false
}

# Create AKS cluster configuration
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                         = "${var.name}-cluster"
  resource_group_name          = var.resource
  location                     = "${var.region}"
  agent_public_key_certificate = filebase64("testdata/public.cer")
  dns_prefix                   = var.name

  default_node_pool {
    name = "system"
    node_count = 2
    vm_size = var.vm_size
  }
  identity {
    type = "SystemAssigned"
  }

  tags = {
    ENV = "Test"
  }
}

# Configure 