#!/usr/bin/env bash
set -euo pipefail

# flux.sh: Bootstrap fluxcd

kubectx titania

kubectl apply -f sealed-secret.yaml

export GITHUB_TOKEN=$(pass github/token)
export GITHUB_USER=kmjayadeep
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=homelab-k8s \
  --branch=main \
  --path=./clusters/titania/bootstrap \
  --personal \
  --components-extra image-reflector-controller,image-automation-controller
