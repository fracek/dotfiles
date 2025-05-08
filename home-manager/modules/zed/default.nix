{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.zed;
in
{
  options.fra.programs.zed.enable = mkEnableOption "zed";

  config = mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      package = pkgs.zed-editor-bin;
      extensions = [
        "nix"
        "toml"
      ];
      # extraPackages = [ pkgs.nixd ];
      userSettings = {
        auto_update = false;
      };
    };
  };
}
