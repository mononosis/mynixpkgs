{ callPackage
, lib
, stdenv
, fetchurl
, licenses
, platforms
, maintainers
, writeShellScriptBin
}:

stdenv.mkDerivation {
  pname = "hellonixos";
  version = "1.0.0";

  src = writeShellScriptBin "hellonixos" ''
    echo "hellonixos"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp $src/bin/hellonixos $out/bin/
  '';

  meta = with lib; {
    description = "A simple program that prints 'hellonixos'";
    longDescription = ''
      Hellonixos is a simple demonstration package for MyNixpkgs.
      When executed, it prints "hellonixos" to stdout.
    '';
    homepage = "https://github.com/your-username/mynixpkgs";
    license = licenses.mit;
    maintainers = [ maintainers.user ];
    mainProgram = "hellonixos";
    platforms = platforms.all;
  };
} 