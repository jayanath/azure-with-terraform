
terraform {
  required_version = ">=1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
