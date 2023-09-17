{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "monolisa";
  version = "2.010";
  src = pkgs.requireFile {
    name = "MonoLisa-Basic-${version}-ttf.zip";
    message = ''
      Please add MonoLisa-Basic-${version}-ttf.zip to the nixos store by running

      nix-prefetch-url --type sha256 file://$(pwd)/MonoLisa-Basic-${version}-ttf.zip

      and updating the sha256 below if necessary.
    '';
    sha256 = "1zy054766apnbjqq44gm0mcsy3jl5by00halmgjyfkh5lkdz0kpy";
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
