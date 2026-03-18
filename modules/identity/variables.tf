variable "name" {
  description = "name of cluster"
  type = string
}

variable "resource_group_name" {
    description = "name of resource group" 
    type = string
}

variable "location" {
    description = "location of resources"
    type = string
    default = "uksouth"
}

variable "aks_admin_users" {
  type = list(string)

  default = [
    ""
  ]
}
