{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.rofi;
in
{
  options.fra.programs.rofi.enable = mkEnableOption "rofi launcher";

  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      package =
        pkgs.rofi.override { plugins = [ pkgs.rofi-emoji pkgs.rofi-calc ]; };
      theme = ./dotfiles/theme.rasi;
    };
  };
}

