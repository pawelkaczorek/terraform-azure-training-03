resource "azurerm_resource_group" "this" {
  name     = "rg-${var.prefix}-vm-${var.environment}-001"
  location = var.location
}

resource "azurerm_virtual_network" "this" {
  name                = "vnet-${var.prefix}-vm-${var.environment}-001"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.2.0/24"]
}
//
resource "azurerm_network_interface" "this" {
  name                = "nic-${var.prefix}-vm-${var.environment}-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id

  }
}

resource "azurerm_public_ip" "this" {
  name                    = "pip-${var.prefix}-${var.environment}-001"
  location                = azurerm_resource_group.this.location
  resource_group_name     = azurerm_resource_group.this.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
}

resource "azurerm_windows_virtual_machine" "this" {
  name                = "vm-${var.environment}-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}