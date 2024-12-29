{ lib, stdenv, requireFile, pkgs }:
stdenv.mkDerivation rec {
  pname = "berkeley-mono";
  version = "2.0";
  variant = "241229NJMZYVR1QL";
  subvariant = "TX-02-QVK28ZYY";
  src = requireFile rec {
    name = "berkeley-mono-v2.zip";
    message = ''
      Please add ${name} to the nixos store by running

      nix-prefetch-url --type sha256 --name ${name} <URL>

      and updating the sha256 below if necessary.
    '';
    sha256 = "1m3h8bw3ylm4mbj39hr1mgrj2nxi80rccl8lryx3m2qsmzpjld5c";
  };

  installPhase = ''
    runHook preInstall

    ls -lAh *
    mkdir -vp $out/share/fonts/{opentype,truetype}

    mv -v ${variant}/${subvariant} $out/share/fonts/opentype

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
