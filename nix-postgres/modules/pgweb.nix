{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    pgweb
  ];

  environment.etc.pgweb-env.source = ../secrets/secret-pgweb.env;

  systemd.services.pgweb = {
    enable = true;
    description = "Postgres visualizer";

    script = ''
      source /etc/pgweb-env
      ${pkgs.pgweb}/bin/pgweb --url postgresql://pgweb:$POSTGRES_PASSWORD@192.168.1.41:5432/postgres?sslmode=disable --bind 0.0.0.0
    '';

  };

}
