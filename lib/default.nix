{ ... } @ args:

let
  # Import the basic library functions
  basicLib = import ./basic.nix args;
  
  # Import additional library modules
  systems = import ./systems.nix args;
  licenses = import ./licenses.nix args;
  platforms = import ./platforms.nix args;
  maintainers = import ./maintainers.nix args;
  
  # Combine all library functions
  lib = basicLib // {
    inherit systems licenses platforms maintainers;
    
    # Helper functions
    genAttrs = names: f: builtins.listToAttrs (map (n: { name = n; value = f n; }) names);
    optionalAttrs = cond: attrs: if cond then attrs else {};
    extend = f: self: let super = self; in self // f self super;
    foldl = op: nul: list: builtins.foldl' op nul list;
  };
in lib 