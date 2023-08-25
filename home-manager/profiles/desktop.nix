{ pkgs, withPicom, ... }:
{
  fra = {
    programs = {
      awesome = {
        inherit withPicom;
        enable = true;
      };
      neovim.enable = true;
      neomutt.enable = true;
      alacritty.enable = true;
      bash.enable = true;
      discord.enable = true;
      firefox.enable = true;
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
    i3lock
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
    exa
    feh
    fortune
    ranger
    ripgrep
    ueberzug

    # dev
    git
    git-absorb
    git-branchless
    grpcurl
    jq
    ngrok
    insomnia
    supabase
    mirrord-bin
    starkli-bin
    tig
    youplot
    meld
    buildah
    skopeo

    # office
    chromium
    zoom
    inkscape
    openrgb
    mailspring
    morgen
    figma-linux
    slack
    tdesktop
    zathura
    mpv
    ffmpeg
    simplescreenrecorder
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

  programs.jujutsu = {
    enable = true;
    enableBashIntegration = false;
    settings = {
      user = {
        name = "Francesco Ceccon";
        email = "francesco@ceccon.me";
      };
      ui = {
        "default-command" = "st";
        "diff-editor" = "meld";
        "merge-editor" = "meld";
      };
      aliases = {
        "l" = [ "log" "-r" "(main..@):: | (main..@)-" ];
        "a" = [ "abandon" ];
        "b" = [ "branch" ];
      };
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

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "oomox-rose-pine";
      package = pkgs.rose-pine-icon-theme;
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

  xdg = {
    mime.enable = true;
    mimeApps.defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  home.sessionVariables = {
    DEFAULT_BROSWER = "${pkgs.firefox}/bin/firefox";
  };
}
