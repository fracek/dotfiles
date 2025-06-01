{ lib, stdenv, pkgs, fetchurl, autoPatchelfHook, makeWrapper }:
stdenv.mkDerivation rec {
  name = "dagger";
  version = "0.18.9";

  src = fetchurl {
    url = "https://github.com/dagger/dagger/releases/download/v${version}/dagger_v${version}_linux_amd64.tar.gz";
    sha256 = "sha256-7pNCul3tEvbQpT3EHKLoF5WyYZ8rpJg/FVpt+hsHBlw=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  unpackPhase = ''
    tar -xzf $src
    mkdir -p $out/bin
    mv dagger $out/bin
  '';

  meta = {
    description = "An open-source runtime for composable workflows. Great for AI agents and CI/CD.";
    license = lib.licenses.asl20;
    maintainers = [];
    platforms = lib.platforms.linux;
  };
}
