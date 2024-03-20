module "vm-generator" {
  count                = var.vm_count
  source               = "../azure-vm"
  vm_name              = "${var.vm_name}-${count.index}"
  resource_group_name  = var.resource_group_name
  location             = var.location
  vm_size              = var.vm_size
  subnet_id            = var.subnet_id
  data_disks           = var.data_disks
  vm_os_type           = var.vm_os_type
  storage_account_type = var.storage_account_type
  admin_username       = var.admin_username
  admin_password       = var.admin_password
}
