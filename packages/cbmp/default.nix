# files generate with:
#     cd /path/to/cbmp
#     node2nix -d -16 -c package.nix -l
{ pkgs, nodejs, stdenv, lib, fetchFromGitHub }:

let
  src = fetchFromGitHub {
    owner = "ful1e5";
    repo = "cbmp";
    rev = "b216d25765ccb22b598aff2eb2367ee509e40808";
    sha256 = "Z4E9KMc4q/NChVSvC0/Z3sKnG2kM5XH9Z5FJgrSbfAg=";
  };

  nodePackages = import ./package.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };

  bcmp = nodePackages.nodeDependencies.override (_: {
    src = src;
    dontNpmInstall = true;
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "y";
  });
in
stdenv.mkDerivation rec {
  name = "cbmp";
  version = "1.0.0";
  inherit src;

  buildInputs = with pkgs; [
    makeWrapper
    nodejs
  ];

  buildPhase = ''
    runHook preBuild
    
    ln -s ${bcmp}/lib/node_modules .
    export PATH="${bcmp}/bin:$PATH"
    npm run build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,opt}
    cp -a . $out/opt/cbmp

    makeWrapper ${nodejs}/bin/node $out/bin/cbmp \
      --add-flags $out/opt/cbmp/bin/cli.js \
      --set PUPPETEER_EXECUTABLE_PATH "${pkgs.chromium}/bin/chromium"

    runHook postInstall
  '';

  skipCheck = true;

  meta = with lib; {
    description = "CLI App for converting cursor svg file to png.";
    homepage = "https://github.com/ful1e5/cbmp";
    license = licenses.mit;
    maintainers = [ ];
  };
}
