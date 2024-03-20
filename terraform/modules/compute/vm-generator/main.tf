module "vm-generator" {
  count               = var.vm_count
  source              = "../azure-vm"
  vm_name             = "${var.vm_name}-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_size             = var.vm_size
  key_vault_name      = var.key_vault_name
  secret_name         = var.secret_name
  subnet_id           = var.subnet_id
  data_disks          = var.data_disks
  vm_os_type          = var.vm_os_type
}
