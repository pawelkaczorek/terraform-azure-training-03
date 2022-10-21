data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "lz" {
  name     = "rg-${var.prefix}-lz-${var.env}-001"
  location = var.location
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "st${var.prefix}${var.storage_account_name}${var.env}001"
  resource_group_name      = azurerm_resource_group.lz.name
  location                 = azurerm_resource_group.lz.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
//  allow_blob_public_access = var.allow_blob_public_access
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "stc-${var.prefix}-${var.storage_container_name}-${var.env}-001"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = var.container_access_type
}

resource "azurerm_key_vault" "lz" {
  name                        = "kv-${var.prefix}-${var.keyvault_name}-${var.env}-001"
  location                    = azurerm_resource_group.lz.location
  resource_group_name         = azurerm_resource_group.lz.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Set",
//      "get",
      "List",
//      "delete",
//       "purge",
    ]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.spn_object_id

    secret_permissions = [
//      "set",
      "Get",
//      "list",
//      "delete",
//     "purge",
    ]
  }
}

resource "random_password" "password" {
  length  = 20
  special = true
}

resource "azurerm_key_vault_secret" "password" {
  name         = "password"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.lz.id
  depends_on   = [azurerm_key_vault.lz]
}