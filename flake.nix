{
  description = "Minimal NixOS installation media";
  inputs.nixos.url = "github:NixOS/nixpkgs/nixos-23.05";
  outputs = { self, nixos }: {
    nixosConfigurations = {
      exampleIso = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ({ pkgs, ... }: {
            environment.systemPackages = [ pkgs.neovim ];
            users.mutableUsers = false;
            users.users.nix = {
              isNormalUser  = true;
              home  = "/home/nix";
              description  = "nix os";
              extraGroups  = [ "wheel" ];
            };
          })
        ];
      };
    };
  };
}
