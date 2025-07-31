{ system ? builtins.currentSystem
, nixpkgs ? null
, config ? {}
, overlays ? []
, crossOverlays ? []
, crossSystem ? null
}:

import ./impure.nix {
  inherit system nixpkgs config overlays crossOverlays crossSystem;
} 