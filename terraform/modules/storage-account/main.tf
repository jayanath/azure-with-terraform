module "random" {
  source = "../random"
  length = 3
}

resource "azurerm_storage_account" "main" {
  name                     = "st${var.location}${var.environment}${module.random.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
