{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  inputs.valheim-server = {
    url = "github:aidalgol/valheim-server-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, disko, valheim-server, ... }:
    {
      nixosConfigurations.valheim = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          valheim-server.nixosModules.default
          ./configuration.nix
          {
            networking.hostName = "valheim";
          }
        ];
      };
    };
}
