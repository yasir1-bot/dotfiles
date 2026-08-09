{ ... }:

{
  # home/yasir/default.nix
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaBlue; # matches the Catppuccin Mocha/blue accent used elsewhere
    name = "Catppuccin-Mocha-Blue-Cursors";       # set explicitly -- there's a known Home Manager bug
                                                  # (nix-community/home-manager#5509) where it can't always
                                                  # auto-infer the theme name from catppuccin-cursors packages
    size = 24;
    gtk.enable = true;       # so GTK apps pick it up too, not just Hyprland
    x11.enable = true;       # covers XWayland apps
    hyprcursor.enable = true; # exports HYPRCURSOR_THEME/HYPRCURSOR_SIZE for native Hyprland windows
  };
}
