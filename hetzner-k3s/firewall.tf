resource "hcloud_firewall" "k8s_firewall" {
  name = "k8s_firewall"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # Pihole, Nginx
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # Pihole DNS
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "53"
    source_ips = [
      "193.176.87.136/32", # VPN IP
    ]
  }

  # Pihole DNS
  rule {
    direction = "in"
    protocol  = "udp"
    port      = "53"
    source_ips = [
      "193.176.87.136/32", # VPN IP
    ]
  }

  # ssh
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # Ingress Nginx
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # Kubernetes control plane
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "6443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}
