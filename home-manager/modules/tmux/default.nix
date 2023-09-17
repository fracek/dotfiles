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
      prefix = "C-h";
      baseIndex = 1;
      keyMode = "vi";
      extraConfig = ''
        bind-key R source-file ~/.config/tmux/tmux.conf \; display-message "tmux config reloaded"
        set-option -g default-terminal "screen-256color"

        set-option -g status-position top
        set-option -g status-style bg=default,fg=#cba6f7
        set-option -g status-justify absolute-centre
        set-option -g status-left ""
        set-option -g status-right ""

        set-option -g message-style bg=#f5c2e7,fg=#1e1e2e

        set-window-option -g window-status-current-style fg=#f5c2e7
        set-window-option -g mouse on
      '';
    };
  };
}


