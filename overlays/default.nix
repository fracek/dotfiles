inputs:
let
  inherit inputs;
in
self: super:
{
  hello-custom = super.callPackage ../packages/hello-custom { };
}
