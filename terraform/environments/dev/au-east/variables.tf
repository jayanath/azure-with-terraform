variable "location" {
  type    = string
  default = "australiaeast"
}

variable "source_image_id" {
  type = string
}

variable "categories" {
  type = list(object({
    category = string
    retention_policy = object({
      enabled = bool
    })
  }))
  default = [
    { category = "Administrative", retention_policy = {
      enabled = false
    } },
    { category = "Alert", retention_policy = {
      enabled = false
    } },
    { category = "Autoscale", retention_policy = {
      enabled = false
    } },
    { category = "Recommendation", retention_policy = {
      enabled = false
    } },
    { category = "Security", retention_policy = {
      enabled = false
    } },
    { category = "Policy", retention_policy = {
      enabled = false
    } }
  ]
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "windows_data_disks" {
  type = list(object({
    disk_size_gb      = number
    managed_disk_type = string
  }))
  default = [{
    disk_size_gb      = 15
    managed_disk_type = "Standard_LRS"
    },
    {
      disk_size_gb      = 30
      managed_disk_type = "Standard_LRS"

  }]
}

variable "linux_data_disks" {
  type = list(object({
    disk_size_gb      = number
    managed_disk_type = string
  }))
  default = [{
    disk_size_gb      = 10
    managed_disk_type = "Standard_LRS"
    },
    {
      disk_size_gb      = 20
      managed_disk_type = "Standard_LRS"

  }]
}


variable "secret_permissions" {
  type    = list(string)
  default = ["Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"]
}

variable "certificate_permissions" {
  type = list(string)
  default = [
    "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
  ]
}

variable "key_permissions" {
  type = list(string)
  default = [
    "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
  ]
}

variable "storage_permissions" {
  type    = list(string)
  default = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
}
