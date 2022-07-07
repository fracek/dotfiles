# Configuration specific to the Lenovo T460p.
{ pkgs, ... }:

{
  # Use dhcp.
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Setup keyboard.
  services.xserver = {
    dpi = 160;
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "ctrl:swapcaps,altwin:swap_alt_win";
    synaptics.enable = true;
  };

  # Setup trackpoint.
  hardware.trackpoint.enable = true;
  hardware.trackpoint.emulateWheel = true;
  hardware.trackpoint.sensitivity = 200;
  hardware.trackpoint.speed = 255;

  # Setup hidpi.
  hardware.video.hidpi.enable = true;

  # Setup power management
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
    };
  };
}
