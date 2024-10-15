resource "proxmox_vm_qemu" "valheim" {
  target_node                 = "pluto"
  balloon                     = 0
  define_connection_info      = false
  bios                        = "ovmf"
  boot                        = "order=scsi0;ide2;net0"
  cores                       = 2
  cpu                         = "x86-64-v2-AES"
  hotplug                     = "network,disk,usb"
  kvm                         = true
  memory                      = 2048
  name                        = "valheim"
  numa                        = false
  onboot                      = true
  protection                  = false
  full_clone                  = false
  qemu_os                     = "l26"
  agent                       = 1
  scsihw                      = "virtio-scsi-single"
  sockets                     = 1
  tablet                      = true
  vcpus                       = 0
  vm_state                    = "running"
  tags                        = "game,valheim"
  disks {
    ide {
      ide2 {
        cdrom {
          iso         = "local:iso/latest-nixos-minimal-x86_64-linux.iso"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size                 = "100G"
          storage              = "local-lvm"
        }
      }
    }
  }
  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    model     = "virtio"
  }
}
