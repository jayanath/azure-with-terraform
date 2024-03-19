module "azurerm_resource_group" {
  source      = "../../../modules/resource-group"
  location    = var.location
  environment = var.environment
}

module "azurerm_key_vault" {
  source              = "../../../modules/key-vault"
  resource_group_name = module.azurerm_resource_group.name
  location            = var.location
}

module "azurerm_virtual_network" {
  source              = "../../../modules/networking"
  resource_group_name = module.azurerm_resource_group.name
  location            = var.location
}


module "azurerm_linux_virtual_machine" {
  source              = "../../../modules/compute/linux-vm"
  resource_group_name = module.azurerm_resource_group.name
  location            = var.location
  vm_size             = "Standard_DS2_v2"
  key_vault_name      = module.azurerm_key_vault.key_vault_id
  secret_name         = "ssh-public"
  subnet_id           = module.azurerm_virtual_network.subnet_id
  data_disks          = var.data_disks
  vm_count            = 3
  depends_on          = [module.azurerm_key_vault]
}


# module "azurerm_storage_account" {
#   source              = "../../../modules/storage-account"
#   resource_group_name = module.azurerm_resource_group.name
#   location            = var.location
#   environment         = var.environment
# }

# module "azurerm_log_analytics_workspace" {
#   source              = "../../../modules/log-analytics"
#   location            = var.location
#   resource_group_name = module.azurerm_resource_group.name
#   environment         = var.environment
# }

# data "azurerm_subscription" "current" {
# }

# module "azurerm_monitor_diagnostic_setting" {
#   source                     = "../../../modules/monitoring"
#   location                   = var.location
#   storage_account_id         = module.azurerm_storage_account.id
#   log_analytics_workspace_id = module.azurerm_log_analytics_workspace.id
#   target_resource_id         = data.azurerm_subscription.current.id
#   environment                = var.environment
#   categories                 = var.categories
# }
