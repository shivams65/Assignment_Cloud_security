resource "azurerm_bastion_host" "Bastion" {
  for_each = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ipconfigname
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.publicip.id
  }
}