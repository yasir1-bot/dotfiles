{ pkgs, ... }:

{
  # home/yasir/default.nix
  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme; # matches the Catppuccin Mocha/blue accent used elsewhere
    name = "Catppuccin-Mocha-Blue-Cursors";       # set explicitly -- there's a known Home Manager bug
    size = 24;
    gtk.enable = true;       # so GTK apps pick it up too, not just Hyprland
    x11.enable = true;       # covers XWayland apps
    hyprcursor.enable = true; # exports HYPRCURSOR_THEME/HYPRCURSOR_SIZE for native Hyprland windows
  };
}
