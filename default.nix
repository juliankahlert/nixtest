# default.nix

{ lib, config, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/iso-minimal.nix>
  ];

  boot.loader.grub.enable = true;
  networking.hostName = "my-nixos-machine";
  time.timeZone = "UTC";
}
