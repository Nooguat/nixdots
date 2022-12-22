{ pkgs ? import <nixpkgs> { } }:

with pkgs:
mkShell {
    buildInput = [
        python310Packages.pip
        python310Packages.pip-tools
    ];
    shellHook = "";
};

