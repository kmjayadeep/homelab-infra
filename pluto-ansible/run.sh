#!/bin/bash

# run.sh: Run ansible playbook

ansible-playbook playbook_k3s.yaml -i hosts.ini -e @secrets.yml --vault-password-file <(pass homelab/cosmos/ansible-vault) -v
