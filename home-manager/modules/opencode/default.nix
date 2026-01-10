{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.opencode;

  folders = [ "agent" "command" ];

  configFiles = lib.listToAttrs (map (folder: {
    name = "opencode/${folder}";
    value.source = builtins.path {
      path = ./${folder};
      name = "opencode-${folder}";
    };
  }) folders);
in
{
  options.fra.programs.opencode.enable = mkEnableOption "opencode";

  config = mkIf cfg.enable {
    home.packages = [ pkgs.opencode ];

    xdg.configFile = configFiles;
  };
}
