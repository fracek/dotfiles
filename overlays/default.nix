inputs:
let
  inherit inputs;
in
self: super:
{
  vscodeExtensions = inputs.nix-vscode-extensions.extensions.${builtins.currentSystem};
  # dev tools
  hello-custom = super.callPackage ../packages/hello-custom { };
  apalache = super.callPackage ../packages/apalache { };
  quint = super.callPackage ../packages/quint { };
  mirrord-bin = super.callPackage ../packages/mirrord-bin { };
  starkli-bin = super.callPackage ../packages/starkli-bin { };
  youplot = super.callPackage ../packages/youplot { };
  # desktop + eye candy
  mailspring = super.callPackage ../packages/mailspring { };
  morgen = super.callPackage ../packages/morgen { };
  smile = super.callPackage ../packages/smile { };
  # fonts
  berkeley-mono = super.callPackage ../packages/berkeley-mono { };
  # monolisa = super.callPackage ../packages/monolisa { };
}
