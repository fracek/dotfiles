{ lib
, buildNpmPackage
, fetchFromGitHub
}:

buildNpmPackage rec {
  pname = "quint";
  version = "0.21.1";

  src = fetchFromGitHub {
    owner = "informalsystems";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-VjAvaFO/OdqIYPqTNbbBZl7ah1GPGMVQJltZYkJx5IY=";
  };

  prePatch = ''
    cd quint
  '';

  npmBuildScript = "compile";
  npmDepsHash = "sha256-nMZ57ArvNz3qNCZNIGVwszRZ7g+zdYo1AJONBOdekaY=";

  meta = with lib; {
    homepage = "https://github.com/informalsystems/quint";
    description = "An executable specification language with delightful tooling based on the temporal logic of actions (TLA)";
    license = licenses.asl20;
    maintainers = [ ];
  };
}
