{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    http-server
  ];

  systemd.services = {
    http-server = {

      description = "HTTP Server for game files";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.http-server}/bin/http-server";
        WorkingDirectory = "/var/lib/valheim/.config/unity3d/IronGate/Valheim/worlds_local";
        Restart = "on-failure";
        RestartSec = 10;
      };

    };
  };

}
