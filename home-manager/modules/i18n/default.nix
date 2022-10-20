{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.i18n;
in
{
  options.fra.i18n.enable = mkEnableOption "i18n";

  config = mkIf cfg.enable {
    i18n.inputMethod = {
      enabled = "fcitx5";

      fcitx5 = {
        addons = [
          pkgs.fcitx5-gtk
          pkgs.fcitx5-lua
          pkgs.fcitx5-chinese-addons
          pkgs.fcitx5-configtool
        ];
      };
    };

    home.sessionVariables = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      GLFW_IM_MODULE = "ibus";
    };
  };
}

