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
      "workbench.colorTheme" = "Paper White";
      "workbench.iconTheme" = null;
      "workbench.activityBar.visible" = false;
      "workbench.statusBar.visible" = true;
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
          "before" = ["<leader>" "s"];
          "commands" = ["workbench.action.files.save"];
        }
        {
          "before" = ["<leader>" "n"];
          "commands" = [":nohl"];
        }
        {
          "before" = ["<leader>" "b" "d"];
          "commands" = ["workbench.action.closeActiveEditor"];
        }
        {
          "before" = ["<leader>" "b" "l"];
          "commands" = ["workbench.action.quickOpen"];
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
          "key" = "b";
          "name" = "buffers...";
          "type" = "bindings";
          "bindings" = [
            {
              "key" = "b";
              "name" = "show all";
              "type" = "command";
              "command" = "workbench.action.showAllEditors";
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
