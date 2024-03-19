module "random" {
  source = "../../random"
  length = 4
}


data "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "ssh-public"
  key_vault_id = data.azurerm_key_vault.main.id
}

resource "azurerm_network_interface" "main" {
  count               = var.vm_count
  name                = "nic-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  count               = var.vm_count
  name                = "vm-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.main[count.index].id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = data.azurerm_key_vault_secret.ssh_public_key.value
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}

resource "azurerm_managed_disk" "main" {
  count                = length(var.data_disks) * var.vm_count
  name                 = "data-disk-${count.index}-${count.index % length(var.data_disks)}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disks[count.index % length(var.data_disks)].managed_disk_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disks[count.index % length(var.data_disks)].disk_size_gb
}


resource "azurerm_virtual_machine_data_disk_attachment" "main" {
  count              = length(var.data_disks) * var.vm_count
  managed_disk_id    = azurerm_managed_disk.main[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.main[count.index % length(var.data_disks)].id
  lun                = count.index % length(var.data_disks)
  caching            = "ReadWrite"
}


