{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.awesome;
in
{
  options.fra.programs.awesome.enable = mkEnableOption "awesome window manager";

  config = mkIf cfg.enable {
    xsession.windowManager.awesome = {
      enable = true;
      luaModules = [ pkgs.luaPackages.vicious ];
    };

    home.packages = with pkgs; [
      # used by vicious
      alsa-utils
    ];

    services.picom = {
      enable = true;
      backend = "glx";
      shadow = true;
      shadowOffsets = [ (-20) (-5) ];
      shadowOpacity = 0.6;
      wintypes = {
        dock = {
          shadow = false;
          blur-background = false;
        };
      };
      settings = {
        "shadow-radius" = 20;
        "blur" = {
          method = "gaussian";
          size = 20;
          deviation = 5.0;
        };
      };
    };

    home.file = {
      ".config/awesome" = {
        recursive = false;
        source = ./dotfiles;
        target = ".config/awesome";
      };
    };
  };
}
