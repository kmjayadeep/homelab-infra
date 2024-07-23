{ config, lib, pkgs, ... }: {

  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      "--disable traefik"
      "--disable servicelb"
      "--disable metrics-server"
      "--disable-cloud-controller"
      "--kube-controller-manager-arg=--node-cidr-mask-size-ipv6=112"
      "--kube-proxy-arg proxy-mode=ipvs"
      "--cluster-cidr=10.42.0.0/16,2001:cafe:42::/56"
      "--service-cidr=10.43.0.0/16,2001:cafe:43::/112"
      "--snapshotter native"
      "--disable-network-policy"
      "--node-ip=192.168.1.40"
      "--disable local-storage"
      "--disable-helm-controller"
      "--write-kubeconfig /home/operator/.kube/config"
      "--write-kubeconfig-mode 644"
    ];
  };

}
