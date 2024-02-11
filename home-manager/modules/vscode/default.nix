{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.vscode;
in
{
  options.fra.programs.vscode.enable = mkEnableOption "vscode";

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      userSettings = {
        "editor.fontFamily" = "monospace";
        "editor.fontSize" = 16;
        "editor.stickyScroll.enabled" = true;
        "workbench.iconTheme" = "quill-icons-minimal";
        "workbench.colorTheme" = "Omni";
        "workbench.activityBar.visible" = false;
        "workbench.editor.showTabs" = false;
        "workbench.statusBar.visible" = true;
        "workbench.sideBar.location" = "right";
        "editor.minimap.enabled" = false;
        "editor.lineNumbers" = "relative";
        "editor.formatOnSave" = true;
        "window.menuBarVisibility" = "toggle";
        "gitlens.advanced.telemetry.enabled" = false;
        "gitlens.codeLens.enabled" = false;
        "gitlens.currentLine.enabled" = false;
        "git.mergeEditor" = true;
        # Vim Config
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
                "key" = "s";
                "name" = "status";
                "type" = "command";
                "command" = "gitlens.showQuickRepoStatus";
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
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vim";
          publisher = "vscodevim";
          version = "1.27.1";
          sha256 = "sha256-tfQ6+rPjflMd4PZ50kXo336IiwyZxdvx7EHWMEjKh1I=";
        }
        {
          name = "whichkey";
          publisher = "VSpaceCode";
          version = "0.11.3";
          sha256 = "sha256-PnaOwOIcSo1Eff1wOtQPhoHYvrHDGTcsRy9mQfdBPX4";
        }
        {
          name = "gitlens";
          publisher = "eamodio";
          version = "2023.11.2804";
          sha256 = "sha256-bzfTILFvGS4Mhhy1LSGc40n3ekU4fCYtN2KOXAwLEiU=";
        }
        {
          name = "nix-ide";
          publisher = "jnoortheen";
          version = "0.2.2";
          sha256 = "sha256-jwOM+6LnHyCkvhOTVSTUZvgx77jAg6hFCCpBqY8AxIg=";
        }
        {
          name = "copilot";
          publisher = "GitHub";
          version = "1.138.570";
          sha256 = "sha256-/NKUPiWNlu47BV0vs8lM85wTOGPjZS8RdQzbXFH5Hvg=";
        }
        {
          name = "prettier-vscode";
          publisher = "esbenp";
          version = "10.1.0";
          sha256 = "sha256-SQuf15Jq84MKBVqK6UviK04uo7gQw9yuw/WEBEXcQAc=";
        }
        {
          name = "theme-omni";
          publisher = "rocketseat";
          version = "1.0.12";
          sha256 = "sha256-rZzyMc9iCVjEFmWCiLuKqohBwSbqoKEYRR2Bn5f6dbU=";
        }
        {
          name = "quill-icons";
          publisher = "cdonohue";
          version = "0.0.2";
          sha256 = "sha256-hi/NOVLJLoVo6Ka9xLTZ1lwrTyoBZoPf0ZpZMKXZmho=";
        }
      ];
    };
  };
}
