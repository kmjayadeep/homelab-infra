#!/bin/bash

# flux.sh: Bootstrap fluxcd

kubectx titania

export GITHUB_TOKEN=$(pass github/token)
export GITHUB_USER=kmjayadeep
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=homelab-k8s \
  --branch=main \
  --path=./clusters/titania/bootstrap \
  --personal
