inputs:
let
  inherit inputs;
in
self: super:
{
  # dev tools
  hello-custom = super.callPackage ../packages/hello-custom { };
  supabase = super.callPackage ../packages/supabase { };
  mirrord-bin = super.callPackage ../packages/mirrord-bin { };
  # desktop + eye candy
  morgen = super.callPackage ../packages/morgen { };
  ctgen = super.python3.pkgs.callPackage ../packages/ctgen { };
  cbmp = super.callPackage ../packages/cbmp { };
  fuchsia-cursor = super.callPackage ../packages/fuchsia-cursor { };
  fcitx5-catppuccin = super.callPackage ../packages/fcitx5-catppuccin { };
  # fonts
  monolisa = super.callPackage ../packages/monolisa { };
  apple-fonts = super.callPackage ../packages/apple-fonts { };
}
