{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package =
      pkgs.rofi.override { plugins = [ pkgs.rofi-emoji pkgs.rofi-calc ]; };
    theme = ./rofi/theme.rasi;
  };
}
