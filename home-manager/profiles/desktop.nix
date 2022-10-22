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
      obs-studio.enable = true;
    };
    i18n.enable = true;
  };

  home.packages = with pkgs; [
    any-nix-shell
    discord
    exa
    feh
    fortune
    git
    git-absorb
    gh
    htop
    i3lock
    mediainfo
    neovim
    libguestfs-with-appliance
    ranger
    ripgrep
    tig
    ueberzug
    unrar
    unzip
    zathura
    monolisa
  ];

  # Setup X11 session.
  xsession.enable = true;
  home.pointerCursor = {
    package = pkgs.fuchsia-cursor;
    name = "Fuchsia";
    size = 32;
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
      pull.rebase = true;
      fetch.prune = true;
      diff.colorMoved = "zebra";
      alias = {
        st = "status";
        br = "branch";
        ci = "commit";
        sw = "switch";
        swc = "switch -c";
        re = "restore";
        ab = "absorb";
        reee = "restore --source=HEAD";
        brrr = "for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'";
      };
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
