{ pkgs, ... }:

{
  # hm specific packages:
  home.packages = with pkgs; [
    kitty
    starship
    cargo
    pywal
    mako
    matugen
    waybar
    cmatrix
    vscodium
    pywalfox-native
    tree
    nitch
    pokemon-colorscripts
    yazi
  ];
}
