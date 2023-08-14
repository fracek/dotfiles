{ lib, stdenv, pkgs, fetchurl, installShellFiles, autoPatchelfHook, makeWrapper }:

stdenv.mkDerivation rec {
  name = "starkli";
  version = "0.1.10";

  src = fetchurl {
    url = "https://github.com/xJonathanLEI/starkli/releases/download/v${version}/starkli-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = "sha256-6g7DwJKHpbAimEgSIarKmP5ao8PTboh1uJU4/ONj30Q=";
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
    mkdir starkli
    tar xvzf $src -C starkli
  '';

  installPhase = ''
    install -D -t $out/bin starkli/*

    installShellCompletion --cmd starkli \
      --bash <($out/bin/starkli completions bash) \
      --fish <($out/bin/starkli completions fish) \
      --zsh <($out/bin/starkli completions zsh) 
  '' + lib.optionalString stdenv.isLinux ''
    wrapProgram $out/bin/starkli --set LD_LIBRARY_PATH "${stdenv.cc.cc.lib}/lib"
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

