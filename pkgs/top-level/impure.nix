{ system ? builtins.currentSystem
, config ? {}
, overlays ? []
, crossOverlays ? []
, crossSystem ? null
, nixpkgs
}:

let
  # Import the library
  lib = import ../../lib {};
  
  # Import nixpkgs to get stdenv and writeShellScriptBin
  pkgs = import nixpkgs { inherit system; };
  
  # Use nixpkgs' stdenv and writeShellScriptBin
  stdenv = pkgs.stdenv;
  writeShellScriptBin = pkgs.writeShellScriptBin;
  
  # Minimal fetchurl implementation (we don't need this for hellonixos)
  fetchurl = { url, sha256, ... }: {
    outPath = "/nix/store/${builtins.hashString "sha256" (url + sha256)}-source";
    type = "derivation";
  };
  
  # Minimal licenses
  licenses = {
    mit = "mit";
    gpl3 = "gpl3";
  };
  
  # Minimal platforms
  platforms = {
    linux = "linux";
    darwin = "darwin";
  };
  
  # Minimal maintainers
  maintainers = {};

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
