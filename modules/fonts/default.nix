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
        noto-fonts-emoji

        (iosevka-bin.override {
          variant = "sgr-iosevka-aile";
        })

        (iosevka-bin.override {
          variant = "sgr-iosevka-etoile";
        })

        (iosevka-bin.override {
          variant = "sgr-iosevka-term-ss08";
        })
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "Iosevka Etoile" ];
          sansSerif = [ "Iosevka Aile" ];
          monospace = [ "Iosevka Term SS08" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
