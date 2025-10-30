# Network Interface
resource "azurerm_network_interface" "azure_nic" {
  name                = "MCInfraNIC"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Linux VM
resource "azurerm_linux_virtual_machine" "azure_vm" {
  name                = "MCInfraVM"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.azure_vm_size
  admin_username      = "azureuser"
  disable_password_authentication = true
  network_interface_ids = [azurerm_network_interface.azure_nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("use your public key")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "20_04-lts"
  version   = "latest"
}
}
