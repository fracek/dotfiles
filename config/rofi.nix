{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "monospace 9";
    package =
      pkgs.rofi.override { plugins = [ pkgs.rofi-emoji pkgs.rofi-calc ]; };
    extraConfig = {
      fixed-num-lines = true;
      case-sensitive = false;
      matching = "fuzzy";
    };
  };
}
