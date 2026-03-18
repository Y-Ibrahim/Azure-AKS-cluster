variable "aks_storage_account_name" {
    description = "Name of the storage account name"
    type        = string
    default     = "yousufakstate"
}

variable "aks_resource_group_name" {
    description = "Name of the resource group"
    type        = string
    default     = "tfstate_storage_group"
}

variable "location" {
    description = "location of resource"
    type = string
    default =  "uksouth"
}

variable "subscription_id" {
  description = "The subscription ID for the Azure account"
  type        = string
}