{ system ? builtins.currentSystem
, config ? {}
, overlays ? []
, crossOverlays ? []
, crossSystem ? null
}:

import ./impure.nix {
  inherit system config overlays crossOverlays crossSystem;
} 