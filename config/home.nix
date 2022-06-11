# Home manager configuration.
{ config, pkgs, ... }:

{
  imports = [ ./alacritty.nix ];

  home.packages = with pkgs; [
    any-nix-shell
    exa
    feh
    fortune
    git
    gh
    htop
    mediainfo
    neovim
    ranger
    tig
    ueberzug
    unrar
    unzip
    zathura
  ];

  # Setup X11 session.
  xsession.enable = true;
  xsession.windowManager.bspwm = import ./bspwm.nix { pkgs = pkgs; };
  services.sxhkd = import ./sxhkd.nix { pkgs = pkgs; };
  # services.polybar.enable = true;

  home.pointerCursor = {
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Snow";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  programs.zsh = import ./zsh.nix { pkgs = pkgs; };
  programs.vscode = import ./vscode.nix { pkgs = pkgs; };
  # programs.alacritty = import ./alacritty.nix { };
  programs.rofi = import ./rofi.nix { pkgs = pkgs; };
  programs.firefox = import ./firefox.nix { pkgs = pkgs; };

  services.picom = {
    enable = true;
    experimentalBackends = true;
    backend = "xrender";
    shadow = true;
    shadowOffsets = [ (-20) (-5) ];
    shadowOpacity = "0.6";
    extraOptions = ''
      shadow-radius = 20;
      corner-radius = 10;
    '';
  };

  programs.git = {
    enable = true;
    iniContent = {
      user = {
        name = "Francesco Ceccon";
        email = "francesco@ceccon.me";
      };
      core = {
        editor = "vim";
        autocrlf = "input";
      };
      init = { defaultBranch = "main"; };
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Arc";
      package = pkgs.arc-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  services.gnome-keyring = { enable = true; };

  services.redshift = {
    enable = true;
    provider = "geoclue2";
  };

  services.network-manager-applet = { enable = true; };
}
