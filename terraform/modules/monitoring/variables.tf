variable "categories" {
  type = list(object({
    category = string
    retention_policy = object({
      enabled = bool
    })
  }))
}

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

variable "storage_account_id" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "target_resource_id" {
    type = string
}