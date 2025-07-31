{ system ? builtins.currentSystem
, config ? {}
, overlays ? []
, crossOverlays ? []
, crossSystem ? null
}:

let
  # Import the library
  lib = import ../../lib {};
  
  # Use the real stdenv from <nixpkgs> directly
  realNixpkgs = import <nixpkgs> { inherit system; };
  stdenv = realNixpkgs.stdenv;
  fetchurl = realNixpkgs.fetchurl;
  licenses = realNixpkgs.lib.licenses;
  platforms = realNixpkgs.lib.platforms;
  maintainers = realNixpkgs.lib.maintainers or {};
  writeShellScriptBin = realNixpkgs.writeShellScriptBin;

  # Call package function (only pass expected args)
  callPackage = fn: args: import fn (args // {
    inherit lib stdenv fetchurl callPackage licenses platforms maintainers writeShellScriptBin;
  });
  
  # Import the hellonixos package
  hellonixos = callPackage ../by-name/he/hellonixos/package.nix {};
  
  # All packages
  allPackages = {
    inherit hellonixos;
  };
  
in allPackages
