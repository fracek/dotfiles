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
        # catppuccin mocha
        colors = {
          primary = {
            background = "0x1E1E2E";
            foreground = "0xCDD6F4";
            dim_foreground = "0xCDD6F4";
            bright_foreground = "0xCDD6F4";
          };
          cursor = {
            text = "0x1E1E2E";
            cursor = "0xF5E0DC";
          };
          vi_mode_cursor = {
            text = "0x1E1E2E";
            cursor = "0xB4BEFE";
          };
          search = {
            matches = {
              foreground = "0x1E1E2E";
              background = "0xA6ADC8";
            };
            focused_match = {
              foreground = "0x1E1E2E";
              background = "0xA6E3A1";
            };
            footer_bar = {
              foreground = "0x1E1E2E";
              background = "0xA6ADC8";
            };
          };
          hints = {
            start = {
              foreground = "0x1E1E2E";
              background = "0xF9E2AF";
            };
            end = {
              foreground = "0x1E1E2E";
              background = "0xA6ADC8";
            };
          };
          selection = {
            foreground = "0x1E1E2E";
            background = "0xF5E0DC";
          };
          normal = {
            black = "0x45475A";
            red = "0xF38BA8";
            green = "0xA6E3A1";
            yellow = "0xF9E2AF";
            blue = "0x89B4FA";
            magenta = "0xF5C2E7";
            cyan = "0x94E2D5";
            white = "0xBAC2DE";
          };
          bright = {
            black = "0x585B70";
            red = "0xF38BA8";
            green = "0xA6E3A1";
            yellow = "0xF9E2AF";
            blue = "0x89B4FA";
            magenta = "0xF5C2E7";
            cyan = "0x94E2D5";
            white = "0xA6ADC8";
          };
          dim = {
            black = "0x45475A";
            red = "0xF38BA8";
            green = "0xA6E3A1";
            yellow = "0xF9E2AF";
            blue = "0x89B4FA";
            magenta = "0xF5C2E7";
            cyan = "0x94E2D5";
            white = "0xBAC2DE";
          };
          indexed_colors = [
            {
              index = 16;
              color = "0xFAB387";
            }
            {
              index = 17;
              color = "0xF5E0DC";
            }
          ];
        };
      };
    };
  };
}
