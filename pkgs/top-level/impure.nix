{ system ? builtins.currentSystem
, config ? {}
, overlays ? []
, crossOverlays ? []
, crossSystem ? null
}:

let
  # Import the library
  lib = import ../../lib {};
  
  # Create a proper writeShellScriptBin using builtins.derivation
  writeShellScriptBin = name: script:
    builtins.derivation {
      inherit name system;
      builder = "/bin/sh";
      args = [ "-c" "echo '#!/bin/sh' > \$out && echo '${script}' >> \$out" ];
      outputs = [ "out" ];
      # The script is now at $out, which will be symlinked to bin/${name}
    };
  
  # Minimal stdenv (we don't actually need it for hellonixos)
  stdenv = {
    mkDerivation = { name, version, src, buildInputs ? [], nativeBuildInputs ? [], installPhase ? "", ... } @ args:
      let
        drvName = "${name}-${version}";
        outPath = "/nix/store/${builtins.hashString "sha256" (drvName + toString src)}-${drvName}";
      in
      {
        inherit name version src buildInputs nativeBuildInputs installPhase outPath;
        type = "derivation";
        __toString = self: "${drvName}";
      };
  };
  
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
