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
    supabase
    sapling
    gefyra
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
        editor = "code --wait -n";
        autocrlf = "input";
      };
      init = { defaultBranch = "main"; };
      push.default = "current";
      pull.rebase = true;
      fetch.prune = true;
      diff = {
        colorMoved = "zebra";
        tool = "vscode";
      };
      merge.tool = "vscode";
      "difftool \"vscode\"" = {
        cmd = "code -n --wait --diff $LOCAL $REMOTE";
      };
      "mergetool \"vscode\"" = {
        cmd = "code -n --wait $MERGED";
      };
      alias = {
        am = "amend";
        ab = "absorb";
        st = "status";
        br = "branch";
        ci = "commit";
        co = "checkout";
        sw = "switch";
        swc = "switch --create";
        re = "restore";
        reee = "restore --source=HEAD";
        brrr = "for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'";
      };
    };
  };

  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "https";
      enableGitCredentialHelper = true;
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
    provider = "manual";
    latitude = 52.0;
    longitude = 0.12;
  };

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 1e1e2e";
  };

  services.network-manager-applet = { enable = true; };
}
