variable "name" {
  description = "name of cluster"
}

variable "resource_group_name" {
    description = "name of resource group" 
}

variable "location"{
    description = "location of resources"
}

variable "dns_prefix" {
    description = "value"
}

variable "vm_size" {
    description = "size of vm"
    default = "Standard_B4ms"
}