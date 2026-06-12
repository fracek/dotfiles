{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer
    cargo-insta
    pkg-config
    just
    openssl.dev
  ];
}


