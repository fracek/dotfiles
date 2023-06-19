{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.firefox;
in
{
  options.fra.programs.firefox.enable = mkEnableOption "firefox and extensions";

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles.default = {
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          darkreader
          tridactyl
          ublock-origin
        ];
      };
    };
  };
}
