{
  description = "Francesco's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    oxalica = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nur, ... }:
    let system = "x86_64-linux";
    in {
      nixosConfigurations = {
        t460p = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/t460p.nix
            ./hardware/t460p.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.fra = import ./config/home.nix;
              nixpkgs.overlays = [ nur.overlay ];
            }
          ];
        };

        danix = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/danix.nix
            ./hardware/danix.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.fra = import ./config/home.nix;
              nixpkgs.overlays = [ nur.overlay ];
            }
          ];
        };
      };
    };
}
