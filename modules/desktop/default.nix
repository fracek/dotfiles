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

    programs.regreet.enable = true;
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
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

    # Setup gnome related services.
    programs.seahorse.enable = true;
    services.gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
    };

    security = {
      polkit.enable = true;
    };
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };

    # Setup audio.
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Fix for kube + podman
    systemd.services."user@".serviceConfig = {
      Delegate = "memory pids cpu cpuset io";
    };

    nixpkgs.config.allowUnfree = true;
  };
}
