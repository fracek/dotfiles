{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    defaultKeymap = "viins";
    shellAliases = {
      hu = "${pkgs.exa}/bin/exa ";
      ha = "${pkgs.exa}/bin/exa -a";
      hh = "${pkgs.exa}/bin/exa -la";
      ht = "${pkgs.exa}/bin/exa --tree";

      tf = "terraform";
      ktl = "kubectl";
    };
    initExtra = ''
      any-nix-shell zsh --info-right | source /dev/stdin
    '';
    envExtra = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=13'
    '';
    prezto = {
      enable = true;
      editor.keymap = "vi";
      prompt = { theme = "sorin"; };
    };
  };
}
