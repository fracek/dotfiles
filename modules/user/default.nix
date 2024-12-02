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
      extraGroups = [ "wheel" "podman" "networkmanager" "audio" "dialout" "libvirtd" ];
    };

    programs.bash = {
      completion.enable = true;
    };

    nix.settings = {
      allowed-users = [ "fra" ];
      trusted-users = [ "root" "fra" ];
    };

    i18n.defaultLocale = "en_GB.UTF-8";
    console = { useXkbConfig = true; };
  };
}
