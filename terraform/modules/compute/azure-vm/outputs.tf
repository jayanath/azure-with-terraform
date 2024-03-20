output "resource_id" {
  value = var.vm_os_type == "linux" ? azurerm_linux_virtual_machine.main[*].id : azurerm_windows_virtual_machine.main[*].id
}

output "name" {
  value = azurerm_linux_virtual_machine.main[*].name
}

output "network_interface_id" {
  value = azurerm_network_interface.main.id
}

output "private_ip" {
  value = var.vm_os_type == "linux" ? azurerm_linux_virtual_machine.main[*].private_ip_address : azurerm_windows_virtual_machine.main[*].private_ip_address
}

output "data_disks" {
  value = [for disk in azurerm_managed_disk.main : disk]
}

output "virtual_machines" {
  value = var.vm_os_type == "linux" ? azurerm_linux_virtual_machine.main[*] : azurerm_windows_virtual_machine.main[*]
}
