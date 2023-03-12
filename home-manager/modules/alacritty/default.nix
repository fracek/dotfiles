{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.alacritty;
in
{
  options.fra.programs.alacritty.enable = mkEnableOption "alacritty terminal emulator";

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font = { size = 12; };
        window = {
          opacity = 0.98;
        };
        # rose pine colors
        colors = {
          primary = {
            background = "0x191724";
            foreground = "0xe0def4";
          };
          cursor = {
            text = "0xe0def4";
            cursor = "0x524f67";
          };
          vi_mode_cursor = {
            text = "0xe0def4";
            cursor = "0x524f67";
          };
          hints = {
            start = {
              foreground = "0x908caa";
              background = "0x1f1d2e";
            };
            end = {
              foreground = "0x6e6a86";
              background = "0x1f1d2e";
            };
          };
          selection = {
            text = "0xe0def4";
            background = "0x403d52";
          };
          bright = {
            black = "0x6e6a86";
            red = "0xeb6f92";
            green = "0x31748f";
            yellow = "0xf6c177";
            blue = "0x9ccfd8";
            magenta = "0xc4a7e7";
            cyan = "0xebbcba";
            white = "0xe0def4";
          };
          normal = {
            black = "0x26233a";
            red = "0xeb6f92";
            green = "0x31748f";
            yellow = "0xf6c177";
            blue = "0x9ccfd8";
            magenta = "0xc4a7e7";
            cyan = "0xebbcba";
            white = "0xe0def4";
          };
        };
      };
    };
  };
}
