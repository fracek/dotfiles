{ lib, pkgs, fetchurl, appimageTools, ... }:

let
  pname-base = "aptakube";
  version = "1.11.5";
  appImage = appimageTools.wrapType2 {
    inherit version;
    pname = "${pname-base}-wrapped";

    src = fetchurl {
      url = "https://releases.aptakube.com/aptakube_${version}_amd64.AppImage";
      hash = "sha256-c0qVfV/ClW4Wv7lrSy8Yr8C402LPxK9fESR1NZexKUo=";
    };

    extraPkgs = pkgs: with pkgs; [
      libsecret
      kubelogin
      kubelogin-oidc
      kubernetes-helm
    ];
  };
  desktopItem = pkgs.makeDesktopItem {
    name = "aptakube";
    desktopName = "Aptakube";
    exec = "${appImage}/bin/${appImage.pname}";
    terminal = false;
  };
in
pkgs.symlinkJoin
{
  name = "${pname-base}-${version}";
  inherit version;
  paths = [ appImage desktopItem ];

  meta = with lib; {
    homepage = "https://aptakube.com";
    description = "Modern. Lightweight. Multi-Cluster. Kubernetes GUI";
    platforms = [ "x86_64-linux" ];
    mainProgram = "aptakube";
  };
}
