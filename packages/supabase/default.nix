{ lib, stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "supabase";
  version = "1.75.2";

  src = fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "UjA+4Vy69tLMgIU6sDJXVkyNYbIxpFnVvcAFJNfSFf4=";
  };

  vendorSha256 = "E4OVe5u+eWbq51AtsiLqh7B9aDAX+ol/JtNzYjBIL5I=";

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
