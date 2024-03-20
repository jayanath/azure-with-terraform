module "azurerm_resource_group" {
  source      = "../../../modules/resource-group"
  location    = var.location
  environment = var.environment
}

module "azurerm_key_vault" {
  source                  = "../../../modules/key-vault"
  resource_group_name     = module.azurerm_resource_group.name
  location                = var.location
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
  certificate_permissions = var.certificate_permissions
  storage_permissions     = var.storage_permissions
}

module "azurerm_virtual_network" {
  source              = "../../../modules/networking"
  resource_group_name = module.azurerm_resource_group.name
  location            = var.location
}


# module "linux_vms" {
#   source              = "../../../modules/compute/vm-generator"
#   resource_group_name = module.azurerm_resource_group.name
#   location            = var.location
#   vm_size             = "Standard_DS2_v2"
#   subnet_id           = module.azurerm_virtual_network.subnet_id
#   data_disks          = var.linux_data_disks
#   vm_count            = 2
#   vm_name             = "linux-vm"
#   depends_on          = [module.azurerm_virtual_network, module.azurerm_key_vault]
#   vm_os_type          = "Linux"
#   admin_password      = "P@$$w0rd1234!"
#   admin_username      = "adminuser"
# }

# module "windows_vms" {
#   source              = "../../../modules/compute/vm-generator"
#   resource_group_name = module.azurerm_resource_group.name
#   location            = var.location
#   vm_size             = "Standard_DS2_v2"
#   subnet_id           = module.azurerm_virtual_network.subnet_id
#   data_disks          = var.windows_data_disks
#   vm_count            = 3
#   vm_name             = "windows-vm"
#   depends_on          = [module.azurerm_virtual_network, module.azurerm_key_vault]
#   vm_os_type          = "Windows"
#   admin_password      = "P@$$w0rd1234!"
#   admin_username      = "adminuser"

# }




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
