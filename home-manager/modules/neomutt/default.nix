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

    home.file = {
      ".config/mutt/muttrc" = {
        source = ./mutt/muttrc;
        target = ".config/mutt/muttrc";
      };
      ".config/mutt/rose-pine.muttrc" = {
        source = ./mutt/rose-pine.muttrc;
        target = ".config/mutt/rose-pine.muttrc";
      };
    };
  };
}
