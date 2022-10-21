provider "azurerm" {
  features {}
}

module "lz" {
  source = "./../../modules/terraform-azure-lz"

  location      = "westeurope"
  spn_object_id = "ad3c975e-7c48-4da8-98eb-198558274829"
}