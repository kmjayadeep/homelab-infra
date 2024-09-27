{
  config,
  pkgs,
  ...
}: {
  boot.kernel.sysctl = {
    "fs.inotify.max_user_instances" = 1024;

    # Need for tailscale
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  services.tailscale = {
    enable = true;
    extraSetFlags = [
      "--accept-dns=false"
    ];
    extraUpFlags = [
      "--accept-dns=false"
    ];
  };

}