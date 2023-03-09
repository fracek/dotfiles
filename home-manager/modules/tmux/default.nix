{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.tmux;
in
{
  options.fra.programs.tmux.enable = mkEnableOption "tmux";

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      prefix = "C-b";
      baseIndex = 1;
      keyMode = "vi";
      extraConfig = ''
      bind-key R source-file ~/.config/tmux/tmux.conf \; display-message "tmux config reloaded"
      set-option -g default-terminal "screen-256color"

      set-option -g status-position top
      set-option -g status-style bg=default,fg=#7f849c
      set-option -g status-justify absolute-centre
      set-option -g status-left ""
      set-option -g status-right ""

      set-option -g message-style bg=#eba0ac,fg=#1e1e2e

      set-window-option -g window-status-current-style fg=#b4befe
      '';
    };
  };
}


