#!/usr/bin/env bash
set -euo pipefail

# rebuild.sh: Rebuild nixos on all targets
nixos-rebuild switch --flake .#polaris --target-host "root@polaris"
