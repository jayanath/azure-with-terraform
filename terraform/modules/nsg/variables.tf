variable "nsg_rules" {
  description = "NSG rules configuration"
  type = list(object({
    name                     = string
    priority                 = number
    direction                = string
    access                   = string
    protocol                 = string
    sourceAddressPrefix      = string
    sourcePortRange          = string
    destinationAddressPrefix = string
    destinationPortRange     = string
  }))
  default = []
}

variable "nsg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}
