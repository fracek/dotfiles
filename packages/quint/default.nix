{ lib
, buildNpmPackage
, fetchFromGitHub
}:

buildNpmPackage rec {
  pname = "quint";
  version = "0.32.0";

  src = fetchFromGitHub {
    owner = "informalsystems";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-GTbphBmALx/gDc/iV/wtE1ovpK43VtCQoneN5AqUmvg=";
  };

  prePatch = ''
    cd quint
  '';

  npmBuildScript = "compile";
  npmDepsHash = "sha256-6vKu9OTw68A92uhk1vHYDld5ixUln2tZav8pi55/l4c=";

  meta = with lib; {
    homepage = "https://github.com/informalsystems/quint";
    description = "An executable specification language with delightful tooling based on the temporal logic of actions (TLA)";
    license = licenses.asl20;
    maintainers = [ ];
  };
}
