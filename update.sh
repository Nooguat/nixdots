#!/usr/bin/env bash

repository=~/nixconfig

# Disable output for pushd
pushd () {
  command pushd "$@" > /dev/null
}

# Disable output for popd
popd () {
  command popd "$@" > /dev/null
}

home() {
  pushd $repository
  nix run . switch -- --flake .
  popd
}

system() {
  pushd $repository
  sudo nixos-rebuild switch --flake .#
  popd
}

case $1 in
  "home")
    home;;
  "system")
    system;;
  *)
    system
    home;;
esac
