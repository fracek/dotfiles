{ pkgs, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" ];

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
}
