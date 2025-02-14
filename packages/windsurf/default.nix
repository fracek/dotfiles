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

  version = "1.2.4";
  pname = "windsurf";

  executableName = "windsurf";
  longName = "Windsurf";
  shortName = "windsurf";

  src = fetchurl {
    url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/a3033f77830e1fc968bce49f229f7c98f11c60fa/Windsurf-linux-x64-1.3.3.tar.gz";
    hash = "sha256-+iSPnsnkbugUpvAjW+5cES04JlAz55If5NC+lF4+uzw=";
  };

  sourceRoot = "Windsurf";

  tests = nixosTests.vscodium;

  updateScript = "nil";

  meta = with lib; {
    description = "The first agentic IDE, and then some";
  };
}
