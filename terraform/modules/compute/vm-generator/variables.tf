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
  type = number
}

variable "vm_name" {
  type = string
}

variable "windows_admin_password" {
  type    = string
  default = "P@$$w0rd1234!"
}

variable "vm_os_type" {
  type = string

}

variable "data_disks" {
  type = list(object({
    disk_size_gb      = number
    managed_disk_type = string
  }))
}
