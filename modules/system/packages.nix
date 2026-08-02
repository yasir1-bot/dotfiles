{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    fish
    tmux
    flatpak
  ];

  programs.fish.enable = true;
  programs.firefox.enable = true;

  # Hyprland is now enabled properly in modules/hyprland.nix, alongside
  # the rest of its NixOS-level wiring (portals, OZONE_WL, etc.) -- keeping
  # it all in one file beats a stray `enable = false;` sitting in here.
}
