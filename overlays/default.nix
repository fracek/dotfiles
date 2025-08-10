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
  opencode = (super.opencode.overrideAttrs (oldAttrs:
    let
      bun-target = {
        "aarch64-darwin" = "bun-darwin-arm64";
        "aarch64-linux" = "bun-linux-arm64";
        "x86_64-darwin" = "bun-darwin-x64";
        "x86_64-linux" = "bun-linux-x64";
      };
    in rec {
        version = "0.4.2";
        src = super.fetchFromGitHub {
          owner = "sst";
          repo = "opencode";
          rev = "v${version}";
          sha256 = "sha256-8qXmQfZGuCwlcKDm4hSNiHp8kWGK+liDT9ekUS45wso=";
        };

        tui = oldAttrs.tui.overrideAttrs (oldTuiAttrs: {
          vendorHash = "sha256-jGaTgKyAvBMt8Js5JrPFUayhVt3QhgyclFoNatoHac4=";
        });

        node_modules = oldAttrs.node_modules.overrideAttrs (oldNodeAttrs: {
          outputHash = "sha256-LmNn4DdnSLVmGS5yqLyk/0e5pCiKfBzKIGRvvwZ6jHY=";
        });

        buildPhase = ''
          runHook preBuild

          bun build \
            --define OPENCODE_TUI_PATH="'${tui}/bin/tui'" \
            --define OPENCODE_VERSION="'${version}'" \
            --compile \
            --target="bun" \
            --outfile=opencode \
            ./packages/opencode/src/index.ts \

          runHook postBuild
        '';
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
