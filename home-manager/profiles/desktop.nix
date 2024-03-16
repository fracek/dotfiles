{ pkgs, ... }:
{
  fra = {
    programs = {
      gnome.enable = true;
      alacritty.enable = true;
      neovim.enable = true;
      neomutt.enable = true;
      bash.enable = true;
      discord.enable = true;
      rofi.enable = true;
      obs-studio.enable = true;
      tmux.enable = true;
      xplr.enable = true;
      vscode.enable = true;
    };
    i18n.enable = true;
  };

  home.packages = with pkgs; [
    # nix
    any-nix-shell
    nil

    # system
    bind
    cachix
    zip
    mediainfo
    libguestfs-with-appliance
    unrar
    unzip
    pavucontrol
    file
    scrot
    xclip

    # cli
    btop
    htop
    feh
    fortune
    ranger
    ripgrep
    ueberzug

    # dev
    docker-client
    graphite-cli
    git
    grpcurl
    jq
    ngrok
    tree
    insomnia
    supabase-cli
    mirrord-bin
    starkli-bin
    httpie
    pgcli
    tig
    youplot
    meld
    buildah
    skopeo
    kubectl
    quint
    apalache
    duckdb
    mongodb-compass
    radicle-bin

    # office
    chromium
    libqalculate
    qalculate-gtk
    inkscape
    font-manager
    mailspring
    morgen
    figma-linux
    slack
    tdesktop
    zathura
    zoom-us
    mpv
    ffmpeg
    framesh
    notion-app-enhanced
    smile
    obsidian
  ];

  # Setup X11 session.
  xsession.enable = true;
  home.pointerCursor = {
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
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
        editor = "nvim";
        autocrlf = "input";
      };
      merge = {
        conflictStyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
      init = { defaultBranch = "main"; };
      push.default = "current";
      pull.rebase = true;
      fetch.prune = true;
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
        lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
      };
    };
    delta = {
      enable = true;
      options = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
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

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.rbw = {
    enable = true;
    settings = {
      email = "francesco@ceccon.me";
    };
  };

  programs.bat = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd j"
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk3.extraCss = ''
      VteTerminal,
      TerminalScreen,
      vte-terminal {
        padding: 10px 10px 10px 10px;
        -VteTerminal-inner-border: 10px 10px 10px 10px;
      }
    '';

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
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

  services.ssh-agent = {
    enable = true;
  };

  xdg = {
    mime.enable = true;
    mimeApps.defaultApplications = {
      "text/html" = "chromium.desktop";
      "x-scheme-handler/http" = "chromium.desktop";
      "x-scheme-handler/https" = "chromium.desktop";
      "x-scheme-handler/about" = "chromium.desktop";
      "x-scheme-handler/unknown" = "chromium.desktop";
    };
  };

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    DEFAULT_BROSWER = "${pkgs.chromium}/bin/chromium";
    GTK_THEME = "Catppuccin-Mocha-Compact-Pink-Dark";
  };
}
