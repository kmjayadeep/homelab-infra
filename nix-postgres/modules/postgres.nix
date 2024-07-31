{ config, lib, pkgs, ... }: {

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_16;
    ensureDatabases = [
      "planka"
      "totp"
      "immich"
    ];
    ensureUsers = [
      {
        name = "planka";
        ensureDBOwnership = true;
      }
      {
        name = "totp";
        ensureDBOwnership = true;
      }
      {
        name = "immich";
        ensureDBOwnership = true;
      }
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser origin-address    auth-method
      local all      all                      trust
      # lan ipv4
      host  all      all    192.168.1.1/24    scram-sha-256
    '';
  };

  services.postgresqlBackup = {
    enable = true;
    startAt = "hourly";
    databases = [
      "immich"
      "totp"
      "planka"
    ];
  };

}
