{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    restic
  ];

  environment.etc.restic-env.source = ../secrets/secret-restic.env;

  systemd.services.backup-valheim = {
    description = "Backup valheim worlds using restic";
    wants = ["network-online.target"];
    after = ["network-online.target"];

    serviceConfig = {
      Type = "oneshot";
      User = "valheim";
    };

    script = ''
      ${pkgs.restic}/bin/restic backup /var/lib/valheim/.config/unity3d/IronGate/Valheim/worlds_local
      ${pkgs.restic}/bin/restic forget --keep-monthly 12 --keep-last 10 --keep-daily 10 --prune
      ${pkgs.restic}/bin/restic snapshots
    '';
  };

  systemd.timers.backup-valheim = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };

}
