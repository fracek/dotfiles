{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.neomutt;
in
{
  options.fra.programs.neomutt.enable = mkEnableOption "neomutt";

  config = mkIf cfg.enable {
    programs.neomutt = {
      enable = true;
      vimKeys = true;
    };

    home.packages = with pkgs; [
      mailcap
      lynx
      feh
    ];

    home.file = {
      ".config/mutt/muttrc" = {
        source = ./mutt/muttrc;
        target = ".config/mutt/muttrc";
      };
      ".config/mutt/theme.muttrc" = {
        source = ./mutt/theme.muttrc;
        target = ".config/mutt/theme.muttrc";
      };
      ".mailcap" = {
        source = ./mutt/mailcap;
        target = ".mailcap";
      };
    };
  };
}
