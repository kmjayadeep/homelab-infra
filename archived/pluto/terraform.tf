terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
  required_version = "~> 1.9.2"
}

provider "proxmox" {
  pm_api_url = "https://pluto.cosmos.cboxlab.com:8006/api2/json"
}
