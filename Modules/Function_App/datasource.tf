data "azurerm_service_plan" "Service_Plan" {
  name                = "example-app-service-plan"
  resource_group_name = "Application"
}

data "azurerm_storage_account" "Storage" {
  name                = "linuxfunctionappsa2511"
  resource_group_name = "Application"
}
