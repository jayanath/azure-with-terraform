output "resource_id" {
  value = [for id in module.vm-generator[*].resource_id : id]
}

output "vm_name" {
  value = [for name in module.vm-generator[*].vm_name : name]
}

output "network_interface_id" {
  value = [for nic_id in module.vm-generator[*].network_interface_id : nic_id]
}

output "private_ip" {
  value = [for ip in module.vm-generator[*].private_ip : ip]
}

output "data_disks" {
  value = [for disk in module.vm-generator[*].data_disks : disk]
}

output "virtual_machine" {
  value     = [for vm in module.vm-generator[*].virtual_machine : vm]
  sensitive = true
}
