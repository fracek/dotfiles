{ pkgs, ... }:
{
  fra = {
    programs = {
      bash.enable = true;
      gnome.enable = true;
      neovim.enable = true;
      obs-studio.enable = true;
      tmux.enable = true;
      vscode.enable = true;
      xplr.enable = true;
      kitty.enable = true;
      zellij.enable = true;
      k9s.enable = true;
      ghostty.enable = true;
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
    wl-clipboard

    # cli
    btop
    htop
    feh
    fortune
    ranger
    ripgrep
    ueberzug

    # perf tools
    sysstat
    bpftrace
    bpftools
    bpftop

    # dev
    docker-client
    git
    git-absorb
    grpcurl
    gh-notify
    jq
    ngrok
    tree
    httpie
    pgcli
    tig
    youplot
    meld
    buildah
    skopeo
    kubectl
    windsurf
    # quint
    apalache
    duckdb
    mongodb-compass
    bruno
    hotspot
    fblog
    ollama

    # supabase-cli
    # mirrord-bin

    # office
    anki-bin
    chromium
    libqalculate
    qalculate-gtk
    inkscape
    pinta
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
    en-croissant
    notion-app-enhanced
    smile
    obsidian
    mailspring
    discord

    code-cursor
    msty
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
      commit = {
        verbose = true;
      };
      merge = {
        conflictStyle = "zdiff3";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      column = {
        ui = "auto";
      };
      branch = {
        sort = "-committerdate";
      };
      tag = {
        sort = "version:refname";
      };
      init = {
        defaultBranch = "main";
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      pull.rebase = true;
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      alias = {
        ca = "commit --amend";
        ab = "absorb";
        st = "status";
        br = "branch";
        ci = "commit";
        co = "checkout";
        sw = "switch";
        swc = "switch --create";
        re = "restore";
        reee = "restore --source=HEAD";
        rc = "rebase --continue";
        ra = "rebase --abort";
        brrr = "for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'";
        lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
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
    platformTheme.name = "gtk";
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
  };
}
