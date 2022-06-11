{ pkgs, ... }:

{
  enable = true;
  settings = {
    border_width = 0;
    window_gap = 24;
    split_ratio = 0.5;
    borderless_monocle = true;
    gapless_monocle = true;
    bottom_padding = 0;
    top_padding = 40;
    focus_follows_pointer = true;
  };
  monitors = { "*" = [ "1" "2" "3" "4" "5" ]; };
  rules = { };
  startupPrograms = [ ];
}
