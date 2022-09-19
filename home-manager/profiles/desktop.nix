{ pkgs, ... }:
{
  fra = {
    programs = {
      awesome.enable = true;
      alacritty.enable = true;
      bash.enable = true;
      discord.enable = true;
      firefox.enable = true;
      rofi.enable = true;
      vscode.enable = true;
    };
  };

  home.packages = with pkgs; [
    any-nix-shell
    exa
    feh
    fortune
    git
    gh
    htop
    i3lock
    mediainfo
    neovim
    ranger
    ripgrep
    tig
    ueberzug
    unrar
    unzip
    zathura
  ];

  # Setup X11 session.
  xsession.enable = true;
  home.pointerCursor = {
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Snow";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
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
      push.default = "current";
    };
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
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

  services.redshift = {
    enable = true;
    provider = "geoclue2";
  };

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 1e1e2e";
  };

  services.network-manager-applet = { enable = true; };
}
