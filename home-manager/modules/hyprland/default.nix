{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.hyprland;
in
{
  options.fra.programs.hyprland = {
    enable = mkEnableOption "hyprland window manager";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gtk3
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        input = {
          kb_layout = "us";
          kb_variant = "dvorak";
          kb_options = "ctrl:nocaps";
        };
        bind =
          let
            binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
            mvfocus = binding "SUPER" "movefocus";
            ws = binding "SUPER" "workspace";
            resizeactive = binding "SUPER CTRL" "resizeactive";
            mvactive = binding "SUPER ALT" "moveactive";
            mvtows = binding "SUPER SHIFT" "movetoworkspace";
            arr = [ 1 2 3 4 5 6 7 8 9 ];
          in
          [
            "SUPER, A, exec, alacritty"
            "SUPER, RETURN, exec, alacritty"
            "SUPER, W, killactive"
            "SUPER, F, fullscreen"
            "SUPER, P, togglesplit"
            (mvfocus "k" "u")
            (mvfocus "j" "d")
            (mvfocus "l" "r")
            (mvfocus "h" "l")
            (ws "left" "e-1")
            (ws "right" "e+1")
            (mvtows "left" "e-1")
            (mvtows "right" "e+1")
            (resizeactive "k" "0 -20")
            (resizeactive "j" "0 20")
            (resizeactive "l" "20 0")
            (resizeactive "h" "-20 0")
            (mvactive "k" "0 -20")
            (mvactive "j" "0 20")
            (mvactive "l" "20 0")
            (mvactive "h" "-20 0")
          ] ++ (map (i: ws (toString i) (toString i)) arr)
          ++ (map (i: mvtows (toString i) (toString i)) arr);
      };
    };
  };
}
