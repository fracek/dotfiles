{ nixpkgs, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  fra.desktop = {
    enable = true;
    hostname = "t460p";
  };

  # Use dhcp.
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Setup keyboard.
  services.xserver = {
    dpi = 160;
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "ctrl:swapcaps,altwin:swap_alt_win";
  };

  # Setup trackpoint.
  hardware.trackpoint.enable = true;
  hardware.trackpoint.emulateWheel = true;
  hardware.trackpoint.sensitivity = 200;
  hardware.trackpoint.speed = 255;

  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  # Setup power management
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
    };
  };

  system.stateVersion = "22.05";

  # Use systemd-boot efi boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
