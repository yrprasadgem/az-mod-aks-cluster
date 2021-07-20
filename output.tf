output "aks_cluster_output" {
  description = "The Name of Newly Created Resource Group"
  value       =  "${azurerm_kubernetes_cluster.aks_cluster.name}"
}

