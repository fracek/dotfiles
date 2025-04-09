{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    (azure-cli.withExtensions [
      azure-cli-extensions.k8s-extension
    ])
  ];
}
