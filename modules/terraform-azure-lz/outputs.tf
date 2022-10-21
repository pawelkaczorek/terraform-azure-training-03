output "resource_group_name" {
  value       = azurerm_resource_group.lz.name
  description = "Name of the resource group"
}

output "resource_group_location" {
  value       = azurerm_resource_group.lz.location
  description = "Location of the resource group"
}

output "storage_account_name" {
  value       = azurerm_storage_account.tfstate.name
  description = "Name of the storage account"
}

output "container_name" {
  value       = azurerm_storage_container.tfstate.name
  description = "Name of the container of the storage account"
}

output "keyvault_id" {
  value = azurerm_key_vault.lz.id
}

output "keyvault_vault_uri" {
  value = azurerm_key_vault.lz.vault_uri
}


output "keyvault_name" {
  value = azurerm_key_vault.lz.name
}

output "keyvault_rbac_id" {
  value = azurerm_key_vault.lz.id
}

output "password" {
  value     = random_password.password.result
  sensitive = true
}