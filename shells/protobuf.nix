{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    protobuf
  ];
}

