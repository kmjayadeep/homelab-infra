# K3S and fluxCD IAAC

## Setup OS

Setup the VM using terraform script at <../berlin/pluto>
Boot into the nixos installer image

Exit the script `scripts/titania-nix-install.sh` to set correct ip address of the VM

and run

```
make titania-install
```

## Changing OS stuff

Make changes to nix files and run the following command to apply the changes

```
make rebuild
```

## Setup Flux and apps

Just run 

```
make titania-flux
```

It will

1. Setup certificate for sealedsecrets
1. Install fluxcd
1. Configure fluxcd to automatically deploy all manifests
