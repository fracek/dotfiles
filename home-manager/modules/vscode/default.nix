{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.vscode;
  extensions = (pkgs.vscodeExtensions.forVSCodeVersion pkgs.vscode.version).vscode-marketplace;
  vscode = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscode;
    vscodeExtensions = [
      extensions.vspacecode.whichkey
      extensions.vscodevim.vim
      extensions.streetsidesoftware.code-spell-checker
      extensions.editorconfig.editorconfig
      extensions.supermaven.supermaven
      # Git + Github
      # extensions.github.copilot
      # extensions.github.vscode-pull-request-github
      extensions.github.vscode-github-actions
      # extensions.mhutchie.git-graph
      # Language Specific
      extensions.biomejs.biome
      extensions.mylesmurphy.prettify-ts
      extensions.yoavbls.pretty-ts-errors
      extensions.rust-lang.rust-analyzer
      extensions.jnoortheen.nix-ide
      extensions.ms-azuretools.vscode-docker
      extensions.tamasfe.even-better-toml
      extensions.ziglang.vscode-zig
      extensions.informal.quint-vscode
      extensions.zxh404.vscode-proto3
      extensions.ms-vscode.hexeditor
      extensions.informal.quint-vscode
      # Look
      extensions.jdinhlife.gruvbox
      extensions.mvllow.rose-pine
      extensions.enkia.tokyo-night
      extensions.cdonohue.quill-icons
    ];
  };
in
{
  options.fra.programs.vscode.enable = mkEnableOption "vscode";

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = vscode // {
        inherit (pkgs.vscode) pname version;
      };
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "editor.fontFamily" = "monospace";
        "editor.fontSize" = 16;
        "editor.stickyScroll.enabled" = true;
        "workbench.iconTheme" = "quill-icons-minimal";
        "workbench.colorTheme" = "Tokyo Night";
        "workbench.activityBar.visible" = false;
        "workbench.editor.showTabs" = false;
        "workbench.statusBar.visible" = true;
        "workbench.sideBar.location" = "right";
        "editor.minimap.enabled" = false;
        "editor.lineNumbers" = "relative";
        "editor.formatOnSave" = true;
        "editor.semanticHighlighting.enabled" = true;
        "window.menuBarVisibility" = "toggle";
        "git.mergeEditor" = true;
        # Vim Config
        "vim.cursorStylePerMode.insert" = "line";
        "vim.cursorStylePerMode.normal" = "block";
        "vim.easymotion" = true;
        "vim.incsearch" = true;
        "vim.useSystemClipboard" = true;
        "vim.useCtrlKeys" = true;
        "vim.hlsearch" = true;
        "vim.leader" = ",";
        "vim.normalModeKeyBindings" = [
          {
            "before" = [ "<leader>" "<space>" ];
            "commands" = [ "whichkey.show" ];
          }
          {
            "before" = [ "<leader>" "n" ];
            "commands" = [ ":nohl" ];
          }
        ];
        "vim.handleKeys" = {
          "<C-p>" = false;
        };
        # Whichkey
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
                "key" = "g";
                "name" = "graph";
                "type" = "command";
                "command" = "git-graph.view";
              }
            ];
          }
        ];
        # Language Config
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "[nix]" = {
          "editor.insertSpaces" = true;
          "editor.tabSize" = 2;
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
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
          "when" =
            "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
        }
        {
          "key" = "enter";
          "command" = "-renameFile";
          "when" =
            "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
        }
        {
          "key" = "j";
          "command" = "list.focusDown";
          "when" =
            "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
        }
        {
          "key" = "k";
          "command" = "list.focusUp";
          "when" =
            "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
        }
        {
          "key" = "ctrl+j";
          "command" = "selectNextSuggestion";
          "when" =
            "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible";
        }
        {
          "key" = "ctrl+k";
          "command" = "selectPrevSuggestion";
          "when" =
            "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible";
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
          "when" =
            "listFocus && sideBarFocus && activeViewlet == 'workbench.view.scm'";
        }
      ];
    };
  };
}
