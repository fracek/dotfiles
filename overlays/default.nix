inputs:
let
  inherit inputs;
in
self: super:
{
  hello-custom = super.callPackage ../packages/hello-custom { };
  monolisa = super.callPackage ../packages/monolisa { };
  cbmp = super.callPackage ../packages/cbmp { };
  ctgen = super.python3.pkgs.callPackage ../packages/ctgen { };
  fuchsia-cursor = super.callPackage ../packages/fuchsia-cursor { };
}
