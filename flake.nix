{
  description = "Yasir's NixOS configuration";

  # ---------------------------------------------------------------------
  # Inputs
  # ---------------------------------------------------------------------
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # Keep Home Manager's nixpkgs in lockstep with the system's, so
      # everything is built against one shared nixpkgs revision.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia isn't packaged in nixpkgs yet (as of noctalia v5 / mid-2026),
    # so it's pulled straight from its own repo instead. It ships its own
    # Home Manager module (`noctalia.homeModules.default`), wired in via
    # home/yasir/noctalia.nix.
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      # `inputs.nixpkgs.follows` avoids evaluating/downloading a second
      # copy of nixpkgs just for Noctalia. Note this disables Noctalia's
      # Cachix binary cache (cache hits require an *unmodified* Noctalia
      # input graph) -- see the "Binary Cache" section of the Noctalia
      # NixOS docs. Remove this line if you'd rather have pre-built
      # binaries than a single shared nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # helium = {
    #   url = "github:schembriaiden/helium-browser-nix-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  # ---------------------------------------------------------------------
  # Outputs
  # ---------------------------------------------------------------------
  outputs =
    inputs@{ nixpkgs, home-manager, noctalia, ... }:
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # Passing `inputs` through specialArgs means *every* module in this
        # flake -- system-level (hosts/, modules/) and Home Manager alike
        # (home/) -- can just write `{ inputs, ... }:` to reach any flake
        # input (e.g. `inputs.noctalia`) without you having to thread it
        # through by hand module by module.
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/mypc

          home-manager.nixosModules.home-manager
          {
            # Mirrors specialArgs above, but for the home-manager side of
            # the tree specifically: this is what makes `{ inputs, ... }:`
            # work inside home/yasir/*.nix (see home/yasir/noctalia.nix).
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.yasir = import ./home/yasir;
          }
        ];
      };
    };
}
