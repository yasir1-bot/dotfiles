{ inputs, ... }:

{
  home.stateVersion = "26.05";

  imports = [
    ./fish.nix
    ./packages.nix
    ./nvim.nix
    ./hyprland.nix
    ./noctalia.nix
    ./gnome.nix
  ];
}
