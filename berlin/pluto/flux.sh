#!/bin/bash

# flux.sh: Setup fluxcd
#

kubectx cosmos

export GITHUB_TOKEN=$(pass github/token)
export GITHUB_USER=kmjayadeep
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=homelab-k8s \
  --branch=main \
  --path=./clusters/cosmos/bootstrap \
  --personal
