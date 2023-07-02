{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.neovim;
in
{
  options.fra.programs.neovim.enable = mkEnableOption "neovim";

  config = mkIf cfg.enable {
    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      DIFFPROG = "nvim -d";
      MANPAGER = "nvim +Man!";
      MANWIDTH = 900;
    };

    home.packages = with pkgs; [
      # needed to compile tree sitter languages
      tree-sitter
      gcc

      # lsp
      rust-analyzer
    ];

    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      withNodeJs = true;

      plugins = with pkgs.vimPlugins; [
        packer-nvim

        # requires compilation
        telescope-fzf-native-nvim
      ];

      extraConfig = ''
        lua require('config').setup()
      '';
    };

    home.file = {
      ".config/nvim/lua" = {
        recursive = true;
        source = ./lua;
        target = ".config/nvim/lua";
      };
      ".config/nvim/after" = {
        recursive = true;
        source = ./after;
        target = ".config/nvim/after";
      };
    };
  };
}

