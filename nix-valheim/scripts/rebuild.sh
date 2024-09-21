#!/usr/bin/env bash
set -euo pipefail

# rebuild.sh: Rebuild nixos on all targets
nixos-rebuild switch --flake .#valheim --target-host "root@valheim"
nixos-rebuild switch --flake .#darkland --target-host "root@darkland"
