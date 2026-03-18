variable "address_space" {
    description = "address space for VNet"
    type = list(string)
    default = ["10.0.0.0/16"]
}


variable "aks_subnet_cidr" {
    description = "address space for subnet"
    type = string
    default = "10.0.1.0/24"
}

variable "resource_group_name" {
    description = "Name of resource group"
    type = string
}

variable "aks_subnet_name" {
    description = "Name for AKS subnet"
    type = string
}

variable "aks_vnet_name" {
    description = "Name for vnet"
    type = string
}

variable "location" {
    description = "Location of subnet"
    type = string
    default = "UKSouth"
}
