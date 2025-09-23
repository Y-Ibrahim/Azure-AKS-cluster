terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "AKS-group"
    storage_account_name = "yousufakstfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resourecs = false
    }
  }
  subscription_id = ""
}

resource "azurerm_resource_group" "AKS_group" {
  name     = "AKS-group"
  location = "uksouth"
}

