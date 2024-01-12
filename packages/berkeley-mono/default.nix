{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation {
  pname = "berkeley-mono";
  version = "1.0";
  src = requireFile rec {
    name = "berkeley-mono-typeface.zip";
    message = ''
      Please add ${name} to the nixos store by running

      nix-prefetch-url --type sha256 --name ${name} <URL>

      and updating the sha256 below if necessary.
    '';
    sha256 = "1l4978v2m9sv4klz5zka2i04wwlgl756rqlfwxvy80bjhx0b2zfi";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp -a *.ttf $out/share/fonts/truetype
  '';

  sourceRoot = ".";
  nativeBuildInputs = [ pkgs.unzip ];
  buildInputs = [ pkgs.unzip ];

  meta = with lib; {
    description = "A love letter to the golden era of computing.";
    homepage = "https://berkeleygraphics.com/typefaces/berkeley-mono/";
    license = licenses.unfree;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
