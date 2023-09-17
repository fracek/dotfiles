{ pkgs, flake-self, nur, ... }:
let
  editor = "nvim";
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
      htop
      unzip
    ];

    sessionVariables = {
      NIX_SHELL_PRESERVE_PROMPT = 1;
      EDITOR = editor;
    };

    stateVersion = "22.05";
  };
}
