{ pkgs, ... }:

{
  # NOTE: sway, waybar, mako, swaylock-effects, and swayidle below are
  # left over from a pre-Hyprland setup and now overlap functionally with
  # what Noctalia + Hyprland provide (bar, notifications, lock screen, idle
  # handling). Not removed here since sway may still be a fallback you
  # want -- but if you're fully on Hyprland/Noctalia day-to-day, these are
  # safe to drop.
  home.packages = with pkgs; [
    kitty
    pywal
    sway
    swaylock-effects
    swayidle
    mako
    libnotify
    matugen
    fuzzel
    waybar
    cmatrix
    pywalfox-native
    tree
    nitch
    pokemon-colorscripts

    # Terminal file manager, referenced by the $mod+E keybind in
    # home/yasir/hyprland.nix.
    yazi
  ];
}
