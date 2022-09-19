{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "monolisa";
  version = "1.8";
  src = pkgs.requireFile {
    name = "MonoLisa.zip";
    message = ''
    Please add MonoLisa.zip to the nixos store by running

    nix-prefetch-url --type sha256 file://$(pwd)/MonoLisa.zip

    and updating the sha256 below if necessary.
    '';
    sha256 = "0j7pr6xlr0l8r8bk7sky5iw33xw9lz4yyzv7ajidx52vgripmz6p";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp -a *.ttf $out/share/fonts/truetype
  '';

  nativeBuildInputs = [ pkgs.unzip ];
  buildInputs = [ pkgs.unzip ];

  meta = with lib; {
    description = "MonoLisa was designed by professionals to improve developers’ productivity and reduce fatigue.";
    homepage = "https://www.monolisa.dev/";
    license = licenses.unfree;
    maintainers = [ ];
    platforms = platforms.all;
  };
}