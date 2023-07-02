{ lib, stdenv, pkgs, fetchurl, installShellFiles, autoPatchelfHook, makeWrapper }:

stdenv.mkDerivation rec {
  name = "mirrord";
  version = "3.48.0";

  src = fetchurl {
    url = "https://github.com/metalbear-co/mirrord/releases/download/${version}/mirrord_linux_x86_64.zip";
    sha256 = "sha256-vRfmRhLXJRCtNqwoqETV4uydGNxAUXUhcaQu+eBjEQI=";
  };

  nativeBuildInputs = with pkgs; [
    installShellFiles
    unzip
  ] ++ lib.optionals stdenv.isLinux [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [ stdenv.cc.cc.libgcc or null ];

  unpackPhase = ''
    mkdir mirrord
    unzip -d mirrord $src
  '';

  installPhase = ''
    install -D -t $out/bin mirrord/*
  '' + lib.optionalString stdenv.isLinux ''
    wrapProgram $out/bin/mirrord --set LD_LIBRARY_PATH "${stdenv.cc.cc.lib}/lib"
  '';

  meta = with lib; {
    homepage = "";
    description = "";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = [ licenses.asl20 ];
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
