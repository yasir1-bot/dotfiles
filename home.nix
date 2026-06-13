{ pkgs, ... }:

{
  home.username = "yasir";
  home.homeDirectory = "/home/yasir";

  home.stateVersion = "26.05";
  home.file.".config/niri".source = ./niri;
  
  programs.fish.enable = true;

  programs.fish = {
    interactiveShellInit = ''
    fastfetch
    set -g fish_greeting
  '';

  shellAliases = {
    ll = "eza -la";
    n = "nvim";
  };
};

  home.packages = with pkgs; [
    fastfetch
    eza
    niri
    fish
  ];
}
