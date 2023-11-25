resource "azurerm_linux_function_app" "Functionapplication" {
  for_each = var.functionapp
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  service_plan_id            = data.azurerm_service_plan.Service_Plan.id

  storage_account_name       = data.azurerm_storage_account.Storage.name
  storage_account_access_key = data.azurerm_storage_account.Storage.primary_access_key
  site_config {}
}