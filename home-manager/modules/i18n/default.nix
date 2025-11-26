{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.i18n;
in
{
  options.fra.i18n.enable = mkEnableOption "i18n";

  config = mkIf cfg.enable {
    home.sessionVariables = {
      GTK_IM_MODULE = "xim";
      QT_IM_MODULE = "xim";
      XMODIFIERS = "@im=ibus";
      GLFW_IM_MODULE = "ibus";
    };
  };
}
