{ ... } @ args:

let
  # Basic system types
  systems = {
    x86_64-linux = "x86_64-unknown-linux-gnu";
    i686-linux = "i686-unknown-linux-gnu";
    aarch64-linux = "aarch64-unknown-linux-gnu";
    armv7l-linux = "armv7l-unknown-linux-gnueabihf";
    x86_64-darwin = "x86_64-apple-darwin";
    aarch64-darwin = "aarch64-apple-darwin";
  };
  
  # Flake exposed systems (simplified for our use case)
  flakeExposed = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  
  # Platform definitions
  platforms = {
    linux = {
      x86_64 = "x86_64-linux";
      i686 = "i686-linux";
      aarch64 = "aarch64-linux";
      armv7l = "armv7l-linux";
    };
    darwin = {
      x86_64 = "x86_64-darwin";
      aarch64 = "aarch64-darwin";
    };
  };
  
  # Platform predicates
  isLinux = system: builtins.elem system (builtins.attrValues platforms.linux);
  isDarwin = system: builtins.elem system (builtins.attrValues platforms.darwin);
  isUnix = system: isLinux system || isDarwin system;
  
  # Architecture predicates
  isx86_64 = system: builtins.elem system [ "x86_64-linux" "x86_64-darwin" ];
  isAarch64 = system: builtins.elem system [ "aarch64-linux" "aarch64-darwin" ];
  
in {
  inherit systems flakeExposed platforms;
  inherit isLinux isDarwin isUnix isx86_64 isAarch64;
} 