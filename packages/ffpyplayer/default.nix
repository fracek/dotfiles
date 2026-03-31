# originally from https://github.com/m4k070/dotfiles-nix
{ lib
, buildPythonPackage
, fetchPypi
, cython
, pkg-config
, setuptools
, wheel
, ffmpeg_6
, SDL2
, SDL2_mixer
}:

buildPythonPackage rec {
  pname = "ffpyplayer";
  version = "4.5.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-i5Yj4EmXunu/VHYxOqjZ6uJmXGX0A7Xe/0rFHxYVXn4=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'cython~=3.0.11' 'cython>=3.0.11'
    substituteInPlace setup.py \
      --replace-fail 'cython~=3.0.11' 'cython>=3.0.11'
  '';

  nativeBuildInputs = [
    cython
    pkg-config
    setuptools
    wheel
  ];

  buildInputs = [
    ffmpeg_6
    ffmpeg_6.dev
    SDL2
    SDL2.dev
    SDL2_mixer
  ];

  env.NIX_CFLAGS_COMPILE = "-Wno-incompatible-pointer-types";

  meta = {
    description = "A cython implementation of an ffmpeg based player";
    homepage = "https://github.com/matham/ffpyplayer";
    license = lib.licenses.lgpl3Plus;
  };
}
