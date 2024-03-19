variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_cidr_ranges" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "snet_cidr_ranges" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
