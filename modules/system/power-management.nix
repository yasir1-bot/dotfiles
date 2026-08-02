# ---------------------------------------------------------------------------
# Power/battery/profile plumbing.
#
# This was the one gap found while wiring up Noctalia: its NixOS docs
# explicitly call out that wifi, Bluetooth, power-profile, and battery
# widgets need these services running system-wide, or they'll silently
# show nothing:
#
#   - networking.networkmanager.enable        (already on, modules/networking.nix)
#   - hardware.bluetooth.enable                (already on, modules/bluetooth.nix)
#   - services.power-profiles-daemon.enable    (NEW -- added here)
#   - services.upower.enable                   (NEW -- added here)
# ---------------------------------------------------------------------------
{ ... }:

{
  # Lets Noctalia (and GNOME) offer power profile switching
  # (performance/balanced/power-saver).
  services.power-profiles-daemon.enable = true;

  # Battery percentage/charge-state reporting, used by Noctalia's battery
  # widget and idle/OSD logic.
  services.upower.enable = true;
}
