{ nixpkgs, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  fra.desktop = {
    enable = true;
    hostname = "t460p";
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

  system.stateVersion = "22.05";

  # Use systemd-boot efi boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
