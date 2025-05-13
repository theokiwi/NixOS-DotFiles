{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [ pkgs.libgccjit ];

  shell = "${pkgs.zsh}/bin/zsh";
  shellHook = ''
    echo "Compile: gcc -o saida arquivo.c"
    echo "Run: ./arquivo"
  '';
}
