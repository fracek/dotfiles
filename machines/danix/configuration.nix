{ config, nixpkgs, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  fra = {
    desktop = {
      enable = true;
      hostname = "danix";
    };

    usbWakeupDisabled = {
      enable = true;

      devices = [
        {
          # Logitech receiver
          vendor = "046d";
          product = "c52b";
        }
        {
          # Moonlander keyboard
          vendor = "3297";
          product = "1969";
        }
      ];
    };
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  users.users.fra = { extraGroups = [ "i2c-dev" ]; };

  # Enable logitech mouse.
  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
  };

  # Enable vulkan.
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  # WiFi
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  # Printer
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplipWithPlugin ];
  };

  # vpn
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  system.stateVersion = "22.05";

  boot = {
    # Use systemd-boot efi boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    extraModulePackages = with config.boot.kernelPackages; [
      # Allow virtual camera in obs studio
      v4l2loopback
      perf
    ];

    kernel.sysctl = {
      "kernel.perf_event_paranoid" = -1;
    };

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };

  security.polkit.enable = true;
}
