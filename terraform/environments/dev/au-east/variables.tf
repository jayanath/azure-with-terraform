variable "location" {
  type    = string
  default = "australiaeast"
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

variable "data_disks" {
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
