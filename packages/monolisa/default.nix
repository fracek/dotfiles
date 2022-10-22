{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "monolisa";
  version = "2.002";
  src = pkgs.requireFile {
    name = "MonoLisa-Personal-${version}.zip";
    message = ''
      Please add MonoLisa-Personal-${version}.zip to the nixos store by running

      nix-prefetch-url --type sha256 file://$(pwd)/MonoLisa-Personal-${version}.zip

      and updating the sha256 below if necessary.
    '';
    sha256 = "180pgpyffsm3ilxx3xz6y4b2w4bpi731gpz503bgg2z94r2v03wj";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp -a *.ttf $out/share/fonts/truetype
  '';

  nativeBuildInputs = [ pkgs.unzip ];
  buildInputs = [ pkgs.unzip ];

  meta = with lib; {
    description = "MonoLisa was designed by professionals to improve developers' productivity and reduce fatigue.";
    homepage = "https://www.monolisa.dev/";
    license = licenses.unfree;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
