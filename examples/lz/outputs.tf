output "resource_group_name" {
  value       = module.lz.resource_group_name
  description = "Name of the resource group"
}

output "resource_group_location" {
  value       = module.lz.resource_group_location
  description = "Location of the resource group"
}

output "storage_account_name" {
  value       = module.lz.storage_account_name
  description = "Name of the storage account"
}

output "container_name" {
  value       = module.lz.container_name
  description = "Name of the container of the storage account"
}

output "keyvault_id" {
  value = module.lz.keyvault_id
}

output "keyvault_vault_uri" {
  value = module.lz.keyvault_vault_uri
}


output "keyvault_name" {
  value = module.lz.keyvault_name
}

output "keyvault_rbac_id" {
  value = module.lz.keyvault_rbac_id
}

output "password" {
  value     = module.lz.password
  sensitive = true
}