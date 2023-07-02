inputs:
let
  inherit inputs;
in
self: super:
{
  hello-custom = super.callPackage ../packages/hello-custom { };
  fcitx5-catppuccin = super.callPackage ../packages/fcitx5-catppuccin { };
  cbmp = super.callPackage ../packages/cbmp { };
  ctgen = super.python3.pkgs.callPackage ../packages/ctgen { };
  fuchsia-cursor = super.callPackage ../packages/fuchsia-cursor { };
  supabase = super.callPackage ../packages/supabase { };
  morgen = super.callPackage ../packages/morgen { };
  monolisa = super.callPackage ../packages/monolisa { };
  apple-fonts = super.callPackage ../packages/apple-fonts { };
}
