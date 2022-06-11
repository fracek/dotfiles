{ pkgs, fetchurl, ... }:

{
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = [
      pkgs.luaPackages.vicious
    ];
  };

  services.picom = {
    enable = true;
    experimentalBackends = true;
    backend = "xrender";
    shadow = true;
    shadowOffsets = [ (-20) (-5) ];
    shadowOpacity = "0.6";
    extraOptions = ''
      shadow-radius = 20;
    '';
  };

  home.file = {
    ".config/awesome" = {
      recursive = false;
      source = ./awesome;
      target = ".config/awesome";
    };
  };
}


