{
  config,
  pkgs,
  ...  
}: {
  services.valheim = {
    enable = true;
    serverName = "valheim-homelab";
    worldName = "DARKLAND";
    # password is in secret-valheim.nix
  };
}
