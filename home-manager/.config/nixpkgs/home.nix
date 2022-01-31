{ pkgs, config, ... }:

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
    neovim
    ranger
    tig
    ueberzug
    unrar
    unzip
  ];

  home.keyboard.layout = "us";

  xsession.enable = true;

  xsession.windowManager.awesome = {
    enable = true;
    luaModules = [
      pkgs.luaPackages.vicious
    ];
  };

  xsession.pointerCursor = {
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Snow";
    size = 24;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      hu = "${pkgs.exa}/bin/exa ";
      ha = "${pkgs.exa}/bin/exa -a";
      hh = "${pkgs.exa}/bin/exa -la";
      ht = "${pkgs.exa}/bin/exa --tree";
    };
    initExtra = ''
      set -o vi
      export EDITOR=vim
      source $HOME/.nix-profile/etc/profile.d/bash_completion.sh
      source ${pkgs.bashCompletion}/share/bash-completion/bash_completion
      source ${pkgs.nix-bash-completions}/share/bash-completion/completions/*
      export PS1="[\[$(tput sgr0)\]\[\033[38;5;5m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]]\\$\[$(tput sgr0)\] "
    '';
  };

  programs.vscode = {
    enable = true;
    userSettings = {
      "editor.fontFamily" = "monospace";
      "editor.fontSize" = 12;
      "workbench.colorTheme" = "Paper White";
      "workbench.iconTheme" = null;
      "workbench.activityBar.visible" = false;
      "workbench.statusBar.visible" = true;
      "workbench.sideBar.location" = "right";
      "editor.minimap.enabled" = false;
      "editor.lineNumbers" = "relative";
      "window.menuBarVisibility" = "toggle";
      "gitlens.advanced.telemetry.enabled" = false;
      "gitlens.codeLens.enabled" = false;
      "gitlens.currentLine.enabled" = false;
      "vim.easymotion" = true;
      "vim.incsearch" = true;
      "vim.useSystemClipboard" = true;
      "vim.useCtrlKeys" = true;
      "vim.hlsearch" = true;
      "vim.leader" = ",";
      "vim.normalModeKeyBindings" = [
        {
          "before" = ["<leader>" "<space>"];
          "commands" = ["whichkey.show"];
        }
        {
          "before" = ["<leader>" "n"];
          "commands" = [":nohl"];
        }
      ];
      "whichkey.sortOrder" = "alphabetically";
      "whichkey.delay" = 0;
      "whichkey.bindings" = [
        {
          "key" = ";";
          "name" = "commands";
          "type" = "command";
          "command" = "workbench.action.showCommands";
        }
        {
          "key" = "s";
          "name" = "save";
          "type" = "command";
          "command" = "workbench.action.files.save";
        }
        {
          "key" = "b";
          "name" = "+buffers";
          "type" = "bindings";
          "bindings" = [
            {
              "key" = "b";
              "name" = "show all";
              "type" = "command";
              "command" = "workbench.action.showAllEditors";
            }
            {
              "key" = "d";
              "name" = "close active editor";
              "type" = "command";
              "command" = "workbench.action.closeActiveEditor";
            }
            {
              "key" = "n";
              "name" = "next editor";
              "type" = "command";
              "command" = "workbench.action.nextEditor";
            }
            {
              "key" = "p";
              "name" = "previous editor";
              "type" = "command";
              "command" = "workbench.action.previousEditor";
            }
            {
              "key" = "u";
              "name" = "reopen closed editor";
              "type" = "command";
              "command" = "workbench.action.reopenClosedEditor";
            }
            {
              "key" = "y";
              "name" = "yank buffer";
              "type" = "commands";
              "commands" = [
                "editor.action.selectAll"
                "editor.action.clipboardCopyAction"
                "cancelSelection"
              ];
            }
          ];
        }
        {
          "key" = "e";
          "name" = "view explorer";
          "type" = "command";
          "command" = "workbench.view.explorer";
        }
        {
          "key" = "t";
          "name" = "toggle sidebar";
          "type" = "command";
          "command" = "workbench.action.toggleSidebarVisibility";
        }
        {
          "key" = "g";
          "name" = "+git";
          "type" = "bindings";
          "bindings" = [
            {
              "key" = "v";
              "name" = "view";
              "type" = "command";
              "command" = "workbench.view.scm";
            }
            {
              "key" = "a";
              "name" = "stage";
              "type" = "command";
              "command" = "git.stage";
            }
            {
              "key" = "o";
              "name" = "checkout";
              "type" = "command";
              "command" = "git.checkout";
            }
            {
              "key" = "c";
              "name" = "commit";
              "type" = "command";
              "command" = "git.commit";
            }
            {
              "key" = "p";
              "name" = "pull";
              "type" = "command";
              "command" = "git.pull";
            }
            {
              "key" = "P";
              "name" = "push";
              "type" = "command";
              "command" = "git.push";
            }
            {
              "key" = "s";
              "name" = "status";
              "type" = "command";
              "command" = "gitlens.showQuickRepoStatus";
            }
          ];
        }
      ];
      "[nix]" = {
        "editor.insertSpaces" = true;
        "editor.tabSize" = 2;
      };
    };
    keybindings = [
      {
        "key" = "ctrl+h";
        "command" = "workbench.action.navigateLeft";
      }
      {
        "key" = "ctrl+l";
        "command" = "workbench.action.navigateRight";
      }
      {
        "key" = "ctrl+j";
        "command" = "workbench.action.navigateDown";
      }
      {
        "key" = "ctrl+k";
        "command" = "workbench.action.navigateUp";
      }
      {
        "key" = "r";
        "command" = "renameFile";
        "when" = "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
      }
      {
        "key" = "enter";
        "command" = "-renameFile";
        "when" = "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
      }
      {
        "key" = "j";
        "command" = "list.focusDown";
        "when" = "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
      }
      {
        "key" = "k";
        "command" = "list.focusUp";
        "when" = "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
      }
      {
        "key" = "ctrl+j";
        "command" = "selectNextSuggestion";
        "when" = "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible";
      }
      {
        "key" = "ctrl+k";
        "command" = "selectPrevSuggestion";
        "when" = "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible";
      }
      {
        "key" = "ctrl+j";
        "command" = "workbench.action.quickOpenNavigateNext";
        "when" = "inQuickOpen";
      }
      {
        "key" = "ctrl+k";
        "command" = "workbench.action.quickOpenNavigatePrevious";
        "when" = "inQuickOpen";
      }
      {
        "key" = "a";
        "command" = "git.stage";
        "when" = "listFocus && sideBarFocus && activeViewlet == 'workbench.view.scm'";
      }
    ];
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    ];
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 9;
      };
      colors = {
        primary = {
          background = "#fefeff";
          foreground = "#000338";
        };
        normal = {
          black = "#fdf6e3";
          red = "#f74566";
          green = "#74f745";
          yellow = "#f7c845";
          blue = "#4592f7";
          magenta = "#d445f7";
          cyan = "#59c0f8";
          white = "#e2e4f3";
        };
        bright = {
          black = "#160741";
          red = "#f9718a";
          green = "#8af862";
          yellow = "#f9d36c";
          blue = "#6ca9f9";
          magenta = "#de71f9";
          cyan = "#89d3fa";
          white = "#fdf6e3";
        };
      };
    };
  };

  programs.rofi = {
    enable = true;
    font = "monospace 9";
    package = pkgs.rofi.override {
      plugins = [
        pkgs.rofi-emoji
        pkgs.rofi-calc
      ];
    };
    extraConfig = {
      fixed-num-lines = true;
      case-sensitive = false;
      matching = "fuzzy";
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          margin = 0;
          margin-bottom = 0;
          margin-top = 0;
          spacing = 0;
          font = "monospace 9";
          background-color = mkLiteral "#fefeff";
          text-color = mkLiteral "#000338";
        };

        "#listview" = {
          spacing = 0;
          scrollbar = true;
          dynamic = true;
          lines = 10;
          margin = 0;
          padding-top = 500;
        };

        "#window" = {
          width = 600;
          border = 4;
          border-radius = 0;
          border-color = mkLiteral "#000338";
        };

        "#mainbox" = {
          padding = 0;
          border = 0;
        };

        "#element" = {
          padding = 8;
        };

        "#element.normal.normal" = {
          background-color = mkLiteral "#fefeff";
          text-color = mkLiteral "#000338";
        };

        "#element.alternate.normal" = {
          background-color = mkLiteral "#fefeff";
          text-color = mkLiteral "#000338";
        };

        "#element.selected.normal" = {
          background-color = mkLiteral "#e2e4f3";
          text-color = mkLiteral "#000338";
        };

        "#inputbar" = {
          margin = 0;
          spacing = 0;
          border = mkLiteral "0 0 1 0";
          border-color = mkLiteral "#000338";
        };

        "#prompt" = {
          padding = 8;
          border = mkLiteral "0 1 0 0";
          border-color = mkLiteral "#000338";
        };

        "#entry" = {
          padding = 8;
        };

        "#scrollbar" = {
          width = 0;
          border = 0;
          handle-width = 0;
        };

        "element-text, element-icon" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
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

  programs.fzf = {
    enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Arc-Lighter";
      package = pkgs.arc-theme;
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

  services.gnome-keyring = {
    enable = true;
  };

  services.picom = {
    enable = true;
    experimentalBackends = true;
    backend = "xrender";
    shadow = true;
    shadowOffsets = [ (-20) (-5) ];
    shadowOpacity = "0.6";
    extraOptions = ''
      shadow-radius = 20;
    '';
  };
}
