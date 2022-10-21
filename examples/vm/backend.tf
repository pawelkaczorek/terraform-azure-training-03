terraform {
  backend "azurerm" {
    resource_group_name  = "rg-vo-lz-master-001"
    storage_account_name = "stvolzmaster001"
    container_name       = "stc-vo-tfstate-master-001"
    key                  = "vm.tfstate"
  }
}