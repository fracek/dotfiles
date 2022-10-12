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
        "editor.fontSize" = 15;
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = null;
        "workbench.activityBar.visible" = false;
        "workbench.editor.showTabs" = false;
        "workbench.statusBar.visible" = true;
        "workbench.sideBar.location" = "right";
        "editor.minimap.enabled" = false;
        "editor.lineNumbers" = "relative";
        "window.menuBarVisibility" = "toggle";
        "gitlens.advanced.telemetry.enabled" = false;
        "gitlens.codeLens.enabled" = false;
        "gitlens.currentLine.enabled" = false;
        "git.mergeEditor" = true;
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
          version = "1.23.2";
          sha256 = "dtIlgODzRdoMKnG9050ZcCX3w15A/R3FaMc+ZylvBbU=";
        }
        {
          name = "whichkey";
          publisher = "VSpaceCode";
          version = "0.11.3";
          sha256 = "PnaOwOIcSo1Eff1wOtQPhoHYvrHDGTcsRy9mQfdBPX4=";
        }
        {
          name = "gitlens";
          publisher = "eamodio";
          version = "12.2.2";
          sha256 = "gPhiytthf35eDhtzkSK2JZjtj4877la3hB1Cswbrszw=";
        }
        {
          name = "catppuccin-vsc";
          publisher = "Catppuccin";
          version = "2.0.0";
          sha256 = "RRiPhRImztCWyCu+klDsmvNhF49V9BTVeAnoOJ+i7hY=";
        }
      ];
    };
  };
}
