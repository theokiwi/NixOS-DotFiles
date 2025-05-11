{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [ pkgs.openjdk ];

  shellHook = ''
    echo "Compile: javac Hello.java"
    echo "Run: java Hello"
  '';
}
