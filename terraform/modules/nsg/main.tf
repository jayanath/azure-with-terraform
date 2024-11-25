resource "azurerm_network_security_group" "main" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.nsg_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_address_prefix      = security_rule.value.sourceAddressPrefix
      source_port_range          = security_rule.value.sourcePortRange
      destination_address_prefix = security_rule.value.destinationAddressPrefix
      destination_port_range     = security_rule.value.destinationPortRange
    }
  }
}

