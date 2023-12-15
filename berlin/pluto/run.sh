#!/usr/bin/env bash

# run.sh: Run ansible playbook

ansible-playbook playbook.yaml -i hosts.ini -e @secrets.yml --vault-password-file <(pass homelab/pluto/ansible-vault) -v
