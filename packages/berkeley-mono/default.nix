{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "berkeley-mono";
  version = "2.0";
  variant = "24123002P2PZY8Q0";
  ticketNumber = "TX-02-94N41JK6";
  src = requireFile rec {
    name = "berkeley-mono-v2.zip";
    message = ''
      Please add ${name} to the nixos store by running

      nix-prefetch-url --type sha256 --name ${name} <URL>

      and updating the sha256 below if necessary.
    '';
    sha256 = "0b9zkvzw54mq0958wg3f0y9r57agl8dz37a3lcvvblhq33qx8959";
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
