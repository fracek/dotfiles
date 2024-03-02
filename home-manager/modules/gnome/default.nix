{ config, pkgs, lib, ... }:
with lib;
with lib.hm.gvariant;
let
  cfg = config.fra.programs.gnome;
in
{
  options.fra.programs.gnome.enable = mkEnableOption "gnome";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnomeExtensions.pop-shell
    ];

    dconf.settings = {
      "org/gnome/desktop/input-sources" = {
        sources = [
          (mkTuple ["xkb" "us+dvorak"])
        ];
      };

      "org/gnome/desktop/interface" = {
        monospace-font-name = "Monospace 14";
        font-name = "Noto Sans 11";
        document-font-name = "Noto Sans 11";
      };

      "org/gnome/desktop/wm/preferences" = {
        titlebar-font = "Noto Sans Bold 11";
      };

      "org/gnome/shell" = {
         disable-user-extensions = false;
         enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
         ];
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "Catppuccin-Mocha-Compact-Pink-Dark";
      };
    };
  };
}