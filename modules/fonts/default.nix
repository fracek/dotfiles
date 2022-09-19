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
        cascadia-code
        noto-fonts-emoji
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "DejaVu Serif" ];
          sansSerif = [ "DejaVu Sans" ];
          monospace = [ "Cascadia Code" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
