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

  systemd.services.backup-postgres = {
    description = "Backup the Postgres db using restic";
    wants = ["network-online.target"];
    after = ["network-online.target"];

    serviceConfig = {
      Type = "oneshot";
      User = "postgres";
    };

    script = ''
      set -eu
      mkdir -p /tmp/postgres-backup
      ${pkgs.postgresql_16}/bin/pg_dump totp > /tmp/postgres-backup/totp.sql
      ${pkgs.postgresql_16}/bin/pg_dump planka > /tmp/postgres-backup/planka.sql
    '';
  };

  systemd.timers.backup-postgres = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };

}
