module "proxmox-clone" {
  source = "./modules/proxmox-clone"
  node_name = var.node_name
  vm_name = var.vm_name
  cores = var.cores
  sockets = var.sockets
  memory = var.memory
  data_disk_size = var.data_disk_size
}