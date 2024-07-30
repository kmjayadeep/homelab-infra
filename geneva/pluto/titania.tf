# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "proxmox_vm_qemu" "titania" {
  balloon                     = 0
  define_connection_info      = false
  bios                        = "ovmf"
  boot                        = "order=scsi0;ide2;net0"
  cores                       = 4
  cpu                         = "x86-64-v2-AES"
  hotplug                     = "network,disk,usb"
  kvm                         = true
  memory                      = 7000
  name                        = "titania"
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
  tags                        = "k8s"
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
          backup               = true
          discard              = false
          emulatessd           = false
          format               = "raw"
          iops_r_burst         = 0
          iops_r_burst_length  = 0
          iops_r_concurrent    = 0
          iops_wr_burst        = 0
          iops_wr_burst_length = 0
          iops_wr_concurrent   = 0
          iothread             = true
          mbps_r_burst         = 0
          mbps_r_concurrent    = 0
          mbps_wr_burst        = 0
          mbps_wr_concurrent   = 0
          readonly             = false
          replicate            = true
          size                 = "200G"
          storage              = "local-lvm"
        }
      }
    }
  }
  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    macaddr   = "EA:2F:81:C7:99:59"
    model     = "virtio"
    mtu       = 0
    queues    = 0
    rate      = 0
    tag       = -1
  }
  smbios {
    uuid         = "eff0ce2f-e9ea-4842-ba26-5863c84c82d7"
  }
}
