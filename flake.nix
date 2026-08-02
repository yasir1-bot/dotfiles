{
  description = "Yasir's NixOS configuration";

  # ---------------------------------------------------------------------
  # Inputs
  # ---------------------------------------------------------------------
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:AlvaroParker/helium-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # ---------------------------------------------------------------------
  # Outputs
  # ---------------------------------------------------------------------
  outputs =
    inputs@{ nixpkgs, home-manager, noctalia, ... }:
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/mypc

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.yasir = import ./modules/hm;
          }
        ];
      };
    };
}
