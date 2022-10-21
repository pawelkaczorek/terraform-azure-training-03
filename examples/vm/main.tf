provider "azurerm" {
  features {}
}

module "vm" {
  source = "./../../modules/terraform-azure-vm"

  location       = "West Europe"
  environment    = "master"
  admin_password = "Almafa12345!"
}