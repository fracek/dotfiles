{ config, lib, ... }:
with lib;
let
  cfg = config.fra.programs.wezterm;
in
{
  options.fra.programs.wezterm.enable = mkEnableOption "wezterm terminal emulator";

  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      enableBashIntegration = true;
    };

    home.file = {
      ".config/wezterm" = {
        recursive = true;
        source = ./config;
        target = ".config/wezterm";
      };
    };
  };
}