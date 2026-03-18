# Create AKS cluster configuration
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                         = "${var.name}-cluster"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  dns_prefix                   = var.name

  default_node_pool {
    name = "system"
    node_count = var.node_count
    vm_size = var.vm_size
  }

  tags = {
    ENV = var.name
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = var.ssh_key
    }
  }

  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
    outbound_type = "loadBalancer"
  }

  azure_active_directory_role_based_access_control {
  azure_rbac_enabled     = true
  admin_group_object_ids = [var.admin_group_object_id]
  }

}


resource "azuread_group" "aks_devops" {
  display_name     = "AKS-DevOps"
  security_enabled = true
  description      = "DevOps access to AKS cluster"
}

resource "azurerm_role_assignment" "aks_admin" {
  scope                = azurerm_kubernetes_cluster.aks_cluster.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = var.admin_group_object_id
}
