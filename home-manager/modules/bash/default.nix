{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.fra.programs.bash;
in
{
  options.fra.programs.bash.enable = mkEnableOption "bash";

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      # enableCompletion = true;
      shellAliases = {
        hu = "${pkgs.exa}/bin/exa ";
        ha = "${pkgs.exa}/bin/exa -a";
        hh = "${pkgs.exa}/bin/exa -la";
        ht = "${pkgs.exa}/bin/exa --tree";

        tf = "terraform";
        ktl = "kubectl";
      };
      initExtra = ''
        complete -o default -F __start_kubectl ktl
      '';
    };
  };
}
