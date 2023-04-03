{ lib
, pkgs
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "fuchsia-cursor";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "ful1e5";
    repo = pname;
    rev = "v${version}";
    sha256 = "WnDtUsjRXT7bMppgwU5BIDqphP69DmPzQM/0qXES5tM=";
  };

  nativeBuildInputs = with pkgs; [
    nodejs
    ctgen
    cbmp
  ];

  buildPhase = ''
    runHook preBuild
    # rose pine
    cbmp -d 'svg' -n 'Fuchsia' -bc '#f6c177' -oc '#e0def4'
    ctgen build.toml -d 'bitmaps/Fuchsia' -n 'Fuchsia' -c 'My personal Fuchsia cursor theme'
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    ls ./themes
    cp -r ./themes/Fuchsia $out/share/icons
    runHook postInstall
  '';

  meta = with lib; {
    description = "First OpenSource port of FuchsiaOS's cursors for Linux and Windows.";
    homepage = "https://github.com/ful1e5/fuchsia-cursor";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}
