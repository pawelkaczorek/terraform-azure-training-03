provider "azurerm" {
  features {}
}

data "azurerm_key_vault" "lz_keyvault" {
  name                = var.lz_keyvault_name
  resource_group_name = var.lz_keyvault_rg_name
}

data "azurerm_key_vault_secret" "password" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.lz_keyvault.id
}

module "vm" {
  source = "./../../modules/terraform-azure-vm"

  location       = "West Europe"
  environment    = "master"
  admin_password = data.azurerm_key_vault_secret.password.value
}