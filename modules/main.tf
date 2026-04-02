resource "proxmox_virtual_environment_vm" "vm1" {
  name      = var.vm_name
  node_name = var.node_name
  vm_id     = var.vm_id

  clone {
    vm_id = 9998
    full  = true
    node_name = "sd102-07"
  }
  
  agent {
    enabled = true
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.default_gateway
      }
    }
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
  }

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = "host"
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = var.storage
    interface    = "scsi0"
    size         = var.disk_size
  }

  # Data disk
  disk {
    datastore_id = var.storage
    interface    = "scsi1"
    size         = var.data_disk_size
  }
}
