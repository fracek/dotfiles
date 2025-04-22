# https://github.com/EmberCraze/dotfiles/blob/a76f79a24ce1b1e03939be263a1d8f26a6f55b86/files/.config/nixos/windsurf.nix#L11
{ lib
, stdenv
, pkgs
, callPackage
, fetchurl
, nixosTests
, commandLineArgs ? ""
,
}:
# https://windsurf-stable.codeium.com/api/update/linux-x64/stable/latest
callPackage "${pkgs.path}/pkgs/applications/editors/vscode/generic.nix" rec {
  inherit commandLineArgs;

  version = "1.7.0";
  pname = "windsurf";

  executableName = "windsurf";
  longName = "Windsurf";
  shortName = "windsurf";

  src = fetchurl {
    url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/69a900001328c5e276063fc33dcff89076073a54/Windsurf-linux-x64-1.7.0.tar.gz";
    hash = "sha256-2HHTNBdAnEGKv1lH/cVxI66i2F0pk1k60QKeyUI7C0w=";
  };

  sourceRoot = "Windsurf";

  tests = nixosTests.vscodium;

  updateScript = "nil";

  meta = with lib; {
    description = "The first agentic IDE, and then some";
  };
}
