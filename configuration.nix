# System configuration.

{ config, lib, pkgs, inputs, ... }:

{
  # Use systemd-boot efi boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Set timezone and language.
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = { useXkbConfig = true; };

  # Setup user account.
  users.users.fra = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker" "networkmanager" ];
  };

  # Setup fonts.
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [ dejavu_fonts jetbrains-mono ];

    fontconfig = {
      defaultFonts = {
        serif = [ "DejaVu Serif" ];
        sansSerif = [ "DejaVu Sans" ];
        monospace = [ "Jetbrains Mono" ];
      };
    };
  };

  # Setup networking.
  networking = { networkmanager.enable = true; };

  # Setup docker.
  virtualisation.docker.enable = true;

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
  services.localtime.enable = true;

  # Setup dconf.
  programs.dconf.enable = true;
  services.dbus.packages = [ pkgs.dconf ];

  # Setup bluetooth.
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Setup gnome keyring.
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  # Setup audio.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Packages and NixOS.
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
  };

  environment.systemPackages = [ pkgs.git pkgs.vim ];

  system.stateVersion = "22.05";
}
