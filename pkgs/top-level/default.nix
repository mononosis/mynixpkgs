{ system ? builtins.currentSystem
, config ? {}
, overlays ? []
, crossOverlays ? []
, crossSystem ? null
, nixpkgs
}:

import ./impure.nix {
  inherit system config overlays crossOverlays crossSystem nixpkgs;
} 