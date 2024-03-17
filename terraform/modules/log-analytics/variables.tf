
variable "location" {
  type        = string
  description = "Azure region"
}

variable "environment" {
  type        = string
  description = "The environment: dev, staging, or prod"

  validation {
    condition     = var.environment == "dev" || var.environment == "staging" || var.environment == "prod"
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "sku" {
  type    = string
  default = "PerGB2018"
}

variable "resource_group_name" {
  type = string
}

variable "retention_in_days" {
  type    = number
  default = 30
}

