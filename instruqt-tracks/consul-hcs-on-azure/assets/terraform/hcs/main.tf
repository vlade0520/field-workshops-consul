provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "hcs" {
  name     = "hcs-instruqt"
  location = "East US"
}

module "hcs" {
  source              = "cpu601/hcs/azurerm"
  resource_group_name = azurerm_resource_group.hcs.name
  application_name    = "hcs"
  consul_cluster_name = "instruqt-consul-cluster"
  external_endpoint   = true
  vnet_starting_ip_address = "10.1.3.0"
}

output "consul_url" {
  value = module.hcs.consul_url
}