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
    url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/7f3de2bfc56b2f76334027e4d55dd26daa003035/Windsurf-linux-x64-1.2.4.tar.gz";
    hash = "sha256-4aacnI8cJ0Opeqs6ogCYa/8XMqfzxnVeWBopMWCHvfw=";
  };

  sourceRoot = "Windsurf";

  tests = nixosTests.vscodium;

  updateScript = "nil";

  meta = with lib; {
    description = "The first agentic IDE, and then some";
  };
}
