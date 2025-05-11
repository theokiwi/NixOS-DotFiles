{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [ pkgs.iverilog ];

  shellHook = ''
    echo "Compile: iverilog -o hello hello.v"
    echo "Run: vvp hello"
  '';
}
