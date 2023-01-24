{ pkgs, lib, fetchFromGitHub, python3Packages }:

let
  pname = "gefyra";
  version = "1.0.1";
  repo = fetchFromGitHub {
    owner = "gefyrahq";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "xXd2KPX31E7mkZC0BhLxgh0q2q+Swc/E4Ypxqwh6ZL4=";
  };
in
python3Packages.buildPythonPackage rec {
  inherit pname version;
  format = "pyproject";

  src = "${repo}/client";

  nativeBuildInputs = with pkgs; [
    python3Packages.poetry
  ];

  patches = [
    ./remove-cli-tracker.patch
  ];

  propagatedBuildInputs = with pkgs; [
    python3Packages.docker
    python3Packages.kubernetes
    python3Packages.tabulate
  ];

  LC_ALL = "en_US.UTF-8";

  meta = with lib; {
    description = "Blazingly-fast, rock-solid, local application development with Kubernetes.";
    homepage = "https://github.com/gefyrahq/gefyra";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = [ ];
  };
}
