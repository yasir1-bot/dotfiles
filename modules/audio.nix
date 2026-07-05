{ pkgs, ... }:

{
  services.pipewire.enable = true;
  services.pipewire = {
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;
}
