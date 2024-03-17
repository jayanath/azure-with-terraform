module "random" {
  source = "../random"
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "log-${var.location}-${var.environment}-${module.random.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}