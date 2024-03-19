module "random" {
  source = "../random"
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.location}-main"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_cidr_ranges

}

resource "azurerm_subnet" "default" {
  name                 = "snet-${var.location}-default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.snet_cidr_ranges

}

resource "azurerm_network_security_group" "main" {
  name                = "nsg-default-${module.random.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
}

data "http" "myip" {
  url    = "https://ipv4.icanhazip.com"
  method = "POST"
}


resource "azurerm_network_security_rule" "rule100" {
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.main.name

  name                       = "rule-100"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "${chomp(data.http.myip.response_body)}/32"
  destination_address_prefix = "*"
}


resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.main.id
}

