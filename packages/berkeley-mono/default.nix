{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "berkeley-mono";
  version = "2.0";
  variant = "24122903LPX5Q63M";
  ticketNumber = "TX-02-82QJZ01K";
  src = requireFile rec {
    name = "berkeley-mono-v2.zip";
    message = ''
      Please add ${name} to the nixos store by running

      nix-prefetch-url --type sha256 --name ${name} <URL>

      and updating the sha256 below if necessary.
    '';
    sha256 = "0rf9p72bhrybkb6lmjsnjahaw1m60pmw1swvqvd4p1j1cimanw2z";
  };

  installPhase = ''
    runHook preInstall

    ls -lAh ${variant}
    ls -lAh ${variant}/${ticketNumber}
    mkdir -vp $out/share/fonts/opentype

    mv -v ${variant}/${ticketNumber}/*.otf $out/share/fonts/opentype

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
