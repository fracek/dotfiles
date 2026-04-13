inputs:
let
  inherit inputs;
in
self: super: {
  # from flakes
  opencode = inputs.opencode.packages.${self.stdenv.hostPlatform.system}.opencode;
  opencode-desktop = inputs.opencode.packages.${self.stdenv.hostPlatform.system}.desktop;
  ghostty = inputs.ghostty.packages.${self.stdenv.hostPlatform.system}.ghostty;

  # dev tools
  hello-custom = super.callPackage ../packages/hello-custom { };
  zed-editor-bin = super.callPackage ../packages/zed-editor-bin { };
  zed-editor-fhs = self.buildFHSEnv {
    name = "zed";
    targetPkgs =
      pkgs: with pkgs; [
        zed-editor-bin
      ];
    runScript = "zed";
  };

  models-dev = super.callPackage ../packages/models-dev { };
  apalache = super.callPackage ../packages/apalache { };
  quint = super.callPackage ../packages/quint { };
  mirrord-bin = super.callPackage ../packages/mirrord-bin { };
  youplot = super.callPackage ../packages/youplot { };
  dagger = super.callPackage ../packages/dagger { };
  aptakube = super.callPackage ../packages/aptakube { };
  gitbutler-cli = super.callPackage ../packages/gitbutler-cli { };

  # desktop + eye candy
  msty = super.callPackage ../packages/msty { };
  mailspring = super.callPackage ../packages/mailspring { };
  smile = super.callPackage ../packages/smile { };
  en-croissant = super.callPackage ../packages/en-croissant { };
  kaya-go = super.callPackage ../packages/kaya-go { };
  katrain = super.callPackage ../packages/katrain { };
  # fonts
  berkeley-mono = super.callPackage ../packages/berkeley-mono { };
  pragmata-pro = super.callPackage ../packages/pragmata-pro { };
  # monolisa = super.callPackage ../packages/monolisa { };

  # neeeded by other packages
  python3Packages = super.python3Packages // {
    ffpyplayer = self.python3Packages.callPackage ../packages/ffpyplayer {
      inherit (self) SDL2 SDL2_mixer ffmpeg_6;
    };

    kivymd = self.python3Packages.callPackage ../packages/kivymd {
      inherit (self.python3Packages) kivy pillow requests;
    };
  };
}
