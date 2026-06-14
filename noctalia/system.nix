{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    # Pull noctalia packages from the flake input
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
