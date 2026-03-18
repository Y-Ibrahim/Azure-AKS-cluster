variable "cluster_name" {
    description = "Name of cluster"
    default = "test"
}

variable "location" {
    description = "region for cluster"
    default = "uksouth"
  
}

variable "subscription_id" {
  description = "The subscription ID for the Azure account"
  type        = string
}

variable "node_count" {
    description = "The no. of nodes to create"
    type = string
    default = 2
}

variable "ssh_key" {
    description = "ssh public key associated with VM"
}
