terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">=0.50.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = var.proxmox_insecure

  # terrafrom must be able to connect to proxmox node to create a file for cloud-init
  ssh {
    agent = false
    private_key = file("${path.module}/files/id_ed25519_vm")
    username = "root"
    password = "CHANGE_ME"
  }
}
