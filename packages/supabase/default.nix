{ lib, stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "supabase";
  version = "1.26.5";

  src = fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "ywmNWR7dYKT1lwkaphU17Sv0QtD15RVWw7kv1+QrRLU=";
  };

  vendorSha256 = "v/KyOqG1RH2qSOmbnv6OMn2qprS0fW6/6+4lKV1LBzI=";

  doCheck = false;

  subPackages = [ "main.go" ];

  postInstall = ''
    mv $out/bin/main $out/bin/supabase
  '';

  meta = with lib; {
    description = "Supabase CLI ";
    homepage = "https://supabase.com/docs/reference/cli/about";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
