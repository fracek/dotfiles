{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    cargo
    rust-analyzer
    pkg-config
    openssl.dev
  ];
}


