data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "App-vnet"
  resource_group_name  = "Application"
}
data "azurerm_public_ip" "publicip" {
  name                = "Bastionpublicip01"
  resource_group_name = "Application"
}