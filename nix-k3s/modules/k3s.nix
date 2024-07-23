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
      "--cluster-cidr=10.61.0.0/16,2a04:ee41:83:71da:300::/96"
      "--service-cidr=10.91.0.0/16,2a04:ee41:83:71da:400::/112"
      "--snapshotter native"
      "--disable-network-policy"
      "--flannel-backend=none"
      "--node-ip=192.168.1.40,fe80::ccc"
      "--disable local-storage"
      "--disable-helm-controller"
      "--write-kubeconfig /home/operator/.kube/config"
      "--write-kubeconfig-mode 644"
    ];
  };

}
