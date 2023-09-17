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
      historyControl = [
        "ignoredups"
        "ignorespace"
        "erasedups"
      ];
      shellAliases = {
        ls = "${pkgs.lsd}/bin/lsd";
        hu = "${pkgs.lsd}/bin/lsd ";
        ha = "${pkgs.lsd}/bin/lsd -a";
        hh = "${pkgs.lsd}/bin/lsd -la";
        ht = "${pkgs.lsd}/bin/lsd --tree";

        ktl = "kubectl";
      };
      initExtra = ''
        complete -o default -F __start_kubectl ktl
      '';
    };

    programs.lsd = {
      enable = true;
      settings = {
        icons = {
          when = "never";
        };
      };
    };
  };
}
