{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.go
  ];
}

