variable "vm_name" {
  type        = string
  description = "Name of the new virtual machine"
}

variable "cores" {
  type    = number
  default = 2
}

variable "sockets" {
  type    = number
  default = 1
}

variable "memory" {
  type        = number
  default     = 4096
  description = "RAM in MB"
}

variable "data_disk_size" {
  type    = number
  default = 150
}

variable "node_name" {
  type        = string
  description = "Proxmox node name where the VM will be created"
}