{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.caffeine
    gnomeExtensions.just-perfection
    gnomeExtensions.user-themes
 ];

  gtk = {
    enable = true;

    theme = {
      name = "sweet";
      package = pkgs.sweet;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-format = "24h";
      enable-hot-corners = true;
      show-battery-percentage = false;
     };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/yasir/Pictures/Wallpapers/clouds.jpg";
      picture-uri-dark = "file:///home/yasir/Pictures/Wallpapers/gruvbox/117497448_p0.jpg";
     };
     
    "org/gnome/shell" = {
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "caffeine@patapon.info"
        "just-perfection-desktop@just-perfection"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
	"pip-on-top@rafostar.github.com"
      ];
   };
  };
}
