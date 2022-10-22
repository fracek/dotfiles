{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "monolisa";
  version = "2.0";
  src = pkgs.requireFile {
    name = "MonoLisa-Personal-2.001.zip";
    message = ''
      Please add MonoLisa-Personal-2.001.zip to the nixos store by running

      nix-prefetch-url --type sha256 file://$(pwd)/MonoLisa-Personal-2.001.zip

      and updating the sha256 below if necessary.
    '';
    sha256 = "0r6q4n8ahfgwix6hwjmh4q7d584r0jlpl7rh11ym8b2n5amfkzr6";
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
