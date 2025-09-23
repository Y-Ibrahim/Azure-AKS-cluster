# Create AKS cluster configuration
resource "azurerm_arc_kubernetes_cluster" "aks_cluster" {
  name                         = "${var.name}-cluster"
  resource_group_name          = azure_resource_name
  location                     = "${var.region}"
  agent_public_key_certificate = filebase64("testdata/public.cer")
  dns_prefix                   = "var.name"

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