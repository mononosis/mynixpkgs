{ lib
, system ? null
, modules ? []
, baseModules ? []
, extraArgs ? {}
}:

let
  # Basic configuration evaluation
  config = {
    # Default system if not specified
    system = system or "x86_64-linux";
    
    # Basic package set
    pkgs = {
      hellonixos = null; # Will be set by the flake
    };
    
    # Basic lib
    lib = lib;
  };
  
  # Merge all modules
  finalConfig = lib.foldl (acc: module: acc // (if builtins.isFunction module then module acc else module)) config (baseModules ++ modules);
  
in {
  inherit config finalConfig;
  inherit lib;
} 