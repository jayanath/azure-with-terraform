variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "subnet_id" {
  type = string
}

variable "vm_count" {
  type    = number
  default = 1
}

variable "vm_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "vm_os_type" {
  type = string
  validation {
    condition     = contains(["Linux", "Windows"], var.vm_os_type)
    error_message = "Valid values: Linux, Windows"
  }
  default = "Linux"
}

variable "storage_account_type" {
  type = string
  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_ZRS", "Premium_LRS", "PremiumV2_LRS", "Premium_ZRS", "StandardSSD_LRS", "UltraSSD_LRS"], var.storage_account_type)
    error_message = "Valid values: Standard_LRS, StandardSSD_ZRS, Premium_LRS, PremiumV2_LRS, Premium_ZRS, StandardSSD_LRS or UltraSSD_LRS"
  }
  default = "Standard_LRS"
}

variable "os_disk_caching" {
  type = string
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.os_disk_caching)
    error_message = "Valid values: None, ReadOnly, ReadWrite"
  }
  default = "ReadWrite"
}

variable "data_disk_caching" {
  type = string
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.data_disk_caching)
    error_message = "Valid values: None, ReadOnly, ReadWrite"
  }
  default = "ReadWrite"
}

variable "disk_create_option" {
  type = string
  validation {
    condition     = contains(["Attach", "Empty"], var.disk_create_option)
    error_message = "Valid values: Attach, Empty"
  }
  default = "Empty"
}

variable "data_disks" {
  type = list(object({
    disk_size_gb      = number
    managed_disk_type = string
  }))
}
