variable "prefix" {
  type        = string
  description = "The prefix which should be used for all resources in this module"
  default     = "vo"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this module should be created."
}

variable "admin_password" {
  type        = string
  description = "Password of admin user"
}