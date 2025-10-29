{
  description = "My personal NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in
    {
    nixosConfigurations = {
      dt-polonium = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ ./hosts/polonium/configuration.nix ];
      };
      
      lt-caesium = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ ./hosts/caesium/configuration.nix ];
      };
    };
  };
}
