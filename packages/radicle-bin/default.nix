{ lib, stdenv, pkgs, fetchurl, installShellFiles, autoPatchelfHook, makeWrapper }:

let
  rev = "fe55de181d4320a0cd7a6ebd2820764280ae9adc";
  platform = "x86_64-unknown-linux-musl";
in
stdenv.mkDerivation {
  name = "radicle-bin";
  version = "0.8.0";

  src = fetchurl {
    url = "https://files.radicle.xyz/${rev}/${platform}/radicle-${platform}.tar.gz";
    sha256 = "sha256-ZkRL1cIvqpo4TbcmsYebDFBF2m+2ohQdxPqxR+dRcgs=";
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
  mkdir radicle
  mkdir radicle/bin
  mkdir radicle/man
  mkdir temp
  tar xzf $src --strip-components=1 -C temp
  mv temp/*.1 radicle/man/
  mv temp/* radicle/bin/
  '';

  installPhase = ''
    installManPage radicle/man/*.1
    install -D -t $out/bin radicle/bin/*
  '' + lib.optionalString stdenv.isLinux ''
    for p in $out/bin/*; do
      wrapProgram $p --set LD_LIBRARY_PATH "${stdenv.cc.cc.lib}/lib";
    done;
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