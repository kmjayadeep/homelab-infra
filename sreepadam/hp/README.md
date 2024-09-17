# HP proxmox server

Manage pluto proxmox server as code

## Prereqs

Get password from `pass homelab/hp/terraform-prov`

If the terraform-prov user doesn't exist, create it first
```
pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
pveum user add terraform-prov@pve --password <password>
pveum aclmod / -user terraform-prov@pve -role TerraformProv
```

```
direnv allow
```

## Install tailscale

```
ssh hp
apt insall tailscale

tailscale up --accept-dns=false --advertise-routes=192.168.80.0/24
```
