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
    sha256 = "0mwdgsqmqaj6hgx50v8l25zn3x7pi9kkzgxnn7xsxp8ng2anpvfy";
  };

  installPhase = ''
    runHook preInstall

    ls -lAh *
    mkdir -vp $out/share/fonts/{,truetype}

    mv -v berkeley-mono/OTF $out/share/fonts/opentype
    mv -v berkeley-mono{,variable}/TTF/*.ttf $out/share/fonts/truetype

    runHook postInstall
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
