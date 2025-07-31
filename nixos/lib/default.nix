{ lib }:

let
  # Basic NixOS library functions
  eval-config = import ./eval-config.nix { inherit lib; };
  
in {
  inherit eval-config;
} 