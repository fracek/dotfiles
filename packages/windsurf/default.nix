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

  version = "1.5.9";
  pname = "windsurf";

  executableName = "windsurf";
  longName = "Windsurf";
  shortName = "windsurf";

  src = fetchurl {
    url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/b3241b91445f79878ccc91626dfe190f90563e53/Windsurf-linux-x64-1.5.9.tar.gz";
    hash = "sha256-3jPS64q1qiTuRbzA+K9vlzMR8bSaLA4xw/EODGN0z3M=";
  };

  sourceRoot = "Windsurf";

  tests = nixosTests.vscodium;

  updateScript = "nil";

  meta = with lib; {
    description = "The first agentic IDE, and then some";
  };
}
