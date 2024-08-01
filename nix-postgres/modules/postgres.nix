{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    restic
  ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_16;
    extraPlugins = with pkgs.postgresql_16.pkgs; [ pgvector ];
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
      # Dockge hosts
      host  all      all    172.25.0.0/16    scram-sha-256
    '';
  };

  environment.etc.restic-env.source = ../secrets/secret-restic.env;

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
      source /etc/restic-env
      for DB_NAME in totp planka; do
        ${pkgs.postgresql_16}/bin/pg_dump -d "''$DB_NAME" > "/tmp/postgres-backup/''${DB_NAME}_backup.sql"
      done
      ls /tmp/postgres-backup
      ${pkgs.restic}/bin/restic backup /tmp/postgres-backup
      ${pkgs.restic}/bin/restic forget --keep-monthly 12 --keep-last 10 --keep-daily 10 --prune
      ${pkgs.restic}/bin/restic snapshots
      mkdir -p /tmp/postgres-backup-prev
      mv /tmp/postgres-backup/* /tmp/postgres-backup-prev
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
