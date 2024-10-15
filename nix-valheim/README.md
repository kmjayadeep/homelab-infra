# Valheim game server IAAC using Nixos and Nixos-anywhere

## Setup OS

Setup the VM using terraform script at <../sreepadam/hp>
Boot into the nixos installer image and set static ip address

```
# for valheim
ip addr add 192.168.80.25/24 dev ens18

# for odin
ip addr add 192.168.1.51/24 dev ens18

# for darkland
ip addr add 192.168.80.26/24 dev ens18
```

Setup ssh config to be able to connect to `valheim` and `darkland` and `odin`

and run the following to install os, setup disks etc.

```
make valheim-install
```

```
make darkland-install
```

```
make odin-install
```

## Changing OS stuff

Make changes to nix files and run the following command to apply the changes

```
make rebuild
```

## Valhelm game server

reference:
https://kevincox.ca/2022/12/09/valheim-server-nixos-v2/ - not working
https://github.com/aidalgol/valheim-server-flake/blob/main/pkgs/valheim-server/default.nix

```
make rebuild
```

## Tailscale

Need to login to tailscale manually

```
# on non-geneva nodes
tailscale up --accept-dns=false --accept-routes

# on geneva nodes
tailscale up --accept-dns=false
```
