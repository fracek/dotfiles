{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.discord;
in
{
  options.fra.programs.discord.enable = mkEnableOption "discord";

  config = mkIf cfg.enable {
    # programs.discocss = {
    #   enable = true;
    #   discordAlias = true;
    #   css = ''
    #     /**
    #      * @name Catppuccin
    #      * @author Catppuccin
    #      * @version 0.0.8
    #      * @description 🎮 Soothing pastel theme for Discord
    #      * @website https://github.com/catppuccin
    #      * @source https://github.com/catppuccin/discord
    #     **/

    #     @import url(https://catppuccin.github.io/discord/main.css);
    #   '';
    # };
  };
}
