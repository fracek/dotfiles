{ config, lib, pkgs, flake-self, nur, ... }:
with lib;
let
  cfg = config.fra.desktop;
in
{
  options.fra.desktop = {
    enable = mkEnableOption "the default desktop configuration";

    hostname = mkOption {
      type = types.str;
      default = null;
      example = "nixos";
      description = "the machine hostname";
    };

    withPicom = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Enable picom.
      '';
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      nur.overlay
      flake-self.overlays.default
    ];

    home-manager = {
      users.fra = flake-self.homeConfigurations.desktop;

      # DON'T set useGlobalPackages! It's not necessary in newer
      # home-manager versions and does not work with configs using
      # nixpkgs.config`
      useUserPackages = true;

      sharedModules = [ ];

      # Pass all flake inputs to home-manager modules aswell so we can use them
      # there.
      extraSpecialArgs = {
        inherit flake-self nur;
        withPicom = cfg.withPicom;
      };
    };

    fra = {
      defaults = {
        fonts.enable = true;
        user.enable = true;
        nix.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      git
      vim
      virt-manager
    ];

    # Setup networking.
    networking = {
      networkmanager.enable = true;
      hostName = cfg.hostname;

      firewall.enable = false;
      nftables.enable = true;

      nameservers = [
        "1.1.1.1"
      ];
    };

    # Setup docker/podman and qemu.
    virtualisation = {
      podman = {
        enable = true;
        dockerSocket.enable = true;
        autoPrune.enable = true;
      };

      libvirtd.enable = true;
    };

    # Enable X11.
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      displayManager.defaultSession = "xsession";
      displayManager.session = [{
        name = "xsession";
        manage = "desktop";
        start = "exec $HOME/.xsession";
      }];
    };

    # Enable geoclue2.
    services.geoclue2.enable = true;
    services.localtimed.enable = true;

    # Setup dconf.
    programs.dconf.enable = true;
    services.dbus.packages = [ pkgs.dconf ];

    # Setup bluetooth.
    services.blueman.enable = true;
    hardware.bluetooth.enable = true;

    # Setup gnome keyring.
    services.gnome.gnome-keyring.enable = true;
    programs.seahorse.enable = true;

    # Setup tailscale.
    services.tailscale.enable = true;

    # Setup audio.
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
    };

    nixpkgs.config.allowUnfree = true;
  };
}
