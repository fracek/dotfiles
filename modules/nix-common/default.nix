{ config, pkgs, lib, flake-self, nixpkgs, ... }:
with lib;
let cfg = config.fra.defaults.nix;
in
{

  options.fra.defaults.nix = { enable = mkEnableOption "nix defaults"; };

  config = mkIf cfg.enable {

    # Set the $NIX_PATH entry for nixpkgs. This is necessary in
    # this setup with flakes, otherwise commands like `nix-shell
    # -p pkgs.htop` will keep using an old version of nixpkgs.
    # With this entry in $NIX_PATH it is possible (and
    # recommended) to remove the `nixos` channel for both users
    # and root e.g. `nix-channel --remove nixos`. `nix-channel
    # --list` should be empty for all users afterwards
    nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
    nixpkgs.overlays = [ flake-self.overlays.default ];

    # Let 'nixos-version --json' know the Git revision of this flake.
    system.configurationRevision =
      nixpkgs.lib.mkIf (flake-self ? rev) flake-self.rev;
    nix.registry.nixpkgs.flake = nixpkgs;
    nix.registry.fra.flake = flake-self;

    # Allow unfree licenced packages
    nixpkgs.config.allowUnfree = true;

    # Enable flakes
    nix = {
      # Enable flakes
      package = pkgs.nixFlakes;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';

      settings = {
        # Save space by hardlinking store files
        auto-optimise-store = true;

        # Users allowed to run nix
        allowed-users = [ "root" ];
      };

      # Clean up old generations after 30 days
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
