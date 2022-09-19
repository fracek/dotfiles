{
  description = "Francesco's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
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

    discocss = {
      url = "github:mlvzk/discocss/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    with inputs;
    {
      # format with `nix fmt`.
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      # expose overlay to output.
      overlays.default = final: prev: (import ./overlays inputs) final prev;

      # expose all modules in ./modules.
      nixosModules = builtins.listToAttrs
        (map
          (x:
            {
              name = x;
              value = import (./modules + "/${x}");
            }
          )
          (builtins.attrNames (builtins.readDir ./modules)));

      # each directory in ./machines is a host.
      nixosConfigurations = builtins.listToAttrs
        (map
          (x:
            {
              name = x;
              value = nixpkgs.lib.nixosSystem {
                # Make inputs and the flake itself accessible as module parameters.
                # Technically, adding the inputs is redundant as they can be also
                # accessed with flake-self.inputs.X, but adding them individually
                # allows to only pass what is needed to each module.
                specialArgs = { flake-self = self; } // inputs;
                system = "x86_64-linux";
                modules = [
                  (./machines + "/${x}/configuration.nix")
                  { imports = builtins.attrValues self.nixosModules; }
                  home-manager.nixosModules.home-manager
                ];
              };
            }
          )
          (builtins.attrNames (builtins.readDir ./machines)));

      # home manager configuration.
      homeConfigurations = {
        desktop = { pkgs, lib, username, ... }: {
          imports = [
            ./home-manager/profiles/common.nix
            ./home-manager/profiles/desktop.nix
          ] ++ (builtins.attrValues self.homeManagerModules);
        };
      };

      # home manager modules.
      homeManagerModules = builtins.listToAttrs
        (map
          (x:
            {
              name = x;
              value = import (./home-manager/modules + "/${x}");
            }
          )
          (builtins.attrNames (builtins.readDir ./home-manager/modules)));
    };
}
