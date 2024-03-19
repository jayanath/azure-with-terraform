variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "secret_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_count" {
  type    = number
  default = 1
}

variable "data_disks" {
  type = list(object({
    disk_size_gb      = number
    managed_disk_type = string
  }))
}

