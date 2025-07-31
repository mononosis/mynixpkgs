let
  pkgs = import . { system = "x86_64-linux"; };
in
pkgs.hellonixos 