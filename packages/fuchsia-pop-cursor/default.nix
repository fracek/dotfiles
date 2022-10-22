{ lib
, stdenv
, fetchurl
}:

stdenv.mkDerivation rec {
  pname = "fuchsia-cursors";
  version = "2.0.0";

  src = fetchurl {
    url = "https://github.com/ful1e5/fuchsia-cursor/releases/download/v${version}/Fuchsia-Pop.tar.gz";
    sha256 = "tNrElSkBRrDZ7YzHgt4ZFcEbGIdkU1jxLBlrA4cPYmU=";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r ./Fuchsia-Pop $out/share/icons
    runHook postInstall
  '';

  meta = with lib; {
    description = "First OpenSource port of FuchsiaOS's cursors for Linux and Windows.";
    homepage = "https://github.com/ful1e5/fuchsia-cursor";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [];
  };
}