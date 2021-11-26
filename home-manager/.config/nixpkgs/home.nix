{ pkgs, ... }:

{
  home.packages = with pkgs; [
    atool
    atop
    bash-completion
    exa
    feh
    fortune
    git
    lua
    htop
    i3lock
    mediainfo
    nix-bash-completions
    ranger
    tig
    ueberzug
    unrar
    unzip
  ];

  home.keyboard.layout = "dvorak";

  xsession.enable = true;

  xsession.windowManager.awesome = {
    enable = true;
    luaModules = [
      pkgs.luaPackages.vicious
    ];
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      export EDITOR=vim
      source $HOME/.nix-profile/etc/profile.d/bash_completion.sh
      source ${pkgs.bashCompletion}/share/bash-completion/bash_completion
      source ${pkgs.nix-bash-completions}/share/bash-completion/completions/*
    '';
  };

  programs.vscode = {
    enable = true;
    userSettings = {
      "editor.fontFamily" = "monospace";
      "workbench.colorTheme" = "Moin Light";
      "workbench.activityBar.visible" = false;
      "workbench.statusBar.visible" = false;
      "editor.minimap.enabled" = false;
      "editor.lineNumbers" = "relative";
      "window.menuBarVisibility" = "toggle";
      "[nix]" = {
        "editor.insertSpaces" = true;
        "editor.tabSize" = 2;
      };
    };
    keybindings = [
      {
        key = "tab";
        command = "extension.vim_tab";
        when = "editorFocus && vim.active && !inDebugRepl && vim.mode != 'Insert' && editorLangId != 'magit'";
      }
      {
        key = "tab";
        command = "-extension.vim_tab";
        when = "editorFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'";
      }
      {
        key = "x";
        command = "magit.discard-at-point";
        when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
      }
      {
        key = "k";
        command = "-magit.discard-at-point";
      }
      {
        key = "-";
        command = "magit.reverse-at-point";
        when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
      }
      {
        key = "v";
        command = "-magit.reverse-at-point";
      }
      {
        key = "shift+-";
        command = "magit.reverting";
        when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
      }
      {
        key = "shift+v";
        command = "-magit.reverting";
      }
      {
        key = "shift+o";
        command = "magit.resetting";
        when = "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
      }
      {
        key = "shift+x";
        command = "-magit.resetting";
      }
      {
        key = "x";
        command = "-magit.reset-mixed";
      }
      {
        key = "ctrl+u x";
        command = "-magit.reset-hard";
      }
    ];
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "moin-theme";
        publisher = "nwwdles";
        version = "1.2.1";
        sha256 = "1anzh2x6434izdxf9c2844ygc3z04fljpc61nqmwqiz3hkwllnxf";
      }
      {
        name = "magit";
        publisher = "kahole";
        version = "0.6.23";
        sha256 = "0pfm45ln51wadqj5lccab7hmdd2j0a7dxh7fbfkp3gabicxndd02";
      }
    ];
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 10;
      };
      colors = {
        primary = {
          background = "#ffffff";
          foreground = "#000000";
        };
        normal = {
          black = "#000000";
          red = "#a60000";
          green = "#005e00";
          yellow = "#813e00";
          blue = "#0031a9";
          magenta = "#721045";
          cyan = "#00538b";
          white = "#ffffff";
        };
        bright = {
          black = "#282828";
          red = "#7f1010";
          green = "#104410";
          yellow = "#5f4400";
          blue = "#003497";
          magenta = "#752f50";
          cyan = "#005007";
          white = "#f8f8f8";
        };
      };
    };
  };

  programs.rofi = {
    enable = true;
    font = "monospace 10";
    package = pkgs.rofi.override {
      plugins = [
        pkgs.rofi-emoji
        pkgs.rofi-calc
      ];
    };
    padding = 10;
    colors = {
      window = {
        background = "#ffffff";
        border = "#00d3d0";
        separator = "#00d3d0";
      };
      rows = {
        normal = {
          background = "#ffffff";
          backgroundAlt = "#ffffff";
          foreground = "#000000";
          highlight = {
            background = "#00d3d0";
            foreground = "#000000";
          };
        };
      };
    };
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
      init = {
        defaultBranch = "main";
      };
    };
  };

  services.gnome-keyring = {
    enable = true;
  };

  services.picom = {
    enable = true;
  };
}
