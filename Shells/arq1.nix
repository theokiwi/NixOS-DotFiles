{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [ pkgs.iverilog ];
  shell = "${pkgs.zsh}/bin/zsh";
  shellHook = ''
    echo "Compile: iverilog -o hello hello.v"
    echo "Run: vvp hello"
  '';
}
