{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.xplr;
in
{
  options.fra.programs.xplr = {
    enable = mkEnableOption "xplr file manager";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      xplr
    ];

    home.file = {
      ".config/xplr" = {
        recursive = false;
        source = ./dotfiles;
        target = ".config/xplr";
      };
    };
  };
}
