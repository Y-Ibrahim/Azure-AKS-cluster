variable "ssh_key" {
    description = "ssh public key associated with VM"
    type = string
}
variable "name" {
  description = "name of cluster"
}

variable "resource_group_name" {
    description = "name of resource group" 
}

variable "location" {
    description = "location of resources"
    type = string
    default = "uksouth"
}

variable "vm_size" {
    description = "size of vm"
    type = string
    default = "Standard_B4ms"
}

variable "acr_name" {
    description = "name of azure container registry"
    type = string
    default = "portfolio-website"
}

variable "node_count" {
    type = string
    description = "no. of nodes to create"
    default = 2

}

variable "admin_group_object_id" {
    type = string
    description = "ID of admin group object"
}
