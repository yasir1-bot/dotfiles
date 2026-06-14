{ inputs, pkgs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;

    settings = {
      bar = {
        density  = "compact";
        position = "right";
        widgets = {
          left = [
            { id = "ControlCenter"; useDistroLogo = true; }
            { id = "Network"; }
            { id = "Bluetooth"; }
          ];
          center = [
            { id = "Workspace"; hideUnoccupied = false; labelMode = "none"; }
          ];
          right = [
            { id = "Battery"; alwaysShowPercentage = false; warningThreshold = 30; }
            {
              id = "Clock";
              formatHorizontal    = "HH:mm";
              useMonospacedFont   = true;
              usePrimaryColor     = true;
            }
          ];
        };
      };

      colorSchemes.predefinedScheme = "Monochrome";

      general = {
        avatarImage = "/home/yasir/.face";
        radiusRatio = 0.2;
      };

      location = {
        name          = "London, UK";
        monthBeforeDay = false;
      };
    };
  };
}
