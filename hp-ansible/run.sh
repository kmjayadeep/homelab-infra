#!/bin/bash

# run.sh: Run ansible playbook

ansible-playbook playbook_hp.yaml -i hosts.ini -e @secrets.yml --vault-password-file <(pass homelab/hp/ansible-vault) -v
