resource "proxmox_vm_qemu" "cosmos" {
  additional_wait             = null
  agent                       = 1
  agent_timeout               = null
  args                        = null
  automatic_reboot            = null
  balloon                     = 0
  bios                        = "seabios"
  boot                        = "order=scsi0"
  bootdisk                    = null
  ci_wait                     = null
  cicustom                    = null
  cipassword                  = null # sensitive
  ciuser                      = "cosmos"
  clone                       = null
  clone_wait                  = null
  cores                       = 4
  cpu                         = "host"
  define_connection_info      = false
  desc                        = null
  force_create                = false
  force_recreate_on_change_of = null
  full_clone                  = false
  hagroup                     = null
  hastate                     = null
  hotplug                     = "network,disk,usb"
  ipconfig0                   = "ip=192.168.1.20/24,gw=192.168.1.1"
  ipconfig1                   = null
  ipconfig10                  = null
  ipconfig11                  = null
  ipconfig12                  = null
  ipconfig13                  = null
  ipconfig14                  = null
  ipconfig15                  = null
  ipconfig2                   = null
  ipconfig3                   = null
  ipconfig4                   = null
  ipconfig5                   = null
  ipconfig6                   = null
  ipconfig7                   = null
  ipconfig8                   = null
  ipconfig9                   = null
  kvm                         = true
  machine                     = "q35"
  memory                      = 13000
  name                        = "cosmos"
  nameserver                  = "1.1.1.1"
  numa                        = false
  onboot                      = true
  os_network_config           = null
  os_type                     = null
  pool                        = null
  protection                  = false
  pxe                         = null
  qemu_os                     = "other"
  scsihw                      = "virtio-scsi-pci"
  searchdomain                = null
  skip_ipv4                   = null
  skip_ipv6                   = null
  sockets                     = 1
  ssh_forward_ip              = null
  ssh_private_key             = null # sensitive
  ssh_user                    = null
  sshkeys                     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVFwMXBBljf+W5diHw9sz+A5AQhojFh8xXHCvznJkebVimhPU18dP7aL6K91tMdx+1rDbW3XyqWlAcuJY55j/G1JMyMGGTSCWkUlovZArqFAWxyadQ9s7Ev13bSF+h2qaL1x8tFAYK/L/LR4OOHSKXzqdeS2WeZgIFEuBW6HDnlGGV0aVVLo6f7wTIt4QK48IiUxKDo+giN5vmXtcBg0F88DhbDtLip3Yab6Sqm4v5PCIM4XiKkULqMLGqfQoUItFi0MGEq1P2qvQ/pVdHEjMoPjXfnwI0Jr4T6NN/QO8lsEfyYlI8qtZ2MvTYdqmOvrY37cYx2BJsIQvwC1wzERgqboEUk0qsRwNqIUcAbOaBIADDn11FUQyvYZ2S8QeIqiwkdyE+jJuPTTgzh5RtuFoqyKuIQohzPDIhAmr65xygcYUyM7vRji5F20dVxc92fNc7ec1FCsbPoSHdW41PkimO2+plyhMFkYrbRo2Hzi6pW+LkmPDbZTMWDo6RM07G+1DIGoDUmSxCQDgkoHHG+x6U0mKh2YSX9zwIxr/9h/dvEyWYCG09XNmxFlGHNNlb0Us52UJ4Ax53WnNoxECH0RDojRQkn3m3v0xxFU9C/RaER48N7ppEDjL9dtcM0lF714TbpBQYBM2oJYJIoCX0Cj/fyrSxofHTYARsnBzblDZA9Q== kmjayadeep@gmail.com"
  startup                     = null
  tablet                      = true
  tags                        = "k3s"
  target_node                 = null
  target_nodes                = null
  vcpus                       = 0
  vm_state                    = "running"
  vmid                        = null
  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          asyncio              = null
          backup               = true
          cache                = null
          discard              = false
          emulatessd           = false
          format               = "raw"
          iops_r_burst         = 0
          iops_r_burst_length  = 0
          iops_r_concurrent    = 0
          iops_wr_burst        = 0
          iops_wr_burst_length = 0
          iops_wr_concurrent   = 0
          iothread             = false
          mbps_r_burst         = 0
          mbps_r_concurrent    = 0
          mbps_wr_burst        = 0
          mbps_wr_concurrent   = 0
          readonly             = false
          replicate            = true
          serial               = null
          size                 = "250G"
          storage              = "local-lvm"
          wwn                  = null
        }
      }
    }
  }
  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    macaddr   = "0A:39:2D:9A:5C:2F"
    model     = "virtio"
    mtu       = 0
    queues    = 0
    rate      = 0
    tag       = -1
  }
  smbios {
    family       = null
    manufacturer = null
    product      = null
    serial       = null
    sku          = null
    uuid         = "42c534c9-1bcf-4b07-b459-6d6805cc3581"
    version      = null
  }
}
