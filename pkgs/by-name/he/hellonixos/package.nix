{ callPackage
, lib
, stdenv
, fetchurl
, licenses
, platforms
, maintainers
, writeShellScriptBin
}:

writeShellScriptBin "hellonixos" ''
  echo "hellonixos"
'' 