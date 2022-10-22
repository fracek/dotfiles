inputs:
let
  inherit inputs;
in
self: super:
{
  hello-custom = super.callPackage ../packages/hello-custom { };
  monolisa = super.callPackage ../packages/monolisa { };
  fuchsia-pop-cursor = super.callPackage ../packages/fuchsia-pop-cursor {};
}
