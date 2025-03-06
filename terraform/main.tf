

resource "azurerm_kubernetes_cluster" "bistec_cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.bistec_rg.location
  resource_group_name = azurerm_resource_group.bistec_rg.name
  dns_prefix          = var.dns_prefix


  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }
 
}

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.example.kube_config_raw

#   sensitive = true
# }