output "kube_config" {
  value = azurerm_kubernetes_cluster.bistec_cluster.kube_config_raw

  sensitive = true
}