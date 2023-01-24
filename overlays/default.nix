inputs:
let
  inherit inputs;
in
self: super:
{
  hello-custom = super.callPackage ../packages/hello-custom { };
  monolisa = super.callPackage ../packages/monolisa { };
  fcitx5-catppuccin = super.callPackage ../packages/fcitx5-catppuccin { };
  cbmp = super.callPackage ../packages/cbmp { };
  ctgen = super.python3.pkgs.callPackage ../packages/ctgen { };
  fuchsia-cursor = super.callPackage ../packages/fuchsia-cursor { };
  supabase = super.callPackage ../packages/supabase { };
  sapling = super.callPackage ../packages/sapling { };
  gefyra = super.callPackage ../packages/gefyra { };
}
