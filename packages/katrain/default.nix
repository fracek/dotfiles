# originally from https://github.com/m4k070/dotfiles-nix
{ lib
, python3Packages
, fetchPypi
, katago
, makeWrapper
}:

python3Packages.buildPythonApplication rec {
  pname = "katrain";
  version = "1.17.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TiND+RzJgI3GhPGRNRHNE3V29NgFHGx1VUX2jXTA1J8=";
  };

  nativeBuildInputs = [ makeWrapper python3Packages.hatchling ];

  propagatedBuildInputs = with python3Packages; [
    kivy
    kivymd
    chardet
    docutils
    ffpyplayer
    screeninfo
    urllib3
    pillow
  ];

  postInstall = ''
    wrapProgram $out/bin/katrain \
      --prefix PATH : ${lib.makeBinPath [ katago ]}
  '';

  doCheck = false;

  meta = {
    description = "KaTrain: AI-assisted Go training with KataGo";
    homepage = "https://github.com/sanderland/katrain";
    license = lib.licenses.mit;
    mainProgram = "katrain";
  };
}
