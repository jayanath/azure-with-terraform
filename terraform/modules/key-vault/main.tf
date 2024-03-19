module "random" {
  source = "../random"
  length = 4
}

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "main" {
  name                     = "kv-${module.random.result}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled = false

  sku_name = "standard"

}

resource "azurerm_key_vault_access_policy" "terraform_user" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
  ]

  secret_permissions = [
    "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"
  ]
}

resource "azurerm_key_vault_secret" "ssh_private_key" {
  name         = "ssh-private"
  value        = tls_private_key.main.private_key_pem
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "ssh-public"
  value        = tls_private_key.main.public_key_openssh
  key_vault_id = azurerm_key_vault.main.id
}
