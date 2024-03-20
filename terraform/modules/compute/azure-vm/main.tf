resource "azurerm_network_interface" "main" {
  name                = "nic-${var.vm_name}"
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
  create_option        = var.disk_create_option
  disk_size_gb         = var.data_disks[count.index].disk_size_gb
}


resource "azurerm_virtual_machine_data_disk_attachment" "linux" {
  count              = var.vm_os_type == "Linux" ? length(var.data_disks) : 0
  managed_disk_id    = azurerm_managed_disk.main[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.main[0].id
  lun                = count.index
  caching            = var.data_disk_caching
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows" {
  count              = var.vm_os_type == "Windows" ? length(var.data_disks) : 0
  managed_disk_id    = azurerm_managed_disk.main[count.index].id
  virtual_machine_id = azurerm_windows_virtual_machine.main[0].id
  lun                = count.index
  caching            = var.data_disk_caching
}

