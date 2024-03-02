inputs:
let
  inherit inputs;
in
self: super:
{
  # dev tools
  hello-custom = super.callPackage ../packages/hello-custom { };
  apalache = super.callPackage ../packages/apalache { };
  quint = super.callPackage ../packages/quint { };
  mirrord-bin = super.callPackage ../packages/mirrord-bin { };
  starkli-bin = super.callPackage ../packages/starkli-bin { };
  youplot = super.callPackage ../packages/youplot { };
  radicle-bin = super.callPackage ../packages/radicle-bin { };
  # desktop + eye candy
  mailspring = super.callPackage ../packages/mailspring { };
  morgen = super.callPackage ../packages/morgen { };
  # ctgen = super.python3.pkgs.callPackage ../packages/ctgen { };
  # cbmp = super.callPackage ../packages/cbmp { };
  # fuchsia-cursor = super.callPackage ../packages/fuchsia-cursor { };
  fcitx5-catppuccin = super.callPackage ../packages/fcitx5-catppuccin { };
  # fonts
  berkeley-mono = super.callPackage ../packages/berkeley-mono { };
  # monolisa = super.callPackage ../packages/monolisa { };
}
