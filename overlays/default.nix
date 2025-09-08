inputs:
let
  inherit inputs;
in
self: super:
{
  # dev tools
  bun = (super.bun.overrideAttrs (oldAttrs: rec {
      version = "1.2.21";
      src = self.fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64.zip";
        hash = "sha256-WU9FTVHOVxmdQyDIXL1JW+nAVO8XquvKXmyQir/aYXk=";
      };
  }));
  hello-custom = super.callPackage ../packages/hello-custom { };
  zed-editor-bin = super.callPackage ../packages/zed-editor-bin { };
  zed-editor-fhs = self.buildFHSEnv {
    name = "zed";
    targetPkgs = pkgs:
      with pkgs; [
        zed-editor-bin
      ];
    runScript = "zed";
  };
  opencode-git = super.callPackage ../packages/opencode-git { };
  apalache = super.callPackage ../packages/apalache { };
  quint = super.callPackage ../packages/quint { };
  mirrord-bin = super.callPackage ../packages/mirrord-bin { };
  starkli-bin = super.callPackage ../packages/starkli-bin { };
  youplot = super.callPackage ../packages/youplot { };
  dagger = super.callPackage ../packages/dagger { };
  # windsurf = super.callPackage ../packages/windsurf { };
  aptakube = super.callPackage ../packages/aptakube { };
  ghostty = inputs.ghostty.packages.${self.system}.ghostty;
  # desktop + eye candy
  msty = super.callPackage ../packages/msty { };
  mailspring = super.callPackage ../packages/mailspring { };
  morgen = super.callPackage ../packages/morgen { };
  smile = super.callPackage ../packages/smile { };
  en-croissant = super.callPackage ../packages/en-croissant { };
  # fonts
  berkeley-mono = super.callPackage ../packages/berkeley-mono { };
  # monolisa = super.callPackage ../packages/monolisa { };
}
