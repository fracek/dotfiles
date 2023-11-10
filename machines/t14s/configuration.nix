# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  fra.desktop = {
    enable = true;
    hostname = "t14s";
    withPicom = false;
  };

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [
      "acpi_call"
    ];
    kernelParams = [
      "acpi_backlight=native"
      "mem_sleep_default=deep"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      acpi_call
    ];
  };

  # Use dhcp.
  networking.interfaces.wlp1s0.useDHCP = true;

  # Enable networking
  networking = {
    networkmanager.enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "ctrl:swapcaps,altwin:swap_alt_win";
  };

  # Setup trackpoint.
  hardware.trackpoint.enable = true;
  hardware.trackpoint.emulateWheel = true;
  hardware.trackpoint.sensitivity = 200;
  hardware.trackpoint.speed = 255;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Setup power management
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
    };
  };

  # fingerprint
  services.fprintd = {
    enable = true;
  };

  # needed by fprint
  security.polkit = {
    enable = true;
  };

  # vpn
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
