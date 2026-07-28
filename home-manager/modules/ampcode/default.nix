{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.ampcode;
in
{
  options.fra.programs.ampcode.enable = mkEnableOption "ampcode";

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      amp-cli
    ];

    xdg.configFile."amp/settings.json" = {
      source = ./settings.json;
    };
  };
}
