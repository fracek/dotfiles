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
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      nur.overlays.default
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
      };
    };

    fra = {
      defaults = {
        fonts.enable = true;
        user.enable = true;
        nix.enable = true;
      };
    };

    madness.enable = true;

    environment.systemPackages = with pkgs; [
      git
      vim
      virt-manager
      man-pages
      man-pages-posix
      gnome-tweaks
      # config.boot.kernelPackages.perf
    ];

    # Yubikey
    security.pam = {
      u2f = {
        enable = true;
        settings = {
          interactive = true;
          cue = true;
          origin = "pam://yubi";
          authFile = pkgs.writeText "u2f-mappings" ''
            fra
            :Ek7piRaKrfqKy5sd2dcoR8tBWtd8AaKHJx2Blvglxl5Omm+EC5kkj/Es77PaYIWWZrhyfzokHrPQqujNGsOOiw==,8tqVvK6XIXo99G+iFLUH+FDWlUvRznG0XSU1dR/9jaI+g1n/3f8VxE31vjEp65+9UXAAG6OHxnf0kPyP0wVu7Q==,es256,+presence
          '';
        };
      };
      services = {
        login.u2fAuth = true;
        sudo.u2fAuth = true;
      };
    };
    services = {
      pcscd.enable = true;
      udev.packages = [ pkgs.yubikey-personalization ];
    };

    # Setup networking.
    networking = {
      networkmanager.enable = true;
      hostName = cfg.hostname;

      nftables.enable = true;
      firewall = {
        enable = false;
        trustedInterfaces = [ "tailscale0" ];
        allowedUDPPorts = [ config.services.tailscale.port ];
        allowedTCPPorts = [ 22 ];
      };


      nameservers = [
        "1.1.1.1"
      ];
    };

    documentation = {
      enable = true;
      man.enable = true;
      info.enable = true;
      dev.enable = true;
      nixos.enable = true;
    };

    # Setup docker/podman and qemu.
    programs.virt-manager.enable = true;
    virtualisation = {
      podman = {
        enable = true;
        dockerSocket.enable = true;
        autoPrune.enable = true;
      };

      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    # Enable Gnome.
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment = {
      gnome.excludePackages = with pkgs; [
        gnome-photos
        gnome-tour
        gnome-music
        epiphany
        tali
        iagno
        hitori
        atomix
        yelp
        gnome-initial-setup
      ];
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
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };

    # Setup audio.
    security.rtkit.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
    };

    programs.bcc.enable = true;

    # Fix for kube + podman
    systemd.services."user@".serviceConfig = {
      Delegate = "memory pids cpu cpuset io";
    };

    services.ollama = {
      enable = true;
    };

    nixpkgs.config.allowUnfree = true;
  };
}
