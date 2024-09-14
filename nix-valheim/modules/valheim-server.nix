{
  config,
  pkgs,
  ...
}: {
  services.valheim = {
    enable = true;
    # crossplay = true;
    # password is in secret-valheim.nix
  };
}
