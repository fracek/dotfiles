{
  description = "Francesco's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    oxalica = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    with inputs;
    {

      # expose overlay to output.
      overlays.default = final: prev: (import ./overlays inputs) final prev;

      # common templates I use.
      templates = {
        rust = {
          path = ./templates/rust;
          description = "A rust project";
        };

        node = {
          path = ./templates/node;
          description = "A node project";
        };
      };

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
                  nix-ld.nixosModules.nix-ld
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

    } //

    (flake-utils.lib.eachSystem [ "x86_64-linux" ])
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}.extend self.overlays.default;
        in
        rec {
          # Custom packages added via the overlay are selectively exposed here, to
          # allow using them from other flakes that import this one.
          packages = flake-utils.lib.flattenTree {
            hello-custom = pkgs.hello-custom;
            supabase = pkgs.supabase;
          };
        }
      ) //

    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system}.extend self.overlays.default;
      in
      {
        # format with `nix fmt`.
        formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

        devShells = {
          ld = import ./shells/ld.nix { inherit pkgs; };
          node = import ./shells/node.nix { inherit pkgs; };
          go = import ./shells/go.nix { inherit pkgs; };
          protobuf = import ./shells/protobuf.nix { inherit pkgs; };
        };
      }
    ));
}
