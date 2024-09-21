{ config, lib, pkgs, ... }: {

  networking = {
    hostName = "darkland";
    interfaces.ens18 = {
      ipv4.addresses = [{
        address = "192.168.80.26";
        prefixLength = 24;
      }];
      ipv6.addresses = [{
        address = "fe80::101";
        prefixLength = 64;
      }];
    };
    defaultGateway = {
      address = "192.168.80.1";
      interface = "ens18";
    };
  };

  services.valheim = {
    worldName =  "DARKLAND";
    serverName = "valheim-homelab-darkland";
  };
}
