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
    '';
  };

  programs.vscode = {
    enable = true;
    userSettings = {
      "editor.fontFamily" = "monospace";
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
          "name" = "toggle explorer";
          "type" = "command";
          "command" = "workbench.view.explorer";
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
        size = 10;
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
    font = "monospace 10";
    package = pkgs.rofi.override {
      plugins = [
        pkgs.rofi-emoji
        pkgs.rofi-calc
      ];
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
