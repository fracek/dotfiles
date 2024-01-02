{ lib
, stdenv
, fetchzip
, jre
, makeWrapper
}:

stdenv.mkDerivation rec {
  pname = "apalache";
  version = "0.44.2";

  src = fetchzip {
    name = "${pname}.zip";
    url = "https://github.com/informalsystems/apalache/releases/download/v${version}/apalache-${version}.zip";
    hash = "sha256-5igZtsA1RGGgxXoo3eVV4B40895pXQ+c1lHjIhhMm5k=";
  };

  nativeBuildInputs = [ makeWrapper ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    echo "HERE";
    ls $src
    install -Dm555 $src/lib/apalache.jar $out/lib/apalache.jar
    install -Dm555 $src/bin/apalache-mc $out/bin/.apalache-wrapped
    makeWrapper "$out/bin/.apalache-wrapped" "$out/bin/apalache" \
      --prefix PATH : "${jre}/bin" \
      --set JAVA_HOME "${jre}"
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://apalache.informal.systems/";
    license = licenses.asl20;
    description = "Symbolic model checker for TLA+ and Quint";
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
