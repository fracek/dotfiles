{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.obs-studio;
in
{
  options.fra.programs.obs-studio.enable = mkEnableOption "obs-studio";

  config = mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      plugins =  with pkgs.obs-studio-plugins; [
        obs-vkcapture
        obs-pipewire-audio-capture
      ];
    };
  };
}

