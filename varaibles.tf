
# Everything below is for the module

variable "aks_resource_location" {
  description = "The location/region where we are creating the resource"
  type=string

}

variable "aks_enable_private_cluster" {
  type=bool
}

variable "aks_resource_group_name"{
  type=string
}
variable "aks_cluster_name" {
  type=string
}

variable "aks_resource_tags" {
  description = "The resources tag added to resource group"
  type=map(any)

}

variable "aks_map" {
  description = "values for aks cluster"
  type=map(any)

}

variable "aks_log_analytics_workspace_id"{
  type=string
}

variable "aks_default_node_pool_settings"{
  type=map(any)
  default = {

  }
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
  default = ""
}


variable "vnet_subnet_id" {
  type =  string
}

variable "aks_service_principal"{
  type=map(any)
  default = {

  }

}
