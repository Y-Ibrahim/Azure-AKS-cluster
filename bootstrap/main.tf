terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
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

resource "azurerm_resource_group" "AKS_group" {
  name     = var.aks_resource_group_name
  location = var.location
}

# Storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = var.aks_storage_account_name
  resource_group_name      = azurerm_resource_group.AKS_group.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage container
resource "azurerm_storage_container" "storage_container" {
  name                 = "test-name"
  storage_account_id   = azurerm_storage_account.storage_account.id
  container_access_type = "private"
}