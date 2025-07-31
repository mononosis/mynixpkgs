{ system ? builtins.currentSystem
, config ? {}
, overlays ? []
, crossOverlays ? []
, crossSystem ? null
}:

let
  # Import the library
  lib = import ../../lib {};
  
  # Create a minimal stdenv without nixpkgs
  stdenv = {
    mkDerivation = { name, version, src, buildInputs ? [], nativeBuildInputs ? [], installPhase ? "", ... } @ args:
      let
        drvName = "${name}-${version}";
        outPath = "/nix/store/${builtins.hashString "sha256" (drvName + toString src)}-${drvName}";
      in
      {
        inherit name version src buildInputs nativeBuildInputs installPhase outPath;
        type = "derivation";
        drvPath = "/nix/store/${builtins.hashString "sha256" (drvName + "drv")}-${drvName}.drv";
        outputs = [ "out" ];
        outputName = "out";
        outputSpecified = true;
        all = [ outPath ];
        __toString = self: "${drvName}";
      };
  };
  
  # Minimal fetchurl implementation
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
  
  # Minimal writeShellScriptBin
  writeShellScriptBin = name: script: {
    name = name;
    script = script;
    outPath = "/nix/store/${builtins.hashString "sha256" (name + script)}-${name}";
    type = "derivation";
  };

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
