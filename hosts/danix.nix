{ pkgs, ... }:

{
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

  # Printer
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplipWithPlugin ];
  };
}
