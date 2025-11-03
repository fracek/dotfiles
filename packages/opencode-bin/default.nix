{ lib, stdenv, pkgs, fetchurl, installShellFiles, autoPatchelfHook }:

stdenv.mkDerivation rec {
  name = "opencode-bin";
  version = "1.0.15";

  src = fetchurl {
    url = "https://github.com/sst/opencode/releases/download/v${version}/opencode-linux-x64.zip";
    sha256 = "sha256-C6RRik1EEE1AcWpLYIdWTfpkntX9D8Dw3Tf5BM+qZxg=";
  };

  nativeBuildInputs = with pkgs; [
    installShellFiles
    unzip
  ] ++ lib.optionals stdenv.isLinux [
    autoPatchelfHook
  ];

  buildInputs = [ stdenv.cc.cc.libgcc or null ];

  unpackPhase = ''
    mkdir opencode
    unzip -d opencode $src
  '';

  installPhase = ''
    install -D -t $out/bin opencode/*
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
