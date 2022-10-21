output "resource_group_name" {
  value       = azurerm_resource_group.this.name
  description = "Name of the resource group"
}

output "resource_group_location" {
  value       = azurerm_resource_group.this.location
  description = "Location of the resource group"
}

output "id" {
  value       = azurerm_windows_virtual_machine.this.id
  description = "Id of the virtual machine."
}