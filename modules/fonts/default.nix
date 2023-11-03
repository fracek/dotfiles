{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.defaults.fonts;
in
{
  options.fra.defaults.fonts.enable = mkEnableOption "fonts defaults";

  config = mkIf cfg.enable {
    nixpkgs.config.input-fonts.acceptLicense = true;

    fonts = {
      enableDefaultFonts = true;
      fonts = with pkgs; [
        dejavu_fonts
        noto-fonts
        noto-fonts-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        input-fonts
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "Input Serif" ];
          sansSerif = [ "Input Sans" ];
          monospace = [ "Input Mono Narrow" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
