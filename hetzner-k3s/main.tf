# Define provider
terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

# Obtain ssh key data
data "hcloud_ssh_key" "ssh_key" {
  fingerprint = "f6:70:54:43:ee:b8:c6:36:ec:41:a8:76:8c:69:b2:73"
}

resource "hcloud_server" "k8s1" {
  name = "uranus"
  image = "ubuntu-22.04"
  location  = "nbg1"
  server_type = "cx21"
  ssh_keys  = ["${data.hcloud_ssh_key.ssh_key.id}"]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  firewall_ids = [hcloud_firewall.k8s_firewall.id]
}

# Output Server Public IP address 
output "server_ip_k8s1" {
 value = "${hcloud_server.k8s1.ipv4_address}"
}
