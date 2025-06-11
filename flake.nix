{
  description = "Francesco's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    madness = {
      url = "github:antithesishq/madness";
    };

    oxalica = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ethereum = {
      url = "github:nix-community/ethereum.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = { self, ... }@inputs:
    with inputs;
    {

      # expose overlay to output.
      overlays.default = (import ./overlays inputs);

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
                  madness.nixosModules.madness
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
            # devtools
            zed-editor-bin = pkgs.zed-editor-bin;
            apalache = pkgs.apalache;
            dagger = pkgs.dagger;
            quint = pkgs.quint;
            mirrord-bin = pkgs.mirrord-bin;
            starkli-bin = pkgs.starkli-bin;
            youplot = pkgs.youplot;
            aptakube = pkgs.aptakube;
            ghostty = pkgs.ghostty;
            berkeley-mono = pkgs.berkeley-mono;
            opencode = pkgs.opencode-git;
            # office
            mailspring = pkgs.mailspring;
            morgen = pkgs.morgen;
            smile = pkgs.smile;
            msty = pkgs.msty;
            en-croissant = pkgs.en-croissant;
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
          rust = import ./shells/rust.nix { inherit pkgs; };
          azure = import ./shells/azure.nix { inherit pkgs; };
        };
      }
    ));
}
