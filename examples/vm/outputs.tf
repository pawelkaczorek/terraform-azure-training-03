output "resource_group_name" {
  value       = module.vm.resource_group_name
  description = "Name of the resource group"
}

output "resource_group_location" {
  value       = module.vm.resource_group_location
  description = "Location of the resource group"
}

output "id" {
  value = module.vm.id
}