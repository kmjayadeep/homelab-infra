#!/bin/bash

# kubeconfig.sh: copy kubeconfig

scp cosmos:/home/cosmos/.kube/config /tmp

# Remove existing config
kubectl config delete-cluster cosmos
kubectl config delete-context cosmos
kubectl config delete-user cosmos

# Import k3s config
kubectl konfig import --save /tmp/config

rm /tmp/config

