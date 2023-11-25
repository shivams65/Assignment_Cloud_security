resource "azurerm_network_security_group" "NSG" {
  for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}