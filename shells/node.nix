{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.nodejs
    pkgs.nodePackages.typescript
    pkgs.nodePackages.typescript-language-server
  ];
  NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc
    pkgs.openssl
  ];
  NIX_LD = (pkgs.runCommand "ld.so" { } ''
    ln -s "$(cat '${pkgs.stdenv.cc}/nix-support/dynamic-linker')" $out
  '');

}
