{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    cargo
    rustc
    rustfmt
    rust-analyzer
    pkg-config
    openssl.dev
  ];
}


