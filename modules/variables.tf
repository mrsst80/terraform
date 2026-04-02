variable "proxmox_endpoint" {
  type        = string
  description = "Proxmox API endpoint URL (e.g. https://proxmox.example.com:8006)"
  default = "https://<change_me>:8006/api2/json"
}

variable "proxmox_api_token" {
  type        = string
  sensitive   = true
  description = "Proxmox API token in format: user@realm!token-name=secret-uuid"
}

variable "proxmox_insecure" {
  type        = bool
  default     = true
  description = "Skip TLS certificate verification"
}

variable "node_name" {
  type        = string
  description = "Proxmox node name where the VM will be created"
}

variable "vm_name" {
  type        = string
  description = "Name of the new virtual machine"
}

variable "vm_id" {
  type        = number
  default     = null
  description = "VMID for the new VM (null = auto-assign)"
}

variable "ssh_username" {
  type        = string
  description = "Username to create via cloud-init"
  default = "autoadm"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key to inject via cloud-init"
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIXQZHVzNF+cGiYMQhd0KffBWb77qvX3jQUwbXO01M1 stefan.stefanov@MACF1Q60X1PH3"
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

variable "storage" {
  type    = string
  default = "local-lvm"
}

variable "disk_size" {
  type    = number
  default = 50
}

variable "data_disk_size" {
  type    = number
  default = 150
}

variable "ip_address" {
  type    = string
  default = "dhcp"
}

variable "default_gateway" {
  type    = string
  default = null
}

