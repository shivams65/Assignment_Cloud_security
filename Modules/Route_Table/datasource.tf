data "azurerm_subnet" "subnet" {
  name                 = "frontend-subnet-01"
  virtual_network_name = "App-Frontend-vnet"
  resource_group_name  = "Application"
}
