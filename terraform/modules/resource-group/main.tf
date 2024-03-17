module "random" {
  source = "../random"
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.location}-${var.environment}-${module.random.result}"
  location = var.location
}