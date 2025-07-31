{ ... } @ args:

let
  # Platform definitions
  platforms = {
    # Linux platforms
    linux = {
      x86_64 = "x86_64-linux";
      i686 = "i686-linux";
      aarch64 = "aarch64-linux";
      armv7l = "armv7l-linux";
    };
    
    # Darwin platforms
    darwin = {
      x86_64 = "x86_64-darwin";
      aarch64 = "aarch64-darwin";
    };
    
    # All platforms (for packages that work everywhere)
    all = [
      "x86_64-linux"
      "i686-linux"
      "aarch64-linux"
      "armv7l-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    
    # Unix platforms (Linux + Darwin)
    unix = [
      "x86_64-linux"
      "i686-linux"
      "aarch64-linux"
      "armv7l-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    
    # Linux only
    linux = [
      "x86_64-linux"
      "i686-linux"
      "aarch64-linux"
      "armv7l-linux"
    ];
    
    # Darwin only
    darwin = [
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  };
  
in {
  inherit platforms;
} 