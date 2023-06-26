#!/bin/bash

# kubeconfig.sh: copy kubeconfig

scp cosmos:/etc/rancher/k3s/k3s.yaml /tmp

# Remove existing config
kubectl config delete-cluster cosmos
kubectl config delete-context cosmos
kubectl config delete-user cosmos

# Import k3s config
kubectl konfig import --save /tmp/k3s.yaml

rm /tmp/k3s.yaml

