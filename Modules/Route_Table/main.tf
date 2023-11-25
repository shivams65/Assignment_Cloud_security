resource "azurerm_route_table" "routetable" {
  for_each = var.route_table
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name

  route {
    name           = each.value.routename
    address_prefix = each.value.address_prefix
    next_hop_type  = each.value.next_hop_type
  }

}

resource "azurerm_subnet_route_table_association" "route_association" {
  for_each = var.route_table
  subnet_id      = data.azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.routetable[each.key].id
}