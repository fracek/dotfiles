{ lib
, buildNpmPackage
, fetchurl
, fd
, ripgrep
}:

buildNpmPackage rec {
  pname = "pi-coding-agent";
  version = "0.73.0";

  src = fetchurl {
    url = "https://registry.npmjs.org/@mariozechner/pi-coding-agent/-/pi-coding-agent-${version}.tgz";
    hash = "sha256-9hTRUh87tkSOQdKW1q9OcUC+ekxa844O65yuabsSdLs=";
  };

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  npmDepsHash = "sha256-1AIMOdaBjDr3WzwQiakjafwOAtnw8NWC3YvcwAJsiVw=";
  dontNpmBuild = true;

  postInstall = ''
    wrapProgram $out/bin/pi \
      --prefix PATH : ${
        lib.makeBinPath [
          fd
          ripgrep
        ]
      } \
      --set PI_SKIP_VERSION_CHECK 1 \
      --set PI_TELEMETRY 0
  '';

  meta = {
    description = "AI agent toolkit: coding agent CLI, unified LLM API, TUI & web UI libraries, Slack bot, vLLM pods";
    homepage = "https://github.com/badlogic/pi-mono";
    license = lib.licenses.mit;
  };
}
