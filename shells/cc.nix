{ pkgs ? import <nixpkgs> { } }:

with pkgs:
mkShell {
    buildInput = [
        gdb
        ccls
        cmake
        boost
        gnumake
        gcc-unwrapped
    ];
    shellHook = "";
};

