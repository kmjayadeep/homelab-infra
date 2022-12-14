resource "hcloud_floating_ip" "nginx-public" {
  name      = "nginx-public-ipv6"
  type      = "ipv6"
  server_id = hcloud_server.k8s1.id
}

# Output Floatng IP
output "floating_ipv6_nginx_public" {
 value = "${hcloud_floating_ip.nginx-public.ip_address}"
}

output "floating_ipv6_subnet_nginx_public" {
 value = "${hcloud_floating_ip.nginx-public.ip_network}"
}
