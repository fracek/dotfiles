{ config, pkgs, lib, ... }:
with lib;
with lib.hm.gvariant;
let
  cfg = config.fra.programs.gnome;
in
{
  options.fra.programs.gnome.enable = mkEnableOption "gnome";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      pop-launcher
      gnomeExtensions.pop-shell
      gnomeExtensions.vitals
    ];

    programs.gnome-terminal = {
      enable = true;
      showMenubar = false;
      profile."3a7a63eb-4515-4532-81ba-de766b863396" = {
        default = true;
        visibleName = "Default";
        cursorShape = "underline";
        cursorBlinkMode = "on";
        colors = {
          backgroundColor = "#1e1e2e";
          foregroundColor = "#cdd6f4";
          cursor = {
            background = "#f5e0dc";
            foreground = "#1e1e2e";
          };
          highlight = {
            background = "#1e1e2e";
            foreground = "#585b70";
          };
          palette = [
            "#45475a"
            "#f38ba8"
            "#a6e3a1"
            "#f9e2af"
            "#89b4fa"
            "#f5c2e7"
            "#94e2d5"
            "#bac2de"
            "#585b70"
            "#f38ba8"
            "#a6e3a1"
            "#f9e2af"
            "#89b4fa"
            "#f5c2e7"
            "#94e2d5"
            "#a6adc8"
          ];
        };
      };
    };

    dconf.settings = {
      "org/gnome/desktop/input-sources" = {
        sources = [
          (mkTuple [ "xkb" "us+dvorak" ])
          (mkTuple [ "xkb" "us" ])
        ];
      };

      "org/gnome/desktop/interface" = {
        monospace-font-name = "Monospace 14";
        font-name = "Noto Sans 11";
        document-font-name = "Noto Sans 11";
      };

      "org/gnome/desktop/wm/preferences" = {
        titlebar-font = "Noto Sans Bold 11";
        num-workspaces = 10;
        focus-mode = "sloppy";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "pop-shell@system76.com"
          "Vitals@CoreCoding.com"
        ];
        favorite-apps = [
          "org.gnome.Terminal.desktop"
          "qalculate-gtk.desktop"
        ];
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "Catppuccin-Mocha-Compact-Pink-Dark";
      };

      "org/gnome/shell/extensions/pop-shell" = {
        search = [ "<Super>r" ];
        tile-by-default = true;
        hint-color-rgba = "#f5c2e7"; # pink
        fullscreen-launcher = true;
        active-hint = true;
        smart-gaps = false;
        gap-inner = mkUint32 4;
        gap-outer = mkUint32 4;
      };

      # Shortcuts
      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>w" ];
        minimize = [ ];
        maximize = [ "<Super>m" ];
        unmaximize = [ "<Super><Shift>m" ];
        move-to-monitor-down = [ ];
        move-to-monitor-left = [ ];
        move-to-monitor-right = [ ];
        move-to-monitor-up = [ ];
        move-to-workspace-left = [ ];
        move-to-workspace-right = [ ];
        switch-to-workspace-left = [ ];
        switch-to-workspace-right = [ ];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-5 = [ "<Super><Shift>5" ];
        move-to-workspace-6 = [ "<Super><Shift>6" ];
        move-to-workspace-7 = [ "<Super><Shift>7" ];
        move-to-workspace-8 = [ "<Super><Shift>8" ];
        move-to-workspace-9 = [ "<Super><Shift>9" ];
        move-to-workspace-10 = [ "<Super><Shift>0" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];
        switch-to-workspace-10 = [ "<Super>0" ];
      };

      "org/gnome/shell/keybindings" = {
        toggle-overview = [ "<Super>e" ];
        toggle-application-view = [ ];
        toggle-message-tray = [ ];
        toggle-quick-settings = [ ];
        focus-active-notification = [ ];
        switch-to-application-1 = [ ];
        switch-to-application-2 = [ ];
        switch-to-application-3 = [ ];
        switch-to-application-4 = [ ];
        switch-to-application-5 = [ ];
        switch-to-application-6 = [ ];
        switch-to-application-7 = [ ];
        switch-to-application-8 = [ ];
        switch-to-application-9 = [ ];
      };

      "org/gnome/mutter" = {
        overlay-key = "Super_R";
      };

      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ ];
        toggle-tiled-right = [ ];
      };

      "org/gnome/mutter/wayland/keybindings" = {
        restore-shortcuts = [ ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super><Shift>t";
        command = "gnome-terminal --window";
        name = "term";
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
        screensaver = [ ];
        screenreader = [ ];
        magnifier = [ ];
        magnifier-zoom-in = [ ];
        magnifier-zoom-out = [ ];
        help = [ ];
      };
    };
  };
}
