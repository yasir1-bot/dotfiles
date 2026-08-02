# ---------------------------------------------------------------------------
# System-level Hyprland enablement.
#
# Per the Hyprland wiki ("Nix/Hyprland-on-Home-Manager" and
# "Nix/Hyprland-on-NixOS"), Hyprland setup on NixOS has two halves:
#
#   1. NixOS module (this file, `programs.hyprland`)      -- REQUIRED.
#      Registers a Hyprland session with the display manager (GDM, in our
#      case, via modules/gnome.nix) and provides the correct XDG desktop
#      portal backend. Skipping this is the classic cause of "Hyprland
#      isn't in my login screen" / broken screen-share & file-picker portals.
#
#   2. Home Manager module (home/yasir/hyprland.nix)       -- optional.
#      Actually configures Hyprland's keybinds, monitors, animations, etc.
#
# We deliberately keep Hyprland as an *additional* session next to GNOME
# (modules/gnome.nix) rather than ripping GNOME out: GDM happily lists
# multiple sessions, so you can pick either at the login screen, which
# gives you a safe fallback if a Hyprland/Noctalia rebuild ever leaves you
# with a broken session.
# ---------------------------------------------------------------------------
{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;

    # Use the Hyprland version shipped with this nixpkgs release instead of
    # a separate `hyprland.url = "github:hyprwm/Hyprland"` flake input.
    # This keeps the whole system on a single nixpkgs revision (simpler
    # dependency graph, one thing to update) and sidesteps the "mesa
    # version mismatch between system and Hyprland flake" issue the wiki
    # warns about. Point `package`/`portalPackage` at a flake input here
    # (and set the matching Home Manager options to `null`) if you ever
    # want bleeding-edge Hyprland instead.
    xwayland.enable = true;
  };

  # Was previously set in modules/packages.nix as `enable = false;` --
  # moved here and flipped on now that Hyprland is actually being used.

  # Belt-and-braces: recent nixpkgs usually enables this by default for
  # any GPU-accelerated session, but Hyprland needs working OpenGL/Vulkan
  # to render at all, so make it explicit rather than relying on a default
  # that could change.
  hardware.graphics.enable = true;

  # Hint Electron/Chromium apps to run natively on Wayland (native Wayland
  # rendering, no XWayland round-trip) when a Wayland session is active.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
