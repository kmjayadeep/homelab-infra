# Valheim game server IAAC using Nixos and Nixos-anywhere

## Setup OS

Setup the VM using terraform script at <../sreepadam/hp>
Boot into the nixos installer image and set static ip address

```
ip addr add 192.168.80.25/24 dev ens18
```

Setup ssh config to be able to connect to `valheim`

and run

```
make valheim-install
```

## Changing OS stuff

Make changes to nix files and run the following command to apply the changes

```
make rebuild
```

## Tailscale

Need to login to tailscale manually

```
tailscale up
```
