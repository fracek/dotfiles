{ lib
, stdenv
, buildPythonApplication
, fetchFromGitHub
, attrs
, pillow
, libX11
, libXcursor
, libpng
, toml
, numpy
, python
, pytestCheckHook
}:

buildPythonApplication rec {
  pname = "ctgen";
  version = "2.1.3";

  format = "setuptools";

  src = fetchFromGitHub {
    owner = "ful1e5";
    repo = "clickgen";
    rev = "v${version}";
    sha256 = "qDaSfIeKCbyl3C2iKz9DYQc1oNwTe5xDlGg/yYhakSw=";
  };

  buildInputs = [ libXcursor libX11 libpng ];
  propagatedBuildInputs = [ pillow toml attrs numpy ];
  pythonImportsCheck = [ "clickgen" ];

  prePatch = ''
    substituteInPlace setup.cfg \
        --replace 'numpy>=1.21.6' 'numpy>=1.21.5'
  '';

  meta = with lib; {
    homepage = "https://github.com/ful1e5/clickgen";
    description = "The hassle-free cursor building toolbox";
    license = licenses.mit;
    maintainers = [ ];
  };
}
