{ pkgs, ... }:

{

  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    papirus-icon-theme
    bibata-cursors
    adwaita-icon-theme
  ];
}
