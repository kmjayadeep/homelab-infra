# Hetzner kubenetes

deploy the homelab kubenetes stack to hetzner cloud

## prereqs:

`pass` should have the hetzner token in `pass jayadeep/hetzner/token`.
You can modify pass path in `.env` file

## apply

```
cd hetzner-k3s
source .env
terraform init
terraform apply
```
