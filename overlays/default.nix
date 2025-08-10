inputs:
let
  inherit inputs;
in
self: super:
{
  # dev tools
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
  opencode = (super.opencode.overrideAttrs (oldAttrs: {
        version = "0.4.2";
        src = super.fetchFromGitHub {
          owner = "sst";
          repo = "opencode";
          rev = "7bbc643600a8a669f4dd9136a29f220a5b0e81ab";
          sha256 = "1jn274p5396p9y1miylac68pqyl8ilaf5rm0f0jjrf26yr0yd9gj";
        };

        tui = oldAttrs.tui.overrideAttrs (oldTuiAttrs: {
          vendorHash = "sha256-jGaTgKyAvBMt8Js5JrPFUayhVt3QhgyclFoNatoHac4=";
        });

        node_modules = oldAttrs.node_modules.overrideAttrs (oldNodeAttrs: {
          outputHash = "sha256-LmNn4DdnSLVmGS5yqLyk/0e5pCiKfBzKIGRvvwZ6jHY=";
        });
      }));
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
