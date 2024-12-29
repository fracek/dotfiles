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
      enableDefaultPackages = true;
      packages = with pkgs; [
        berkeley-mono
        dejavu_fonts
        noto-fonts
        noto-fonts-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "Noto Serif" ];
          sansSerif = [ "Noto Sans" ];
          monospace = [ "TX-02" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
