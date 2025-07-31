# Experimental flake interface to MyNixpkgs.
# A personal nixpkgs alternative with only the hellonixos package.
{
  description = "A personal collection of packages for the Nix package manager";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs }:
    let
      # Simple system list
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      
      # Generate packages for all systems
      forAllSystems = f: builtins.listToAttrs (map (system: { name = system; value = f system; }) systems);
    in
    {
      # Modern packages output
      packages = forAllSystems (system: 
        let
          pkgs = import ./pkgs/top-level/default.nix { inherit system nixpkgs; };
        in
        {
          hellonixos = pkgs.hellonixos;
        }
      );
      
      # Keep legacyPackages for backward compatibility
      legacyPackages = forAllSystems (system: import ./pkgs/top-level/default.nix {
        inherit system nixpkgs;
      });
    };
} 