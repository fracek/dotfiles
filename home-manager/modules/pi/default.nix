{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.pi;

  packages = with pkgs.pi-packages; [
    pi-catppuccin
  ];
in
{
  options.fra.programs.pi = {
    enable = mkEnableOption "pi";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.pi-coding-agent
    ] ++ packages;

    home.file.".pi/agent/settings.json".text = builtins.toJSON {
      defaultProvider = "opencode";
      defaultModel = "kimi-k2.6";
      hideThinkingBlock = false;
      defaultThinkingLevel = "medium";
      enabledModels = [ ];
      steeringMode = "all";
      followUpMode = "all";
      enableInstallTelemetry = false;
      theme = "catppuccin-mocha";
      packages = packages;
    };
  };
}
