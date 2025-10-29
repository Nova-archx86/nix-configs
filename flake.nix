{
  description = "My personal NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in
    {
    nixosConfigurations = {
      dt-polonium = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/polonium/configuration.nix ];
      };
      
      lt-caesium = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/caesium/configuration.nix ];
      };
    };
  };
}
