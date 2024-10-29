{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  inputs.valheim-server = {
    url = "github:kmjayadeep/valheim-server-flake/80cdc965dcf062caf7f0fc3a8fc68511a1d55567";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, disko, valheim-server,... }:
    {
      nixosConfigurations.valheim = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          valheim-server.nixosModules.default
          ./configuration.nix
          ./hosts/valheim.nix
        ];
      };

      nixosConfigurations.darkland = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          valheim-server.nixosModules.default
          ./configuration.nix
          ./hosts/darkland.nix
        ];
      };

      nixosConfigurations.odin = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          valheim-server.nixosModules.default
          ./configuration.nix
          ./hosts/odin.nix
        ];
      };
    };
}
