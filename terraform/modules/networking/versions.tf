terraform {
  required_version = ">=1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.2"
    }
  }
}
