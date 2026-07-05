{
  imports = [
    ./hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/networking.nix
    ../../modules/audio.nix
    ../../modules/users.nix
    ../../modules/fonts.nix
    ../../modules/packages.nix
    ../../modules/bluetooth.nix
    ../../modules/flatpak.nix
    ../../modules/nix.nix
    ../../modules/xdg.nix
    ../../modules/gnome.nix

    # System-level Hyprland session + Wayland/portal wiring.
    ../../modules/hyprland.nix

    # wifi/bluetooth/battery/power-profile plumbing that Noctalia's NixOS
    # docs call out as required for its system widgets to work.
    ../../modules/power-management.nix
  ];
}
