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
        # languages
        # vim-nix

        # rust-vim

        # tools
        # neogit
        # diffview-nvim
        # nvim-lspconfig
        # rust-tools-nvim

        # (nvim-treesitter.withPlugins (plugins: with plugins; [
#           tree-sitter-python
#           tree-sitter-rust
#           tree-sitter-lua
#           tree-sitter-markdown
#           tree-sitter-yaml
#           tree-sitter-bash
#         ]))

        # ui
#         nvim-tree-lua
#         which-key-nvim
#         telescope-nvim

        # themes
#         catppuccin-nvim
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
    };
  };
}

