{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    bun
    nodejs_22
    pnpm_10
    vtsls
    biome
    nodePackages.typescript
    nodePackages.typescript-language-server
  ];
  NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc
    pkgs.openssl
  ];
  NIX_LD = (pkgs.runCommand "ld.so" { } ''
    ln -s "$(cat '${pkgs.stdenv.cc}/nix-support/dynamic-linker')" $out
  '');

}
