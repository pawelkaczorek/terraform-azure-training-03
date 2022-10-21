variable "prefix" {
  type        = string
  description = "Prefix name of the module"
  default     = "vo"
}

variable "env" {
  type        = string
  description = "Environment name of the module"
  default     = "master"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "westeurope"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "lz"
}

variable "account_tier" {
  type        = string
  description = "Kind of account tier"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Type of account replication"
  default     = "LRS"
}

variable "allow_blob_public_access" {
  type        = bool
  description = "Allow blob public access"
  default     = true
}

variable "storage_container_name" {
  type        = string
  description = "Name of the storage container"
  default     = "tfstate"
}

variable "container_access_type" {
  type        = string
  description = "Type of container access"
  default     = "blob"
}

variable "keyvault_name" {
  type        = string
  description = "Name of the keyvault"
  default     = "lz"
}

variable "purge_protection_enabled" {
  type        = string
  description = "Enable purge protection"
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Soft deletetion period in days"
  default     = 7
}

variable "spn_object_id" {
  type = string
}