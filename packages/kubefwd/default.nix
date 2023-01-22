{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubefwd";
  version = "1.22.4";

  src = fetchFromGitHub {
    owner = "txn2";
    repo = pname;
    rev = "${version}";
    sha256 = "iC2oowLJCtpV0O+CpUCaBmSw668mFVoKbB+QEUDcG9Y=";
  };

  vendorSha256 = "oeRShx5lYwJ9xFPg5Ch0AzdQXwX/5OA3EyuumgH9gXU=";

  meta = with lib; {
    description = "Bulk port forwarding Kubernetes services for local development. ";
    homepage = "https://github.com/txn2/kubefwd";
    license = licenses.asl20;
    maintainers = [ ];
  };
}