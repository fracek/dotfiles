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
        # languages
        vim-nix

        # tools
        neogit
        diffview-nvim

        # ui
        which-key-nvim
        telescope-nvim
        telescope-fzf-native-nvim

        # themes
        catppuccin-nvim
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

