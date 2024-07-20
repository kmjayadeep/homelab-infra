#!/usr/bin/env bash

# rebuild.sh: Rebuild nixos-anywhere on targets
nixos-rebuild switch --flake .#titania --target-host "root@192.168.1.40"
