{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.k9s;
in
{
  options.fra.programs.k9s.enable = mkEnableOption "k9s";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fblog
    ];

    programs.k9s = {
      enable = true;
      plugin = {
        plugins = {
          fblog-pod = {
            shortCut = "Shift-L";
            description = "fblog pod (all fields)";
            confirm = false;
            scopes = [ "pods" ];
            command = "sh";
            background = false;
            args = [ "-c" "kubectl logs --follow -n $NAMESPACE $NAME | fblog -d" ];
          };
          fblog-container = {
            shortCut = "Shift-L";
            description = "fblog container (all fields)";
            confirm = false;
            scopes = [ "containers" ];
            command = "sh";
            background = false;
            args = [ "-c" "kubectl logs --follow -n $NAMESPACE $POD -c $NAME | fblog -d" ];
          };
        };
      };
    };
  };
}

