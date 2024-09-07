{ modulesPath, config, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
    ./modules/user.nix
    ./modules/valheim.nix
    ./modules/steam.nix
  ];

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  time.timeZone = "Asia/Kolkata";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    vim
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVFwMXBBljf+W5diHw9sz+A5AQhojFh8xXHCvznJkebVimhPU18dP7aL6K91tMdx+1rDbW3XyqWlAcuJY55j/G1JMyMGGTSCWkUlovZArqFAWxyadQ9s7Ev13bSF+h2qaL1x8tFAYK/L/LR4OOHSKXzqdeS2WeZgIFEuBW6HDnlGGV0aVVLo6f7wTIt4QK48IiUxKDo+giN5vmXtcBg0F88DhbDtLip3Yab6Sqm4v5PCIM4XiKkULqMLGqfQoUItFi0MGEq1P2qvQ/pVdHEjMoPjXfnwI0Jr4T6NN/QO8lsEfyYlI8qtZ2MvTYdqmOvrY37cYx2BJsIQvwC1wzERgqboEUk0qsRwNqIUcAbOaBIADDn11FUQyvYZ2S8QeIqiwkdyE+jJuPTTgzh5RtuFoqyKuIQohzPDIhAmr65xygcYUyM7vRji5F20dVxc92fNc7ec1FCsbPoSHdW41PkimO2+plyhMFkYrbRo2Hzi6pW+LkmPDbZTMWDo6RM07G+1DIGoDUmSxCQDgkoHHG+x6U0mKh2YSX9zwIxr/9h/dvEyWYCG09XNmxFlGHNNlb0Us52UJ4Ax53WnNoxECH0RDojRQkn3m3v0xxFU9C/RaER48N7ppEDjL9dtcM0lF714TbpBQYBM2oJYJIoCX0Cj/fyrSxofHTYARsnBzblDZA9Q== kmjayadeep@gmail.com"
  ];

  networking = {
    interfaces.ens18 = {
      ipv4.addresses = [{
        address = "192.168.80.25";
        prefixLength = 24;
      }];
      ipv6.addresses = [{
        address = "fe80::100";
        prefixLength = 64;
      }];
    };
    defaultGateway = {
      address = "192.168.80.1";
      interface = "ens18";
    };
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    useNetworkd = true;
    dhcpcd.IPv6rs = true; # Enable getting public IPv6 from router
    firewall.enable = false;
  };

  services.resolved.enable = true;
  services.qemuGuest.enable = true;

  system.stateVersion = "24.04";
}
