{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.zellij;
in
{
  options.fra.programs.zellij.enable = mkEnableOption "zellij";

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableBashIntegration = false;
      settings = {
        theme = "tokyo-night";
        pane_frames = false;
        mouse_mode = true;
        default_layout = "compact";
      };
    };
  };
}



