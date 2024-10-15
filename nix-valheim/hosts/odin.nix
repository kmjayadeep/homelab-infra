{ config, lib, pkgs, ... }: {

  networking = {
    hostName = "odin";
    interfaces.ens18 = {
      ipv4.addresses = [{
        address = "192.168.1.51";
        prefixLength = 24;
      }];
      ipv6.addresses = [{
        address = "fe80::100";
        prefixLength = 64;
      }];
    };
    defaultGateway = {
      address = "192.168.1.1";
      interface = "ens18";
    };
  };

  services.valheim = {
    worldName =  "First";
    serverName = "odin";
  };
}
