data "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "ssh-public"
  key_vault_id = data.azurerm_key_vault.main.id
}

resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_managed_disk" "main" {
  count                = length(var.data_disks)
  name                 = "${var.vm_name}-data-disk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disks[count.index].managed_disk_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disks[count.index].disk_size_gb
}


resource "azurerm_virtual_machine_data_disk_attachment" "main" {
  count              = length(var.data_disks)
  managed_disk_id    = azurerm_managed_disk.main[count.index].id
  virtual_machine_id = var.vm_os_type == "linux" ? azurerm_linux_virtual_machine.main[0].id : azurerm_windows_virtual_machine.main[0].id
  lun                = count.index
  caching            = "ReadWrite"
}


