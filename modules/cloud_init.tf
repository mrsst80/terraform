data "local_file" "ssh_public_key" {
  filename = "${path.module}/files/id_ed25519_vm.pub"
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "snippets"
  node_name    = "sd102-07"

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${var.vm_name}
    timezone: Europe/Dublin
    users:
      - default
      - name: autoadm 
        groups:
          - sudo
        shell: /bin/bash
        passwd: '$6$yhSVXNY8b7jUt4tp$TfJxMuvKUsZ658FD47iso1mTPTt6sdv2Spk2a3h36NUo1vQl4/7Pf2ADZ2zKFvLFNTn/LBOkGuJyisqO5g7Y4/'
        lock_passwd: false
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    package_update: true
    packages:
      - qemu-guest-agent
      - net-tools
      - curl
      - python3
      - lvm2
      - python3-PyMySQL
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "user-data-cloud-config.yaml"
  }
}