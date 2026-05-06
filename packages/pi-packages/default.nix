{ lib
, buildNpmPackage
, fetchzip
, stdenv
}:

let
  piPackage = { name, version, hash }:
    let
      parts = lib.strings.splitString "/" name;
      src = fetchzip {
        url = "https://registry.npmjs.org/${name}/-/${lib.lists.last parts}-${version}.tgz";
        hash = hash;
      };
    in
    stdenv.mkDerivation {
      inherit src name version;

      dontConfigure = true;
      dontBuild = true;

      installPhase = ''
        runHook preInstall
        mkdir -p $out
        cp -r $src/* $out/
        runHook postInstall
      '';
    };
in
{
  pi-catppuccin = piPackage {
    name = "@sherif-fanous/pi-catppuccin";
    version = "0.2.0";
    hash = "sha256-kSc8oErAb0saz2dMzrblyVI0Mi/k2AHTDlre5FnqZMY=";
  };
}
