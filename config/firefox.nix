{ pkgs, ... }:

{
  enable = true;

  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    bitwarden
    darkreader
    tridactyl
    ublock-origin
  ];

  profiles.fra = { isDefault = true; };
}
