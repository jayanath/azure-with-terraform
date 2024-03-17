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
