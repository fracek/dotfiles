{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.fra.defaults.user;
in
{
  options.fra.defaults.user.enable = mkEnableOption "default user";

  config = mkIf cfg.enable {
    users.users.fra = {
      isNormalUser = true;
      shell = pkgs.bash;
      extraGroups = [ "wheel" "docker" "networkmanager" "audio" "dialout" ];
    };

    programs.bash.enableCompletion = true;

    nix.settings = {
      allowed-users = [ "fra" ];
      trusted-users = [ "root" "fra" ];
    };

    # Set timezone and language.
    time.timeZone = "Europe/Amsterdam";
    i18n.defaultLocale = "en_GB.UTF-8";
    console = { useXkbConfig = true; };
  };
}
