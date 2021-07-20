resource azurerm_kubernetes_cluster "aks_cluster"{

  location = var.aks_resource_location
  name = var.aks_cluster_name
  resource_group_name = var.aks_resource_group_name
  tags = var.aks_resource_tags
  kubernetes_version = var.aks_map["aks_version"]
  private_cluster_enabled = var.aks_enable_private_cluster




  addon_profile {
    oms_agent {
      enabled = true
      log_analytics_workspace_id = var.aks_log_analytics_workspace_id
    }
  }

  network_profile {
    network_plugin = var.aks_map["aks_netPlugin"]
    docker_bridge_cidr = var.aks_map["aks_docker_bridge_cidr"]
    load_balancer_sku = var.aks_map["aks_load_balancer_sku"]
    service_cidr = var.aks_map["aks_service_cidr"]
    dns_service_ip = var.aks_map["aks_dns_service_ip"]
  }


  role_based_access_control {
    enabled = var.aks_map["rbac_enabled"]
  }


  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }


  dns_prefix = "sg"
  default_node_pool {
    name=var.aks_default_node_pool_settings["name"]
    vm_size = var.aks_default_node_pool_settings["vm_size"]
    enable_node_public_ip = var.aks_default_node_pool_settings["enable_node_public_ip"]
    max_pods = var.aks_default_node_pool_settings["max_pods"]
    os_disk_size_gb = var.aks_default_node_pool_settings["os_disk_size_gb"]
    enable_auto_scaling = var.aks_default_node_pool_settings["enable_auto_scaling"]
    max_count = var.aks_default_node_pool_settings["max_count"]
    min_count = var.aks_default_node_pool_settings["min_count"]
    type = var.aks_default_node_pool_settings["type"]
    vnet_subnet_id = var.vnet_subnet_id
    orchestrator_version = var.aks_default_node_pool_settings["version"]
    availability_zones = ["1","2","3"]
  }

}


