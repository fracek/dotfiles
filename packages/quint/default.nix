{ lib
, buildNpmPackage
, fetchFromGitHub
}:

buildNpmPackage rec {
  pname = "quint";
  version = "0.17.1";

  src = fetchFromGitHub {
    owner = "informalsystems";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-mbwuJWlQGkxaJx2G0WHAmQg+rfKXTAKjFTxgH/9bhXI=";
  };

  prePatch = ''
    cd quint
  '';

  npmBuildScript = "compile";
  npmDepsHash = "sha256-pJSIaOLZ9KpE9KhqqcK1k0dYlYnPFN/uHmLzDJWQZ90=";

  meta = with lib; {
    homepage = "https://github.com/informalsystems/quint";
    description = "An executable specification language with delightful tooling based on the temporal logic of actions (TLA)";
    license = licenses.asl20;
    maintainers = [ ];
  };
}
