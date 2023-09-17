{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.defaults.fonts;
in
{
  options.fra.defaults.fonts.enable = mkEnableOption "fonts defaults";

  config = mkIf cfg.enable {
    fonts = {
      enableDefaultFonts = true;
      fonts = with pkgs; [
        dejavu_fonts
        noto-fonts
        noto-fonts-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        monolisa
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "Noto Serif" ];
          sansSerif = [ "Noto Sans" ];
          monospace = [ "MonoLisa" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
