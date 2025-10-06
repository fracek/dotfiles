{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "berkeley-mono";
  version = "2.0";
  variant = "251003255KQ86MR2";
  ticketNumber = "9JQ308P8";
  src = requireFile rec {
    name = "${variant}.zip";
    message = ''
      Please add ${name} to the nixos store by running

      nix-prefetch-url --type sha256 file:///home/fra/Downloads/${variant}.zip

      and updating the sha256 below if necessary.
    '';
    sha256 = "1xq07v9h30fv7q43cwjix661c2z9rqa7isqli8ynqazmcy7lcxck";
  };

  installPhase = ''
    runHook preInstall

    ls -lAh ${variant}
    ls -lAh ${variant}/TX-02-${ticketNumber}
    mkdir -vp $out/share/fonts/opentype

    mv -v ${variant}/TX-02-${ticketNumber}/*.otf $out/share/fonts/opentype

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
