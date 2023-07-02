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
        apple-fonts
        dejavu_fonts
        noto-fonts-emoji
        monolisa
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "New York" ];
          sansSerif = [ "SF Pro Display" ];
          monospace = [ "SF Mono" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
