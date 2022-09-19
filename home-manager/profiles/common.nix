{ pkgs, flake-self, nur, ... }:
let
  editor = "vim";
in
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      flake-self.overlays.default
      nur.overlay
    ];
  };

  # include man pages
  manual.manpages.enable = true;

  systemd.user.sessionVariables = {
    EDITOR = editor;
  };

  home = {
    packages = with pkgs; [
      exa
      htop
      unzip
    ];

    sessionVariables = {
      EDITOR = editor;
    };

    stateVersion = "22.05";
  };
}
