output "vm_ipv4_address" {
  value = proxmox_virtual_environment_vm.vm1.ipv4_addresses[1][0]
}

output "vm_id" {
  value = proxmox_virtual_environment_vm.vm1.id
}