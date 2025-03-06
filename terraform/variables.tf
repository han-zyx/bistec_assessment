#resource group variables
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "bistec-rg"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default = "West Europe"
  
}

#AKS cluster variables
variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default = "bistec-cluster"
}

variable "aks_node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
  default = 1
}

variable "node_vm_size" {
  description = "The size of the nodes in the AKS cluster"
  type        = string
  default = "Standard_D2_v2"
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
  default = "bistecaks1"
}