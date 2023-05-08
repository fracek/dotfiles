{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    go
    gotools
    gopls
    golangci-lint
  ];
}

