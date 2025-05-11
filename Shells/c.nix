{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [ pkgs.libgccjit ];

  shellHook = ''
    echo "Compile: gcc -o saida arquivo.c"
    echo "Run: ./arquivo"
  '';
}
