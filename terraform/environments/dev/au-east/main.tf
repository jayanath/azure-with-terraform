module "azurerm_resource_group" {
  source      = "../../../modules/resource-group"
  location    = var.location
  environment = var.environment
}

module "azurerm_storage_account" {
  source              = "../../../modules/storage-account"
  resource_group_name = module.azurerm_resource_group.name
  location            = var.location
  environment         = var.environment
}

module "azurerm_log_analytics_workspace" {
  source              = "../../../modules/log-analytics"
  location            = var.location
  resource_group_name = module.azurerm_resource_group.name
  environment         = var.environment
}

data "azurerm_subscription" "current" {
}

module "azurerm_monitor_diagnostic_setting" {
  source                     = "../../../modules/monitoring"
  location                   = var.location
  storage_account_id         = module.azurerm_storage_account.id
  log_analytics_workspace_id = module.azurerm_log_analytics_workspace.id
  target_resource_id         = data.azurerm_subscription.current.id
  environment                = var.environment
  categories                 = var.categories
}
