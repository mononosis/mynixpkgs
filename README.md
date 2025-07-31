# MyNixpkgs

A personal nixpkgs alternative that replicates the structure of the official nixpkgs but only implements a single package called `hellonixos`.

## Overview

This project demonstrates how to create a minimal nixpkgs alternative with the same directory structure and conventions as the official nixpkgs repository. It includes:

- Complete directory structure matching nixpkgs
- Basic library functions (`lib/`)
- Package system (`pkgs/`)
- NixOS support (`nixos/`)
- Flake support (`flake.nix`)
- Single package: `hellonixos`

## Structure

```
mynixpkgs/
├── default.nix              # Main entry point
├── flake.nix                # Flake interface
├── lib/                     # Library functions
│   ├── default.nix
│   ├── basic.nix
│   ├── systems.nix
│   ├── licenses.nix
│   ├── platforms.nix
│   ├── maintainers.nix
│   ├── minver.nix
│   └── flake-version-info.nix
├── pkgs/                    # Package definitions
│   ├── top-level/
│   │   ├── default.nix
│   │   └── impure.nix
│   └── by-name/
│       └── he/
│           └── hellonixos/
│               └── package.nix
└── nixos/                   # NixOS modules
    └── lib/
        ├── default.nix
        └── eval-config.nix
```

## The hellonixos Package

The `hellonixos` package is a simple demonstration package that:

- Prints "hellonixos" when executed
- Is implemented as a bash script
- Supports all platforms (Linux and Darwin)
- Uses MIT license
- Follows nixpkgs conventions

## Usage

### As a Flake

```bash
# Build the hellonixos package
nix build .#legacyPackages.x86_64-linux.hellonixos

# Run the hellonixos program
./result/bin/hellonixos
# Output: hellonixos
```

### Traditional Nix

```bash
# Import the package set
nix-env -f . -iA hellonixos

# Run the program
hellonixos
# Output: hellonixos
```

### Development

```bash
# Enter a development shell with the package
nix develop

# Or build and test
nix build
./result/bin/hellonixos
```

## Adding More Packages

To add more packages to this mynixpkgs:

1. Create a new directory under `pkgs/by-name/` following the naming convention
2. Add a `package.nix` file with your package definition
3. Import the package in `pkgs/top-level/impure.nix`
4. Add it to the `allPackages` attribute set

## Differences from Official nixpkgs

This mynixpkgs is significantly simplified compared to the official nixpkgs:

- Only one package (`hellonixos`)
- Minimal library functions
- No complex build systems
- No cross-compilation support
- No extensive testing infrastructure
- Simplified stdenv

## License

This project is licensed under the MIT License, just like the `hellonixos` package it contains.

## Contributing

This is a personal project for learning purposes. Feel free to fork and modify for your own needs! 