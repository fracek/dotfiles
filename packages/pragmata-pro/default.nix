{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "pragmata-pro";
  version = "1.4";
  fileName = "EPPR-jf54f.zip";
  src = requireFile rec {
    name = "${fileName}";
    message = ''
      Please add ${name} to the nixos store by running

      nix-prefetch-url --type sha256 file:///home/fra/Downloads/${fileName}

      and updating the sha256 below if necessary.
    '';
    sha256 = "06dlbxzy83qbg4kjhx37cvxxhgxd5daczd68chwhvswvcchpi4i9";
  };

  installPhase = ''
    runHook preInstall

    ls -lAh .
    mkdir -vp $out/share/fonts/opentype
    mv -v EssentialPragmataPro-Regular1.4/*.ttf $out/share/fonts/opentype/

    runHook postInstall
  '';

  sourceRoot = ".";
  nativeBuildInputs = [ pkgs.unzip ];
  buildInputs = [ pkgs.unzip ];

  meta = with lib; {
    description = "PragmataPro is a condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering.";
    homepage = "https://fsd.it/shop/fonts/pragmatapro";
    license = licenses.unfree;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
