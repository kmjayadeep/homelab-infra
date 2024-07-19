#!/usr/bin/env bash

# nix-install.sh: Install nixos-anywhere on target
# Make sure the server is accessible with the given port and user using my ssh ssh key
nix run github:nix-community/nixos-anywhere -- --flake .#titania root@192.1.68.1.73
