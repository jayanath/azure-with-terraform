variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "certificate_permissions" {
  type = list(string)
}

variable "key_permissions" {
  type = list(string)
}

variable "secret_permissions" {
  type = list(string)
}

variable "storage_permissions" {
  type = list(string)
}
