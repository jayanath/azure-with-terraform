output "linux_resource_ids" {
  value = [for id in module.linux_vms[*].resource_id : id]
}

output "linux_vm_names" {
  value = [for name in module.linux_vms[*].vm_name : name]
}

output "linux_network_interface_ids" {
  value = [for nic_id in module.linux_vms[*].network_interface_id : nic_id]
}

output "linux_private_ips" {
  value = [for ip in module.linux_vms[*].private_ip : ip]
}

output "linux_data_disks" {
  value = [for disk in module.linux_vms[*].data_disks : disk]
}

output "linux_virtual_machines" {
  value     = [for vm in module.linux_vms[*].virtual_machine : vm]
  sensitive = true
}

output "windows_resource_ids" {
  value = [for id in module.windows_vms[*].resource_id : id]
}

output "windows_vm_names" {
  value = [for name in module.windows_vms[*].vm_name : name]
}

output "windows_network_interface_ids" {
  value = [for nic_id in module.windows_vms[*].network_interface_id : nic_id]
}

output "windows_private_ips" {
  value = [for ip in module.windows_vms[*].private_ip : ip]
}

output "windows_data_disks" {
  value = [for disk in module.windows_vms[*].data_disks : disk]
}

output "windows_virtual_machines" {
  value     = [for vm in module.windows_vms[*].virtual_machine : vm]
  sensitive = true
}
