#!/usr/bin/env bash
set -euo pipefail

# nix-install.sh: Install nixos-anywhere on target
# Make sure the server is accessible with the given port and user using my ssh ssh key

read -p "This will cleanup the VM and reinstall nixos along with partitions on disneyland vm. Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  nix run github:nix-community/nixos-anywhere/69ad3f4a50cfb711048f54013404762c9a8e201e -- --flake .#disneyland root@disneyland
fi

