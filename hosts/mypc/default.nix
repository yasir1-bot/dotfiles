{
  imports = [
    ./hardware-configuration.nix

    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/audio.nix
    ../../modules/system/users.nix
    ../../modules/system/fonts.nix
    ../../modules/system/packages.nix
    ../../modules/system/bluetooth.nix
    
    ../../modules/system/flatpak.nix
    ../../modules/system/nix.nix
    ../../modules/system/xdg.nix
    ../../modules/system/gnome.nix
    ../../modules/system/hyprland.nix
    ../../modules/system/power-management.nix
    ../../modules/system/nvidia.nix
  ];
}
