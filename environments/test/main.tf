# New tfstate
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate_storage_group"
    storage_account_name = "yousufakstate"
    container_name       = "tfstate"
    key                  = "test.tfstate"
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id

}

# Kubernetes provider
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Helm provider
provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

# Create 'AKS-group' resource group
resource "azurerm_resource_group" "aks_rg" {
  name     = "AKS-group"
  location = var.location

  tags = {
    ENV = "test"
  }
}

# Module: Identity
module "identity" {
source = "../../modules/identity"
location = var.location
name     = var.cluster_name
resource_group_name = azurerm_resource_group.aks_rg.name
}

# Module: Fullcluster
module "test_cluster" {
source = "../../modules/tf_module_full_cluster"
location = var.location
name     = var.cluster_name
resource_group_name =  azurerm_resource_group.aks_rg.name
admin_group_object_id = module.identity.aks_admin_group_id
ssh_key = var.ssh_key

# node pool
node_count = 2
vm_size = "Standard_B4ms"
}

# Install Traefik onto cluster via helm
module "traefik" {
source  = "aigisuk/traefik/kubernetes"
version = "0.2.1"
}
