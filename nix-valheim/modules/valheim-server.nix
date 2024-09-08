{
  config,
  pkgs,
  ...
}: {
  services.valheim = {
    enable = true;
    serverName = "valheim-homelab";
    worldName = "First";
    # crossplay = true;
    # password is in secret-valheim.nix
  };
}
