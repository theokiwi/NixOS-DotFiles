{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [ pkgs.openjdk pkgs.zsh ];

  shell = "${pkgs.zsh}/bin/zsh";

  shellHook = ''
    echo "Compile: javac Hello.java"
    echo "Run: java Hello"
  '';
}

