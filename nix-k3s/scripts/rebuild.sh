#!/usr/bin/env bash

# rebuild.sh: Rebuild nixos on all targets
nixos-rebuild switch --flake .#titania --target-host "root@192.168.1.40"
